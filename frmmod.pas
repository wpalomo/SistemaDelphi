unit frmmod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDataset, DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, StdCtrls, Buttons, ComCtrls, ExtCtrls, dxCntner,
  dxEditor, dxExEdtr, dxEdLib, dxDBELib, Mask, DBCtrls, jpeg;

type
  Tfrmmodi = class(TForm)
    Label13: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label40: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Panel4: TPanel;
    Label3: TLabel;
    Panel5: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Panel6: TPanel;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    Panel10: TPanel;
    Panel11: TPanel;
    Label14: TLabel;
    Panel13: TPanel;
    Label16: TLabel;
    Panel14: TPanel;
    Label17: TLabel;
    Panel15: TPanel;
    Label18: TLabel;
    Panel17: TPanel;
    Label21: TLabel;
    Panel18: TPanel;
    Label22: TLabel;
    Panel19: TPanel;
    Label23: TLabel;
    Panel20: TPanel;
    Label24: TLabel;
    sue: TEdit;
    sue2: TEdit;
    sue3: TEdit;
    Panel21: TPanel;
    Label26: TLabel;
    Panel22: TPanel;
    Label27: TLabel;
    Panel23: TPanel;
    Label28: TLabel;
    Panel24: TPanel;
    Label29: TLabel;
    Panel25: TPanel;
    Label30: TLabel;
    Panel26: TPanel;
    Label31: TLabel;
    Panel27: TPanel;
    Label32: TLabel;
    Panel28: TPanel;
    Label33: TLabel;
    Panel29: TPanel;
    Label37: TLabel;
    Panel30: TPanel;
    Label38: TLabel;
    Panel31: TPanel;
    Label39: TLabel;
    Panel32: TPanel;
    Label41: TLabel;
    Panel33: TPanel;
    Label42: TLabel;
    Panel34: TPanel;
    Label43: TLabel;
    Panel35: TPanel;
    Label44: TLabel;
    Panel36: TPanel;
    Label47: TLabel;
    Panel37: TPanel;
    Label48: TLabel;
    Panel38: TPanel;
    Label49: TLabel;
    Panel39: TPanel;
    Label50: TLabel;
    Panel40: TPanel;
    Label51: TLabel;
    Panel41: TPanel;
    Label52: TLabel;
    Panel42: TPanel;
    Label53: TLabel;
    BitBtn2: TBitBtn;
    sin: TRadioButton;
    sre: TRadioButton;
    sca: TRadioButton;
    str: TRadioButton;
    Panel7: TPanel;
    Label10: TLabel;
    Panel8: TPanel;
    Label11: TLabel;
    Panel9: TPanel;
    Label12: TLabel;
    smh: TRadioButton;
    seg: TRadioButton;
    smc: TRadioButton;
    ssu: TRadioButton;
    slc: TRadioButton;
    scl: TRadioButton;
    sas: TRadioButton;
    Panel16: TPanel;
    Label19: TLabel;
    Panel12: TPanel;
    Label15: TLabel;
    fec2: TDateTimePicker;
    Panel2: TPanel;
    lic: TRadioButton;
    tsu: TRadioButton;
    mae: TRadioButton;
    ott: TRadioButton;
    Panel3: TPanel;
    sol: TRadioButton;
    cas: TRadioButton;
    viu: TRadioButton;
    divo: TRadioButton;
    Panel43: TPanel;
    mas: TRadioButton;
    fem: TRadioButton;
    Panel44: TPanel;
    Panel45: TPanel;
    dtit: TRadioButton;
    dxint: TRadioButton;
    dwint: TRadioButton;
    dhva: TRadioButton;
    Panel46: TPanel;
    fij: TRadioButton;
    int: TRadioButton;
    Panel47: TPanel;
    bbn: TRadioButton;
    bbs: TRadioButton;
    Panel48: TPanel;
    cor: TRadioButton;
    aho: TRadioButton;
    datamov: TDataSource;
    zeb: TDBEdit;
    efe: TDBEdit;
    fac: TdxDBDateEdit;
    ced: TDBEdit;
    cco: TDBEdit;
    nom: TDBEdit;
    fin: TdxDBDateEdit;
    fna: TdxDBDateEdit;
    cde: TDBEdit;
    cde2: TDBEdit;
    cde3: TDBEdit;
    nde: TDBEdit;
    nde2: TDBEdit;
    nde3: TDBEdit;
    cca: TDBEdit;
    cca2: TDBEdit;
    cca3: TDBEdit;
    nca: TDBEdit;
    nca2: TDBEdit;
    nca3: TDBEdit;
    cho: TDBEdit;
    cho2: TDBEdit;
    cho3: TDBEdit;
    cdcp: TDBEdit;
    ndecp: TDBEdit;
    ccap: TDBEdit;
    ncap: TDBEdit;
    ude: TDBEdit;
    asi: TDBEdit;
    ncta: TDBEdit;
    cba: TDBEdit;
    ban: TDBEdit;
    retro: TDBEdit;
    ces: TDBEdit;
    nfs: TDBEdit;
    cdes: TDBEdit;
    ccs: TDBEdit;
    dess: TDBEdit;
    usu: TDBEdit;
    con_emp: TZQuery;
    hdoc: TDBEdit;
    hda: TDBEdit;
    hto: TDBEdit;
    Panel49: TPanel;
    Label1: TLabel;
    denotitu: TDBEdit;
    Image1: TImage;
    smd: TRadioButton;
    Panel1: TPanel;
    Label2: TLabel;
    Panel50: TPanel;
    Label5: TLabel;
    Panel51: TPanel;
    Label4: TLabel;
    ntit: TRadioButton;
    nyint: TRadioButton;
    nzint: TRadioButton;
    obs: TDBMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure hdocExit(Sender: TObject);
    procedure hdaExit(Sender: TObject);
    procedure strExit(Sender: TObject);
    procedure sinClick(Sender: TObject);
    procedure sreClick(Sender: TObject);
    procedure scaClick(Sender: TObject);
    procedure strClick(Sender: TObject);
    procedure sasClick(Sender: TObject);
    procedure sclClick(Sender: TObject);
    procedure slcClick(Sender: TObject);
    procedure ssuClick(Sender: TObject);
    procedure smhClick(Sender: TObject);
    procedure segClick(Sender: TObject);
    procedure smcClick(Sender: TObject);
    procedure smdClick(Sender: TObject);
    procedure cdcpKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmodi: Tfrmmodi;

implementation

uses frmmovi, frmacces;

{$R *.dfm}

procedure Tfrmmodi.BitBtn1Click(Sender: TObject);
begin
con_emp.Cancel;
con_emp.Close;
close;
end;

procedure Tfrmmodi.BitBtn2Click(Sender: TObject);
begin
  if   con_emp.FieldByName('cedula').AsString='' then
  begin
       application.MessageBox('Debe Ingresar la CEDULA...!','Mensaje al Usuario',16);
       ced.SetFocus;
  end
  else
  begin
  if   con_emp.FieldByName('nombre').AsString='' then
  begin
       application.MessageBox('Debe Ingresar el Nombre...!','Mensaje al Usuario',16);
       ced.SetFocus;
  end
  else
  begin

   con_emp.Edit;
   if sin.Checked then con_emp.FieldByName('tipomov').AsString:='INGRESO';
   if sre.Checked then con_emp.FieldByName('tipomov').AsString:='REINGRESO';
   if sca.Checked then con_emp.FieldByName('tipomov').AsString:='CARGO ADICIONAL';
   if str.Checked then con_emp.FieldByName('tipomov').AsString:='TRASLADO';
   if sas.Checked then con_emp.FieldByName('tipomov').AsString:='ASCENSO';
   if scl.Checked then con_emp.FieldByName('tipomov').AsString:='CLASIFICACION';
   if slc.Checked then con_emp.FieldByName('tipomov').AsString:='LIBERACION DE CARGO';
   if ssu.Checked then con_emp.FieldByName('tipomov').AsString:='SUSPENCION';
   if smh.Checked then con_emp.FieldByName('tipomov').AsString:='MODIFICACION DE HORAS';
   if seg.Checked then con_emp.FieldByName('tipomov').AsString:='EGRESOS';
   if smc.Checked then con_emp.FieldByName('tipomov').AsString:='MODIFICACION DE CARGO';
   if smd.Checked then con_emp.FieldByName('tipomov').AsString:='MODIFICACION DE DATOS PERSONALES';

                            if mas.Checked then
                                con_emp.FieldByName('sexo').AsString                  :='MASCULINO';
                            if fem.Checked then
                                con_emp.FieldByName('sexo').AsString                  :='FEMENINO';

                            if sol.Checked then
                                con_emp.FieldByName('edo_civil').AsString             :='SOLTERO';
                            if cas.Checked then
                                con_emp.FieldByName('edo_civil').AsString             :='CASADO';
                            if viu.Checked then
                                con_emp.FieldByName('edo_civil').AsString             :='VIUDO';
                            if divo.Checked then
                                con_emp.FieldByName('edo_civil').AsString             :='DIVORCIADO';

                            if lic.Checked then
                                con_emp.FieldByName('nivel_aca').AsString             :='LIC. O PROF.';
                            if tsu.Checked then
                                con_emp.FieldByName('nivel_aca').AsString             :='T.S.U. EDUCACION';
                            if mae.Checked then
                                con_emp.FieldByName('nivel_aca').AsString             :='MAESTRO';
                            if ott.Checked then
                                con_emp.FieldByName('nivel_aca').AsString             :='OTRO TITULO';

                            if not seg.Checked then
                            begin
                            if fij.Checked then
                                con_emp.FieldByName('tipo_nombr').AsString             :='FIJO';
                            if int.Checked then
                                con_emp.FieldByName('tipo_nombr').AsString             :='INTERINO';



                            if dtit.Checked then
                                con_emp.FieldByName('t_diurno').AsString             :='TITULAR';
                            if dxint.Checked then
                                con_emp.FieldByName('t_diurno').AsString             :='INTERINO (S/P)';
                            if dwint.Checked then
                                con_emp.FieldByName('t_diurno').AsString             :='INTERINO(P/CONCURSO)';
                            if dhva.Checked then
                                con_emp.FieldByName('t_diurno').AsString             :='HORAS VARIABLES';

                            if ntit.Checked then
                                con_emp.FieldByName('t_nocturno').AsString           :='TITULAR';
                            if nyint.Checked then
                                con_emp.FieldByName('t_nocturno').AsString           :='INTERINO (S/P)';
                            if nzint.Checked then
                                con_emp.FieldByName('t_nocturno').AsString           :='INTERINO(P/CONCURSO)';
                           end
                           else
                           begin
                             if not fij.Checked then
                                con_emp.FieldByName('tipo_nombr').AsString             :='';
                            if not int.Checked then
                                con_emp.FieldByName('tipo_nombr').AsString             :='';



                            if not dtit.Checked then
                                con_emp.FieldByName('t_diurno').AsString             :='';
                            if not dxint.Checked then
                                con_emp.FieldByName('t_diurno').AsString             :='';
                            if not dwint.Checked then
                                con_emp.FieldByName('t_diurno').AsString             :='';
                            if not dhva.Checked then
                                con_emp.FieldByName('t_diurno').AsString             :='';

                            if not ntit.Checked then
                                con_emp.FieldByName('t_nocturno').AsString           :='';
                            if not nyint.Checked then
                                con_emp.FieldByName('t_nocturno').AsString           :='';
                            if not nzint.Checked then
                                con_emp.FieldByName('t_nocturno').AsString           :='';

                           end;

                            if bbs.Checked then
                                con_emp.FieldByName('bb').AsString                   :='SI';
                            if bbn.Checked then
                                con_emp.FieldByName('bb').AsString                   :='NO';


                            if cor.Checked then
                                con_emp.FieldByName('tipo_cuenta').AsString          :='CORRIENTE';
                            if aho.Checked then
                                con_emp.FieldByName('tipo_cuenta').AsString          :='AHORRO';

                            con_emp.FieldByName('analista').AsString                 :=frmacceso.con_usu.fieldbyname('nombre').AsString;
                            con_emp.FieldByName('fec_ela').AsDateTime                :=date;


con_emp.Post;
close;
end;
end;
end;

procedure Tfrmmodi.FormShow(Sender: TObject);
begin
if con_emp.FieldByName('tipomov').AsString='INGRESO' then
   sin.Checked:=true;
if con_emp.FieldByName('tipomov').AsString='REINGRESO' then
   sre.Checked:=true;
if con_emp.FieldByName('tipomov').AsString='CARGO ADICIONAL' then
   sca.Checked:=true;
if con_emp.FieldByName('tipomov').AsString='TRASLADO' then
   str.Checked:=true;
if con_emp.FieldByName('tipomov').AsString='ASCENSO' then
   sas.Checked:=true;
if con_emp.FieldByName('tipomov').AsString='CLASIFICACION' then
   scl.Checked:=true;
if con_emp.FieldByName('tipomov').AsString='LIBERACION DE CARGO' then
   slc.Checked:=true;
if con_emp.FieldByName('tipomov').AsString='SUSPENCION' then
   ssu.Checked:=true;
if con_emp.FieldByName('tipomov').AsString='MODIFICACION DE HORAS' then
   smh.Checked:=true;
if con_emp.FieldByName('tipomov').AsString='EGRESOS' then
   seg.Checked:=true;
if con_emp.FieldByName('tipomov').AsString='MODIFICACION DE CARGO' then
   smc.Checked:=true;
if con_emp.FieldByName('tipomov').AsString='MODIFICACION DE DATOS PERSONALES' then
   smd.Checked:=true;


if (sin.Checked=true) or (sre.Checked=true) then
begin
    aho.Checked:=true;
    aho.Enabled:=false;
    cor.Enabled:=false;
end
else
begin
    aho.Checked:=false;
    aho.Enabled:=false;
    cor.Enabled:=false;
end;

if con_emp.FieldByName('sexo').AsString='MASCULINO' then
     mas.Checked:=true;
if con_emp.FieldByName('sexo').AsString='FEMENINO' then
     fem.Checked:=true;

if con_emp.FieldByName('edo_civil').AsString='SOLTERO' then
   sol.Checked:=true;
if con_emp.FieldByName('edo_civil').AsString='CASADO' then
   cas.Checked:=true;
if con_emp.FieldByName('edo_civil').AsString='VIUDO' then
   viu.Checked:=true;
if con_emp.FieldByName('edo_civil').AsString='DIVORCIADO' then
   divo.Checked:=true;

if con_emp.FieldByName('nivel_aca').AsString='LIC. O PROF.' then
   lic.Checked:=true;
if con_emp.FieldByName('nivel_aca').AsString='MAESTRO' then
   mae.Checked:=true;
if con_emp.FieldByName('nivel_aca').AsString='T.S.U. EDUCACION' then
   tsu.Checked:=true;
if con_emp.FieldByName('nivel_aca').AsString='OTRO TITULO' then
   ott.Checked:=true;


if con_emp.FieldByName('tipo_nombr').AsString ='FIJO' then
   fij.Checked:=true;

if con_emp.FieldByName('tipo_nombr').AsString='INTERINO' then
   int.Checked:=true;

if con_emp.FieldByName('t_diurno').AsString='TITULAR' then
   dtit.Checked:=true;

if con_emp.FieldByName('t_diurno').AsString ='INTERINO (S/P)'then
   dxint.Checked:=true;

if con_emp.FieldByName('t_diurno').AsString ='INTERINO(P/CONCURSO)' then
   dwint.Checked:=true;

if con_emp.FieldByName('t_diurno').AsString ='HORAS VARIABLES' then
   dhva.Checked:=true;

if con_emp.FieldByName('t_nocturno').AsString='TITULAR' then
   ntit.Checked:=true;

if con_emp.FieldByName('t_nocturno').AsString='INTERINO (S/P)' then
   nyint.Checked:=true;

if con_emp.FieldByName('t_nocturno').AsString='INTERINO(P/CONCURSO)' then
   nzint.Checked:=true;

if con_emp.FieldByName('bb').AsString='SI' then
   bbs.Checked:=true;
if con_emp.FieldByName('bb').AsString='NO' then
   bbn.Checked:=true;


if con_emp.FieldByName('tipo_cuenta').AsString='CORRIENTE' then
   cor.Checked:=true;
if con_emp.FieldByName('tipo_cuenta').AsString='AHORRO' then
   aho.Checked:=true;

end;

procedure Tfrmmodi.hdocExit(Sender: TObject);
begin
con_emp.FieldByName('horas13').AsFloat:=con_emp.FieldByName('horas1').AsFloat + con_emp.FieldByName('horas12').AsFloat
end;

procedure Tfrmmodi.hdaExit(Sender: TObject);
begin
con_emp.FieldByName('horas13').AsFloat:=con_emp.FieldByName('horas1').AsFloat + con_emp.FieldByName('horas12').AsFloat
end;

procedure Tfrmmodi.strExit(Sender: TObject);
begin
if fec2.Checked then
begin
    fec2.Enabled:=false;
    bbs.Checked:=false;
    bbs.Enabled:=false;
    bbn.Checked:=false;
    bbn.Enabled:=false;
    fin.Enabled:=false;
end
else
begin
   fec2.Enabled:=true;
   bbs.Enabled:=true;
   bbn.Enabled:=true;
   bbn.Checked:=true;
   fin.Enabled:=true;
end;
end;

procedure Tfrmmodi.sinClick(Sender: TObject);
begin
if (sin.Checked=true) then
begin
    aho.Checked:=true;
    aho.Enabled:=false;
    fin.Enabled:=false;
end;
end;

procedure Tfrmmodi.sreClick(Sender: TObject);
begin
if (sre.Checked=true) then
begin
    aho.Checked:=true;
    aho.Enabled:=false;
end;
end;

procedure Tfrmmodi.scaClick(Sender: TObject);
begin
if (sca.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;

end;
end;

procedure Tfrmmodi.strClick(Sender: TObject);
begin
if (str.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
end;
end;

procedure Tfrmmodi.sasClick(Sender: TObject);
begin
if (sas.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
  
end;
end;

procedure Tfrmmodi.sclClick(Sender: TObject);
begin
if (scl.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
 end;
end;

procedure Tfrmmodi.slcClick(Sender: TObject);
begin
if (slc.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
end;
end;

procedure Tfrmmodi.ssuClick(Sender: TObject);
begin
if (ssu.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
end;
end;

procedure Tfrmmodi.smhClick(Sender: TObject);
begin
if (smh.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
   
end;
end;

procedure Tfrmmodi.segClick(Sender: TObject);
begin
if (seg.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
    mas.Checked:=true;
    sol.Checked:=true;
    lic.Checked:=true;
    fij.Checked:=false;
    dtit.Checked:=false;
    int.Checked:=false;
    dxint.Checked:=false;
    dwint.Checked:=false;
    dhva.Checked:=false;
    ntit.Checked:=false;
    nyint.Checked:=false;
    nzint.Checked:=false;
   end
else
begin
    mas.Checked:=false;
    sol.Checked:=false;
    lic.Checked:=false;
end;
end;

procedure Tfrmmodi.smcClick(Sender: TObject);
begin
if (smc.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
 
end;
end;

procedure Tfrmmodi.smdClick(Sender: TObject);
begin
if (smd.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
end;
end;

procedure Tfrmmodi.cdcpKeyPress(Sender: TObject; var Key: Char);
begin
 // case key of
 // #13:;
 //else
 // key:=#0;
 //  end;
end;

end.
