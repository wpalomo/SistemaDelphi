unit frmcocrendi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  RxCalc, dxDBTLCl, dxGrClms, dxDBCtrl, dxDBGrid, dxTL, dxCntner, StdCtrls,
  ExtCtrls, Buttons;

type
  Tfrmcocren = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    grid_oc: TdxDBGrid;
    grid_ocanulada: TdxDBGridCheckColumn;
    grid_ocid: TdxDBGridMaskColumn;
    grid_ocfec_ela: TdxDBGridDateColumn;
    grid_ocmun: TdxDBGridMaskColumn;
    grid_octotaloc: TdxDBGridMaskColumn;
    grid_octotalimp: TdxDBGridMaskColumn;
    grid_ocnom_proy: TdxDBGridMaskColumn;
    grid_ocnom_prov: TdxDBGridMaskColumn;
    grid_ocnom_esc: TdxDBGridMaskColumn;
    grid_ocsemana: TdxDBGridMaskColumn;
    grid_ocfec_del: TdxDBGridDateColumn;
    grid_ocfec_al: TdxDBGridDateColumn;
    grid_ocpent_esc: TdxDBGridMaskColumn;
    grid_ocseg: TdxDBGridCheckColumn;
    grid_ocobs: TdxDBGridMaskColumn;
    grid_ocusuario: TdxDBGridMaskColumn;
    calculadora: TRxCalculator;
    con_oc: TZQuery;
    dataoc: TDataSource;
    calcu: TRxCalculator;
    bt_mod: TBitBtn;
    grid_ocrendida: TdxDBGridCheckColumn;
    grid_ocanalista_rinde: TdxDBGridMaskColumn;
    grid_ocfecren: TdxDBGridDateColumn;
    bt_tp: TBitBtn;
    bt_tg: TBitBtn;
    ven: TPanel;
    con_bsgen: TZQuery;
    data_bsgen: TDataSource;
    con_bspro: TZQuery;
    data_bspro: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_modClick(Sender: TObject);
    function esnum(NumStr : string) : bool;
    procedure grid_octotalocGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure grid_octotalimpGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure grid_ocDblClick(Sender: TObject);
    procedure bt_tpClick(Sender: TObject);
    procedure bt_tgClick(Sender: TObject);
    procedure venMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcocren: Tfrmcocren;

implementation

uses frmacces, frmrendicion, frmbus, frmacercade;

{$R *.dfm}


function Tfrmcocren.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
         end;
end;

procedure Tfrmcocren.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmcocren.BitBtn6Click(Sender: TObject);
begin
calcu.Title:='CALCULADORA ZEB';
  calcu.Execute;
end;

procedure Tfrmcocren.BitBtn2Click(Sender: TObject);
begin
 frmbuscar.ShowModal;
  if esnum(frmbuscar.bus.Text) then
  begin
    con_oc.Close;
    con_oc.SQL.Text:='select * from oc where pagada="N" and id like :c LIMIT 50';
    con_oc.Params[0].AsString:=frmbuscar.bus.Text+'%';
    con_oc.Open;
  end
  else
  begin
    con_oc.Close;
    con_oc.SQL.Text:='select * from oc where pagada="N" and nom_prov like :n LIMIT 50';
    con_oc.Params[0].AsString:='%'+frmbuscar.bus.Text+'%';
    con_oc.Open;
  end;
end;

procedure Tfrmcocren.FormShow(Sender: TObject);
begin
  con_oc.Close;
  con_oc.SQL.Text:='select * from oc where pagada="N" LIMIT 50';
  con_oc.ExecSQL;
  con_oc.Open;
end;

procedure Tfrmcocren.bt_modClick(Sender: TObject);
begin
if con_oc.FieldByName('anulada').AsString='N' then
  frmrendir.ShowModal
else
begin
 if con_oc.FieldByName('anulada').AsString='S' then
   application.MessageBox('Orden de Compra Anulada no se puede Rendir...!','Mensaje al Usuario',16);
end;
end;

procedure Tfrmcocren.grid_octotalocGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if atext<>'' then
   atext:=formatfloat('#,##0.00',strtofloat(Atext));
end;

procedure Tfrmcocren.grid_octotalimpGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if atext<>'' then
   atext:=formatfloat('#,##0.00',strtofloat(Atext));
end;

procedure Tfrmcocren.grid_ocDblClick(Sender: TObject);
begin
bt_modClick(Sender);
end;

procedure Tfrmcocren.bt_tpClick(Sender: TObject);
begin
 ven.Visible:=true;
 con_bspro.Close;
 con_bspro.Params[0].AsInteger:=con_oc.fieldbyname('cod_prov').AsInteger;
 con_bspro.Open;
 if not con_bspro.IsEmpty then
 begin
    ven.Caption:='EL PROVEEDOR ** '+con_oc.fieldbyname('nom_prov').Asstring +' ** RINDE UN TOTAL HASTA LA FECHA DE HOY: ** '+ formatfloat('#,##0.00',con_bspro.fieldbyname('totaloc').asfloat) + ' ** Bs.F - IMPUESTO: ** '+formatfloat('#,##0.00',con_bspro.fieldbyname('totalimp').asfloat) +' ** Bs.F';
 end
 else
 begin
    ven.Caption:='EL PROVEEDOR ** '+con_oc.fieldbyname('nom_prov').Asstring +' ** RINDE UN TOTAL HASTA LA FECHA DE HOY: ** 0 ** Bs.F - IMPUESTO: ** 0 ** Bs.F';
 end;
end;

procedure Tfrmcocren.bt_tgClick(Sender: TObject);
begin
 ven.Visible:=true;
 con_bsgen.Close;
 con_bsgen.Open;
 if not con_bsgen.IsEmpty then
 begin
    ven.Caption:='SE HA RENDIDO UN TOTAL HASTA LA FECHA DE HOY: ** '+ formatfloat('#,##0.00',con_bsgen.fieldbyname('totaloc').asfloat) + ' ** Bs.F - IMPUESTO: ** '+formatfloat('#,##0.00',con_bsgen.fieldbyname('totalimp').asfloat) +' ** Bs.F';
 end
 else
 begin
    ven.Caption:='SE HA RENDIDO UN TOTAL HASTA LA FECHA DE HOY: ** 0 ** Bs.F - IMPUESTO: ** 0 ** Bs.F';
 end;

end;

procedure Tfrmcocren.venMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 ven.Caption:='';
 ven.Visible:=false;
end;

end.
