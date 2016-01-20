unit frmcaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, dxExEdtr,
  StdCtrls, ExtCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid, Buttons, ComCtrls,
  dxDBTLCl, dxGrClms, RxCalc;

type
  Tfrmcajas = class(TForm)
    datacon: TDataSource;
    con: TZQuery;
    grid_datos: TdxDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    gr_prov: TGroupBox;
    prov: TEdit;
    titulo: TPanel;
    Label4: TLabel;
    grid_datosid: TdxDBGridMaskColumn;
    grid_datosmun: TdxDBGridMaskColumn;
    grid_datosfec_del: TdxDBGridDateColumn;
    grid_datosfec_al: TdxDBGridDateColumn;
    grid_datosnom_esc: TdxDBGridMaskColumn;
    grid_datostotaloc: TdxDBGridMaskColumn;
    grid_datostotalimp: TdxDBGridMaskColumn;
    grid_datosnom_proy: TdxDBGridMaskColumn;
    grid_datosnumcheque: TdxDBGridColumn;
    BitBtn3: TBitBtn;
    conid: TFloatField;
    confec_ela: TDateField;
    conanno: TIntegerField;
    conorg: TIntegerField;
    conuad: TStringField;
    conuej: TStringField;
    conubi: TStringField;
    conmun: TStringField;
    conlent: TStringField;
    conseg: TStringField;
    conpen: TIntegerField;
    confpag: TStringField;
    concoc: TStringField;
    conest: TStringField;
    concod_prov: TIntegerField;
    consemana: TIntegerField;
    concod_proy: TIntegerField;
    concod_esc: TIntegerField;
    confec_del: TDateField;
    confec_al: TDateField;
    conent: TIntegerField;
    contel_prov: TStringField;
    connom_prov: TStringField;
    condir_prov: TStringField;
    conrif_prov: TStringField;
    concpostal_prov: TIntegerField;
    connom_esc: TStringField;
    condir_esc: TStringField;
    conpent_esc: TStringField;
    conobs: TStringField;
    contotaloc: TFloatField;
    contotalimp: TFloatField;
    connom_proy: TStringField;
    conmat_esc: TIntegerField;
    confecoc: TDateField;
    conusuario: TStringField;
    conanulada: TStringField;
    conrendida: TStringField;
    connfac: TStringField;
    connne: TStringField;
    conanalista_rinde: TStringField;
    conpagada: TStringField;
    confecren: TDateField;
    confecpago: TDateField;
    conanalista_paga: TStringField;
    conimputacionp: TStringField;
    connumcheque: TLargeintField;
    condesimp: TStringField;
    connproyf: TIntegerField;
    conentregado_che: TStringField;
    confecha_entrega_che: TDateField;
    conquien_entrega_che: TStringField;
    calcu: TRxCalculator;
    BitBtn6: TBitBtn;
    act_entregado: TZQuery;
    dataenviado: TDataSource;
    grid_datosentregado_che: TdxDBGridColumn;
    codtxt: TEdit;
    nc: TEdit;
    numc: TLabel;
    estado: TLabel;
    con_cen: TZQuery;
    datachen: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure ck_prClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure grid_datosEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure grid_datosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_datosentregado_cheGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure grid_datosKeyPress(Sender: TObject; var Key: Char);
    procedure ncKeyPress(Sender: TObject; var Key: Char);
    procedure ncEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sw:integer;
  end;

var
  frmcajas: Tfrmcajas;

implementation

uses frmacces, frmbusprov;

{$R *.dfm}

procedure Tfrmcajas.FormShow(Sender: TObject);
begin
titulo.Visible:=false;
grid_datos.Visible:=false;
prov.Clear;
codtxt.Clear;
nc.Clear;
estado.Caption:='';
prov.SetFocus;
end;

procedure Tfrmcajas.ck_prClick(Sender: TObject);
begin
    prov.Clear;
    prov.SetFocus;
end;

procedure Tfrmcajas.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmcajas.BitBtn2Click(Sender: TObject);
begin
  con.close;
  con.SQL.Text:='select * from oc where pagada="S" and cod_prov ="'+codtxt.Text+'" GROUP BY numcheque';
  con.ExecSQL;
  con.Open;
  if con.IsEmpty then
  begin
     application.MessageBox(pchar('No existen Pagos para el Proveedor: '+prov.Text),'Mensaje al Usuario',32);
     prov.Clear;
     codtxt.Clear;
     prov.SetFocus;
  end
  else
  begin
    titulo.Visible:=true;
    grid_datos.Visible:=true;
    grid_datos.SetFocus;
  end;
end;

procedure Tfrmcajas.BitBtn3Click(Sender: TObject);
begin
   frmbuscaprov.ShowModal;
end;

procedure Tfrmcajas.BitBtn6Click(Sender: TObject);
begin
calcu.Title:='CALCULADORA ZEB';
  calcu.Execute;
end;

procedure Tfrmcajas.grid_datosEdited(Sender: TObject;
  Node: TdxTreeListNode);
begin
 if sw=1 then
 begin
   act_entregado.Params[0].AsString:=con.fieldbyname('entregado_che').AsString;
   act_entregado.Params[1].Asstring:=frmacceso.usuario.Text;
   act_entregado.Params[2].Asdate:= date;
   act_entregado.Params[3].Asfloat:=con.fieldbyname('id').AsFloat;
   act_entregado.ExecSQL;
 end
 else
 begin
   if sw=2 then
   begin
     act_entregado.Params[0].AsString:=con.fieldbyname('entregado_che').AsString;
     act_entregado.Params[1].Asstring:='';
     act_entregado.Params[2].Asdate:=0;
     act_entregado.Params[3].Asfloat:=con.fieldbyname('id').AsFloat;
     act_entregado.ExecSQL;
   end;
 end;
  con.close;
  con.SQL.Text:='select * from oc where pagada="S" and cod_prov ="'+codtxt.Text+'" GROUP BY numcheque';
  con.ExecSQL;
  con.Open;
end;

procedure Tfrmcajas.grid_datosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//if key<>vk_return then KEY:=0;
end;

procedure Tfrmcajas.grid_datosentregado_cheGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if atext='' then
      con.Cancel;
end;

procedure Tfrmcajas.grid_datosKeyPress(Sender: TObject; var Key: Char);
begin
if grid_datos.FocusedColumn=0 then
begin
case key of
  #13:;
  #8:;
  #83:sw:=1;
  #78:sw:=2;
else
  key:=#0;
end;
end;
end;

procedure Tfrmcajas.ncKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #8:;
      #13:
          begin
             con_cen.Close;
             con_cen.Params[0].AsInteger:=strtoint(nc.Text);
             con_cen.Open;
             if con_cen.IsEmpty then
             begin
                estado.Font.Color:=clred;
                estado.Caption:='NO ENTREGADO';
             end
             ELSE
             begin
                estado.Font.Color:=clgreen;
                estado.Caption:='ENTREGADO';
             end;
             con_cen.Close;
          end;
else
      key:=#0;
end;
end;

procedure Tfrmcajas.ncEnter(Sender: TObject);
begin
nc.Clear;
estado.Caption:='';
end;

end.
