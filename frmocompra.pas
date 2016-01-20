unit frmocompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxCalc, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, dxExEdtr, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms, ComCtrls, ZAbstractTable,
  dxEditor, dxEdLib;

type
  Tfrmoc = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    bt_mod: TBitBtn;
    calculadora: TRxCalculator;
    GroupBox1: TGroupBox;
    num_oc: TLabel;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    datanumoc: TDataSource;
    con_prov: TZQuery;
    dataprov: TDataSource;
    con_proy: TZQuery;
    dataproy: TDataSource;
    con_zon: TZQuery;
    datazon: TDataSource;
    con_unesc: TZQuery;
    dataunesc: TDataSource;
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
    grupo_base2: TGroupBox;
    grup_esc: TGroupBox;
    lab_nomdep: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    lab_dire: TLabel;
    Label34: TLabel;
    lab_plazo: TLabel;
    grup_fp: TGroupBox;
    ck_ac: TRadioButton;
    ck_cc: TRadioButton;
    ck_ch: TRadioButton;
    grup_cc: TGroupBox;
    ck_cif: TRadioButton;
    ck_fob: TRadioButton;
    ck_fas: TRadioButton;
    ck_otros: TRadioButton;
    bt_cargaoc: TBitBtn;
    grupo_base3: TPanel;
    con_menu: TZQuery;
    datamenu: TDataSource;
    GroupBox2: TGroupBox;
    fec_uno: TDateTimePicker;
    fec_dos: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    dias_oc: TZQuery;
    DataSource1: TDataSource;
    datanomdia: TDataSource;
    nom_dia: TZQuery;
    con_sema: TZQuery;
    datsema: TDataSource;
    con_menu2: TZQuery;
    datamenu2: TDataSource;
    con_menuarticulo: TStringField;
    con_menuunidad: TStringField;
    con_menucantidad: TFloatField;
    con_menuprecio: TFloatField;
    con_menutotal: TFloatField;
    con_menu2articulo: TStringField;
    con_menu2unidad: TStringField;
    con_menu2cantidad: TFloatField;
    con_menu2precio: TFloatField;
    con_menu2total: TFloatField;
    con_menuimp: TStringField;
    con_menu2imp: TStringField;
    con_menuimpbs: TFloatField;
    con_menu2impbs: TFloatField;
    tb_oc: TZTable;
    dataoc: TDataSource;
    BitBtn6: TBitBtn;
    grupo_base4: TGroupBox;
    obs: TEdit;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    lab_matri: TLabel;
    lab_mun: TLabel;
    Label10: TLabel;
    con_mun: TZQuery;
    DataSource3: TDataSource;
    Panel3: TPanel;
    lab_men: TLabel;
    Label7: TLabel;
    ttimp: TdxEdit;
    ttoc: TdxEdit;
    ins_detoc: TZQuery;
    DataSource4: TDataSource;
    fecoc: TDateTimePicker;
    con_menuimpbs_1: TFloatField;
    con_menu2impbs_1: TFloatField;
    con_emioc: TZQuery;
    dataemioc: TDataSource;
    con_detoc: TZQuery;
    datadetoc: TDataSource;
    grid_oc: TdxDBGrid;
    grid_ocren: TdxDBGridMaskColumn;
    grid_ocarticulo: TdxDBGridMaskColumn;
    grid_ocunidad: TdxDBGridMaskColumn;
    grid_occan: TdxDBGridMaskColumn;
    grid_ocprecio_uni: TdxDBGridMaskColumn;
    grid_octotal: TdxDBGridMaskColumn;
    grid_ocimp_x100: TdxDBGridMaskColumn;
    grid_ocimpbs: TdxDBGridMaskColumn;
    con_numoc: TZTable;
    con_maxid: TZQuery;
    datamaxid: TDataSource;
    con_menuid: TIntegerField;
    con_menumat_pro: TIntegerField;
    con_menu2id: TIntegerField;
    con_menu2mat_pro: TIntegerField;
    lis_prov: TDBComboBox;
    cod_prov: TDBComboBox;
    lista_prov: TdxDBGrid;
    lista_provnom: TdxDBGridMaskColumn;
    cod_proy: TDBComboBox;
    lis_proy: TDBComboBox;
    lista_proy: TdxDBGrid;
    cod_esc: TDBComboBox;
    lis_esc: TDBComboBox;
    lista_esc: TdxDBGrid;
    lista_escnom_esc: TdxDBGridMaskColumn;
    con_prove: TZQuery;
    DataSource2: TDataSource;
    con_esc: TZQuery;
    dataesc: TDataSource;
    lista_proymodal: TdxDBGridMaskColumn;
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
    Label13: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_menuKeyPress(Sender: TObject; var Key: Char);
    procedure bt_cargaocClick(Sender: TObject);
    procedure fec_unoKeyPress(Sender: TObject; var Key: Char);
    procedure fec_dosKeyPress(Sender: TObject; var Key: Char);
    procedure fec_unoEnter(Sender: TObject);
    procedure bt_modClick(Sender: TObject);
    procedure lis_provDblClick(Sender: TObject);
    procedure lista_provDblClick(Sender: TObject);
    procedure lis_proyDblClick(Sender: TObject);
    procedure lista_proyDblClick(Sender: TObject);
    procedure lis_escDblClick(Sender: TObject);
    procedure lista_escDblClick(Sender: TObject);
    procedure lis_provEnter(Sender: TObject);
    procedure lis_proyKeyPress(Sender: TObject; var Key: Char);
    procedure lis_escKeyPress(Sender: TObject; var Key: Char);
    procedure lis_escEnter(Sender: TObject);
    procedure lis_proyEnter(Sender: TObject);
    procedure lis_escExit(Sender: TObject);
    procedure lis_proyExit(Sender: TObject);
  private
     { Private declarations }
  public
    sw:byte;
    ndw,salir:integer;
    toc,timp:double;

      { Public declarations }
  end;


var
  frmoc: Tfrmoc;

implementation

uses frmacces, frmzeb, frmocgeneral;

{$R *.dfm}

procedure Tfrmoc.BitBtn1Click(Sender: TObject);
begin
tb_oc.Cancel;
close;
end;

procedure Tfrmoc.BitBtn6Click(Sender: TObject);
begin
calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmoc.FormShow(Sender: TObject);
begin
salir:=0;

cod_prov.Clear;
lis_prov.Clear;
cod_proy.Clear;
lis_proy.Clear;

obs.Clear;
ck_segn.Checked:=true;
con_numoc.Close;
con_numoc.Open;
con_numoc.FindLast;
con_numoc.Edit;
num_oc.Caption:= floattostr(con_numoc.fieldbyname('id').AsFloat+1);
con_numoc.fieldbyname('id').AsFloat:=con_numoc.fieldbyname('id').AsFloat+1;
con_numoc.Post;
con_numoc.Close;
lis_prov.SetFocus;
fecoc.Date:=date;
fec_uno.Date:=date;
fec_dos.Date:=date;
lista_prov.Visible:=false;
lista_proy.Visible:=false;
lista_esc.Visible:=false;

end;

procedure Tfrmoc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tfrmoc.cb_menuKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0;
end;

procedure Tfrmoc.bt_cargaocClick(Sender: TObject);
var
nd,i:integer;
begin
sw:=0;
ndw:=0;
toc:=0;
timp:=0;
if (ck_ac.Checked=false) and (ck_cc.Checked=false) and (ck_ch.Checked=false) then
begin
    messagebox(0,'Debe Ingresar Forma de Pago...!','Mensaje al Usuario',16);
    ck_ac.SetFocus;
end
else
begin
  if (ck_cif.Checked=false) and (ck_fob.Checked=false) and (ck_fas.Checked=false) and (ck_otros.Checked=false) then
  begin
    messagebox(0,'Debe Ingresar Condiciones de Compra...!','Mensaje al Usuario',16);
    ck_cif.SetFocus;
  end
  else
  begin
    grupo_base3.Visible:=true;
    grupo_base4.Visible:=true;


         if ck_m1.Checked then
         begin

              dias_oc.close;
              dias_oc.params[0].AsDate:=fec_dos.Date;
              dias_oc.params[1].AsDate:=fec_uno.Date;
              dias_oc.Open;
              nd:=dias_oc.FieldByName('dias').AsInteger+1;
              ndw:=nd;
              if (nd<1) or (nd>5) then
              begin
                messagebox(0,'Debe Ingresar una Semana de 5 dias...!','Mensaje al Usuario',16);
                fec_uno.SetFocus;
              end
              else
              begin
                sw:=0;
              end;
              bt_modClick(Sender);
         end
         else
         begin
           if ck_m2.Checked then
           begin
              dias_oc.close;
              dias_oc.params[0].AsDate:=fec_dos.Date;
              dias_oc.params[1].AsDate:=fec_uno.Date;
              dias_oc.Open;
              nd:=5+(dias_oc.FieldByName('dias').AsInteger+1);
              ndw:=nd;
              if (nd<6)  and (nd>10) then
              begin
                messagebox(0,'Debe Ingresar una Semana de 5 dias...!','Mensaje al Usuario',16);
                fec_uno.SetFocus;
              end
              else
              begin
                 sw:=1;
              end;
              bt_modClick(Sender);
            end;
         end;
         con_detoc.Close;
         con_detoc.Params[0].AsInteger:=strtoint(num_oc.Caption);
         con_detoc.Open;
         con_detoc.FindFirst;
         toc:=0;
         timp:=0;
           for i:=1 to con_detoc.RecordCount do
           begin

             if con_detoc.fieldbyname('cod_prod').Asinteger=26 then
             begin
                con_detoc.Edit;
                con_detoc.FieldByName('can').AsFloat:=con_detoc.fieldbyname('mat_pro').Asinteger;
             end;

             if con_detoc.fieldbyname('cod_prod').Asinteger=32 then
             begin
                con_detoc.Edit;
                con_detoc.FieldByName('can').AsFloat:=((round((con_detoc.FieldByName('can').AsFloat/con_detoc.FieldByName('mat_pro').AsFloat)*1000)*con_detoc.FieldByName('mat_pro').AsFloat)/50);
                con_detoc.FieldByName('can').AsFloat:=round(con_detoc.FieldByName('can').AsFloat);
             end;


               if (con_detoc.FieldByName('can').AsFloat>=0.00) and (con_detoc.FieldByName('can').AsFloat<=0.99) then
               begin
                   con_detoc.Edit;
                   con_detoc.FieldByName('can').AsFloat:=1;
                   con_detoc.FieldByName('total').AsFloat:=con_detoc.FieldByName('can').AsFloat*con_detoc.FieldByName('precio_uni').AsFloat;
                   con_detoc.FieldByName('impbs').AsFloat:=(con_detoc.FieldByName('total').AsFloat*(con_detoc.FieldByName('imp_x100').AsFloat/100));
                   con_detoc.Post;
                   toc:=toc+con_detoc.fieldbyname('total').AsFloat;
                   if con_detoc.FieldByName('imp').AsString='S' then
                      timp:=timp+con_detoc.fieldbyname('impbs').AsFloat;
                   con_detoc.Next;
                end
                else
                begin
                   con_detoc.Edit;
                   con_detoc.FieldByName('total').AsFloat:=con_detoc.FieldByName('can').AsFloat*con_detoc.FieldByName('precio_uni').AsFloat;
                   con_detoc.FieldByName('impbs').AsFloat:=con_detoc.FieldByName('total').AsFloat*(con_detoc.FieldByName('imp_x100').AsFloat/100);
                   con_detoc.Post;
                   toc:=toc+con_detoc.fieldbyname('total').AsFloat;
                   if con_detoc.FieldByName('imp').AsString='S' then
                      timp:=timp+con_detoc.fieldbyname('impbs').AsFloat;
                   con_detoc.Next;
                end;
             end;
             ttoc.Text:=formatfloat('#,##0.00',toc);
             ttimp.Text:=formatfloat('#,##0.00',timp);
           grid_oc.Refresh;
           tb_oc.Edit;
           tb_oc.FieldByName('totaloc').Asfloat:=toc;
           tb_oc.FieldByName('totalimp').Asfloat:=timp;
           tb_oc.Post;
     end;
 end;
end;

procedure Tfrmoc.fec_unoKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0;
end;

procedure Tfrmoc.fec_dosKeyPress(Sender: TObject; var Key: Char);
var
 nd:integer;
begin

if key=#13 then
begin
 con_sema.Close;
 con_sema.Params[0].AsInteger:=strtoint(cod_prov.Text);
 con_sema.Params[1].AsInteger:=strtoint(cod_proy.Text);
 con_sema.Params[2].AsInteger:=strtoint(cod_esc.Text);
 con_sema.Params[3].Asdate:=fec_uno.date;
 con_sema.Params[4].asdate:=fec_dos.date;
 con_sema.Open;
 if con_sema.recordcount=0 then
 begin

 dias_oc.close;
 dias_oc.params[0].AsDate:=fec_dos.Date;
 dias_oc.params[1].AsDate:=fec_uno.Date;
 dias_oc.Open;
 nd:=dias_oc.FieldByName('dias').AsInteger+1;
 if (nd>=1) and (nd<=5) then
 begin
         grupo_base2.Visible:=true;
         lab_nomdep.Caption:=lis_esc.Text;
         lab_dire.Caption:=con_unesc.fieldbyname('dir_1').AsString;
 end
 else
 begin
   messagebox(0,'Debe ingresar una semana valida...!','Mensaje al Usuario',16);
   fec_uno.SetFocus;
 end;
 end
 else
 begin
    messagebox(0,pchar('Orden de Compra de Semana: '+ datetostr(fec_uno.Date)+' al '+datetostr(fec_dos.Date)+' Ya esta Generada'),'Mensaje al Usuario',16);
    con_sema.Close;
    close;
 end;
end;
end;

procedure Tfrmoc.fec_unoEnter(Sender: TObject);
begin
grupo_base2.Visible:=false;
grupo_base3.Visible:=false;
grupo_base4.Visible:=false;
end;

procedure Tfrmoc.bt_modClick(Sender: TObject);
var
i:integer;
begin
//************** GUARDA EL DETALLE DE LA ORDEN DE COMPRA ***************//
if sw=0 then
begin
   con_menu.Close;
   con_menu.Params[0].AsInteger:=strtoint(cod_proy.Text);
   con_menu.Params[1].AsInteger:=strtoint(cod_prov.Text);
   con_menu.Params[2].AsInteger:=strtoint(cod_esc.Text);
   con_menu.Params[3].AsInteger:=ndw;
   con_menu.Open;
 if  con_menu.IsEmpty then
 begin
     messagebox(0,'No existen MENUS asignados...!','Mensaje al Usuario',16);
     grupo_base3.Visible:=false;
     grupo_base4.Visible:=true;
     bt_cargaoc.SetFocus;
 end
 else
 begin
   con_menu.FindFirst;
   con_maxid.Close;
   con_maxid.Open;
   for i:=1 to con_menu.RecordCount do
   begin
      ins_detoc.Close;
      ins_detoc.Params[0].AsInteger:=con_maxid.fieldbyname('maxid').AsInteger;
      ins_detoc.Open;
      ins_detoc.FindLast;
      ins_detoc.Edit;
      ins_detoc.Append;
      ins_detoc.FieldByName('cod_oc').AsInteger  :=strtoint(num_oc.Caption);
      ins_detoc.FieldByName('ren').AsInteger     :=i;
      ins_detoc.FieldByName('articulo').AsString :=con_menu.fieldbyname('articulo').AsString;
      ins_detoc.FieldByName('unidad').AsString   :=con_menu.fieldbyname('unidad').AsString;
      ins_detoc.FieldByName('can').AsFloat       :=con_menu.fieldbyname('cantidad').Asfloat;
      ins_detoc.FieldByName('precio_uni').AsFloat:=con_menu.fieldbyname('precio').Asfloat;
      ins_detoc.FieldByName('total').AsFloat     :=con_menu.fieldbyname('total').Asfloat;
      ins_detoc.FieldByName('imp').Asstring      :=con_menu.fieldbyname('imp').Asstring;
      ins_detoc.FieldByName('imp_x100').AsFloat  :=con_menu.fieldbyname('impbs').Asfloat;
      ins_detoc.FieldByName('impbs').AsFloat     :=con_menu.fieldbyname('impbs_1').Asfloat;

      ins_detoc.FieldByName('cod_prod').Asinteger  :=con_menu.fieldbyname('id').Asinteger;
      ins_detoc.FieldByName('mat_pro').Asinteger   :=con_menu.fieldbyname('mat_pro').Asinteger;

      ins_detoc.Post;
      con_menu.Next;
   end;
 end;
end
else
begin
  if sw=1 then
  begin
   con_menu2.Close;
   con_menu2.Params[0].AsInteger:=strtoint(cod_proy.Text);
   con_menu2.Params[1].AsInteger:=strtoint(cod_prov.Text);
   con_menu2.Params[2].AsInteger:=strtoint(cod_esc.Text);
   con_menu2.Params[3].AsInteger:=ndw;
   con_menu2.Open;
 if  con_menu2.IsEmpty then
 begin
    messagebox(0,'No existen MENUS asignados...!','Mensaje al Usuario',16);
    grupo_base3.Visible:=false;
    grupo_base4.Visible:=false;
    bt_cargaoc.SetFocus;
 end
 else
 begin
   con_menu2.FindFirst;
   con_maxid.Close;
   con_maxid.Open;
   for i:=1 to con_menu2.RecordCount do
   begin
      ins_detoc.Close;
      ins_detoc.Params[0].AsInteger:=con_maxid.fieldbyname('maxid').AsInteger;
      ins_detoc.Open;
      ins_detoc.FindLast;
      ins_detoc.Edit;
      ins_detoc.Append;
      ins_detoc.FieldByName('cod_oc').AsInteger  :=strtoint(num_oc.Caption);
      ins_detoc.FieldByName('ren').AsInteger     :=i;
      ins_detoc.FieldByName('articulo').AsString :=con_menu2.fieldbyname('articulo').AsString;
      ins_detoc.FieldByName('unidad').AsString   :=con_menu2.fieldbyname('unidad').AsString;
      ins_detoc.FieldByName('can').AsFloat       :=con_menu2.fieldbyname('cantidad').Asfloat;
      ins_detoc.FieldByName('precio_uni').AsFloat:=con_menu2.fieldbyname('precio').Asfloat;
      ins_detoc.FieldByName('total').AsFloat     :=con_menu2.fieldbyname('total').Asfloat;
      ins_detoc.FieldByName('imp').Asstring      :=con_menu2.fieldbyname('imp').Asstring;
      ins_detoc.FieldByName('imp_x100').AsFloat  :=con_menu2.fieldbyname('impbs').Asfloat;
      ins_detoc.FieldByName('impbs').AsFloat     :=con_menu2.fieldbyname('impbs_1').Asfloat;
      ins_detoc.FieldByName('cod_prod').Asinteger:=con_menu2.fieldbyname('id').Asinteger;
      ins_detoc.FieldByName('mat_pro').Asinteger :=con_menu2.fieldbyname('mat_pro').Asinteger;

      ins_detoc.Post;
      con_menu2.Next;
   end;
  end;
 end;
end;





//**************** GUARDA LA ORDEN DE COMPRA ***************//
 tb_oc.Open;
 tb_oc.Append;
 tb_oc.Edit;
 tb_oc.FieldByName('id').AsInteger  :=strtoint(num_oc.Caption);
 tb_oc.FieldByName('fec_ela').AsDateTime:=date;
 tb_oc.FieldByName('anno').Asinteger  :=strtoint(lab_anno.Caption);
 tb_oc.FieldByName('org').asinteger   :=strtoint(lab_org.Caption);
 tb_oc.FieldByName('uad').asstring    :=lab_ua.Caption;
 tb_oc.FieldByName('uej').Asstring    :=lab_ue.Caption;
 tb_oc.FieldByName('ubi').AsString    :=lab_ug.Caption;
 tb_oc.FieldByName('mun').AsString    :=lab_mun.Caption;
 tb_oc.FieldByName('lent').AsString   :=lab_nomdep.Caption;
                                                                                                                
 if ck_segs.Checked=true then
    tb_oc.FieldByName('seg').AsString :='S';
 if ck_segn.Checked=true then
    tb_oc.FieldByName('seg').AsString :='N';

 tb_oc.FieldByName('pen').asinteger   :=strtoint(lab_plazo.Caption);

 if ck_ac.Checked=true then
    tb_oc.FieldByName('fpag').asstring:='ABONO EN CUENTA';
 if ck_cc.Checked=true then
    tb_oc.FieldByName('fpag').asstring:='CARTA CREDITO';
 if ck_ch.Checked=true then
    tb_oc.FieldByName('fpag').asstring:='CHEQUE';

 if ck_cif.Checked=true then
    tb_oc.FieldByName('coc').AsString:='CIF';
 if ck_fob.Checked=true then
    tb_oc.FieldByName('coc').AsString:='FOB';
 if ck_fas.Checked=true then
    tb_oc.FieldByName('coc').AsString:='FAS';
 if ck_otros.Checked=true then
    tb_oc.FieldByName('coc').AsString:='OTROS';



 tb_oc.FieldByName('est').AsString:='';
 tb_oc.FieldByName('cod_prov').AsInteger:=strtoint(cod_prov.Text);
 tb_oc.FieldByName('cod_proy').AsInteger:=strtoint(cod_proy.Text);
 tb_oc.FieldByName('cod_esc').AsInteger:=strtoint(cod_esc.Text);

 { con_sema.Close;
  con_sema.Params[0].AsInteger:=strtoint(cod_prov.Text);
  con_sema.Params[1].AsInteger:=strtoint(cod_proy.Text);
  con_sema.Params[2].AsInteger:=strtoint(cod_esc.Text);
  con_sema.Open;
  con_sema.FindLast;}

    if ck_m1.Checked  then
       tb_oc.FieldByName('semana').asinteger:=1;
    if ck_m2.Checked  then
       tb_oc.FieldByName('semana').asinteger:=2;




    tb_oc.FieldByName('fec_del').AsDateTime:=fec_uno.Date;
    tb_oc.FieldByName('fec_al').AsDateTime:=fec_dos.Date;

    tb_oc.FieldByName('ent').AsInteger:=strtoint(lab_efe.Caption);
    tb_oc.FieldByName('tel_prov').Asstring:=lab_telprov.Caption;

    tb_oc.FieldByName('nom_prov').Asstring:=lab_nomprov.Caption;
    tb_oc.FieldByName('dir_prov').Asstring:=lab_dirprov.Caption;
    tb_oc.FieldByName('rif_prov').Asstring:=lab_rifprov.Caption;
    tb_oc.FieldByName('cpostal_prov').Asstring:=lab_cpprov.Caption;
    tb_oc.FieldByName('nom_esc').Asstring:=lab_nomdep.Caption;
    tb_oc.FieldByName('dir_esc').Asstring:=lab_dire.Caption;
    tb_oc.FieldByName('pent_esc').Asstring:=lab_plazo.Caption;
    tb_oc.FieldByName('obs').Asstring:= obs.Text;
    tb_oc.FieldByName('nom_proy').Asstring:= lis_proy.Text;

    tb_oc.FieldByName('totaloc').Asfloat:=toc;
    tb_oc.FieldByName('totalimp').Asfloat:=timp;
    tb_oc.FieldByName('mat_esc').AsInteger:=strtoint(lab_matri.Caption);
    tb_oc.FieldByName('fecoc').AsDateTime:=fecoc.Date;
    tb_oc.FieldByName('usuario').Asstring:=frmacceso.con_usu.fieldbyname('nombre').asstring;
    tb_oc.Post;
//************************************************************************
end;

procedure Tfrmoc.lis_provDblClick(Sender: TObject);
begin
lista_prov.Visible:=true;
con_prov.Close;
con_prov.Open;
end;

procedure Tfrmoc.lista_provDblClick(Sender: TObject);
begin
  lis_prov.Text:=con_prov.fieldbyname('nom').asstring;
  cod_prov.Text:=con_prov.fieldbyname('id').asstring;
  lista_prov.Visible:=false;
end;

procedure Tfrmoc.lis_proyDblClick(Sender: TObject);
begin
lista_proy.Visible:=true;
con_proy.Close;
con_proy.Params[0].AsInteger:=strtoint(cod_prov.Text);
con_proy.Open;
if con_proy.IsEmpty then
begin
   messagebox(0,'No tiene Dependencias Asignadas...!','Mensaje al Usuario',16);
   lis_prov.SetFocus;
end;
end;

procedure Tfrmoc.lista_proyDblClick(Sender: TObject);
begin
  lis_proy.Text:=con_proy.fieldbyname('modal').asstring;
  cod_proy.Text:=con_proy.fieldbyname('cod_moda').asstring;
  lista_proy.Visible:=false;
  lis_proy.SetFocus;
end;

procedure Tfrmoc.lis_escDblClick(Sender: TObject);
begin
lista_esc.Visible:=true;
con_unesc.Close;
con_unesc.Params[0].asinteger:=strtoint(cod_proy.Text);
con_unesc.Params[1].asinteger:=strtoint(cod_prov.Text);
con_unesc.Open;
end;

procedure Tfrmoc.lista_escDblClick(Sender: TObject);
begin
  lis_esc.Text:=con_unesc.fieldbyname('nom_esc').asstring;
  cod_esc.Text:=con_unesc.fieldbyname('cod_dep').asstring;
  lista_esc.Visible:=false;
  lis_esc.SetFocus;
end;

procedure Tfrmoc.lis_provEnter(Sender: TObject);
begin
   cod_proy.Clear;
   lis_proy.Clear;

   ck_ac.Checked:=false;
   ck_cc.Checked:=false;
   ck_ch.Checked:=false;
   ck_cif.Checked:=false;
   ck_fob.Checked:=false;
   ck_fas.Checked:=false;
   ck_otros.Checked:=false;
   lista_proy.Visible:=false;
   lista_prov.Visible:=false;
   lista_esc.Visible:=false;

   grupo_base.Visible:=false;
   grupo_base2.Visible:=false;
   grupo_base3.Visible:=false;
   grupo_base4.Visible:=false;
end;

procedure Tfrmoc.lis_proyKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0
else
begin
    grupo_base.Visible:=true;
    con_zon.Close;
    con_zon.Open;

    lab_anno.Caption:=con_zon.fieldbyname('anno').AsString;
    lab_fec.Caption:=datetostr(date);
    lab_org.Caption:='10';
    lab_ua.Caption :=con_zon.fieldbyname('uni_adm').AsString;
    lab_ue.Caption :=con_zon.fieldbyname('uni_eje').AsString;
    lab_ug.Caption :='ESTADO BOLÌVAR';
    lab_efe.Caption:='06';
    lab_men.Caption:='TOTAL IMPUESTO Bs:';


    con_prove.Close;
    con_prove.Params[0].AsInteger:=strtoint(cod_prov.Text);
    con_prove.Open;
    lab_nomprov.Caption:=con_prove.fieldbyname('nom').AsString;
    lab_dirprov.Caption:=con_prove.fieldbyname('dir').AsString;
    lab_telprov.Caption:=con_prove.fieldbyname('tel').AsString;
    lab_rifprov.Caption:=con_prove.fieldbyname('rif').AsString;
    lab_cpprov.Caption:=inttostr(con_prove.fieldbyname('cpo').Asinteger);
    lab_plazo.Caption :=con_prove.fieldbyname('pzo_ent').AsString;
    con_prove.close;
end;
end;

procedure Tfrmoc.lis_escKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0
else
begin
con_emioc.Close;
con_emioc.Params[0].AsInteger:= strtoint(cod_prov.Text);
con_emioc.Params[1].AsInteger:=strtoint(cod_proy.Text);
con_emioc.Params[2].AsInteger:=strtoint(cod_esc.Text);
con_emioc.open;
con_emioc.FindLast;
       con_esc.Close;
       con_esc.Params[0].asinteger:=strtoint(cod_esc.Text);
       con_esc.Open;
       lab_nomdep.Caption:=con_esc.FieldByName('nombre').AsString;
       lab_dire.Caption  := con_esc.FieldByName('direc').AsString;
       lab_matri.Caption :=con_esc.FieldByName('mat_pro').AsString;
       con_mun.Close;
       con_mun.Params[0].AsInteger:=con_esc.FieldByName('cod_mun').AsInteger;
       con_mun.Open;
       lab_mun.Caption:=con_mun.fieldbyname('nombre').AsString;
       con_mun.close;
       con_esc.close;
       fecoc.SetFocus;
 end;
end;

procedure Tfrmoc.lis_escEnter(Sender: TObject);
begin
grupo_base2.Visible:=false;
lista_proy.Visible:=false;
lista_prov.Visible:=false;
lista_esc.Visible:=false;
end;

procedure Tfrmoc.lis_proyEnter(Sender: TObject);
begin
   lista_proy.Visible:=false;
   lista_prov.Visible:=false;
   lista_esc.Visible:=false;

end;

procedure Tfrmoc.lis_escExit(Sender: TObject);
begin
con_emioc.Close;
con_emioc.Params[0].AsInteger:= strtoint(cod_prov.Text);
con_emioc.Params[1].AsInteger:=strtoint(cod_proy.Text);
con_emioc.Params[2].AsInteger:=strtoint(cod_esc.Text);
con_emioc.open;
con_emioc.FindLast;
       con_esc.Close;
       con_esc.Params[0].asinteger:=strtoint(cod_esc.Text);
       con_esc.Open;
       lab_nomdep.Caption:=con_esc.FieldByName('nombre').AsString;
       lab_dire.Caption  := con_esc.FieldByName('direc').AsString;
       lab_matri.Caption :=con_esc.FieldByName('mat_pro').AsString;
       con_mun.Close;
       con_mun.Params[0].AsInteger:=con_esc.FieldByName('cod_mun').AsInteger;
       con_mun.Open;
       lab_mun.Caption:=con_mun.fieldbyname('nombre').AsString;
       con_mun.close;
       con_esc.close;
       fecoc.SetFocus;
end;

procedure Tfrmoc.lis_proyExit(Sender: TObject);
begin
 grupo_base.Visible:=true;
    con_zon.Close;
    con_zon.Open;

    lab_anno.Caption:=con_zon.fieldbyname('anno').AsString;
    lab_fec.Caption:=datetostr(date);
    lab_org.Caption:='10';
    lab_ua.Caption :=con_zon.fieldbyname('uni_adm').AsString;
    lab_ue.Caption :=con_zon.fieldbyname('uni_eje').AsString;
    lab_ug.Caption :='ESTADO BOLÌVAR';
    lab_efe.Caption:='06';
    lab_men.Caption:='TOTAL IMPUESTO Bs:';


    con_prove.Close;
    con_prove.Params[0].AsInteger:=strtoint(cod_prov.Text);
    con_prove.Open;
    lab_nomprov.Caption:=con_prove.fieldbyname('nom').AsString;
    lab_dirprov.Caption:=con_prove.fieldbyname('dir').AsString;
    lab_telprov.Caption:=con_prove.fieldbyname('tel').AsString;
    lab_rifprov.Caption:=con_prove.fieldbyname('rif').AsString;
    lab_cpprov.Caption:=inttostr(con_prove.fieldbyname('cpo').Asinteger);
    lab_plazo.Caption :=con_prove.fieldbyname('pzo_ent').AsString;
    con_prove.close;
end;

end.



