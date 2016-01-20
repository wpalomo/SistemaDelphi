unit frmcoocpag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RxCalc,
  StdCtrls, dxCntner, dxEditor, dxEdLib, Buttons, ExtCtrls, ComCtrls,
  dxExEdtr, dxDBGrid, dxTL, dxDBCtrl, dxDBTLCl, dxGrClms;

type
  Tfrmconsoc = class(TForm)
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
    GroupBox3: TGroupBox;
    ck_m1: TRadioButton;
    ck_m2: TRadioButton;
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
    anulada: TGroupBox;
    Image1: TImage;
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
    lab_esc: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    fec_uno: TDateTimePicker;
    fec_dos: TDateTimePicker;
    fecoc: TDateTimePicker;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    bt_aceptar: TBitBtn;
    GroupBox1: TGroupBox;
    lab_numoc: TLabel;
    GroupBox7: TGroupBox;
    lab_prov: TLabel;
    GroupBox8: TGroupBox;
    lab_proy: TLabel;
    grupo_base3: TPanel;
    Panel2: TPanel;
    Label5: TLabel;
    Panel3: TPanel;
    lab_men: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    ttimp: TdxEdit;
    ttoc: TdxEdit;
    aux_tot: TdxEdit;
    aux_imp: TdxEdit;
    tocbs: TdxEdit;
    impbsf: TdxEdit;
    ocbsf: TdxEdit;
    tocbsf: TdxEdit;
    BitBtn6: TBitBtn;
    BitBtn2: TBitBtn;
    calculadora: TRxCalculator;
    dataoc: TDataSource;
    con_oc: TZQuery;
    pagcontrol: TPageControl;
    pagren: TTabSheet;
    Label13: TLabel;
    memofac: TMemo;
    Label14: TLabel;
    memone: TMemo;
    pagch: TTabSheet;
    Label24: TLabel;
    Label26: TLabel;
    fechapag: TDateTimePicker;
    analistap: TEdit;
    GroupBox6: TGroupBox;
    lab_ano2: TLabel;
    GroupBox9: TGroupBox;
    lab_prog: TLabel;
    numcheq: TEdit;
    Label29: TLabel;
    Label19: TLabel;
    fecren: TDateTimePicker;
    Label22: TLabel;
    analistar: TEdit;
    GroupBox4: TGroupBox;
    gridocxnum: TdxDBGrid;
    con_ocxnumc: TZQuery;
    dataocxnumc: TDataSource;
    tot_monto: TZQuery;
    datamonto: TDataSource;
    gridocxnumid: TdxDBGridMaskColumn;
    gridocxnumtotalimp: TdxDBGridMaskColumn;
    gridocxnumnumcheque: TdxDBGridColumn;
    RichEdit1: TRichEdit;
    Label30: TLabel;
    gridocxnumtotaloc: TdxDBGridMaskColumn;
    con_ocxnumcid: TFloatField;
    con_ocxnumcfec_ela: TDateField;
    con_ocxnumcanno: TIntegerField;
    con_ocxnumcorg: TIntegerField;
    con_ocxnumcuad: TStringField;
    con_ocxnumcuej: TStringField;
    con_ocxnumcubi: TStringField;
    con_ocxnumcmun: TStringField;
    con_ocxnumclent: TStringField;
    con_ocxnumcseg: TStringField;
    con_ocxnumcpen: TIntegerField;
    con_ocxnumcfpag: TStringField;
    con_ocxnumccoc: TStringField;
    con_ocxnumcest: TStringField;
    con_ocxnumccod_prov: TIntegerField;
    con_ocxnumcsemana: TIntegerField;
    con_ocxnumccod_proy: TIntegerField;
    con_ocxnumccod_esc: TIntegerField;
    con_ocxnumcfec_del: TDateField;
    con_ocxnumcfec_al: TDateField;
    con_ocxnumcent: TIntegerField;
    con_ocxnumctel_prov: TStringField;
    con_ocxnumcnom_prov: TStringField;
    con_ocxnumcdir_prov: TStringField;
    con_ocxnumcrif_prov: TStringField;
    con_ocxnumccpostal_prov: TIntegerField;
    con_ocxnumcnom_esc: TStringField;
    con_ocxnumcdir_esc: TStringField;
    con_ocxnumcpent_esc: TStringField;
    con_ocxnumcobs: TStringField;
    con_ocxnumctotaloc: TFloatField;
    con_ocxnumctotalimp: TFloatField;
    con_ocxnumcnom_proy: TStringField;
    con_ocxnumcmat_esc: TIntegerField;
    con_ocxnumcfecoc: TDateField;
    con_ocxnumcusuario: TStringField;
    con_ocxnumcanulada: TStringField;
    con_ocxnumcrendida: TStringField;
    con_ocxnumcnfac: TStringField;
    con_ocxnumcnne: TStringField;
    con_ocxnumcanalista_rinde: TStringField;
    con_ocxnumcpagada: TStringField;
    con_ocxnumcfecren: TDateField;
    con_ocxnumcfecpago: TDateField;
    con_ocxnumcanalista_paga: TStringField;
    con_ocxnumcimputacionp: TStringField;
    con_ocxnumcnumcheque: TLargeintField;
    totbs: TdxEdit;
    totimp: TdxEdit;
    totche: TdxEdit;
    paga_oc: TZQuery;
    data_pagaoc: TDataSource;
    nopaga_oc: TZQuery;
    data_nopaga: TDataSource;
    GroupBox5: TGroupBox;
    desimp: TComboBox;
    nimp: TComboBox;
    con_ocxnumcdesimp: TStringField;
    con_ocxnumcid_1: TIntegerField;
    con_ocxnumcnom: TStringField;
    con_ocxnumcrif: TStringField;
    con_ocxnumcced: TIntegerField;
    con_ocxnumcnac: TStringField;
    con_ocxnumctpro: TIntegerField;
    con_ocxnumcdir: TStringField;
    con_ocxnumcciu: TStringField;
    con_ocxnumctel: TStringField;
    con_ocxnumcrcz: TIntegerField;
    con_ocxnumcrpocei: TIntegerField;
    con_ocxnumccpo: TIntegerField;
    con_ocxnumcrleg: TStringField;
    con_ocxnumccel: TStringField;
    con_ocxnumcimp: TStringField;
    con_ocxnumcimpx100: TFloatField;
    con_ocxnumcpzo_ent: TIntegerField;
    gridocxnumimp: TdxDBGridCheckColumn;
    con_ocxnumcnproyf: TIntegerField;
    con_ocp: TZQuery;
    dataocp: TDataSource;
    act_saldo: TZReadOnlyQuery;
    datasaldo: TDataSource;
    con_saldo: TZReadOnlyQuery;
    datacsaldo: TDataSource;
    act_saldo2: TZReadOnlyQuery;
    datasaldo2: TDataSource;
    con_numcheq: TZQuery;
    datanumcheq: TDataSource;
    con_ocpro: TZQuery;
    dataconprov: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure numcheqKeyPress(Sender: TObject; var Key: Char);
    procedure parKeyPress(Sender: TObject; var Key: Char);
    procedure bt_aceptarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure nimpChange(Sender: TObject);
    procedure nimpKeyPress(Sender: TObject; var Key: Char);
    procedure desimpKeyPress(Sender: TObject; var Key: Char);
    procedure desimpChange(Sender: TObject);
    procedure numcheqExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconsoc: Tfrmconsoc;

implementation

uses frmacces, frmocpagadas, frmclaveocpagadas;

{$R *.dfm}

procedure Tfrmconsoc.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmconsoc.FormShow(Sender: TObject);
begin
 bt_aceptar.Enabled:=true;
 con_ocxnumc.Close;
 totbs.Clear;
 totimp.Clear;
 totche.Clear;
 numcheq.Clear;
 fechapag.Date:=date;
 aux_tot.Text:='';
 aux_imp.Text:='';
 desimp.ItemIndex:=10;
 nimp.ItemIndex:=10;

 if frmocpag.con_oc.FieldByName('anulada').AsString='S' then
    anulada.Visible:=true;
 if frmocpag.con_oc.FieldByName('anulada').AsString='N' then
    anulada.Visible:=false;

 lab_numoc.Caption:=frmocpag.con_oc.FieldByName('id').AsString;
 lab_prov.Caption :=frmocpag.con_oc.FieldByName('nom_prov').AsString;
 lab_proy.Caption :=frmocpag.con_oc.FieldByName('nom_proy').AsString;
 lab_fec.Caption  :=frmocpag.con_oc.FieldByName('fec_ela').AsString;
 lab_org.Caption  :=frmocpag.con_oc.FieldByName('org').AsString;
 lab_ua.Caption   :=frmocpag.con_oc.FieldByName('uad').AsString;
 lab_ue.Caption   :=frmocpag.con_oc.FieldByName('uej').AsString;
 lab_ug.Caption   :=frmocpag.con_oc.FieldByName('ubi').AsString;
 lab_efe.Caption  :=frmocpag.con_oc.FieldByName('ent').AsString;
 lab_anno.Caption :=frmocpag.con_oc.FieldByName('anno').AsString;
 lab_ano2.Caption :=frmocpag.con_oc.FieldByName('anno').AsString;

 if (frmocpag.con_oc.FieldByName('nom_proy').AsString='EDUCACION ESPECIAL') or (frmocpag.con_oc.FieldByName('nom_proy').AsString='EDUCACION ESPECIAL ( ALMUERZO )') then
    lab_prog.Caption :='34'
 else
 begin
    if (frmocpag.con_oc.FieldByName('nom_proy').AsString='EDUCACION INICIAL') or (frmocpag.con_oc.FieldByName('nom_proy').AsString='EDUCACION INICIAL ( ALMUERZO )') then
       lab_prog.Caption :='40'
    else
    begin
        if (frmocpag.con_oc.FieldByName('nom_proy').AsString='ESCUELA BASICA BOLIVARIANA') or (frmocpag.con_oc.FieldByName('nom_proy').AsString='ESCUELA BASICA BOLIVARIANA ( ALMUERZO )') then
           lab_prog.Caption :='30'

        else
        begin
            if (frmocpag.con_oc.FieldByName('nom_proy').AsString='ESCUELA TECNICA ROBINSONIANA') or (frmocpag.con_oc.FieldByName('nom_proy').AsString='ESCUELA TECNICA ROBINSONIANA ( ALMUERZO )') then
               lab_prog.Caption :='33'
            else
            begin
              if frmocpag.con_oc.FieldByName('nom_proy').AsString='LICEO BOLIVARIANO' then
                 lab_prog.Caption :='32'
            end;
        end;
     end;
  end;

 lab_nomprov.Caption:=frmocpag.con_oc.FieldByName('nom_prov').AsString;
 lab_dirprov.Caption:=frmocpag.con_oc.FieldByName('dir_prov').AsString;
 lab_telprov.Caption:=frmocpag.con_oc.FieldByName('tel_prov').AsString;
 if frmocpag.con_oc.FieldByName('seg').AsString='S' then
 begin
    ck_segs.Checked:=true;
    ck_segn.Checked:=false;
 end;
 if frmocpag.con_oc.FieldByName('seg').AsString='N' then
 begin
    ck_segs.Checked:=false;
    ck_segn.Checked:=true;
 end;
 lab_rifprov.Caption:=frmocpag.con_oc.FieldByName('rif_prov').AsString;
 lab_cpprov.Caption :=frmocpag.con_oc.FieldByName('cpostal_prov').AsString;
 lab_esc.Caption    :=frmocpag.con_oc.FieldByName('nom_esc').AsString;
 fecoc.Date         :=frmocpag.con_oc.FieldByName('fecoc').AsDateTime;
 fec_uno.Date       :=frmocpag.con_oc.FieldByName('fec_del').AsDateTime;
 fec_dos.Date       :=frmocpag.con_oc.FieldByName('fec_al').AsDateTime;
 lab_nomdep.Caption :=frmocpag.con_oc.FieldByName('nom_esc').Asstring;
 lab_mun.Caption    :=frmocpag.con_oc.FieldByName('mun').Asstring;
 lab_dire.Caption   :=frmocpag.con_oc.FieldByName('dir_esc').Asstring;
 lab_plazo.Caption  :=frmocpag.con_oc.FieldByName('pent_esc').Asstring;
 lab_matri.Caption  :=frmocpag.con_oc.FieldByName('mat_esc').Asstring;
 if frmocpag.con_oc.FieldByName('fpag').Asstring='ABONO EN CUENTA' then
 begin
    ck_ac.Checked:=true;
 end;
 if frmocpag.con_oc.FieldByName('fpag').Asstring='CARTA CREDITO' then
 begin
    ck_cc.Checked:=true;
 end;
 if frmocpag.con_oc.FieldByName('fpag').Asstring='CHEQUE' then
 begin
    ck_ch.Checked:=true;
 end;


 if frmocpag.con_oc.FieldByName('coc').Asstring='CIF' then
 begin
    ck_cif.Checked:=true;
 end;
 if frmocpag.con_oc.FieldByName('coc').Asstring='FAS' then
 begin
    ck_fas.Checked:=true;
 end;
 if frmocpag.con_oc.FieldByName('coc').Asstring='FOB' then
 begin
    ck_fob.Checked:=true;
 end;
 if frmocpag.con_oc.FieldByName('coc').Asstring='OTROS' then
 begin
    ck_otros.Checked:=true;
 end;

 if (frmocpag.con_oc.FieldByName('semana').Asinteger=1) or (frmocpag.con_oc.FieldByName('semana').Asinteger=3) or (frmocpag.con_oc.FieldByName('semana').Asinteger=5) or (frmocpag.con_oc.FieldByName('semana').Asinteger=7)then ck_m1.Checked:=true;
 if (frmocpag.con_oc.FieldByName('semana').Asinteger=2) or (frmocpag.con_oc.FieldByName('semana').Asinteger=4) or (frmocpag.con_oc.FieldByName('semana').Asinteger=6) or (frmocpag.con_oc.FieldByName('semana').Asinteger=8)then ck_m2.Checked:=true;


 obs.Text:=frmocpag.con_oc.FieldByName('obs').Asstring;
 memofac.Text:=frmocpag.con_oc.FieldByName('nfac').Asstring;
 memone.Text:=frmocpag.con_oc.FieldByName('nne').Asstring;
 analistar.Text:=frmocpag.con_oc.FieldByName('analista_rinde').Asstring;
 analistap.Text:=frmacceso.con_usu.fieldbyname('nombre').asstring;

 fecren.Date:=frmocpag.con_oc.FieldByName('fecren').AsDateTime;
 ttoc.Text:=formatfloat('#,##0.00',frmocpag.con_oc.FieldByName('totaloc').Asfloat);
 ttimp.Text:=formatfloat('#,##0.00',frmocpag.con_oc.FieldByName('totalimp').Asfloat);
 tocbs.Text:=formatfloat('#,##0.00',(frmocpag.con_oc.FieldByName('totaloc').Asfloat +frmocpag.con_oc.FieldByName('totalimp').Asfloat));
 //impbsf.Text:=formatfloat('#,##0.00',(frmocpag.con_oc.FieldByName('totalimp').Asfloat/1000));
 //ocbsf.Text:=formatfloat('#,##0.00',(frmocpag.con_oc.FieldByName('totaloc').Asfloat/1000));
 //tocbsf.Text:=formatfloat('#,##0.00',((frmocpag.con_oc.FieldByName('totaloc').Asfloat +frmocpag.con_oc.FieldByName('totalimp').Asfloat)/1000));
 pagcontrol.ActivePageIndex:=1;
 numcheq.SetFocus;
end;

procedure Tfrmconsoc.BitBtn6Click(Sender: TObject);
begin
calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmconsoc.numcheqKeyPress(Sender: TObject; var Key: Char);
begin
 case key of
   #48..#57:;
        #13: begin
               bitbtn6.SetFocus;
             end;
         #8:;
 else
   key:=#0;
 end;
end;

procedure Tfrmconsoc.parKeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Tfrmconsoc.bt_aceptarClick(Sender: TObject);
var
 x:pchar;
 v:string;
begin
 con_ocxnumc.Close;
 con_ocxnumc.Params[0].AsInteger:=strtoint(numcheq.text);
 con_ocxnumc.Open;

if not(con_ocxnumc.FieldByName('id').AsFloat=strtofloat(lab_numoc.Caption)) then
begin

con_saldo.Close;
con_saldo.Open;
if con_saldo.FieldByName('saldo').AsFloat < frmocpag.con_oc.FieldByName('totaloc').Asfloat then
begin

   v:='Puede Ingresar una nueva Orden de pago ó se pueden procesar cheques por montos menores a: '+ formatfloat('#,##0.00',con_saldo.FieldByName('saldo').AsFloat)+' Bs.F';
   x:=pchar(v);
   application.MessageBox(x,'Mensaje al Usuario',32);
end
else
begin
//*****************************************
If numcheq.Text='' then
begin
   application.MessageBox('Debe Ingresar Numero de Cheque...!','Mensaje al Usuario',16);
   numcheq.SetFocus;
end
else
begin
 if con_ocxnumc.RecordCount=0 then
 begin
   paga_oc.Close;
   paga_oc.Params[0].AsString:=analistap.Text;
   paga_oc.Params[1].Asdate:=fechapag.Date;
   paga_oc.Params[2].Asinteger:=strtoint(numcheq.Text);
   paga_oc.Params[3].AsString:=nimp.Text;
   paga_oc.Params[4].AsString:=desimp.Text;
   paga_oc.Params[5].AsFloat:=strtoint(lab_prog.Caption);
   paga_oc.Params[6].Asfloat:=frmocpag.con_oc.FieldByName('id').Asfloat;
   paga_oc.Params[7].Asfloat:=con_saldo.FieldByName('nro').Asinteger;
   paga_oc.ExecSQL;


       con_ocpro.Close;
       con_ocpro.Params[0].AsFloat:=frmocpag.con_oc.FieldByName('id').Asfloat;
       con_ocpro.Open;



      act_saldo.Close;
      if con_ocpro.FieldByName('tpro').AsInteger=2 then
      begin
        act_saldo.Params[0].AsFloat:=frmocpag.con_oc.FieldByName('totaloc').Asfloat+frmocpag.con_oc.FieldByName('totalimp').Asfloat;
      end
      else
      begin
        act_saldo.Params[0].AsFloat:=frmocpag.con_oc.FieldByName('totaloc').Asfloat;
      end;
      act_saldo.ExecSQL;
    close;
 end
 else
 begin
  if (frmocpag.con_oc.FieldByName('cod_prov').Asinteger=con_ocxnumc.FieldByName('cod_prov').AsInteger)and (strtoint(lab_prog.Caption)=con_ocxnumc.FieldByName('nproyf').AsInteger) then
  begin
      paga_oc.Close;
      paga_oc.Params[0].AsString:=analistap.Text;
      paga_oc.Params[1].Asdate:=fechapag.Date;
      paga_oc.Params[2].Asinteger:=strtoint(numcheq.Text);
      paga_oc.Params[3].AsString:=nimp.Text;
      paga_oc.Params[4].AsString:=desimp.Text;
      paga_oc.Params[5].Asinteger:=strtoint(lab_prog.Caption);
      paga_oc.Params[6].AsFloat:=frmocpag.con_oc.FieldByName('id').Asfloat;
      paga_oc.Params[7].Asfloat:=con_saldo.FieldByName('nro').Asinteger;
      paga_oc.ExecSQL;


       con_ocpro.Close;
       con_ocpro.Params[0].AsFloat:=frmocpag.con_oc.FieldByName('id').Asfloat;
       con_ocpro.Open;

      act_saldo.Close;
      if con_ocpro.FieldByName('tpro').AsInteger=2 then
      begin
        act_saldo.Params[0].AsFloat:=frmocpag.con_oc.FieldByName('totaloc').Asfloat+frmocpag.con_oc.FieldByName('totalimp').Asfloat;
      end
      else
      begin
        act_saldo.Params[0].AsFloat:=frmocpag.con_oc.FieldByName('totaloc').Asfloat;
      end;
      act_saldo.ExecSQL;
      close;
  end
  else
  begin
    application.MessageBox(pchar('Este Cheque ya está asignado al proveedor: '+ con_ocxnumc.FieldByName('nom_prov').Asstring+'...!'),'Mensaje al Usuario',16);
    numcheq.SetFocus;
  end;
 end;
end;
end;
end
else
begin
  application.MessageBox(pchar('Esta Orden de Compra Nro.: '+frmocpag.con_oc.FieldByName('id').Asstring+'   fue cancelada con el cheque Nro.:   '+ con_ocp.fieldbyname('numcheque').Asstring +'...!'),'Mensaje al Usuario',16);
end;

//*********************************************
end;

procedure Tfrmconsoc.BitBtn2Click(Sender: TObject);
begin



if numcheq.Text='' then
begin
   application.MessageBox('Debe Ingresar Numero de Cheque...!','Mensaje al Usuario',16);
   numcheq.SetFocus;
end
else
begin
if (con_ocxnumc.FieldByName('pagada').AsString='') then
begin
  application.MessageBox('Orden de Compra NO ha sido Pagada...!','Mensaje al Usuario',16);
end
else
begin
if (con_ocxnumc.FieldByName('pagada').AsString='S') then
begin
  if  MessageDlg('Orden de Compra PAGADA...!  Desea Continuar con el NO PAGO de la Orden?' ,
    mtConfirmation,[mbYes, mbNo],0)=mrYes then
  begin
  con_saldo.Close;
  con_saldo.Open;
  if not con_saldo.IsEmpty then
  begin
      act_saldo2.Close;
      if con_ocxnumc.FieldByName('tpro').AsInteger=2 then
      begin
        act_saldo2.Params[0].AsFloat:=frmocpag.con_oc.FieldByName('totaloc').Asfloat+frmocpag.con_oc.FieldByName('totalimp').Asfloat;
      end
      else
      begin
        act_saldo2.Params[0].AsFloat:=frmocpag.con_oc.FieldByName('totaloc').Asfloat;
      end;
      act_saldo2.ExecSQL;


   nopaga_oc.Close;
   nopaga_oc.Params[0].AsFloat:=frmocpag.con_oc.FieldByName('id').Asfloat;
   nopaga_oc.ExecSQL;
   close;
  end
  else
  begin
     application.MessageBox(pchar('No Existe Orden de Pago Activa: ..!'),'Mensaje al Usuario',16);
     close;
  end;
end;
end;
end;
end;
end;


procedure Tfrmconsoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmocpag.con_oc.Close;
frmocpag.con_oc.SQL.Text:='select * from oc where rendida="S" limit 50';
frmocpag.con_oc.ExecSQL;
frmocpag.con_oc.Open;
con_ocp.Close;
con_ocpro.Close;
con_ocxnumc.Close;
end;

procedure Tfrmconsoc.nimpChange(Sender: TObject);
begin
 desimp.ItemIndex:=nimp.ItemIndex;
end;

procedure Tfrmconsoc.nimpKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure Tfrmconsoc.desimpKeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Tfrmconsoc.desimpChange(Sender: TObject);
begin
nimp.ItemIndex:=desimp.ItemIndex;
end;






procedure Tfrmconsoc.numcheqExit(Sender: TObject);
var
  mon,imp:double;
  i:integer;
  clave:string;
begin
  if numcheq.text<>'' then
  begin
   con_numcheq.Close;
   con_numcheq.Params[0].AsInteger:=strtoint(numcheq.text);
   con_numcheq.Open;
   if not con_numcheq.IsEmpty then
   begin
        if  MessageDlg('Numero de Cheque ya Asignado...!  Desea Continuar?' ,
         mtConfirmation,[mbYes, mbNo],0)=mrYes then
        begin
          clave:='0000';
          con_ocp.close;
          con_ocp.Params[0].AsFloat:=frmocpag.con_oc.FieldByName('id').Asfloat;
          con_ocp.Open;
          if not con_ocp.IsEmpty then
          begin
            if  MessageDlg('Esta Orden de Compra Nro.: '+frmocpag.con_oc.FieldByName('id').Asstring+'   fue cancelada con el cheque Nro.:   '+ con_ocp.fieldbyname('numcheque').Asstring +'  Desea Continuar?' ,
               mtConfirmation,[mbYes, mbNo],0)=mrYes then
            begin
              frmclavepago.ShowModal;
              clave:=frmclavepago.clave.Text;
              bt_aceptar.Enabled:=false;
            end;
          end
          else
          begin
            clave:='665';
          end;
        end;
   end
   else
   begin
     clave:='665';
   end;




//**************************************************
if (clave='665') then
begin

mon:=0;
imp:=0;
  if numcheq.Text<>'' then
  begin

             if numcheq.Text='0' then
             begin
                messagebox(0,'Debe Ingresar Un numero de Cheque Valido...!','Mensaje al Usuario',16);
                numcheq.Clear;
                numcheq.SetFocus;
             end
             else
             begin
                 con_ocxnumc.Close;
                 con_ocxnumc.Params[0].AsInteger:=strtoint(numcheq.text);
                 con_ocxnumc.Open;
                 if con_ocxnumc.RecordCount>0 then
                 begin
                     for i:=1 to con_ocxnumc.RecordCount do
                     begin
                       if not(con_ocxnumc.FieldByName('id').Asfloat=strtofloat(lab_numoc.Caption)) then
                       begin
                         if con_ocxnumc.fieldbyname('imp').AsString='S' then
                         begin
                           mon:=mon+con_ocxnumc.fieldbyname('totaloc').AsFloat;
                           imp:=imp+con_ocxnumc.fieldbyname('totalimp').AsFloat;
                         end
                         else
                         begin
                           if con_ocxnumc.fieldbyname('imp').AsString='N' then
                           begin
                             mon:=mon+con_ocxnumc.fieldbyname('totaloc').AsFloat;
                           end;
                         end;
                       end
                       else
                       begin
                         messagebox(0,'Orden de compra ya asignada al numero de Cheque Ingresado...!','Mensaje al Usuario',16);
                         //CLOSE;
                       end;
                     con_ocxnumc.Next;
                     end;
                     totbs.Text:=formatfloat('#,##0.00',mon);
                     totimp.Text:=formatfloat('#,##0.00',imp);
                     totche.Text:=formatfloat('#,##0.00',(mon+imp));
                     bitbtn2.SetFocus;
                 end
                 else
                 begin
                   totbs.Clear;
                   totimp.Clear;
                   totche.Clear;
                   messagebox(0,'No existen Ordenes de compras Asignadas al numero de Cheque Ingresado...!','Mensaje al Usuario',16);
                   bitbtn6.SetFocus;
                 end;
             end;
     end;
 end
 else
 begin
   close;
   bt_aceptar.Enabled:=true;
 end;
 //************************

   end;
  end;
end.
