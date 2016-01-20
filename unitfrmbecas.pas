unit unitfrmbecas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ZConnection, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractTable, Buttons, ppDB, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppPrnabl, ppBands,
  ppCache, myChkBox, ppVar, ppStrtch, ppMemo, ppModule, raCodMod,
  ppParameter;

type
  Tfrmbecas = class(TForm)
    Label1: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    exp: TEdit;
    npl: TEdit;
    zon: TEdit;
    anb: TEdit;
    GroupBox1: TGroupBox;
    sf: TRadioButton;
    sm: TRadioButton;
    GroupBox2: TGroupBox;
    urb: TRadioButton;
    rur: TRadioButton;
    ind: TRadioButton;
    fro: TRadioButton;
    GroupBox3: TGroupBox;
    a: TRadioButton;
    b: TRadioButton;
    c: TRadioButton;
    de: TRadioButton;
    GroupBox4: TGroupBox;
    mcs: TRadioButton;
    ecs: TRadioButton;
    eso: TRadioButton;
    eom: TRadioButton;
    mam: TRadioButton;
    GroupBox5: TGroupBox;
    qta: TRadioButton;
    csa: TRadioButton;
    apt: TRadioButton;
    psi: TRadioButton;
    bar: TRadioButton;
    GroupBox6: TGroupBox;
    pro: TRadioButton;
    gra: TRadioButton;
    optc: TRadioButton;
    alq: TRadioButton;
    ota: TRadioButton;
    GroupBox7: TGroupBox;
    GroupBox10: TGroupBox;
    ut: TRadioButton;
    cs: TRadioButton;
    so: TRadioButton;
    mdo: TRadioButton;
    GroupBox11: TGroupBox;
    TabSheet2: TTabSheet;
    Label16: TLabel;
    pvs: TEdit;
    Label32: TLabel;
    Label43: TLabel;
    mu: TRadioButton;
    es: TRadioButton;
    na: TRadioButton;
    GroupBox13: TGroupBox;
    puo: TEdit;
    Label20: TLabel;
    Label23: TLabel;
    cid: TEdit;
    Label19: TLabel;
    Label22: TLabel;
    cgo: TEdit;
    ldt: TEdit;
    npe: TEdit;
    Label18: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    GroupBox14: TGroupBox;
    Label44: TLabel;
    Label45: TLabel;
    Label35: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    cei: TEdit;
    Label27: TLabel;
    ape: TEdit;
    ltra: TEdit;
    Label29: TLabel;
    dhab: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    ofi: TEdit;
    Label33: TLabel;
    inm: TEdit;
    Label34: TLabel;
    tlf: TEdit;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label42: TLabel;
    Label41: TLabel;
    Label40: TLabel;
    Label39: TLabel;
    Label38: TLabel;
    Label37: TLabel;
    Label36: TLabel;
    cide: TEdit;
    apell: TEdit;
    lut: TEdit;
    habi: TEdit;
    ocu: TEdit;
    ing: TEdit;
    tel: TEdit;
    Label51: TLabel;
    Label52: TLabel;
    Label50: TLabel;
    Label49: TLabel;
    Label48: TLabel;
    Label47: TLabel;
    ciden: TEdit;
    apn: TEdit;
    lutra: TEdit;
    tlfn: TEdit;
    ingre: TEdit;
    ocup: TEdit;
    dirh: TEdit;
    Label46: TLabel;
    GroupBox18: TGroupBox;
    Label17: TLabel;
    ed: TEdit;
    cb_mun: TComboBox;
    cod_mun: TEdit;
    fnac: TDateTimePicker;
    Label2: TLabel;
    Label25: TLabel;
    GroupBox19: TGroupBox;
    nv: TRadioButton;
    ne: TRadioButton;
    ci: TEdit;
    eep: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    lb_na: TLabel;
    lb_nd: TLabel;
    lb_nc: TLabel;
    lb_ne: TLabel;
    lb_nf: TLabel;
    lb_nb: TLabel;
    GroupBox8: TGroupBox;
    rc2: TRadioButton;
    rc1: TRadioButton;
    rc3: TRadioButton;
    GroupBox9: TGroupBox;
    e1: TEdit;
    dha: TMemo;
    rd2: TRadioButton;
    rd1: TRadioButton;
    re3: TRadioButton;
    re2: TRadioButton;
    re1: TRadioButton;
    rf1: TRadioButton;
    cb_usu: TComboBox;
    Label70: TLabel;
    Label71: TLabel;
    eb2: TRadioButton;
    ee: TRadioButton;
    ei: TRadioButton;
    eb1: TRadioButton;
    eb3: TRadioButton;
    em: TRadioButton;
    obs: TMemo;
    ra: TRadioButton;
    rb: TRadioButton;
    tb_exp: TZTable;
    cod_pl: TEdit;
    con_exp: TZQuery;
    dataexp: TDataSource;
    tb_alu: TZTable;
    tb_aut: TZTable;
    bbp: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    bt_aceptar: TBitBtn;
    bt_imp: TBitBtn;
    ppbecas: TppReport;
    ppexp: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText5: TppDBText;
    ppLabel9: TppLabel;
    ppDBText6: TppDBText;
    ppLabel10: TppLabel;
    ppDBText7: TppDBText;
    ppLabel11: TppLabel;
    ppDBText8: TppDBText;
    ppLabel12: TppLabel;
    ppDBText9: TppDBText;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppDBText37: TppDBText;
    ppShape1: TppShape;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ck_u: TmyCheckBox;
    ck_r: TmyCheckBox;
    ck_i: TmyCheckBox;
    ck_f: TmyCheckBox;
    ck_a: TmyCheckBox;
    ck_b: TmyCheckBox;
    ck_c: TmyCheckBox;
    ck_de: TmyCheckBox;
    ck_1: TmyCheckBox;
    ck_4: TmyCheckBox;
    ck_2: TmyCheckBox;
    ck_3: TmyCheckBox;
    ck_5: TmyCheckBox;
    ck_q: TmyCheckBox;
    ck_p: TmyCheckBox;
    ck_ca: TmyCheckBox;
    ck_ap: TmyCheckBox;
    ck_ba: TmyCheckBox;
    ck_pr: TmyCheckBox;
    ck_al: TmyCheckBox;
    ck_gr: TmyCheckBox;
    ck_oc: TmyCheckBox;
    ck_ot: TmyCheckBox;
    ck_13: TmyCheckBox;
    ck_46: TmyCheckBox;
    ck_78: TmyCheckBox;
    ck_m8: TmyCheckBox;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ck_n1: TmyCheckBox;
    ck_n2: TmyCheckBox;
    ck_n3: TmyCheckBox;
    ck_n31: TmyCheckBox;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ck_n32: TmyCheckBox;
    ck_n4: TmyCheckBox;
    ck_n41: TmyCheckBox;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ck_n5: TmyCheckBox;
    ck_n52: TmyCheckBox;
    ck_n6: TmyCheckBox;
    ppLabel76: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppShape2: TppShape;
    ppLabel87: TppLabel;
    ppDBText10: TppDBText;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppDBText11: TppDBText;
    ppLabel90: TppLabel;
    ppDBText12: TppDBText;
    ppLabel91: TppLabel;
    ppDBText13: TppDBText;
    ppLabel92: TppLabel;
    ppDBText14: TppDBText;
    ppLabel93: TppLabel;
    ppDBText15: TppDBText;
    ppLabel94: TppLabel;
    ppDBText16: TppDBText;
    ppLabel95: TppLabel;
    ppDBText17: TppDBText;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppDBText18: TppDBText;
    ppLabel99: TppLabel;
    ppDBText19: TppDBText;
    ppLabel100: TppLabel;
    ppDBText20: TppDBText;
    ppLabel101: TppLabel;
    ppDBText21: TppDBText;
    ppLabel102: TppLabel;
    ppDBText22: TppDBText;
    ppLabel103: TppLabel;
    ppDBText23: TppDBText;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppDBText24: TppDBText;
    ppLabel106: TppLabel;
    ppDBText25: TppDBText;
    ppLabel107: TppLabel;
    ppDBText26: TppDBText;
    ppLabel108: TppLabel;
    ppDBText27: TppDBText;
    ppLabel109: TppLabel;
    ppDBText28: TppDBText;
    ppLabel110: TppLabel;
    ppDBText29: TppDBText;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppDBText30: TppDBText;
    ppLabel113: TppLabel;
    ppDBText31: TppDBText;
    ppLabel114: TppLabel;
    ppDBText32: TppDBText;
    ppLabel115: TppLabel;
    ppDBText33: TppDBText;
    ppLabel116: TppLabel;
    ppDBText34: TppDBText;
    ppLabel117: TppLabel;
    ppDBText35: TppDBText;
    ppLabel118: TppLabel;
    ppDBText36: TppDBText;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLabel119: TppLabel;
    ppShape5: TppShape;
    ppImage2: TppImage;
    ppLabel120: TppLabel;
    ppDBText38: TppDBText;
    ppLabel121: TppLabel;
    ppDBText39: TppDBText;
    ppLine1: TppLine;
    myDBCheckBox1: TmyDBCheckBox;
    myDBCheckBox2: TmyDBCheckBox;
    myDBCheckBox3: TmyDBCheckBox;
    myDBCheckBox4: TmyDBCheckBox;
    eli_exp: TZQuery;
    eli_alu: TZQuery;
    eli_auto: TZQuery;
    BitBtn6: TBitBtn;
    con_bene: TZQuery;
    databene: TDataSource;
    ppShape8: TppShape;
    ppLabel138: TppLabel;
    ppShape9: TppShape;
    ppLabel139: TppLabel;
    con_exp1: TZQuery;
    DataSource1: TDataSource;
    con_exp22: TZQuery;
    DataSource2: TDataSource;
    con_exp3: TZQuery;
    DataSource3: TDataSource;
    ppImage5: TppImage;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    pprt: TppDBPipeline;
    pprepto: TppReport;
    con_total: TZQuery;
    datatotal: TDataSource;
    ppParameterList1: TppParameterList;
    ppHeaderBand3: TppHeaderBand;
    ppShape10: TppShape;
    ppImage6: TppImage;
    ppImage7: TppImage;
    ppMemo2: TppMemo;
    ppLabel140: TppLabel;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppLine27: TppLine;
    ppLine30: TppLine;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppLabel152: TppLabel;
    ppLine37: TppLine;
    ppSystemVariable7: TppSystemVariable;
    ppLine22: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLabel141: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppSystemVariable8: TppSystemVariable;
    raCodeModule2: TraCodeModule;
    ppLabel155: TppLabel;
    ppLine45: TppLine;
    ppLabel156: TppLabel;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppLabel159: TppLabel;
    ppLabel160: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    ppLine32: TppLine;
    ppLine34: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLabel161: TppLabel;
    ppLine61: TppLine;
    ppLabel162: TppLabel;
    ppLine62: TppLine;
    ppLabel163: TppLabel;
    ppLine63: TppLine;
    ppLabel164: TppLabel;
    ppLine64: TppLine;
    ppLabel165: TppLabel;
    ppLine65: TppLine;
    ppLabel166: TppLabel;
    ppLine66: TppLine;
    ppLabel167: TppLabel;
    ppLine67: TppLine;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    ppLine31: TppLine;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ra1: TRadioButton;
    ra2: TRadioButton;
    Label12: TLabel;
    Label62: TLabel;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    rb5: TRadioButton;
    rb6: TRadioButton;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    rauf: TRadioButton;
    raum: TRadioButton;
    Label67: TLabel;
    Label69: TLabel;
    telau: TEdit;
    GroupBox12: TGroupBox;
    rauv: TRadioButton;
    raue: TRadioButton;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    Label68: TLabel;
    anb2: TEdit;
    Label72: TLabel;
    npe2: TEdit;
    ppDBText53: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    Label73: TLabel;
    anb3: TEdit;
    Label74: TLabel;
    anb4: TEdit;
    Label75: TLabel;
    npe3: TEdit;
    Label76: TLabel;
    npe4: TEdit;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ck_n12: TmyCheckBox;
    ck_n13: TmyCheckBox;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel122: TppLabel;
    ck_n21: TmyCheckBox;
    ppLabel123: TppLabel;
    ck_n22: TmyCheckBox;
    ppLabel124: TppLabel;
    ck_n23: TmyCheckBox;
    ppLabel125: TppLabel;
    ck_n24: TmyCheckBox;
    ppLabel126: TppLabel;
    ck_n25: TmyCheckBox;
    ck_n51: TmyCheckBox;
    ppLabel70: TppLabel;
    procedure FormShow(Sender: TObject);
    procedure nplKeyPress(Sender: TObject; var Key: Char);
    procedure expKeyPress(Sender: TObject; var Key: Char);
    procedure cb_munChange(Sender: TObject);
    procedure ciKeyPress(Sender: TObject; var Key: Char);
    procedure anbKeyPress(Sender: TObject; var Key: Char);
    procedure fnacKeyPress(Sender: TObject; var Key: Char);
    function Edad(FechaNacimiento:string):integer;
    procedure e1KeyPress(Sender: TObject; var Key: Char);
    procedure cidKeyPress(Sender: TObject; var Key: Char);
    procedure cidExit(Sender: TObject);
    procedure obsKeyPress(Sender: TObject; var Key: Char);
    procedure dhaKeyPress(Sender: TObject; var Key: Char);
    procedure limpiar();
    procedure ceiKeyPress(Sender: TObject; var Key: Char);
    procedure cideKeyPress(Sender: TObject; var Key: Char);
    procedure cidenKeyPress(Sender: TObject; var Key: Char);
    procedure inmKeyPress(Sender: TObject; var Key: Char);
    procedure ingKeyPress(Sender: TObject; var Key: Char);
    procedure ingreKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure muKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbpClick(Sender: TObject);
    procedure cb_munKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure bt_aceptarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bt_impClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ciExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbecas: Tfrmbecas;

implementation

uses unitfrmbuscadep, Unitfrmbuscaexp, frmacces;

{$R *.dfm}

procedure Tfrmbecas.limpiar();
begin
   cod_pl.Clear;
   npl.Clear;
   exp.Clear;
   cb_mun.ItemIndex:=0;
   anb.Clear;
   anb2.Clear;
   anb3.Clear;
   anb4.Clear;
   ci.Clear;
   e1.Clear;
   pvs.Clear;
   npe.Clear;
   npe2.Clear;
   npe3.Clear;
   npe4.Clear;
   cid.Enabled:=true;
   cid.Clear;
   puo.Clear;
   ldt.Clear;
   cgo.Clear;
   obs.Clear;
   dha.Clear;
   cei.Clear;
   ape.Clear;
   ltra.Clear;
   dhab.Clear;
   ofi.Clear;
   inm.Clear;
   tlf.Clear;
   cide.Clear;
   apell.Clear;
   lut.Clear;
   habi.Clear;
   ocu.Clear;
   ing.Clear;
   tel.Clear;
   ciden.Clear;
   apn.Clear;
   lutra.Clear;
   dirh.Clear;
   ocup.Clear;
   ingre.Clear;
   tlfn.Clear;
   cb_usu.ItemIndex:=0;
   ne.Checked:=false;
   nv.Checked:=false;
   sf.Checked:=false;
   sm.Checked:=false;
   urb.Checked:=false;
   rur.Checked:=false;
   ind.Checked:=false;
   fro.Checked:=false;
   a.Checked:=false;
   b.Checked:=false;
   c.Checked:=false;
   de.Checked:=false;
   ut.Checked:=false;
   cs.Checked:=false;
   so.Checked:=false;
   mdo.Checked:=false;
   mcs.Checked:=false;
   ecs.Checked:=false;
   eso.Checked:=false;
   eom.Checked:=false;
   mam.Checked:=false;
   pro.Checked:=false;
   gra.Checked:=false;
   optc.Checked:=false;
   alq.Checked:=false;
   ota.Checked:=false;
   qta.Checked:=false;
   csa.Checked:=false;
   apt.Checked:=false;
   psi.Checked:=false;
   bar.Checked:=false;
   ee.Checked:=false;
   ra.Checked:=false;
   ra1.Checked:=false;
   ra2.Checked:=false;
   ei.Checked:=false;
   rb.Checked:=false;
   rb2.Checked:=false;
   rb3.Checked:=false;
   rb4.Checked:=false;
   rb5.Checked:=false;
   rb6.Checked:=false;
   eb1.Checked:=false;
   rc1.Checked:=false;
   rc2.Checked:=false;
   rc3.Checked:=false;
   eb2.Checked:=false;
   rd1.Checked:=false;
   rd2.Checked:=false;
   eb3.Checked:=false;
   re1.Checked:=false;
   re2.Checked:=false;
   re3.Checked:=false;
   em.Checked:=false;
   rf1.Checked:=false;
   mu.Checked:=false;
   es.Checked:=false;
   na.Checked:=false;
   telau.Clear;







end;

function Tfrmbecas.Edad(FechaNacimiento:string):integer;
var
      iTemp,iTemp2,Nada:word;
      Fecha:TDate;
 begin
     Fecha:=StrToDate(FechaNacimiento);
     DecodeDate(Date,itemp,Nada,Nada);
     DecodeDate(Fecha,itemp2,Nada,Nada);
      if FormatDateTime('mmdd',Date) <
         FormatDateTime('mmdd',Fecha) then Result:=iTemp-iTemp2-1
                                      else Result:=iTemp-iTemp2;
end;

procedure Tfrmbecas.FormShow(Sender: TObject);
var
ftex:string;
begin
  limpiar();
  ftex:=datetostr(fnac.Date);
  ed.Text:=intToStr(Edad(ftex));
  pagecontrol1.ActivePageIndex:=0;
  cod_mun.Text:='1';
  fnac.Date:=date;
  bbp.SetFocus;
  bt_aceptar.Visible:=true;
end;

procedure Tfrmbecas.nplKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
     cb_mun.SetFocus;
end;


procedure Tfrmbecas.expKeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
 else
      key:=#0;
 end;
end;

procedure Tfrmbecas.cb_munChange(Sender: TObject);
begin
   cod_mun.Text:= inttostr(cb_mun.ItemIndex+1);
end;

procedure Tfrmbecas.ciKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #8:;
 else
      key:=#0;
 end;
end;

procedure Tfrmbecas.anbKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #65..#90:;
      #97..#122:;
      'ñ':;
      'Ñ':;
      #32:;
      #8:;
 else
      key:=#0;
 end;
end;

procedure Tfrmbecas.fnacKeyPress(Sender: TObject; var Key: Char);
var
 ftex: string;
begin
     ftex:=datetostr(fnac.Date);
     ed.Text:=intToStr(Edad(ftex));
end;

procedure Tfrmbecas.e1KeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #8:;
      #45:;
 else
      key:=#0;
 end;
end;

procedure Tfrmbecas.cidKeyPress(Sender: TObject; var Key: Char);
begin
  case key of
      #48..#57:;
      #8:;
 else
      key:=#0;
 end;
end;

procedure Tfrmbecas.cidExit(Sender: TObject);
begin
if cid.Text<>'' then
begin
  con_exp.Close;
  con_exp.Params[0].AsInteger:=strtoint(cid.Text);
  con_exp.Open;
  if con_exp.IsEmpty then
  begin
      exp.Text:=cid.Text;
  end
  else
  begin
    application.MessageBox('El Expediente ya existe..!' ,'Mensaje al Usuario',16);
    cid.Clear;
    cid.SetFocus;
  end;
end;
end;

procedure Tfrmbecas.obsKeyPress(Sender: TObject; var Key: Char);
begin
key:=upcase(key);
end;

procedure Tfrmbecas.dhaKeyPress(Sender: TObject; var Key: Char);
begin
 key:=upcase(key);
end;

procedure Tfrmbecas.ceiKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #8:;
 else
      key:=#0;
 end;
end;

procedure Tfrmbecas.cideKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #8:;
 else
      key:=#0;
 end;
end;

procedure Tfrmbecas.cidenKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #8:;
 else
      key:=#0;
 end;
end;

procedure Tfrmbecas.inmKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #46:;
      #8:;
 else
      key:=#0;
 end;
end;

procedure Tfrmbecas.ingKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #46:;
      #8:;
 else
      key:=#0;
 end;

end;

procedure Tfrmbecas.ingreKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #46:;
      #8:;
 else
      key:=#0;
 end;

end;

procedure Tfrmbecas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 13 then
   begin
       Key := 0;
       Perform(WM_NEXTDLGCTL, 0, 0);
   end

end;

procedure Tfrmbecas.muKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  pagecontrol1.ActivePageIndex:=1;
  pvs.SetFocus;
end;

procedure Tfrmbecas.bbpClick(Sender: TObject);
begin
 frmbuscadep.ShowModal;
 if frmbuscadep.salir='N' then
    cb_mun.SetFocus
 else
    bbp.SetFocus;
end;

procedure Tfrmbecas.cb_munKeyPress(Sender: TObject; var Key: Char);
var
 ftex: string;
begin
     key:=#0;
     ftex:=datetostr(fnac.Date);
     ed.Text:=intToStr(Edad(ftex));

end;

procedure Tfrmbecas.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfrmbecas.bt_aceptarClick(Sender: TObject);
begin
if npl.Text='' then
  begin
    application.MessageBox('Debe Ingresar Nombre del plantel..!','Mensaje al Usuario',16);
    pagecontrol1.ActivePageIndex:=0;
    npl.SetFocus;
  end
  else
  begin
     if (anb.Text='')   then
     begin
       application.MessageBox('Debe Ingresar Primer Nombre del Beneficiario..!','Mensaje al Usuario',16);
       pagecontrol1.ActivePageIndex:=0;
       anb.SetFocus;
     end
     else
     begin
     if (anb3.Text='')   then
     begin
       application.MessageBox('Debe Ingresar Segundo Nombre del Beneficiario..!','Mensaje al Usuario',16);
       pagecontrol1.ActivePageIndex:=0;
       anb3.SetFocus;
     end
     else
     begin
     if (anb2.Text='')   then
     begin
       application.MessageBox('Debe Ingresar Primer Apellido del Beneficiario..!','Mensaje al Usuario',16);
       pagecontrol1.ActivePageIndex:=0;
       anb2.SetFocus;
     end
     else
     begin
     if (anb4.Text='')   then
     begin
       application.MessageBox('Debe Ingresar Segundo Apellido del Beneficiario..!','Mensaje al Usuario',16);
       pagecontrol1.ActivePageIndex:=0;
       anb4.SetFocus;
     end
     else
     begin

         if ci.Text='' then
         begin
           application.MessageBox('Debe Ingresar Cédula de Identidad del Beneficiario..!','Mensaje al Usuario',16);
           pagecontrol1.ActivePageIndex:=0;
           ci.SetFocus;
         end
         else
         begin
            if e1.Text='' then
            begin
               application.MessageBox('Debe Ingresar Año Escolar del Beneficiario..!','Mensaje al Usuario',16);
               pagecontrol1.ActivePageIndex:=0;
               e1.SetFocus;
            end
            else
            begin
               if pvs.Text='' then
               begin
                 application.MessageBox('Debe Ingresar si la vivienda posee servicios básicos..!','Mensaje al Usuario',16);
                 pagecontrol1.ActivePageIndex:=1;
                 pvs.SetFocus;
               end
               else
               begin
                 if npe.Text='' then
                 begin
                    application.MessageBox('Debe Ingresar el Primer Nombre del Autorizado..!','Mensaje al Usuario',16);
                    pagecontrol1.ActivePageIndex:=1;
                    npe.SetFocus;
                 end
                 else
                 begin
                 if npe3.Text='' then
                 begin
                    application.MessageBox('Debe Ingresar el Segundo Nombre del Autorizado..!','Mensaje al Usuario',16);
                    pagecontrol1.ActivePageIndex:=1;
                    npe3.SetFocus;
                 end
                 else
                 begin
                 if npe2.Text='' then
                 begin
                    application.MessageBox('Debe Ingresar el Primer Apellido del Autorizado..!','Mensaje al Usuario',16);
                    pagecontrol1.ActivePageIndex:=1;
                    npe2.SetFocus;
                 end
                 else
                 begin
                 if npe4.Text='' then
                 begin
                    application.MessageBox('Debe Ingresar el Segundo Apellido del Autorizado..!','Mensaje al Usuario',16);
                    pagecontrol1.ActivePageIndex:=1;
                    npe4.SetFocus;
                 end
                 else
                 begin
                   if cid.Text='' then
                   begin
                     application.MessageBox('Debe Ingresar Cédula de Identidad del Autorizado..!','Mensaje al Usuario',16);
                     pagecontrol1.ActivePageIndex:=1;
                     cid.SetFocus;
                   end
                   else
                   begin
                      if puo.Text='' then
                      begin
                        application.MessageBox('Debe Ingresar Profesión del Autorizado..!','Mensaje al Usuario',16);
                        pagecontrol1.ActivePageIndex:=1;
                        puo.SetFocus;
                      end
                      else
                      begin
                         if ldt.Text='' then
                         begin
                           application.MessageBox('Debe Ingresar lugar de Trabajo del Autorizado..!','Mensaje al Usuario',16);
                           pagecontrol1.ActivePageIndex:=1;
                           ldt.SetFocus;
                         end
                         else
                         begin
                            if cgo.Text='' then
                            begin
                              application.MessageBox('Debe Ingresar Cargo del Autorizado..!','Mensaje al Usuario',16);
                              pagecontrol1.ActivePageIndex:=1;
                              cgo.SetFocus;
                            end
                            else
                            begin
                                if dha.Text='' then
                                begin
                                  application.MessageBox('Debe Ingresar La dirección del Autorizado...!','Mensaje al Usuario',16);
                                  pagecontrol1.ActivePageIndex:=1;
                                  dha.SetFocus;
                                end
                                else
                                begin

                                     if ((cei.Text='') and (cide.Text='') and (ciden.Text=''))then
                                     begin
                                       application.MessageBox('Debe Ingresar Cédula de Identidad...!','Mensaje al Usuario',16);
                                       pagecontrol1.ActivePageIndex:=1;
                                       cei.SetFocus;
                                     end
                                     else
                                     begin
                                        if ((ape.Text='') and (apell.Text='') and(apn.Text='')) then
                                        begin
                                          application.MessageBox('Debe Ingresar Apellidos y Nombres...!','Mensaje al Usuario',16);
                                          pagecontrol1.ActivePageIndex:=1;
                                          ape.SetFocus;
                                        end
                                        else
                                        begin
                                            if ((ltra.Text='') and(lut.Text='') and(lutra.Text='')) then
                                            begin
                                              application.MessageBox('Debe Ingresar Lugar de Trabajo...!','Mensaje al Usuario',16);
                                              pagecontrol1.ActivePageIndex:=1;
                                              ltra.SetFocus;
                                            end
                                            else
                                            begin
                                                if ((dhab.Text='') and (habi.Text='') and(dirh.Text='')) then
                                                begin
                                                  application.MessageBox('Debe Ingresar Dirección...!','Mensaje al Usuario',16);
                                                  pagecontrol1.ActivePageIndex:=1;
                                                  dhab.SetFocus;
                                                end
                                                else
                                                begin
                                                   if ((ofi.Text='') and (ocu.Text='') and (ocup.Text='')) then
                                                   begin
                                                     application.MessageBox('Debe Ingresar la Ocupación...!','Mensaje al Usuario',16);
                                                     pagecontrol1.ActivePageIndex:=1;
                                                     ofi.SetFocus;
                                                   end
                                                   else
                                                   begin
                                                     if ((inm.Text='') and (ing.Text='') and (ingre.Text='')) then
                                                     begin
                                                       application.MessageBox('Debe colocar el Ingreso Mensual...!','Mensaje al Usuario',16);
                                                       pagecontrol1.ActivePageIndex:=1;
                                                       inm.SetFocus;
                                                     end
                                                     else
                                                     begin
                                                        if ((tlf.Text='') and (tel.Text='') and (tlfn.Text='')) then
                                                        begin
                                                          application.MessageBox('Debe Ingresar el Teléfono...!','Mensaje al Usuario',16);
                                                          pagecontrol1.ActivePageIndex:=1;
                                                          tlf.SetFocus;
                                                        end
                                                        else
                                                        begin
                                                        //***************************guardar expediente completo***************************************************************

                                                           //*********************************  Autorizado  *****************************************************************
                                                           tb_aut.Close;
                                                           tb_aut.Open;
                                                           tb_aut.Append;
                                                           tb_aut.Edit;
                                                           tb_aut.FieldByName('pvs').Asstring     := pvs.Text;
                                                           tb_aut.FieldByName('npe').Asstring     := npe.Text;
                                                           tb_aut.FieldByName('npe1').Asstring     := npe3.Text;
                                                           tb_aut.FieldByName('ape').Asstring     := npe2.Text;
                                                           tb_aut.FieldByName('ape1').Asstring     := npe4.Text;
                                                           if cid.Text='' then
                                                              tb_aut.FieldByName('cid').Asinteger    :=0
                                                           else
                                                              tb_aut.FieldByName('cid').Asinteger    := strtoint(cid.Text);
                                                           tb_aut.FieldByName('puo').Asstring     := puo.Text;
                                                           tb_aut.FieldByName('ldt').Asstring     := ldt.Text;

                                                           if rauf.Checked then
                                                              tb_aut.FieldByName('sexau').Asstring   :='F';
                                                           if raum.Checked then
                                                              tb_aut.FieldByName('sexau').Asstring   :='M';
                                                           if rauv.Checked then
                                                              tb_aut.FieldByName('nacau').Asstring   :='V';
                                                           if raue.Checked then
                                                              tb_aut.FieldByName('nacau').Asstring   :='E';

                                                           tb_aut.FieldByName('teleau').Asstring     := telau.Text;

                                                           tb_aut.FieldByName('cgo').Asstring     := cgo.Text;
                                                           tb_aut.FieldByName('obs').Asstring     := obs.Text;
                                                           tb_aut.FieldByName('dha').Asstring     := dha.Text;
                                                           if cei.Text='' then
                                                              tb_aut.FieldByName('cimad').Asfloat    :=0
                                                           else
                                                              tb_aut.FieldByName('cimad').Asfloat    := strtofloat(cei.Text);
                                                           tb_aut.FieldByName('nmad').Asstring    := ape.Text;
                                                           tb_aut.FieldByName('ltmad').Asstring   := ltra.Text;
                                                           tb_aut.FieldByName('dhmad').Asstring   := dhab.Text;
                                                           tb_aut.FieldByName('omad').Asstring    := ofi.Text;
                                                           if inm.Text='' then
                                                              tb_aut.FieldByName('inmad').Asinteger    :=0
                                                           else
                                                              tb_aut.FieldByName('inmad').Asfloat    := strtofloat(inm.Text);
                                                           tb_aut.FieldByName('telmad').Asstring  := tlf.Text;
                                                           if cide.Text='' then
                                                              tb_aut.FieldByName('ceipad').Asinteger    :=0
                                                           else
                                                              tb_aut.FieldByName('ceipad').Asinteger  := strtoint(cide.Text);
                                                           tb_aut.FieldByName('npad').Asstring    := apell.Text;
                                                           tb_aut.FieldByName('ltpad').Asstring   := lut.Text;
                                                           tb_aut.FieldByName('dhpad').Asstring   := habi.Text;
                                                           tb_aut.FieldByName('opad').Asstring    := ocu.Text;
                                                           if ing.Text='' then
                                                              tb_aut.FieldByName('inpad').Asinteger    :=0
                                                           else
                                                              tb_aut.FieldByName('inpad').Asfloat    := strtofloat(ing.Text);
                                                           tb_aut.FieldByName('telpad').Asstring  := tel.Text;
                                                           if ciden.Text='' then
                                                              tb_aut.FieldByName('cgc').Asinteger    :=0
                                                           else
                                                              tb_aut.FieldByName('cgc').Asinteger    := strtoint(ciden.Text);
                                                           tb_aut.FieldByName('ngc').Asstring     := apn.Text;
                                                           tb_aut.FieldByName('ltgc').Asstring    := lutra.Text;
                                                           tb_aut.FieldByName('dhgc').Asstring    := dirh.Text;
                                                           tb_aut.FieldByName('ogc').Asstring     := ocup.Text;
                                                           if ingre.Text='' then
                                                              tb_aut.FieldByName('ingc').Asinteger    :=0
                                                           else
                                                              tb_aut.FieldByName('ingc').asfloat     := strtofloat(ingre.Text);
                                                           tb_aut.FieldByName('telgc').Asstring   := tlfn.Text;
                                                           tb_aut.FieldByName('funre').Asstring   := cb_usu.Text;
                                                           tb_aut.FieldByName('cod_exp').Asinteger:= strtoint(exp.Text);
                                                           tb_aut.Post;

                                                           //*********************************  fin Autorizado  *****************************************************************

                                                           //*********************************  Beneficiario  *****************************************************************
                                                           tb_alu.Close;
                                                           tb_alu.Open;
                                                           tb_alu.Append;
                                                           tb_alu.Edit;
                                                           tb_alu.FieldByName('cod_exp').Asinteger  :=strtoint(exp.Text);
                                                           tb_alu.FieldByName('nombres').Asstring   :=anb.Text;
                                                           tb_alu.FieldByName('nombres1').Asstring   :=anb3.Text;
                                                           tb_alu.FieldByName('apellidos').Asstring   :=anb2.Text;
                                                           tb_alu.FieldByName('apellidos1').Asstring   :=anb4.Text;

                                                           if nv.Checked then
                                                              tb_alu.FieldByName('tced').Asstring   :='V'
                                                           else
                                                              tb_alu.FieldByName('tced').Asstring   :='E';
                                                           tb_alu.FieldByName('cedula').Asinteger := strtoint(ci.Text);
                                                           if sf.Checked then
                                                              tb_alu.FieldByName('sexo').Asstring   :='F'
                                                           else
                                                              tb_alu.FieldByName('sexo').Asstring   :='M';
                                                           tb_alu.FieldByName('fechanac').AsDateTime:= fnac.Date;
                                                           tb_alu.FieldByName('edad').Asinteger     := strtoint(ed.Text);
                                                           if urb.Checked then
                                                              tb_alu.FieldByName('sector').Asstring   :='URBANO';
                                                           if rur.Checked then
                                                              tb_alu.FieldByName('sector').Asstring   :='RURAL';
                                                           if ind.Checked then
                                                              tb_alu.FieldByName('sector').Asstring   :='INDIGENA';
                                                           if fro.Checked then
                                                              tb_alu.FieldByName('sector').Asstring   :='FRONTERIZO';
                                                           if a.Checked then
                                                              tb_alu.FieldByName('escc').Asstring   :='A';
                                                           if b.Checked then
                                                              tb_alu.FieldByName('escc').Asstring   :='B';
                                                           if c.Checked then
                                                              tb_alu.FieldByName('escc').Asstring   :='C';
                                                           if de.Checked then
                                                              tb_alu.FieldByName('escc').Asstring   :='D-E';
                                                           if ut.Checked then
                                                              tb_alu.FieldByName('numhab').Asstring   :='DE 1 A 3';
                                                           if cs.Checked then
                                                              tb_alu.FieldByName('numhab').Asstring   :='DE 4 A 6';
                                                           if so.Checked then
                                                              tb_alu.FieldByName('numhab').Asstring   :='DE 7 A 8';
                                                           if mdo.Checked then
                                                              tb_alu.FieldByName('numhab').Asstring   :='MAS DE 8';
                                                           if mcs.Checked then
                                                              tb_alu.FieldByName('ingresofam').Asstring   :='MENOS DE 450';
                                                           if ecs.Checked then
                                                              tb_alu.FieldByName('ingresofam').Asstring   :='ENTRE 450 Y 650';
                                                           if eso.Checked then
                                                              tb_alu.FieldByName('ingresofam').Asstring   :='ENTRE 651 Y 850';
                                                           if eom.Checked then
                                                              tb_alu.FieldByName('ingresofam').Asstring   :='ENTRE 851 Y 1000';
                                                           if mam.Checked then
                                                              tb_alu.FieldByName('ingresofam').Asstring   :='MAS DE 1000';
                                                           if pro.Checked then
                                                              tb_alu.FieldByName('tenenciaviv').Asstring   :='PROPIA';
                                                           if gra.Checked then
                                                              tb_alu.FieldByName('tenenciaviv').Asstring   :='GRATUITA';
                                                           if optc.Checked then
                                                              tb_alu.FieldByName('tenenciaviv').Asstring   :='OPCION COMPRA';
                                                           if alq.Checked then
                                                              tb_alu.FieldByName('tenenciaviv').Asstring   :='ALQUILADA';
                                                           if ota.Checked then
                                                              tb_alu.FieldByName('tenenciaviv').Asstring   :='OTRAS';
                                                           if qta.Checked then
                                                              tb_alu.FieldByName('tipovivienda').Asstring   :='QUINTA';
                                                           if csa.Checked then
                                                              tb_alu.FieldByName('tipovivienda').Asstring   :='CASA';
                                                           if apt.Checked then
                                                              tb_alu.FieldByName('tipovivienda').Asstring   :='APARTAMENTO';
                                                           if psi.Checked then
                                                              tb_alu.FieldByName('tipovivienda').Asstring   :='PENSION';
                                                           if bar.Checked then
                                                              tb_alu.FieldByName('tipovivienda').Asstring   :='BARRACAS';
                                                           if ee.Checked then
                                                           begin
                                                              tb_alu.FieldByName('estcur').Asstring   :='PREESCOLAR';
                                                              tb_alu.FieldByName('nivel').Asinteger   :=1;
                                                              if ra.Checked then
                                                                tb_alu.FieldByName('ren').Asinteger   :=1;
                                                              if ra1.Checked then
                                                                tb_alu.FieldByName('ren').Asinteger   :=2;
                                                              if ra2.Checked then
                                                                tb_alu.FieldByName('ren').Asinteger   :=3;

                                                                 tb_alu.FieldByName('subsistema').Asinteger:=1;
                                                           end;
                                                           if ei.Checked then
                                                           begin
                                                              tb_alu.FieldByName('estcur').Asstring   :='PRIMARIA';
                                                              tb_alu.FieldByName('nivel').Asinteger   :=2;
                                                              if rb.Checked then
                                                                 tb_alu.FieldByName('ren').Asinteger   :=1;
                                                              if rb2.Checked then
                                                                 tb_alu.FieldByName('ren').Asinteger   :=2;
                                                              if rb3.Checked then
                                                                 tb_alu.FieldByName('ren').Asinteger   :=3;
                                                              if rb4.Checked then
                                                                 tb_alu.FieldByName('ren').Asinteger   :=4;
                                                              if rb5.Checked then
                                                                 tb_alu.FieldByName('ren').Asinteger   :=5;
                                                              if rb6.Checked then
                                                                 tb_alu.FieldByName('ren').Asinteger   :=6;
                                                              tb_alu.FieldByName('subsistema').Asinteger:=2;

                                                           end;
                                                           if eb1.Checked then
                                                           begin
                                                              tb_alu.FieldByName('estcur').Asstring   :='BASICA';
                                                              tb_alu.FieldByName('nivel').Asinteger   :=3;
                                                              if  rc1.Checked then
                                                                  tb_alu.FieldByName('ren').Asinteger   :=7;
                                                              if  rc2.Checked then
                                                                  tb_alu.FieldByName('ren').Asinteger   :=8;
                                                              if  rc3.Checked then
                                                                  tb_alu.FieldByName('ren').Asinteger   :=9;
                                                              tb_alu.FieldByName('subsistema').Asinteger:=3;
                                                           end;
                                                           if eb2.Checked then
                                                           begin
                                                              tb_alu.FieldByName('estcur').Asstring   :='DIVERSIFICADA';
                                                              tb_alu.FieldByName('nivel').Asinteger   :=4;
                                                              if  rd1.Checked then
                                                                  tb_alu.FieldByName('ren').Asinteger   :=1;
                                                              if  rd2.Checked then
                                                                  tb_alu.FieldByName('ren').Asinteger   :=2;
                                                              tb_alu.FieldByName('subsistema').Asinteger:=3;
                                                           end;
                                                           if eb3.Checked then
                                                           begin
                                                              tb_alu.FieldByName('estcur').Asstring   :='PROFESIONAL';
                                                              tb_alu.FieldByName('nivel').Asinteger   :=5;
                                                              if  re1.Checked then
                                                                  tb_alu.FieldByName('ren').Asinteger   :=1;
                                                              if  re2.Checked then
                                                                  tb_alu.FieldByName('ren').Asinteger   :=2;
                                                              if  re3.Checked then
                                                                  tb_alu.FieldByName('ren').Asinteger   :=3;
                                                              tb_alu.FieldByName('subsistema').Asinteger:=3;
                                                           end;
                                                           if em.Checked then
                                                           begin
                                                              tb_alu.FieldByName('estcur').Asstring   :='ESPECIAL';
                                                              tb_alu.FieldByName('nivel').Asinteger   :=6;
                                                              tb_alu.FieldByName('ren').Asinteger   :=0;
                                                              tb_alu.FieldByName('subsistema').Asinteger:=4;
                                                           end;

                                                           tb_alu.FieldByName('aes').Asstring   :=e1.Text;
                                                            if mu.Checked then
                                                              tb_alu.FieldByName('tdep').Asstring   :='MUNICIPAL';
                                                           if es.Checked then
                                                              tb_alu.FieldByName('tdep').Asstring   :='ESTADAL';
                                                           if na.Checked then
                                                              tb_alu.FieldByName('tdep').Asstring   :='NACIONAL';
                                                           tb_alu.Post;
                                                           //********************************* fin Bneficiario ****************************************************************
                                                           //*********************************** exp***************************************************************************
                                                           tb_exp.Close;
                                                           tb_exp.Open;
                                                           tb_exp.Append;
                                                           tb_exp.Edit;
                                                           tb_exp.FieldByName('cod_pl').Asfloat     := strtofloat(cod_pl.Text);
                                                           tb_exp.FieldByName('plantel').AsString   := npl.Text;
                                                           tb_exp.FieldByName('municipio').AsString := cb_mun.Text;
                                                           tb_exp.FieldByName('zona').Asinteger     := strtoint(zon.Text);
                                                           tb_exp.FieldByName('cod_mun').Asinteger     := strtoint(cod_mun.Text);
                                                           tb_exp.FieldByName('exp').Asinteger      := strtoint(exp.Text);
                                                           tb_exp.Post;
                                                           //*********************** fin exp **********************************************************************************

                                                          //***************************finaliza guardar expediente completo ***************************************************
                                                              application.MessageBox('Expediente Guardado exitosamente....!','Mensaje al Usuario',32);
                                                              limpiar();
                                                              pagecontrol1.ActivePageIndex:=0;
                                                              bbp.SetFocus;

                                                         end;
                                                      end;
                                                    end;
                                                 end;
                                               end;
                                             end;
                                           end;
                                        end;
                                     end;
                                   end;
                                end;
                             end;
                          end;
                       end;
                    end;
                  end;
                end;
             end;
           end;
        end;
      end;
    end;
  end;
 end;
end;

procedure Tfrmbecas.BitBtn1Click(Sender: TObject);
begin
   limpiar();
   frmbuscaexp.ShowModal;
end;

procedure Tfrmbecas.bt_impClick(Sender: TObject);
begin

 if exp.Text='' then
    exp.Text:='0';
  con_exp.Close;
  con_exp.Params[0].asinteger:=strtoint(exp.Text);
  con_exp.Open;
  if con_exp.IsEmpty then
  begin
    application.MessageBox('Expediente no esta registrado en Sistema de Becas..!','Mensaje al Usuario',16);
    bt_imp.SetFocus;
  end
  else
  begin
       ck_u.Checked:=false;
       ck_r.Checked:=false;
       ck_i.Checked:=false;
       ck_f.Checked:=false;
       ck_a.Checked:=false;
       ck_b.Checked:=false;
       ck_c.Checked:=false;
       ck_de.Checked:=false;
       ck_1.Checked:=false;
       ck_2.Checked:=false;
       ck_3.Checked:=false;
       ck_4.Checked:=false;
       ck_5.Checked:=false;
       ck_q.Checked:=false;
       ck_ca.Checked:=false;
       ck_ap.Checked:=false;
       ck_p.Checked:=false;
       ck_ba.Checked:=false;
       ck_pr.Checked:=false;
       ck_gr.Checked:=false;
       ck_oc.Checked:=false;
       ck_al.Checked:=false;
       ck_ot.Checked:=false;
       ck_13.Checked:=false;
       ck_46.Checked:=false;
       ck_78.Checked:=false;
       ck_m8.Checked:=false;
       ck_n1.Checked:=false;
       ck_n12.Checked:=false;
       ck_n13.Checked:=false;
       ck_n2.Checked:=false;
       ck_n21.Checked:=false;
       ck_n22.Checked:=false;
       ck_n23.Checked:=false;
       ck_n24.Checked:=false;
       ck_n25.Checked:=false;
       ck_n3.Checked:=false;
       ck_n31.Checked:=false;
       ck_n32.Checked:=false;
       ck_n4.Checked:=false;
       ck_n41.Checked:=false;
       ck_n5.Checked:=false;
       ck_n51.Checked:=false;
       ck_n52.Checked:=false;
       ck_n6.Checked:=false;




     if con_exp.FieldByName('sector').AsString='URBANO' then
         ck_u.Checked:=true;
     if con_exp.FieldByName('sector').AsString='RURAL' then
         ck_r.Checked:=true;
     if con_exp.FieldByName('sector').AsString='INDIGENA' then
         ck_i.Checked:=true;
     if con_exp.FieldByName('sector').AsString='FRONTERIZO' then
         ck_f.Checked:=true;
     if con_exp.FieldByName('escc').AsString='A' then
         ck_a.Checked:=true;
     if con_exp.FieldByName('escc').AsString='B' then
         ck_b.Checked:=true;
     if con_exp.FieldByName('escc').AsString='C' then
         ck_c.Checked:=true;
     if con_exp.FieldByName('escc').AsString='D-E' then
         ck_de.Checked:=true;
     if con_exp.FieldByName('ingresofam').AsString='MENOS DE 450' then
         ck_1.Checked:=true;
     if con_exp.FieldByName('ingresofam').AsString='ENTRE 450 Y 650' then
         ck_2.Checked:=true;
     if con_exp.FieldByName('ingresofam').AsString='ENTRE 651 Y 850' then
         ck_3.Checked:=true;
     if con_exp.FieldByName('ingresofam').AsString='ENTRE 851 Y 1000' then
         ck_4.Checked:=true;
     if con_exp.FieldByName('ingresofam').AsString='MAS DE 1000' then
         ck_5.Checked:=true;
     if con_exp.FieldByName('tipovivienda').AsString='QUINTA' then
         ck_q.Checked:=true;
     if con_exp.FieldByName('tipovivienda').AsString='CASA' then
         ck_ca.Checked:=true;
     if con_exp.FieldByName('tipovivienda').AsString='APARTAMENTO' then
         ck_ap.Checked:=true;
     if con_exp.FieldByName('tipovivienda').AsString='PENSION' then
         ck_p.Checked:=true;
     if con_exp.FieldByName('tipovivienda').AsString='BARRACA' then
         ck_ba.Checked:=true;
     if con_exp.FieldByName('tenenciaviv').AsString='PROPIA' then
         ck_pr.Checked:=true;
     if con_exp.FieldByName('tenenciaviv').AsString='GRATUITA' then
         ck_gr.Checked:=true;
     if con_exp.FieldByName('tenenciaviv').AsString='OPCION COMPRA' then
         ck_oc.Checked:=true;
     if con_exp.FieldByName('tenenciaviv').AsString='ALQUILADA' then
         ck_al.Checked:=true;
     if con_exp.FieldByName('tenenciaviv').AsString='OTRAS' then
         ck_ot.Checked:=true;
     if con_exp.FieldByName('numhab').AsString='DE 1 A 3' then
         ck_13.Checked:=true;
     if con_exp.FieldByName('numhab').AsString='DE 4 A 6' then
         ck_46.Checked:=true;
     if con_exp.FieldByName('numhab').AsString='DE 7 A 8' then
         ck_78.Checked:=true;
     if con_exp.FieldByName('numhab').AsString='MAS DE 8' then
         ck_m8.Checked:=true;




     if con_exp.FieldByName('estcur').AsString='PREESCOLAR' then
     begin
         ee.Checked:=true;
         if  con_exp.FieldByName('ren').Asinteger=1 then
         begin
             ra.Checked:=true;
             ck_n1.Checked:=true;
         end;
         if  con_exp.FieldByName('ren').Asinteger=2 then
         begin
             ra1.Checked:=true;
             ck_n12.Checked:=true;
         end;

         if  con_exp.FieldByName('ren').Asinteger=3 then
         begin
             ra2.Checked:=true;
             ck_n13.Checked:=true;
         end;
     end;

     if con_exp.FieldByName('estcur').AsString='PRIMARIA' then
     begin
         ei.Checked:=true;
         if  con_exp.FieldByName('ren').Asinteger=1 then
         begin
             rb.Checked:=true;
             ck_n2.Checked:=true;
         end;
         if  con_exp.FieldByName('ren').Asinteger=2 then
         begin
             rb2.Checked:=true;
             ck_n21.Checked:=true;
         end;
         if  con_exp.FieldByName('ren').Asinteger=3 then
         begin
             rb3.Checked:=true;
             ck_n22.Checked:=true;
         end;
         if  con_exp.FieldByName('ren').Asinteger=4 then
         begin
             rb4.Checked:=true;
             ck_n23.Checked:=true;
         end;
         if  con_exp.FieldByName('ren').Asinteger=5 then
         begin
             rb5.Checked:=true;
             ck_n24.Checked:=true;
         end;
         if  con_exp.FieldByName('ren').Asinteger=6 then
         begin
             rb6.Checked:=true;
             ck_n25.Checked:=true;
         end;
     end;

     if con_exp.FieldByName('estcur').AsString='BASICA' then
     begin
         eb1.Checked:=true;
         if  con_exp.FieldByName('ren').Asinteger=7 then
         begin
             rc1.Checked:=true;
             ck_n3.Checked:=true;
         end;
         if  con_exp.FieldByName('ren').Asinteger=8 then
         begin
             rc2.Checked:=true;
             ck_n31.Checked:=true;
         end;
         if  con_exp.FieldByName('ren').Asinteger=9 then
         begin
             rc3.Checked:=true;
             ck_n32.Checked:=true;
         end;
     end;

     if con_exp.FieldByName('estcur').AsString='DIVERSIFICADA' then
     begin
         eb2.Checked:=true;
         if  con_exp.FieldByName('ren').Asinteger=1 then
         begin
             rd1.Checked:=true;
             ck_n4.Checked:=true;
         end;
         if  con_exp.FieldByName('ren').Asinteger=2 then
         begin
             rd2.Checked:=true;
             ck_n41.Checked:=true;
         end;
     end;

     if con_exp.FieldByName('estcur').AsString='PROFESIONAL' then
     begin
         eb3.Checked:=true;
         if  con_exp.FieldByName('ren').Asinteger=1 then
         begin
             re1.Checked:=true;
             ck_n5.Checked:=true;
         end;
         if  con_exp.FieldByName('ren').Asinteger=2 then
         begin
             re2.Checked:=true;
             ck_n51.Checked:=true;
         end;
         if  con_exp.FieldByName('ren').Asinteger=3 then
         begin
             re3.Checked:=true;
             ck_n52.Checked:=true;
         end;
     end;
     if con_exp.FieldByName('estcur').AsString='ESPECIAL' then
     begin
         em.Checked:=true;
         if  con_exp.FieldByName('ren').Asinteger=0 then
         begin
             rf1.Checked:=true;
             ck_n6.Checked:=true;
         end;
     end;

      if con_exp.FieldByName('sexau').Asstring   ='F' then
         rauf.Checked:=true;
      if con_exp.FieldByName('sexau').Asstring   ='M' then
         raum.Checked:=true;
      if con_exp.FieldByName('nacau').Asstring   ='V' then
         rauv.Checked:=true;
      if con_exp.FieldByName('nacau').Asstring   ='E' then
         raue.Checked:=true;

      telau.Text:=con_exp.FieldByName('teleau').Asstring;



      ppbecas.Print;

  end;
end;
procedure Tfrmbecas.BitBtn4Click(Sender: TObject);
var
ftex:string;
begin
  limpiar();
  ftex:=datetostr(fnac.Date);
  ed.Text:=intToStr(Edad(ftex));
  pagecontrol1.ActivePageIndex:=0;
  cod_mun.Text:='1';
  fnac.Date:=date;
  bbp.SetFocus;
  bt_aceptar.Visible:=true;
end;

procedure Tfrmbecas.BitBtn5Click(Sender: TObject);
begin
    if  MessageDlg('Desea Eliminar el Expediente..:'+exp.Text,
        mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
       eli_exp.Close;
       eli_exp.Params[0].AsInteger:=strtoint(exp.Text);
       eli_exp.ExecSQL;

       eli_alu.Close;
       eli_alu.Params[0].AsInteger:=strtoint(exp.Text);
       eli_alu.ExecSQL;

       eli_auto.Close;
       eli_auto.Params[0].AsInteger:=strtoint(exp.Text);
       eli_auto.ExecSQL;

       limpiar();
       
       application.MessageBox('Expediente Eliminado.......!','Mensaje al usuario',32)
    end;
end;

procedure Tfrmbecas.BitBtn6Click(Sender: TObject);
begin
con_total.Close;
con_total.Open;
pprepto.Print;
con_total.close;
end;

procedure Tfrmbecas.ciExit(Sender: TObject);
begin
if ci.Text<>'' then
begin
  con_bene.Close;
  con_bene.Params[0].asinteger:=strtoint(ci.Text);
  con_bene.Open;
  if not con_bene.IsEmpty then
  begin
    application.MessageBox('El Beneficiario ya existe..!' ,'Mensaje al Usuario',16);
    ci.Clear;
    ci.SetFocus;
  end;
end;

end;

procedure Tfrmbecas.BitBtn3Click(Sender: TObject);
begin
if exp.Text='' then
begin
   application.MessageBox('No existe solicitud cargada para modificar....','Mensaje al Usuario',48)
end
else
begin
if npl.Text='' then
  begin
    application.MessageBox('Debe Ingresar Nombre del plantel..!','Mensaje al Usuario',16);
    pagecontrol1.ActivePageIndex:=0;
    npl.SetFocus;
  end
  else
  begin
     if (anb.Text='') then
     begin
       application.MessageBox('Debe Ingresar Primer Nombre del Beneficiario..!','Mensaje al Usuario',16);
       pagecontrol1.ActivePageIndex:=0;
       anb.SetFocus;
     end
     else
     begin
     if (anb3.Text='') then
     begin
       application.MessageBox('Debe Ingresar Segundo Nombre del Beneficiario..!','Mensaje al Usuario',16);
       pagecontrol1.ActivePageIndex:=0;
       anb3.SetFocus;
     end
     else
     begin

     if (anb2.Text='') then
     begin
       application.MessageBox('Debe Ingresar Primer Apellido del Beneficiario..!','Mensaje al Usuario',16);
       pagecontrol1.ActivePageIndex:=0;
       anb2.SetFocus;
     end
     else
     begin
     if (anb4.Text='') then
     begin
       application.MessageBox('Debe Ingresar Segundo Apellido del Beneficiario..!','Mensaje al Usuario',16);
       pagecontrol1.ActivePageIndex:=0;
       anb4.SetFocus;
     end
     else
     begin

         if ci.Text='' then
         begin
           application.MessageBox('Debe Ingresar Cédula de Identidad del Beneficiario..!','Mensaje al Usuario',16);
           pagecontrol1.ActivePageIndex:=0;
           ci.SetFocus;
         end
         else
         begin
            if e1.Text='' then
            begin
               application.MessageBox('Debe Ingresar Año Escolar del Beneficiario..!','Mensaje al Usuario',16);
               pagecontrol1.ActivePageIndex:=0;
               e1.SetFocus;
            end
            else
            begin
               if pvs.Text='' then
               begin
                 application.MessageBox('Debe Ingresar si la vivienda posee servicios básicos..!','Mensaje al Usuario',16);
                 pagecontrol1.ActivePageIndex:=1;
                 pvs.SetFocus;
               end
               else
               begin
                 if npe.Text='' then
                 begin
                    application.MessageBox('Debe Ingresar el Primer Nombre del Autorizado..!','Mensaje al Usuario',16);
                    pagecontrol1.ActivePageIndex:=1;
                    npe.SetFocus;
                 end
                 else
                 begin
                 if npe3.Text='' then
                 begin
                    application.MessageBox('Debe Ingresar el Segundo Nombre del Autorizado..!','Mensaje al Usuario',16);
                    pagecontrol1.ActivePageIndex:=1;
                    npe3.SetFocus;
                 end
                 else
                 begin
                 if npe2.Text='' then
                 begin
                    application.MessageBox('Debe Ingresar el Primer Apellido del Autorizado..!','Mensaje al Usuario',16);
                    pagecontrol1.ActivePageIndex:=1;
                    npe2.SetFocus;
                 end
                 else
                 begin
                 if npe4.Text='' then
                 begin
                    application.MessageBox('Debe Ingresar el Segundo Apellido del Autorizado..!','Mensaje al Usuario',16);
                    pagecontrol1.ActivePageIndex:=1;
                    npe4.SetFocus;
                 end
                 else
                 begin

                   if cid.Text='' then
                   begin
                     application.MessageBox('Debe Ingresar Cédula de Identidad del Autorizado..!','Mensaje al Usuario',16);
                     pagecontrol1.ActivePageIndex:=1;
                     cid.SetFocus;
                   end
                   else
                   begin
                      if puo.Text='' then
                      begin
                        application.MessageBox('Debe Ingresar Profesión del Autorizado..!','Mensaje al Usuario',16);
                        pagecontrol1.ActivePageIndex:=1;
                        puo.SetFocus;
                      end
                      else
                      begin
                         if ldt.Text='' then
                         begin
                           application.MessageBox('Debe Ingresar lugar de Trabajo del Autorizado..!','Mensaje al Usuario',16);
                           pagecontrol1.ActivePageIndex:=1;
                           ldt.SetFocus;
                         end
                         else
                         begin
                            if cgo.Text='' then
                            begin
                              application.MessageBox('Debe Ingresar Cargo del Autorizado..!','Mensaje al Usuario',16);
                              pagecontrol1.ActivePageIndex:=1;
                              cgo.SetFocus;
                            end
                            else
                            begin
                                if dha.Text='' then
                                begin
                                  application.MessageBox('Debe Ingresar La dirección del Autorizado...!','Mensaje al Usuario',16);
                                  pagecontrol1.ActivePageIndex:=1;
                                  dha.SetFocus;
                                end
                                else
                                begin

                                     if ((cei.Text='') and (cide.Text='') and (ciden.Text=''))then
                                     begin
                                       application.MessageBox('Debe Ingresar Cédula de Identidad...!','Mensaje al Usuario',16);
                                       pagecontrol1.ActivePageIndex:=1;
                                       cei.SetFocus;
                                     end
                                     else
                                     begin
                                        if ((ape.Text='') and (apell.Text='') and(apn.Text='')) then
                                        begin
                                          application.MessageBox('Debe Ingresar Apellidos y Nombres...!','Mensaje al Usuario',16);
                                          pagecontrol1.ActivePageIndex:=1;
                                          ape.SetFocus;
                                        end
                                        else
                                        begin
                                            if ((ltra.Text='') and(lut.Text='') and(lutra.Text='')) then
                                            begin
                                              application.MessageBox('Debe Ingresar Lugar de Trabajo...!','Mensaje al Usuario',16);
                                              pagecontrol1.ActivePageIndex:=1;
                                              ltra.SetFocus;
                                            end
                                            else
                                            begin
                                                if ((dhab.Text='') and (habi.Text='') and(dirh.Text='')) then
                                                begin
                                                  application.MessageBox('Debe Ingresar Dirección...!','Mensaje al Usuario',16);
                                                  pagecontrol1.ActivePageIndex:=1;
                                                  dhab.SetFocus;
                                                end
                                                else
                                                begin
                                                   if ((ofi.Text='') and (ocu.Text='') and (ocup.Text='')) then
                                                   begin
                                                     application.MessageBox('Debe Ingresar la Ocupación...!','Mensaje al Usuario',16);
                                                     pagecontrol1.ActivePageIndex:=1;
                                                     ofi.SetFocus;
                                                   end
                                                   else
                                                   begin
                                                     if ((inm.Text='') and (ing.Text='') and (ingre.Text='')) then
                                                     begin
                                                       application.MessageBox('Debe colocar el Ingreso Mensual...!','Mensaje al Usuario',16);
                                                       pagecontrol1.ActivePageIndex:=1;
                                                       inm.SetFocus;
                                                     end
                                                     else
                                                     begin
                                                        if ((tlf.Text='') and (tel.Text='') and (tlfn.Text='')) then
                                                        begin
                                                          application.MessageBox('Debe Ingresar el Teléfono...!','Mensaje al Usuario',16);
                                                          pagecontrol1.ActivePageIndex:=1;
                                                          tlf.SetFocus;
                                                        end
                                                        else
                                                        begin
                                                        //***************************guardar expediente completo***************************************************************

                                                           //*********************************  Autorizado  *****************************************************************
                                                           con_exp3.Close;
                                                           con_exp3.Params[0].AsInteger:=strtoint(exp.Text);
                                                           con_exp3.Open;
                                                           con_exp3.Edit;
                                                           con_exp3.FieldByName('pvs').Asstring     := pvs.Text;
                                                           con_exp3.FieldByName('npe').Asstring     := npe.Text;
                                                           con_exp3.FieldByName('npe1').Asstring     := npe3.Text;
                                                           con_exp3.FieldByName('ape').Asstring     := npe2.Text;
                                                           con_exp3.FieldByName('ape1').Asstring     := npe4.Text;
                                                           if cid.Text='' then
                                                              con_exp3.FieldByName('cid').Asinteger    :=0
                                                           else
                                                              con_exp3.FieldByName('cid').Asinteger    := strtoint(cid.Text);
                                                           con_exp3.FieldByName('puo').Asstring     := puo.Text;

                                                           if rauf.Checked then                                                           if rauf.Checked then
                                                              con_exp3.FieldByName('sexau').Asstring   :='F';
                                                           if raum.Checked then
                                                              con_exp3.FieldByName('sexau').Asstring   :='M';
                                                           if rauv.Checked then
                                                              con_exp3.FieldByName('nacau').Asstring   :='V';
                                                           if raue.Checked then
                                                              con_exp3.FieldByName('nacau').Asstring   :='E';

                                                           con_exp3.FieldByName('teleau').Asstring     := telau.Text;


                                                           con_exp3.FieldByName('ldt').Asstring     := ldt.Text;
                                                           con_exp3.FieldByName('cgo').Asstring     := cgo.Text;
                                                           con_exp3.FieldByName('obs').Asstring     := obs.Text;
                                                           con_exp3.FieldByName('dha').Asstring     := dha.Text;
                                                           if cei.Text='' then
                                                              con_exp3.FieldByName('cimad').Asfloat    :=0
                                                           else
                                                              con_exp3.FieldByName('cimad').Asfloat    := strtofloat(cei.Text);
                                                           con_exp3.FieldByName('nmad').Asstring    := ape.Text;
                                                           con_exp3.FieldByName('ltmad').Asstring   := ltra.Text;
                                                           con_exp3.FieldByName('dhmad').Asstring   := dhab.Text;
                                                           con_exp3.FieldByName('omad').Asstring    := ofi.Text;
                                                           if inm.Text='' then
                                                              con_exp3.FieldByName('inmad').Asinteger    :=0
                                                           else
                                                              con_exp3.FieldByName('inmad').Asfloat    := strtofloat(inm.Text);
                                                           con_exp3.FieldByName('telmad').Asstring  := tlf.Text;
                                                           if cide.Text='' then
                                                              con_exp3.FieldByName('ceipad').Asinteger    :=0
                                                           else
                                                              con_exp3.FieldByName('ceipad').Asinteger  := strtoint(cide.Text);
                                                           con_exp3.FieldByName('npad').Asstring    := apell.Text;
                                                           con_exp3.FieldByName('ltpad').Asstring   := lut.Text;
                                                           con_exp3.FieldByName('dhpad').Asstring   := habi.Text;
                                                           con_exp3.FieldByName('opad').Asstring    := ocu.Text;
                                                           if ing.Text='' then
                                                              con_exp3.FieldByName('inpad').Asinteger    :=0
                                                           else
                                                              con_exp3.FieldByName('inpad').Asfloat    := strtofloat(ing.Text);
                                                           con_exp3.FieldByName('telpad').Asstring  := tel.Text;
                                                           if ciden.Text='' then
                                                              con_exp3.FieldByName('cgc').Asinteger    :=0
                                                           else
                                                              con_exp3.FieldByName('cgc').Asinteger    := strtoint(ciden.Text);
                                                           con_exp3.FieldByName('ngc').Asstring     := apn.Text;
                                                           con_exp3.FieldByName('ltgc').Asstring    := lutra.Text;
                                                           con_exp3.FieldByName('dhgc').Asstring    := dirh.Text;
                                                           con_exp3.FieldByName('ogc').Asstring     := ocup.Text;
                                                           if ingre.Text='' then
                                                              con_exp3.FieldByName('ingc').Asinteger    :=0
                                                           else
                                                              con_exp3.FieldByName('ingc').asfloat     := strtofloat(ingre.Text);
                                                           con_exp3.FieldByName('telgc').Asstring   := tlfn.Text;
                                                           con_exp3.FieldByName('funre').Asstring   := cb_usu.Text;
                                                           con_exp3.FieldByName('cod_exp').Asinteger:= strtoint(exp.Text);
                                                           con_exp3.Post;


                                                           //*********************************  fin Autorizado  *****************************************************************

                                                           //*********************************  Beneficiario  *****************************************************************
                                                           con_exp22.Close;                                                           con_exp1.Close;
                                                           con_exp22.Params[0].AsInteger:=strtoint(exp.Text);
                                                           con_exp22.Open;
                                                           con_exp22.Edit;

                                                           con_exp22.FieldByName('cod_exp').Asinteger  :=strtoint(exp.Text);
                                                           con_exp22.FieldByName('nombres').Asstring   :=anb.Text;
                                                           con_exp22.FieldByName('nombres1').Asstring   :=anb3.Text;
                                                           con_exp22.FieldByName('apellidos').Asstring :=anb2.Text;
                                                           con_exp22.FieldByName('apellidos1').Asstring :=anb4.Text;

                                                           if nv.Checked then
                                                              con_exp22.FieldByName('tced').Asstring   :='V'
                                                           else
                                                              con_exp22.FieldByName('tced').Asstring   :='E';
                                                           con_exp22.FieldByName('cedula').Asinteger := strtoint(ci.Text);
                                                           if sf.Checked then
                                                              con_exp22.FieldByName('sexo').Asstring   :='F'
                                                           else
                                                              con_exp22.FieldByName('sexo').Asstring   :='M';
                                                           con_exp22.FieldByName('fechanac').AsDateTime:= fnac.Date;
                                                           con_exp22.FieldByName('edad').Asinteger     := strtoint(ed.Text);
                                                           if urb.Checked then
                                                           begin
                                                              con_exp22.FieldByName('sector').Asstring   :='URBANO';
                                                           end
                                                           else
                                                           begin
                                                             if rur.Checked then
                                                             begin
                                                                 con_exp22.FieldByName('sector').Asstring   :='RURAL';
                                                             end
                                                             else
                                                             begin
                                                                if ind.Checked then
                                                                begin
                                                                   con_exp22.FieldByName('sector').Asstring   :='INDIGENA';
                                                                end
                                                                else
                                                                begin
                                                                  if fro.Checked then
                                                                     con_exp22.FieldByName('sector').Asstring   :='FRONTERIZO';
                                                                end;
                                                               end;
                                                              end;
                                                           if a.Checked then
                                                              con_exp22.FieldByName('escc').Asstring   :='A';
                                                           if b.Checked then
                                                              con_exp22.FieldByName('escc').Asstring   :='B';
                                                           if c.Checked then
                                                              con_exp22.FieldByName('escc').Asstring   :='C';
                                                           if de.Checked then
                                                              con_exp22.FieldByName('escc').Asstring   :='D-E';
                                                           if ut.Checked then
                                                              con_exp22.FieldByName('numhab').Asstring   :='DE 1 A 3';
                                                           if cs.Checked then
                                                              con_exp22.FieldByName('numhab').Asstring   :='DE 4 A 6';
                                                           if so.Checked then
                                                              con_exp22.FieldByName('numhab').Asstring   :='DE 7 A 8';
                                                           if mdo.Checked then
                                                              con_exp22.FieldByName('numhab').Asstring   :='MAS DE 8';
                                                           if mcs.Checked then
                                                              con_exp22.FieldByName('ingresofam').Asstring   :='MENOS DE 450';
                                                           if ecs.Checked then
                                                              con_exp22.FieldByName('ingresofam').Asstring   :='ENTRE 450 Y 650';
                                                           if eso.Checked then
                                                              con_exp22.FieldByName('ingresofam').Asstring   :='ENTRE 651 Y 850';
                                                           if eom.Checked then
                                                              con_exp22.FieldByName('ingresofam').Asstring   :='ENTRE 851 Y 1000';
                                                           if mam.Checked then
                                                              con_exp22.FieldByName('ingresofam').Asstring   :='MAS DE 1000';
                                                           if pro.Checked then
                                                              con_exp22.FieldByName('tenenciaviv').Asstring   :='PROPIA';
                                                           if gra.Checked then
                                                              con_exp22.FieldByName('tenenciaviv').Asstring   :='GRATUITA';
                                                           if optc.Checked then
                                                              con_exp22.FieldByName('tenenciaviv').Asstring   :='OPCION COMPRA';
                                                           if alq.Checked then
                                                              con_exp22.FieldByName('tenenciaviv').Asstring   :='ALQUILADA';
                                                           if ota.Checked then
                                                              con_exp22.FieldByName('tenenciaviv').Asstring   :='OTRAS';
                                                           if qta.Checked then
                                                              con_exp22.FieldByName('tipovivienda').Asstring   :='QUINTA';
                                                           if csa.Checked then
                                                              con_exp22.FieldByName('tipovivienda').Asstring   :='CASA';
                                                           if apt.Checked then
                                                              con_exp22.FieldByName('tipovivienda').Asstring   :='APARTAMENTO';
                                                           if psi.Checked then
                                                              con_exp22.FieldByName('tipovivienda').Asstring   :='PENSION';
                                                           if bar.Checked then
                                                              con_exp22.FieldByName('tipovivienda').Asstring   :='BARRACAS';
                                                             if ee.Checked then
                                                           begin
                                                              con_exp22.FieldByName('estcur').Asstring   :='PREESCOLAR';
                                                              con_exp22.FieldByName('nivel').Asinteger   :=1;
                                                              if ra.Checked then
                                                                con_exp22.FieldByName('ren').Asinteger   :=1;
                                                              if ra1.Checked then
                                                                con_exp22.FieldByName('ren').Asinteger   :=2;
                                                              if ra2.Checked then
                                                                con_exp22.FieldByName('ren').Asinteger   :=3;
                                                              con_exp22.FieldByName('subsistema').Asinteger:=1;
                                                           end;
                                                           if ei.Checked then
                                                           begin
                                                              con_exp22.FieldByName('estcur').Asstring   :='PRIMARIA';
                                                              con_exp22.FieldByName('nivel').Asinteger   :=2;
                                                              if rb.Checked then
                                                                 con_exp22.FieldByName('ren').Asinteger   :=1;
                                                              if rb2.Checked then
                                                                 con_exp22.FieldByName('ren').Asinteger   :=2;
                                                              if rb3.Checked then
                                                                 con_exp22.FieldByName('ren').Asinteger   :=3;
                                                              if rb4.Checked then
                                                                 con_exp22.FieldByName('ren').Asinteger   :=4;
                                                              if rb5.Checked then
                                                                 con_exp22.FieldByName('ren').Asinteger   :=5;
                                                              if rb6.Checked then
                                                                 con_exp22.FieldByName('ren').Asinteger   :=6;
                                                              con_exp22.FieldByName('subsistema').Asinteger:=2;

                                                           end;
                                                           if eb1.Checked then
                                                           begin
                                                              con_exp22.FieldByName('estcur').Asstring   :='BASICA';
                                                              con_exp22.FieldByName('nivel').Asinteger   :=3;
                                                              if  rc1.Checked then
                                                                  con_exp22.FieldByName('ren').Asinteger   :=7;
                                                              if  rc2.Checked then
                                                                  con_exp22.FieldByName('ren').Asinteger   :=8;
                                                              if  rc3.Checked then
                                                                  con_exp22.FieldByName('ren').Asinteger   :=9;
                                                              con_exp22.FieldByName('subsistema').Asinteger:=3;
                                                           end;
                                                           if eb2.Checked then
                                                           begin
                                                              con_exp22.FieldByName('estcur').Asstring   :='DIVERSIFICADA';
                                                              con_exp22.FieldByName('nivel').Asinteger   :=4;
                                                              if  rd1.Checked then
                                                                  con_exp22.FieldByName('ren').Asinteger   :=1;
                                                              if  rd2.Checked then
                                                                  con_exp22.FieldByName('ren').Asinteger   :=2;
                                                              con_exp22.FieldByName('subsistema').Asinteger:=3;
                                                           end;
                                                           if eb3.Checked then
                                                           begin
                                                              con_exp22.FieldByName('estcur').Asstring   :='PROFESIONAL';
                                                              con_exp22.FieldByName('nivel').Asinteger   :=5;
                                                              if  re1.Checked then
                                                                  con_exp22.FieldByName('ren').Asinteger   :=1;
                                                              if  re2.Checked then
                                                                  con_exp22.FieldByName('ren').Asinteger   :=2;
                                                              if  re3.Checked then
                                                                  con_exp22.FieldByName('ren').Asinteger   :=3;
                                                              con_exp22.FieldByName('subsistema').Asinteger:=3;
                                                           end;
                                                           if em.Checked then
                                                           begin
                                                              con_exp22.FieldByName('estcur').Asstring   :='ESPECIAL';
                                                              con_exp22.FieldByName('nivel').Asinteger   :=6;
                                                              con_exp22.FieldByName('ren').Asinteger   :=0;
                                                              con_exp22.FieldByName('subsistema').Asinteger:=4;
                                                           end;
                                                           con_exp22.FieldByName('aes').Asstring   :=e1.Text;
                                                            if mu.Checked then
                                                              con_exp22.FieldByName('tdep').Asstring   :='MUNICIPAL';
                                                           if es.Checked then
                                                              con_exp22.FieldByName('tdep').Asstring   :='ESTADAL';
                                                           if na.Checked then
                                                              con_exp22.FieldByName('tdep').Asstring   :='NACIONAL';

                                                            con_exp22.Post;
                                                           //********************************* fin Bneficiario ****************************************************************
                                                           //*********************************** exp***************************************************************************
                                                           con_exp1.Close;                                                           con_exp1.Close;
                                                           con_exp1.Params[0].AsInteger:=strtoint(exp.Text);
                                                           con_exp1.Open;
                                                           con_exp1.Edit;

                                                           con_exp1.FieldByName('cod_pl').Asfloat     := strtofloat(cod_pl.Text);
                                                           con_exp1.FieldByName('plantel').AsString   := npl.Text;
                                                           con_exp1.FieldByName('municipio').AsString := cb_mun.Text;
                                                           con_exp1.FieldByName('zona').Asinteger     := strtoint(zon.Text);
                                                           con_exp1.FieldByName('cod_mun').Asinteger     := strtoint(cod_mun.Text);
                                                           con_exp1.FieldByName('exp').Asinteger      := strtoint(exp.Text);
                                                           con_exp1.Post;
                                                           //*********************** fin exp **********************************************************************************

                                                          //***************************finaliza guardar expediente completo ***************************************************
                                                              application.MessageBox('Expediente modificado exitosamente....!','Mensaje al Usuario',32);
                                                              limpiar();
                                                              pagecontrol1.ActivePageIndex:=0;
                                                              bbp.SetFocus;

                                                       end;
                                                      end; 
                                                     end;
                                                   end;
                                                end;
                                             end;
                                         end;
                                      end;
                                   end;
                                end;
                            end;
                         end;
                      end;
                   end;
                 end;
               end;
            end;
         end;
      end;
   end;
 end;
end;
end;
end;
end;
end;

end.



