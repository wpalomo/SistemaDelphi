unit frmocgeneral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RxCalc, Buttons, dxExEdtr, dxDBTLCl,
  dxGrClms, dxTL, dxDBCtrl, dxDBGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, dxCntner, ZAbstractTable, ComCtrls;

type
  Tfrmocgen = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    bt_eli: TBitBtn;
    bt_mod: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    calculadora: TRxCalculator;
    Panel1: TPanel;
    Label1: TLabel;
    con_oc: TZQuery;
    dataoc: TDataSource;
    grid_oc: TdxDBGrid;
    grid_ocid: TdxDBGridMaskColumn;
    grid_ocfec_ela: TdxDBGridDateColumn;
    grid_ocmun: TdxDBGridMaskColumn;
    grid_ocsemana: TdxDBGridMaskColumn;
    grid_ocfec_del: TdxDBGridDateColumn;
    grid_ocfec_al: TdxDBGridDateColumn;
    grid_ocnom_prov: TdxDBGridMaskColumn;
    grid_ocnom_esc: TdxDBGridMaskColumn;
    grid_ocobs: TdxDBGridMaskColumn;
    grid_ocseg: TdxDBGridCheckColumn;
    grid_ocpent_esc: TdxDBGridMaskColumn;
    grid_ocnom_proy: TdxDBGridMaskColumn;
    grid_octotaloc: TdxDBGridMaskColumn;
    grid_octotalimp: TdxDBGridMaskColumn;
    eli_oc: TZQuery;
    dataeli: TDataSource;
    eli_detoc: TZQuery;
    dataelidet: TDataSource;
    RxCalculator1: TRxCalculator;
    BitBtn3: TBitBtn;
    grid_ocusuario: TdxDBGridMaskColumn;
    grid_ocanulada: TdxDBGridCheckColumn;
    anula_oc: TZQuery;
    data_anula: TDataSource;
    bt_tg: TBitBtn;
    bt_tp: TBitBtn;
    con_bspro: TZQuery;
    con_bsgen: TZQuery;
    data_bspro: TDataSource;
    data_bsgen: TDataSource;
    ven: TPanel;
    tb_beli: TZTable;
    data_beli: TDataSource;
    fechas: TGroupBox;
    fec1: TDateTimePicker;
    fec2: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grid_octotalocGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure grid_octotalimpGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure BitBtn2Click(Sender: TObject);
    function esnum(NumStr : string) : bool;
    procedure bt_eliClick(Sender: TObject);
    procedure grid_ocDblClick(Sender: TObject);
    procedure bt_modClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure bt_tpClick(Sender: TObject);
    procedure bt_outClick(Sender: TObject);
    procedure bt_tgClick(Sender: TObject);
    procedure venMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure fechasDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmocgen: Tfrmocgen;

implementation

uses frmocompra, frmacces, frmbus, frmmodoc;

{$R *.dfm}

function Tfrmocgen.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
         end;
end;

procedure Tfrmocgen.BitBtn1Click(Sender: TObject);
begin
con_oc.Close;
close;
end;

procedure Tfrmocgen.BitBtn5Click(Sender: TObject);
begin
  frmoc.ShowModal;
  con_oc.Close;
  con_oc.SQL.Text:='select * from oc where rendida="N" limit 50';
  con_oc.Open;
end;

procedure Tfrmocgen.FormShow(Sender: TObject);
begin
  ven.Visible:=false;
  con_oc.Close;
  con_oc.SQL.Text:='select * from oc where rendida="N" limit 50';
  con_oc.Open;
end;

procedure Tfrmocgen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
con_oc.Close;
end;

procedure Tfrmocgen.grid_octotalocGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if atext<>'' then
   atext:=formatfloat('#,##0.00',strtofloat(Atext));
end;

procedure Tfrmocgen.grid_octotalimpGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if atext<>'' then
   atext:=formatfloat('#,##0.00',strtofloat(Atext));
end;

procedure Tfrmocgen.BitBtn2Click(Sender: TObject);
begin
  frmbuscar.ShowModal;
  if esnum(frmbuscar.bus.Text) then
  begin
    con_oc.Close;
    con_oc.SQL.Text:='select * from oc where id like :c and rendida="N"';
    con_oc.Params[0].AsString:=frmbuscar.bus.Text+'%';
    con_oc.Open;
  end
  else
  begin
    con_oc.Close;
    con_oc.SQL.Text:='select * from oc where nom_prov like :n and rendida="N"';
    con_oc.Params[0].AsString:='%'+frmbuscar.bus.Text+'%';
    con_oc.Open;
  end;
end;

procedure Tfrmocgen.bt_eliClick(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15))OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) then
begin
if  MessageDlg('Desea Eliminar la ORDEN DE COMPRA Nro.: '+con_oc.fieldbyname('id').AsString,
        mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
        if not con_oc.IsEmpty then
        begin
          if  MessageDlg('Al eliminar la O/C se eliminará todo su detalle Asociado....¿Está seguro de Eliminar O/C?',
             mtConfirmation,[mbYes, mbNo],0)=mrNo then
          else
          begin

             tb_beli.Close;
             tb_beli.open;
             tb_beli.Edit;
             tb_beli.Append;
             tb_beli.FieldByName('usu').AsString:=frmacceso.usuario.Text;
             tb_beli.FieldByName('numoc').AsFloat:=con_oc.fieldbyname('id').Asfloat;
             tb_beli.Post;

             eli_detoc.Close;
             eli_detoc.Params[0].Asfloat:=con_oc.fieldbyname('id').Asfloat;
             eli_detoc.ExecSQL;
             eli_oc.Close;
             eli_oc.Params[0].Asfloat:=con_oc.fieldbyname('id').Asfloat;
             eli_oc.ExecSQL;
             con_oc.Close;
             con_oc.SQL.Text:='select * from oc where rendida="N" limit 50';
             con_oc.Open;
          end;
        end;
    end;
end
else
begin
  application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;
end;

procedure Tfrmocgen.grid_ocDblClick(Sender: TObject);
begin
bt_modClick(Sender);
end;

procedure Tfrmocgen.bt_modClick(Sender: TObject);
begin
   frmmooc.ShowModal;
  con_oc.Close;
  con_oc.SQL.Text:='select * from oc where rendida="N" limit 50';
  con_oc.Open;
end;

procedure Tfrmocgen.BitBtn6Click(Sender: TObject);
begin
calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmocgen.BitBtn3Click(Sender: TObject);
begin

        if  MessageDlg('¿Está seguro de Anular O/C Nro.: '+con_oc.fieldbyname('id').Asstring+'...?',
             mtConfirmation,[mbYes, mbNo],0)=mrNo then
          else
          begin
             anula_oc.Close;
             anula_oc.Params[0].AsInteger:=con_oc.fieldbyname('id').AsInteger;
             anula_oc.ExecSQL;
             con_oc.Close;
             con_oc.SQL.Text:='select * from oc where rendida="N" limit 50';
             con_oc.Open;
          end;
end;

procedure Tfrmocgen.bt_tpClick(Sender: TObject);
begin

 fechas.Visible:=true;
 fec1.Date:=date;
 fec2.Date:=date;

 
end;

procedure Tfrmocgen.bt_outClick(Sender: TObject);
begin
ven.Visible:=false;
grid_oc.SetFocus;
end;

procedure Tfrmocgen.bt_tgClick(Sender: TObject);
var
  vt:double;
  vp:double;
  vti:double;
  vpi:double;
begin
 ven.Visible:=true;
 con_bsgen.Close;
 con_bsgen.SQL.Text:='select sum(totaloc)as totaloc  from oc where anulada="N"';
 con_bsgen.Open;
 vt:=con_bsgen.fieldbyname('totaloc').asfloat;
 con_bsgen.close;

 con_bsgen.Close;
 con_bsgen.SQL.Text:='select sum(oc.totalimp)as totalimp  from oc,proveedores where anulada="N" and oc.cod_prov=proveedores.id and proveedores.tpro=2';
 con_bsgen.Open;
 vti:=con_bsgen.fieldbyname('totalimp').asfloat;
 con_bsgen.close;


 con_bsgen.Close;
 con_bsgen.SQL.Text:='select sum(totaloc)as totaloc  from oc where anulada="N" and pagada="S"';
 con_bsgen.Open;
 vp:=con_bsgen.fieldbyname('totaloc').asfloat;
 con_bsgen.close;

 con_bsgen.Close;
 con_bsgen.SQL.Text:='select sum(oc.totalimp)as totalimp  from oc,proveedores where anulada="N" and pagada="S" and oc.cod_prov=proveedores.id and proveedores.tpro=2';
 con_bsgen.Open;
 vpi:=con_bsgen.fieldbyname('totalimp').asfloat;
 con_bsgen.close;



 if not con_bsgen.IsEmpty then
 begin
    ven.Caption:='TOTAL GENERADO: '+ formatfloat('#,##0.00',vt)+ ' Bs.F IMP: '+formatfloat('#,##0.00',vti) +' Bs.F - TOTAL PAGADO: '+ formatfloat('#,##0.00',vp) +' Bs.F IMP: '+formatfloat('#,##0.00',vpi) +' Bs.F - TOTAL PENDIENTE:'+formatfloat('#,##0.00',vt-vp)+' Bs.F IMP: '+ formatfloat('#,##0.00',vti-vpi)+' Bs.F';
 end
 else
 begin
    ven.Caption:='TOTAL GENERADO: '+ formatfloat('#,##0.00',vt)+ ' Bs.F IMP: '+formatfloat('#,##0.00',vti) +' Bs.F - TOTAL PAGADO: '+ formatfloat('#,##0.00',vp) +' Bs.F IMP: '+formatfloat('#,##0.00',vpi) +' Bs.F - TOTAL PENDIENTE:'+formatfloat('#,##0.00',vt-vp)+' Bs.F IMP: '+ formatfloat('#,##0.00',vti-vpi)+' Bs.F';
 end;

end;

procedure Tfrmocgen.venMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 ven.Caption:='';
 ven.Visible:=false;
end;

procedure Tfrmocgen.fechasDblClick(Sender: TObject);
var
  vt:double;
  vp:double;
  vti:double;
  vpi:double;
begin
fechas.Visible:=false;

ven.Visible:=true;
 con_bspro.Close;
 con_bspro.Params[0].AsInteger:=con_oc.fieldbyname('cod_prov').AsInteger;
 con_bspro.Params[1].AsDate:=fec1.Date;
 con_bspro.Params[2].AsDate:=fec2.Date;
 con_bspro.SQL.Text:='select sum(totaloc)as totaloc from oc where anulada="N" and cod_prov=:cp and oc.fec_ela BETWEEN :f1 and :f2 group by cod_prov';
 con_bspro.Open;
 vt:=con_bspro.fieldbyname('totaloc').asfloat;

 con_bspro.Close;
 con_bspro.Params[0].AsInteger:=con_oc.fieldbyname('cod_prov').AsInteger;
 con_bspro.Params[1].AsDate:=fec1.Date;
 con_bspro.Params[2].AsDate:=fec2.Date;
 con_bspro.SQL.Text:='select sum(oc.totalimp)as totalimp from oc,proveedores where oc.anulada="N" and oc.cod_prov=:cp and oc.fec_ela BETWEEN :f1 and :f2 and oc.cod_prov=proveedores.id and proveedores.tpro=2 group by oc.cod_prov';
 con_bspro.Open;
 vti:=con_bspro.fieldbyname('totalimp').asfloat;


 con_bspro.Close;
 con_bspro.Params[0].AsInteger:=con_oc.fieldbyname('cod_prov').AsInteger;
 con_bspro.Params[1].AsDate:=fec1.Date;
 con_bspro.Params[2].AsDate:=fec2.Date;
 con_bspro.SQL.Text:='select sum(totaloc)as totaloc from oc where anulada="N" and pagada="S" and cod_prov=:cp and oc.fec_ela BETWEEN :f1 and :f2 group by cod_prov';
 con_bspro.Open;
 vp:=con_bspro.fieldbyname('totaloc').asfloat;

 con_bspro.Close;
 con_bspro.Params[0].AsInteger:=con_oc.fieldbyname('cod_prov').AsInteger;
 con_bspro.Params[1].AsDate:=fec1.Date;
 con_bspro.Params[2].AsDate:=fec2.Date;
 con_bspro.SQL.Text:='select sum(oc.totalimp)as totalimp from oc,proveedores where oc.anulada="N" and oc.pagada="S" and oc.cod_prov=:cp and oc.fec_ela BETWEEN :f1 and :f2 and oc.cod_prov=proveedores.id and proveedores.tpro=2 group by oc.cod_prov';
 con_bspro.Open;
 vpi:=con_bspro.fieldbyname('totalimp').asfloat;


 if not con_bspro.IsEmpty then
 begin
    ven.Caption:='EL PROVEEDOR: '+con_oc.fieldbyname('nom_prov').Asstring +' GEN.: '+ formatfloat('#,##0.00',vt)+' Bs.F IMP: '+formatfloat('#,##0.00',vti) +' Bs.F  PAG.: '+ formatfloat('#,##0.00',vp) +' Bs.F IMP: '+formatfloat('#,##0.00',vpi) + ' Bs.F PEND.: '+formatfloat('#,##0.00',vt-vp)+'Bs.F IMP: '+formatfloat('#,##0.00',vti-vpi)+' Bs.F';
 end
 else
 begin
    ven.Caption:='EL PROVEEDOR: '+con_oc.fieldbyname('nom_prov').Asstring +' GEN.: '+ formatfloat('#,##0.00',vt)+' Bs.F IMP: '+formatfloat('#,##0.00',vti) +' Bs.F  PAG.: '+ formatfloat('#,##0.00',vp) +' Bs.F IMP: '+formatfloat('#,##0.00',vpi) + ' Bs.F PEND.: '+formatfloat('#,##0.00',vt-vp)+'Bs.F IMP: '+formatfloat('#,##0.00',vti-vpi)+' Bs.F';
 end;

end;

end.
