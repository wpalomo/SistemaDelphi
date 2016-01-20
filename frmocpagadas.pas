unit frmocpagadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  RxCalc, dxDBTLCl, dxGrClms, dxDBCtrl, dxDBGrid, dxTL, dxCntner, StdCtrls,
  ExtCtrls, Buttons;

type
  Tfrmocpag = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    grid_oc: TdxDBGrid;
    grid_ocrendida: TdxDBGridCheckColumn;
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
    grid_ocanalista_rinde: TdxDBGridMaskColumn;
    bt_mod: TBitBtn;
    calculadora: TRxCalculator;
    con_oc: TZQuery;
    dataoc: TDataSource;
    calcu: TRxCalculator;
    grid_ocpagada: TdxDBGridCheckColumn;
    grid_ocfecren: TdxDBGridDateColumn;
    grid_ocfecpago: TdxDBGridDateColumn;
    grid_ocanalista_paga: TdxDBGridMaskColumn;
    grid_ocnumcheque: TdxDBGridColumn;
    bt_tp: TBitBtn;
    bt_tg: TBitBtn;
    ven: TPanel;
    con_bsgen: TZQuery;
    data_bsgen: TDataSource;
    data_bspro: TDataSource;
    con_bspro: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    function  esnum(NumStr : string) : bool;
    procedure grid_octotalocGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure grid_octotalimpGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure grid_ocDblClick(Sender: TObject);
    procedure bt_modClick(Sender: TObject);
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
  frmocpag: Tfrmocpag;

implementation

uses frmacces, frmbus, frmcoocpag;

{$R *.dfm}

function Tfrmocpag.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
         end;
end;

procedure Tfrmocpag.FormShow(Sender: TObject);
begin
  con_oc.Close;
  con_oc.SQL.Text:='select * from oc where rendida="S" limit 50';
  con_oc.Open;
end;

procedure Tfrmocpag.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmocpag.BitBtn6Click(Sender: TObject);
begin
calcu.Title:='CALCULADORA ZEB';
calcu.Execute;
end;

procedure Tfrmocpag.BitBtn2Click(Sender: TObject);
begin
frmbuscar.ShowModal;
  if esnum(frmbuscar.bus.Text) then
  begin
    con_oc.Close;
    con_oc.SQL.Text:='select * from oc where id like :c and rendida="S" ';
    con_oc.Params[0].AsString:=frmbuscar.bus.Text+'%';
    con_oc.Open;
  end
  else
  begin
    con_oc.Close;
    con_oc.SQL.Text:='select * from oc where nom_prov like :n and rendida="S"';
    con_oc.Params[0].AsString:='%'+frmbuscar.bus.Text+'%';
    con_oc.Open;
  end;
end;

procedure Tfrmocpag.grid_octotalocGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if atext<>'' then
   atext:=formatfloat('#,##0.00',strtofloat(Atext));
end;

procedure Tfrmocpag.grid_octotalimpGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if atext<>'' then
   atext:=formatfloat('#,##0.00',strtofloat(Atext));
end;

procedure Tfrmocpag.grid_ocDblClick(Sender: TObject);
begin
bt_modClick(Sender);
end;

procedure Tfrmocpag.bt_modClick(Sender: TObject);
begin
   frmconsoc.ShowModal;
end;

procedure Tfrmocpag.bt_tpClick(Sender: TObject);
begin
ven.Visible:=true;
 con_bspro.Close;
 con_bspro.Params[0].AsInteger:=con_oc.fieldbyname('cod_prov').AsInteger;
 con_bspro.Open;
 if not con_bspro.IsEmpty then
 begin
    ven.Caption:='EL PROVEEDOR ** '+con_oc.fieldbyname('nom_prov').Asstring +' ** SE LE CANCELO UN TOTAL HASTA LA FECHA DE HOY: ** '+ formatfloat('#,##0.00',con_bspro.fieldbyname('totaloc').asfloat) + ' ** Bs.F - IMPUESTO: ** '+formatfloat('#,##0.00',con_bspro.fieldbyname('totalimp').asfloat) +' ** Bs.F';
 end
 else
 begin
    ven.Caption:='EL PROVEEDOR ** '+con_oc.fieldbyname('nom_prov').Asstring +' ** SE LE CANCELO UN TOTAL HASTA LA FECHA DE HOY: ** 0 ** Bs.F - IMPUESTO: ** 0 ** Bs.F';
 end;
end;

procedure Tfrmocpag.bt_tgClick(Sender: TObject);
begin
 ven.Visible:=true;
 con_bsgen.Close;
 con_bsgen.SQL.Text:='select sum(totaloc)as totaloc from oc where anulada="N" and pagada="S"';
 con_bsgen.Open;

 if not con_bsgen.IsEmpty then
 begin
    ven.Caption:='SE HA PAGADO UN TOTAL HASTA LA FECHA DE HOY: ** '+ formatfloat('#,##0.00',con_bsgen.fieldbyname('totaloc').asfloat);
 end
 else
 begin
    ven.Caption:='SE HA PAGADO UN TOTAL HASTA LA FECHA DE HOY: ** 0 **';
 end;

 con_bsgen.Close;
 con_bsgen.SQL.Text:='select sum(totalimp)as totalimp from oc,proveedores where anulada="N" and pagada="S" and oc.cod_prov=proveedores.id and proveedores.tpro=2';
 con_bsgen.Open;

 if not con_bsgen.IsEmpty then
 begin
    ven.Caption:=ven.Caption + '** Bs.F - IMPUESTO: ** '+ formatfloat('#,##0.00',con_bsgen.fieldbyname('totalimp').asfloat) +' ** Bs.F';
 end
 else
 begin
    ven.Caption:=ven.Caption + 'Bs.F - IMPUESTO: ** 0 ** Bs.F';
 end;

end;



procedure Tfrmocpag.venMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 ven.Caption:='';
 ven.Visible:=false;
end;

end.
