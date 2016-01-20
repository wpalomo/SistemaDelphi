unit frmmodoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  RxCalc, dxCntner, dxEditor, dxEdLib, dxDBCtrl, dxDBGrid, dxTL, ExtCtrls,
  ComCtrls, StdCtrls, Buttons;

type
  Tfrmmooc = class(TForm)
    grupo_base2: TGroupBox;
    grup_esc: TGroupBox;
    lab_nomdep: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    lab_dire: TLabel;
    Label34: TLabel;
    lab_plazo: TLabel;
    Label6: TLabel;
    lab_matri: TLabel;
    lab_mun: TLabel;
    Label10: TLabel;
    grup_fp: TGroupBox;
    ck_ac: TRadioButton;
    ck_cc: TRadioButton;
    ck_ch: TRadioButton;
    grup_cc: TGroupBox;
    ck_cif: TRadioButton;
    ck_fob: TRadioButton;
    ck_fas: TRadioButton;
    ck_otros: TRadioButton;
    grupo_base4: TGroupBox;
    obs: TEdit;
    grupo_base: TGroupBox;
    grup_prov: TGroupBox;
    Label12: TLabel;
    lab_nomprov: TLabel;
    lab_dirprov: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    lab_telprov: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    lab_rifprov: TLabel;
    Label27: TLabel;
    lab_cpprov: TLabel;
    ck_segs: TRadioButton;
    ck_segn: TRadioButton;
    grup_des: TGroupBox;
    lab_fec: TLabel;
    lab_f: TLabel;
    lab_o: TLabel;
    lab_org: TLabel;
    lab: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    lab_ua: TLabel;
    lab_ue: TLabel;
    lab_ug: TLabel;
    lab_efe: TLabel;
    Label2: TLabel;
    lab_anno: TLabel;
    grupo_unaesc: TGroupBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    fec_uno: TDateTimePicker;
    fec_dos: TDateTimePicker;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    bt_aceptar: TBitBtn;
    GroupBox1: TGroupBox;
    lab_numoc: TLabel;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    grupo_base3: TPanel;
    grid_oc: TdxDBGrid;
    Panel2: TPanel;
    Label5: TLabel;
    BitBtn6: TBitBtn;
    calculadora: TRxCalculator;
    con_detoc: TZQuery;
    datadetoc: TDataSource;
    lab_prov: TLabel;
    lab_proy: TLabel;
    lab_esc: TLabel;
    grid_ocren: TdxDBGridMaskColumn;
    grid_ocarticulo: TdxDBGridMaskColumn;
    grid_ocunidad: TdxDBGridMaskColumn;
    grid_occan: TdxDBGridMaskColumn;
    grid_ocprecio_uni: TdxDBGridMaskColumn;
    grid_octotal: TdxDBGridMaskColumn;
    grid_ocimp_x100: TdxDBGridMaskColumn;
    grid_ocimpbs: TdxDBGridMaskColumn;
    Panel3: TPanel;
    lab_men: TLabel;
    Label7: TLabel;
    ttimp: TdxEdit;
    ttoc: TdxEdit;
    aux_tot: TdxEdit;
    aux_imp: TdxEdit;
    act_oc: TZQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField3: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    dataact: TDataSource;
    fecoc: TDateTimePicker;
    anulada: TGroupBox;
    Image1: TImage;
    con_detocid: TFloatField;
    con_detoccod_oc: TFloatField;
    con_detocren: TIntegerField;
    con_detocarticulo: TStringField;
    con_detocunidad: TStringField;
    con_detoccan: TFloatField;
    con_detocprecio_uni: TFloatField;
    con_detoctotal: TFloatField;
    con_detocimp: TStringField;
    con_detocimp_x100: TFloatField;
    con_detocimpbs: TFloatField;
    con_detoccod_prod: TIntegerField;
    con_detocmat_pro: TIntegerField;
    GroupBox3: TGroupBox;
    ck_m1: TRadioButton;
    ck_m2: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grid_ocEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure grid_ocKeyPress(Sender: TObject; var Key: Char);
    procedure bt_aceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grid_ocimp_x100GetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure grid_ocimpbsGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
  private
    { Private declarations }
  public
     valor_tot,valor_imp:double;
    { Public declarations }
  end;

var
  frmmooc: Tfrmmooc;

implementation

uses frmocgeneral;

{$R *.dfm}

procedure Tfrmmooc.BitBtn1Click(Sender: TObject);
begin
con_detoc.Cancel;
close;
end;

procedure Tfrmmooc.BitBtn6Click(Sender: TObject);
begin
calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmmooc.FormShow(Sender: TObject);
begin
 aux_tot.Text:='';
 aux_imp.Text:='';


 if frmocgen.con_oc.FieldByName('anulada').AsString='S' then
    anulada.Visible:=true;
 if frmocgen.con_oc.FieldByName('anulada').AsString='N' then
    anulada.Visible:=false;

 lab_numoc.Caption:=frmocgen.con_oc.FieldByName('id').AsString;
 lab_prov.Caption :=frmocgen.con_oc.FieldByName('nom_prov').AsString;
 lab_proy.Caption :=frmocgen.con_oc.FieldByName('nom_proy').AsString;
 lab_fec.Caption  :=frmocgen.con_oc.FieldByName('fec_ela').AsString;
 lab_org.Caption  :=frmocgen.con_oc.FieldByName('org').AsString;
 lab_ua.Caption   :=frmocgen.con_oc.FieldByName('uad').AsString;
 lab_ue.Caption   :=frmocgen.con_oc.FieldByName('uej').AsString;
 lab_ug.Caption   :=frmocgen.con_oc.FieldByName('ubi').AsString;
 lab_efe.Caption  :=frmocgen.con_oc.FieldByName('ent').AsString;
 lab_anno.Caption :=frmocgen.con_oc.FieldByName('anno').AsString;
 lab_nomprov.Caption:=frmocgen.con_oc.FieldByName('nom_prov').AsString;
 lab_dirprov.Caption:=frmocgen.con_oc.FieldByName('dir_prov').AsString;
 lab_telprov.Caption:=frmocgen.con_oc.FieldByName('tel_prov').AsString;
 if frmocgen.con_oc.FieldByName('seg').AsString='S' then
 begin
    ck_segs.Checked:=true;
    ck_segn.Checked:=false;
 end;
 if frmocgen.con_oc.FieldByName('seg').AsString='N' then
 begin
    ck_segs.Checked:=false;
    ck_segn.Checked:=true;
 end;
 lab_rifprov.Caption:=frmocgen.con_oc.FieldByName('rif_prov').AsString;
 lab_cpprov.Caption :=frmocgen.con_oc.FieldByName('cpostal_prov').AsString;
 lab_esc.Caption    :=frmocgen.con_oc.FieldByName('nom_esc').AsString;
 fecoc.Date         :=frmocgen.con_oc.FieldByName('fecoc').AsDateTime;
 fec_uno.Date       :=frmocgen.con_oc.FieldByName('fec_del').AsDateTime;
 fec_dos.Date       :=frmocgen.con_oc.FieldByName('fec_al').AsDateTime;
 lab_nomdep.Caption :=frmocgen.con_oc.FieldByName('nom_esc').Asstring;
 lab_mun.Caption    :=frmocgen.con_oc.FieldByName('mun').Asstring;
 lab_dire.Caption   :=frmocgen.con_oc.FieldByName('dir_esc').Asstring;
 lab_plazo.Caption  :=frmocgen.con_oc.FieldByName('pent_esc').Asstring;
 lab_matri.Caption  :=frmocgen.con_oc.FieldByName('mat_esc').Asstring;
 if frmocgen.con_oc.FieldByName('fpag').Asstring='ABONO EN CUENTA' then
 begin
    ck_ac.Checked:=true;
 end;
 if frmocgen.con_oc.FieldByName('fpag').Asstring='CARTA CREDITO' then
 begin
    ck_cc.Checked:=true;
 end;
 if frmocgen.con_oc.FieldByName('fpag').Asstring='CHEQUE' then
 begin
    ck_ch.Checked:=true;
 end;


 if frmocgen.con_oc.FieldByName('coc').Asstring='CIF' then
 begin
    ck_cif.Checked:=true;
 end;
 if frmocgen.con_oc.FieldByName('coc').Asstring='FAS' then
 begin
    ck_fas.Checked:=true;
 end;
 if frmocgen.con_oc.FieldByName('coc').Asstring='FOB' then
 begin
    ck_fob.Checked:=true;
 end;
 if frmocgen.con_oc.FieldByName('coc').Asstring='OTROS' then
 begin
    ck_otros.Checked:=true;
 end;

 if (frmocgen.con_oc.FieldByName('semana').Asinteger=1) or (frmocgen.con_oc.FieldByName('semana').Asinteger=3) or (frmocgen.con_oc.FieldByName('semana').Asinteger=5) or (frmocgen.con_oc.FieldByName('semana').Asinteger=7)then ck_m1.Checked:=true;
 if (frmocgen.con_oc.FieldByName('semana').Asinteger=2) or (frmocgen.con_oc.FieldByName('semana').Asinteger=4) or (frmocgen.con_oc.FieldByName('semana').Asinteger=6) or (frmocgen.con_oc.FieldByName('semana').Asinteger=8)then ck_m2.Checked:=true;

 obs.Text:=frmocgen.con_oc.FieldByName('obs').Asstring;

 valor_tot:=frmocgen.con_oc.FieldByName('totaloc').Asfloat;
 valor_imp:=frmocgen.con_oc.FieldByName('totalimp').Asfloat;

 ttoc.Text:=formatfloat('#,##0.00',frmocgen.con_oc.FieldByName('totaloc').Asfloat);
 ttimp.Text:=formatfloat('#,##0.00',frmocgen.con_oc.FieldByName('totalimp').Asfloat);

 con_detoc.Close;
 con_detoc.Params[0].AsInteger:=frmocgen.con_oc.FieldByName('id').Asinteger;
 con_detoc.Open;
 grid_oc.SetFocus;
 grid_oc.FocusedColumn:=3;

end;

procedure Tfrmmooc.grid_ocEdited(Sender: TObject; Node: TdxTreeListNode);
var
vt,vi:double;
begin
if (node.Values[3]= NULL) then
begin
  messagebox(0,'Debe Ingresar una cantidad Válida...!','Mensaje al Usuario',16);
  grid_oc.FocusedColumn:=3;
end
else
begin
 //valor_tot:=frmocgen.con_oc.FieldByName('totaloc').Asfloat;
 //valor_imp:=frmocgen.con_oc.FieldByName('totalimp').Asfloat;

if grid_oc.FocusedColumn=3 then
begin
   if aux_tot.Text<>'' then
      valor_tot:=strtofloat(aux_tot.Text);
   vt:=valor_tot-con_detoc.FieldByName('total').AsFloat;
   con_detoc.FieldByName('total').AsFloat:=node.Values[3] * node.Values[4];
   valor_tot:=vt+con_detoc.FieldByName('total').AsFloat;
   aux_tot.Text:=floattostr(valor_tot);
   ttoc.Text:=formatfloat('#,##0.00',valor_tot);

   if con_detoc.FieldByName('imp').Asstring='S' then
   begin
     if aux_imp.Text<>'' then
         valor_imp:=strtofloat(aux_imp.Text);
     vi:=valor_imp-con_detoc.FieldByName('impbs').AsFloat;
     con_detoc.FieldByName('impbs').AsFloat:=((node.Values[3] * node.Values[4])*(node.Values[6]/100));
     valor_imp:=vi+con_detoc.FieldByName('impbs').AsFloat;
     aux_imp.Text:=floattostr(valor_imp);
     ttimp.Text:=formatfloat('#,##0.00',valor_imp);

   end
   else
     con_detoc.FieldByName('impbs').AsFloat:=((node.Values[3] * node.Values[4])*(node.Values[6]/100));

end;
end;
end;



procedure Tfrmmooc.grid_ocKeyPress(Sender: TObject; var Key: Char);
begin
if grid_oc.FocusedColumn=3 then
begin
   case key of
       #8:;
       #46: key:=#44;
       #48..#57:;
       #13:;
   else
      key:=#0;
   end;
end;
end;

procedure Tfrmmooc.bt_aceptarClick(Sender: TObject);
var
cadena,cadena2,valor:string;
sem:integer;
begin
    sem:=0;
    con_detoc.FindLast;
    con_detoc.Append;
    con_detoc.Delete;

  if ck_ac.Checked=true then
     cadena:='ABONO EN CUENTA';
 if ck_cc.Checked=true then
    cadena:='CARTA CREDITO';
 if ck_ch.Checked=true then
    cadena:='CHEQUE';

 if ck_cif.Checked=true then
    cadena2:='CIF';
 if ck_fob.Checked=true then
    cadena2:='FOB';
 if ck_fas.Checked=true then
    cadena2:='FAS';
 if ck_otros.Checked=true then
    cadena2:='OTROS';

 if ck_segs.Checked=true then
    valor:='S';
 if ck_segn.Checked=true then
    valor:='N';

 if ck_m1.Checked then sem:=1;
 if ck_m2.Checked then sem:=2;


  act_oc.Close;
  act_oc.Params[0].AsFloat  :=valor_tot;
  act_oc.Params[1].AsFloat  :=valor_imp;
  act_oc.Params[2].AsString :=cadena;
  act_oc.Params[3].AsString :=cadena2;
  act_oc.Params[4].AsString :=valor;
  act_oc.Params[5].AsString :=obs.Text;
  act_oc.Params[6].AsInteger:=sem;
  act_oc.Params[7].AsInteger:=frmocgen.con_oc.FieldByName('id').Asinteger;
  act_oc.ExecSQL;

  close;
end;

procedure Tfrmmooc.FormClose(Sender: TObject; var Action: TCloseAction);
begin

con_detoc.Close;
act_oc.Close;

end;

procedure Tfrmmooc.grid_ocimp_x100GetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
 if  con_detoc.FieldByName('imp').AsString='N'then atext:='0';
end;

procedure Tfrmmooc.grid_ocimpbsGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if  con_detoc.FieldByName('imp').AsString='N'then atext:='0';
end;

end.
