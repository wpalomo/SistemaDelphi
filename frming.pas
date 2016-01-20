{$IFDEF PROFILE} {$O-} {$WARNINGS OFF} {$ENDIF }
{$IFDEF PROFILE} {    Do not delete previous line(s) !!! } {$ENDIF }
{$IFDEF PROFILE} { Otherwise sources can not be cleaned !!! } {$ENDIF }
unit frming;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, ComCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset, dxExEdtr,
  dxTL, dxDBCtrl, dxDBGrid, dxCntner, jpeg, dxDBTLCl, dxGrClms{$IFNDEF PROFILE};{$ELSE}{},Profint;{$ENDIF}

type
  Tfrmin = class(TForm)
    Panel4: TPanel;
    Label3: TLabel;
    Panel5: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    efe: TEdit;
    Panel6: TPanel;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    Panel10: TPanel;
    Label13: TLabel;
    Panel11: TPanel;
    Label14: TLabel;
    Panel13: TPanel;
    Label16: TLabel;
    Panel14: TPanel;
    Label17: TLabel;
    Panel15: TPanel;
    Label18: TLabel;
    Label20: TLabel;
    Panel17: TPanel;
    Label21: TLabel;
    Panel18: TPanel;
    Label22: TLabel;
    Panel19: TPanel;
    Label23: TLabel;
    Panel20: TPanel;
    Label24: TLabel;
    nde: TEdit;
    nde2: TEdit;
    nde3: TEdit;
    nca: TEdit;
    nca2: TEdit;
    nca3: TEdit;
    cho: TEdit;
    cho2: TEdit;
    cho3: TEdit;
    sue: TEdit;
    sue2: TEdit;
    sue3: TEdit;
    Label25: TLabel;
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
    ndecp: TEdit;
    Panel27: TPanel;
    Label32: TLabel;
    Panel28: TPanel;
    Label33: TLabel;
    ncap: TEdit;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    hdoc: TEdit;
    had: TEdit;
    hto: TEdit;
    Panel29: TPanel;
    Label37: TLabel;
    Panel30: TPanel;
    Label38: TLabel;
    asi: TComboBox;
    Panel31: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    Panel32: TPanel;
    Label41: TLabel;
    Panel33: TPanel;
    Label42: TLabel;
    Panel34: TPanel;
    Label43: TLabel;
    Panel35: TPanel;
    Label44: TLabel;
    Label45: TLabel;
    retro: TEdit;
    Label46: TLabel;
    Panel36: TPanel;
    Label47: TLabel;
    Panel37: TPanel;
    Label48: TLabel;
    cdes: TComboBox;
    Panel38: TPanel;
    Label49: TLabel;
    Panel39: TPanel;
    Label50: TLabel;
    ccas: TComboBox;
    Panel40: TPanel;
    Label51: TLabel;
    Panel41: TPanel;
    Label52: TLabel;
    Panel42: TPanel;
    Label53: TLabel;
    BitBtn2: TBitBtn;
    tb_mov: TZTable;
    datamov: TDataSource;
    zeb: TComboBox;
    fac: TDateTimePicker;
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
    fna: TDateTimePicker;
    Panel12: TPanel;
    Label15: TLabel;
    fec2: TDateTimePicker;
    fin: TDateTimePicker;
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
    Panel46: TPanel;
    Panel47: TPanel;
    Panel48: TPanel;
    fij: TRadioButton;
    int: TRadioButton;
    bbn: TRadioButton;
    bbs: TRadioButton;
    cor: TRadioButton;
    aho: TRadioButton;
    con_mun: TZQuery;
    datamun: TDataSource;
    cde: TEdit;
    cde2: TEdit;
    cde3: TEdit;
    cca: TEdit;
    cca2: TEdit;
    cca3: TEdit;
    grid_mun: TdxDBGrid;
    grid_munCOD: TdxDBGridMaskColumn;
    grid_munNOMBRE: TdxDBGridMaskColumn;
    con_dep: TZQuery;
    datadep: TDataSource;
    grid_dep: TdxDBGrid;
    grid_depcod: TdxDBGridMaskColumn;
    grid_depnombre: TdxDBGridMaskColumn;
    cdcp: TEdit;
    grid_cargo: TdxDBGrid;
    con_cargo: TZQuery;
    datacargo: TDataSource;
    grid_cargopd: TdxDBGridMaskColumn;
    grid_cargodes: TdxDBGridMaskColumn;
    grid_jer: TdxDBGrid;
    con_jer: TZQuery;
    datajer: TDataSource;
    grid_jersd: TdxDBGridMaskColumn;
    grid_jerdes: TdxDBGridMaskColumn;
    grid_mod: TdxDBGrid;
    con_mod: TZQuery;
    datamod: TDataSource;
    grid_modtd: TdxDBGridMaskColumn;
    grid_moddes: TdxDBGridMaskColumn;
    grid_cat: TdxDBGrid;
    con_cat: TZQuery;
    datacat: TDataSource;
    grid_catcd: TdxDBGridMaskColumn;
    grid_catdes: TdxDBGridMaskColumn;
    grid_turno: TdxDBGrid;
    con_tur: TZQuery;
    datatur: TDataSource;
    grid_turnoqd: TdxDBGridMaskColumn;
    grid_turnodes: TdxDBGridMaskColumn;
    grid_ded: TdxDBGrid;
    con_ded: TZQuery;
    dataded: TDataSource;
    grid_dedsexd: TdxDBGridMaskColumn;
    grid_deddes: TdxDBGridMaskColumn;
    ccap: TEdit;
    ced: TEdit;
    cco: TEdit;
    nom: TEdit;
    ncta: TEdit;
    cba: TEdit;
    ban: TEdit;
    ces: TEdit;
    nfs: TEdit;
    dess: TEdit;
    denotitu: TEdit;
    usu: TEdit;
    con_movr: TZQuery;
    DataSource1: TDataSource;
    grid_ban: TdxDBGrid;
    con_ban: TZQuery;
    databan: TDataSource;
    grid_banid: TdxDBGridMaskColumn;
    grid_bancod: TdxDBGridMaskColumn;
    grid_banbanco: TdxDBGridMaskColumn;
    ude: TEdit;
    Panel45: TPanel;
    dtit: TRadioButton;
    dxint: TRadioButton;
    dwint: TRadioButton;
    dhva: TRadioButton;
    nyint: TRadioButton;
    ntit: TRadioButton;
    nzint: TRadioButton;
    fec_ela: TDateTimePicker;
    fec_re: TDateTimePicker;
    fr: TLabel;
    con_movcs: TZQuery;
    dataceds: TDataSource;
    Panel44: TPanel;
    Label1: TLabel;
    Image1: TImage;
    smd: TRadioButton;
    tito: TEdit;
    Panel1: TPanel;
    Label2: TLabel;
    Panel49: TPanel;
    Label5: TLabel;
    Panel50: TPanel;
    Label4: TLabel;
    obs: TMemo;
    ccas2: TComboBox;
    cdes2: TComboBox;
    Panel51: TPanel;
    Label6: TLabel;
    Panel52: TPanel;
    Label54: TLabel;
    Panel53: TPanel;
    Label55: TLabel;
    Panel54: TPanel;
    Label56: TLabel;
    ces2: TEdit;
    nfs2: TEdit;
    Label57: TLabel;
    hdocs: TEdit;
    Panel55: TPanel;
    Label58: TLabel;
    hdocs2: TEdit;
    Panel56: TPanel;
    Label59: TLabel;
    hdocst: TEdit;
    hdocst2: TEdit;
    con_movcs2: TZQuery;
    dataceds2: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdeDblClick(Sender: TObject);
    procedure grid_munDblClick(Sender: TObject);
    procedure grid_depDblClick(Sender: TObject);
    procedure cde2DblClick(Sender: TObject);
    procedure cde3DblClick(Sender: TObject);
    procedure cdcpDblClick(Sender: TObject);
    procedure ccaDblClick(Sender: TObject);
    procedure cca2DblClick(Sender: TObject);
    procedure cca3DblClick(Sender: TObject);
    procedure ccapDblClick(Sender: TObject);
    procedure grid_cargoDblClick(Sender: TObject);
    procedure grid_jerDblClick(Sender: TObject);
    procedure grid_modDblClick(Sender: TObject);
    procedure grid_catDblClick(Sender: TObject);
    procedure grid_turnoDblClick(Sender: TObject);
    procedure grid_dedDblClick(Sender: TObject);
    procedure cedKeyPress(Sender: TObject; var Key: Char);
    procedure ccoKeyPress(Sender: TObject; var Key: Char);
    procedure cesKeyPress(Sender: TObject; var Key: Char);
    procedure cedExit(Sender: TObject);
    procedure udeExit(Sender: TObject);
    procedure asiExit(Sender: TObject);
    procedure hdocKeyPress(Sender: TObject; var Key: Char);
    procedure choKeyPress(Sender: TObject; var Key: Char);
    procedure cho3KeyPress(Sender: TObject; var Key: Char);
    procedure hadKeyPress(Sender: TObject; var Key: Char);
    procedure htoKeyPress(Sender: TObject; var Key: Char);
    procedure cho2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure limpiar();
    procedure htoExit(Sender: TObject);
    procedure grid_banDblClick(Sender: TObject);
    procedure cbaDblClick(Sender: TObject);
    procedure ncapKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure nomEnter(Sender: TObject);
    procedure cesExit(Sender: TObject);
    procedure strExit(Sender: TObject);
    procedure facChange(Sender: TObject);
    procedure smdClick(Sender: TObject);
    procedure titoExit(Sender: TObject);
    procedure hdocsExit(Sender: TObject);
    procedure hdocs2Exit(Sender: TObject);
    procedure hdocsKeyPress(Sender: TObject; var Key: Char);
    procedure hdocs2KeyPress(Sender: TObject; var Key: Char);
    procedure hdocstExit(Sender: TObject);
    procedure hdocst2Exit(Sender: TObject);
    procedure hdocstKeyPress(Sender: TObject; var Key: Char);
    procedure hdocst2KeyPress(Sender: TObject; var Key: Char);
    procedure ccasExit(Sender: TObject);
    procedure ccas2Exit(Sender: TObject);

  private
    { Private declarations }
    auxcc:string;
  public
    { Public declarations }
  end;

var
  frmin: Tfrmin;
  control,control2:integer;
  codigo_cargo,nombre_cargo:string;
implementation

uses frmacces;

{$R *.dfm}

procedure tfrmin.limpiar;
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,214 or $25A00000); {$ENDIF}

    fac.Date:=date;
    sin.Checked:=true;
    ced.Clear;
    cco.Clear;
    nom.Clear;
    fin.Date:=date;
    fec2.Date:=date;
    fec_ela.Date:=date;
    mas.Checked:=true;
    fna.Date:=date;
    sol.Checked:=true;
    lic.Checked:=true;
    cde.Clear;
    cde2.Clear;
    cde3.Clear;
    nde.Clear;
    nde2.Clear;
    nde3.Clear;
    cca.Clear;
    cca2.Clear;
    cca3.Clear;
    nca.Clear;
    nca2.Clear;
    nca3.Clear;
    cho.Clear;
    cho2.Clear;
    cho3.Clear;
    cdcp.Clear;
    ndecp.Clear;
    ccap.Clear;
    ncap.Clear;
    hdoc.Clear;
    had.Clear;
    hto.Clear;
    fij.Checked:=true;
    dtit.Checked:=true;
    ude.Clear;
    asi.Clear;
    ncta.Clear;
    cba.Clear;
    ban.Clear;
    aho.Checked:=true;
    retro.Clear;
    ces.Clear;
    nfs.Clear;
    cdes.Clear;
    ccas.Clear;
    dess.Clear;
    obs.Clear;
    denotitu.Clear;
    tito.Clear;
    fac.SetFocus;
    ces2.Clear;
    cdes2.Clear;
    nfs2.Clear;
    ccas2.Clear;
    hdocs.Clear;
    hdocst.Clear;
    hdocs2.Clear;
    hdocst2.Clear;


{$IFDEF PROFILE}finally; Profint.ProfExit(214); end;{$ENDIF}
 end;

procedure Tfrmin.BitBtn2Click(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,215 or $25A00000); {$ENDIF}

   if ced.Text='' then
   begin
{$IFDEF PROFILE}      Profint.AMessageBox('Debe Ingresar la cédula...!','Mensaje al Usuario',16);{$ENDIF}
{$IFNDEF PROFILE}      application.MessageBox('Debe Ingresar la cédula...!','Mensaje al Usuario',16);{$ENDIF}
      ced.SetFocus;
   end
   else
   begin
   if nom.Text='' then
   begin
{$IFDEF PROFILE}          Profint.AMessageBox('Debe Ingresar el NOMBRE...!','Mensaje al Usuario',16);{$ENDIF}
{$IFNDEF PROFILE}          application.MessageBox('Debe Ingresar el NOMBRE...!','Mensaje al Usuario',16);{$ENDIF}
          nom.SetFocus;
   end
   else
   begin
    if (not mas.Checked) and (not fem.Checked) and (seg.Checked=false) then
    begin
{$IFDEF PROFILE}          Profint.AMessageBox('Debe Ingresar el SEXO...!','Mensaje al Usuario',16);{$ENDIF}
{$IFNDEF PROFILE}          application.MessageBox('Debe Ingresar el SEXO...!','Mensaje al Usuario',16);{$ENDIF}
          mas.SetFocus;
    end
    else
    begin
        if (not sol.Checked) and (not cas.Checked) and (not viu.Checked) and (not divo.Checked) and (seg.Checked=false) then
        begin
{$IFDEF PROFILE}          Profint.AMessageBox('Debe Ingresar el EDO. CIVIL...!','Mensaje al Usuario',16);{$ENDIF}
{$IFNDEF PROFILE}          application.MessageBox('Debe Ingresar el EDO. CIVIL...!','Mensaje al Usuario',16);{$ENDIF}
          sol.SetFocus;
        end
        else
        begin
           if (not lic.Checked) and (not tsu.Checked) and (not mae.Checked) and (not ott.Checked) and (seg.Checked=false) then
           begin
{$IFDEF PROFILE}              Profint.AMessageBox('Debe Ingresar el NIVEL ACADEMICO...!','Mensaje al Usuario',16);{$ENDIF}
{$IFNDEF PROFILE}              application.MessageBox('Debe Ingresar el NIVEL ACADEMICO...!','Mensaje al Usuario',16);{$ENDIF}
              lic.SetFocus;
           end
           else
           begin
              if  (hdoc.Text='') and  (had.Text='') and (hto.Text='') and (seg.Checked=false) then
              begin
{$IFDEF PROFILE}                 Profint.AMessageBox('Debe Ingresar las HORAS...!','Mensaje al Usuario',16);{$ENDIF}
{$IFNDEF PROFILE}                 application.MessageBox('Debe Ingresar las HORAS...!','Mensaje al Usuario',16);{$ENDIF}
                 hdoc.SetFocus;
              end
              else
              begin
                if (not fij.Checked) and (not int.Checked) and (seg.Checked=false) then
                begin
{$IFDEF PROFILE}                   Profint.AMessageBox('Debe Ingresar el TIPO DE NOMBRAMIENTO...!','Mensaje al Usuario',16);{$ENDIF}
{$IFNDEF PROFILE}                   application.MessageBox('Debe Ingresar el TIPO DE NOMBRAMIENTO...!','Mensaje al Usuario',16);{$ENDIF}
                   fij.SetFocus;
                end
                else
                begin
                    if (not dtit.Checked) and (not dxint.Checked)and (not dwint.Checked) and (not dhva.Checked)and (not ntit.Checked) and (not nyint.Checked) and(not nzint.Checked) and (seg.Checked=false) then
                    begin
{$IFDEF PROFILE}                         Profint.AMessageBox('Debe Ingresar el TURNO DIURNO O TURNO NOCTURNO...!','Mensaje al Usuario',16);{$ENDIF}
{$IFNDEF PROFILE}                         application.MessageBox('Debe Ingresar el TURNO DIURNO O TURNO NOCTURNO ...!','Mensaje al Usuario',16);{$ENDIF}
                         dtit.SetFocus;
                    end
                    else
                    begin
                      if (hdocs.Text<>'') and (hdocst.Text='') then
                      begin
                            application.MessageBox('Debe Ingresar el número de Horas a Tomar ...!','Mensaje al Usuario',16);
                            hdocst.SetFocus;
                      end
                      else
                      begin

                        if (hdocs2.Text<>'') and (hdocst2.Text='') then
                        begin
                            application.MessageBox('Debe Ingresar el número de Horas a Tomar ...!','Mensaje al Usuario',16);
                            hdocst2.SetFocus;
                        end
                        else
                        begin

                             // guarda en base de datos
                             tb_mov.Open;
                             tb_mov.Append;
                             tb_mov.Edit;
                             tb_mov.FieldByName('fec_actualizacion').AsDateTime:= fac.DateTime;
                             tb_mov.FieldByName('cedula').Asinteger            := strtoint(ced.Text);
                             if cco.Text='' then cco.Text:='0';
                             Tb_mov.FieldByName('cedco').AsInteger             := strtoint(cco.Text);
                             tb_mov.FieldByName('nombre').AsString             := nom.Text;
                             tb_mov.FieldByName('fec_nac').AsDateTime          := fna.DateTime;
                             tb_mov.FieldByName('cargo').AsString              := ncap.Text;
                             tb_mov.FieldByName('cod_dep').AsString            := cdcp.Text;
                             tb_mov.FieldByName('nom_dep').AsString            := ndecp.Text;
                             tb_mov.FieldByName('cod_carg').AsString           := ccap.Text;
                             tb_mov.FieldByName('cod_dep2').AsString           := cde.Text;
                             tb_mov.FieldByName('nom_dep2').AsString           := nde.Text;
                             tb_mov.FieldByName('cargo2').AsString             := nca.Text;
                             tb_mov.FieldByName('observaciones').AsString      := obs.Text;
                             tb_mov.FieldByName('asignatura').AsString         := asi.Text;
                             tb_mov.FieldByName('horas2').AsString             := cho.Text;
                             tb_mov.FieldByName('cod_carg2').AsString          := cca.Text;
                             tb_mov.FieldByName('num_cuenta').AsString         := ncta.Text;
                             tb_mov.FieldByName('cod_banco').AsString          := cba.Text;
                             tb_mov.FieldByName('banco').AsString              := ban.Text;
                             tb_mov.FieldByName('ub_dep').AsString             := ude.Text;
                             tb_mov.FieldByName('personal').AsString           := '';
                             tb_mov.FieldByName('ceds').AsString              := ces.Text;
                             tb_mov.FieldByName('noms').AsString              := nfs.Text;
                             tb_mov.FieldByName('coddeps').AsString           := cdes.Text;
                             tb_mov.FieldByName('codcars').AsString           := ccas.Text;
                             if hdocs.Text='' then hdocs.Text:='0';
                             tb_mov.FieldByName('hdocs').AsFloat           := strtofloat(hdocs.Text);
                             if hdocst.Text='' then hdocst.Text:='0';
                             tb_mov.FieldByName('hdocst').AsFloat          := strtofloat(hdocst.Text);


                             tb_mov.FieldByName('ceds2').AsString              := ces2.Text;
                             tb_mov.FieldByName('noms2').AsString              := nfs2.Text;
                             tb_mov.FieldByName('coddeps2').AsString           := cdes2.Text;
                             tb_mov.FieldByName('codcars2').AsString           := ccas2.Text;
                             if hdocs2.Text='' then hdocs2.Text:='0';
                             tb_mov.FieldByName('hdocs2').AsFloat            := strtofloat(hdocs2.Text);
                             if hdocst2.Text='' then hdocst2.Text:='0';
                             tb_mov.FieldByName('hdocst2').AsFloat          := strtofloat(hdocst2.Text);

                             tb_mov.FieldByName('destino').AsString            := dess.Text;
                             tb_mov.FieldByName('fecha').AsDateTime            := fin.Date;

                             tb_mov.FieldByName('horas1').AsString             := hdoc.Text;
                             tb_mov.FieldByName('horas12').AsString            := had.Text;
                             tb_mov.FieldByName('horas13').AsString            := hto.Text;

                            if sin.Checked then tb_mov.FieldByName('tipomov').AsString:='INGRESO';
                            if sre.Checked then tb_mov.FieldByName('tipomov').AsString:='REINGRESO';
                            if sca.Checked then tb_mov.FieldByName('tipomov').AsString:='CARGO ADICIONAL';
                            if str.Checked then tb_mov.FieldByName('tipomov').AsString:='TRASLADO';
                            if sas.Checked then tb_mov.FieldByName('tipomov').AsString:='ASCENSO';
                            if scl.Checked then tb_mov.FieldByName('tipomov').AsString:='CLASIFICACION';
                            if slc.Checked then tb_mov.FieldByName('tipomov').AsString:='LIBERACION DE CARGO';
                            if ssu.Checked then tb_mov.FieldByName('tipomov').AsString:='SUSPENCION';
                            if smh.Checked then tb_mov.FieldByName('tipomov').AsString:='MODIFICACION DE HORAS';
                            if seg.Checked then tb_mov.FieldByName('tipomov').AsString:='EGRESOS';
                            if smc.Checked then tb_mov.FieldByName('tipomov').AsString:='MODIFICACION DE CARGO';
                            if smd.Checked then tb_mov.FieldByName('tipomov').AsString:='MODIFICACION DE DATOS PERSONALES';

                            tb_mov.FieldByName('ze').AsInteger                   := strtoint(zeb.Text);
                            tb_mov.FieldByName('estado').AsString                := efe.Text;
                            tb_mov.FieldByName('analista').AsString              := usu.Text;
                            tb_mov.FieldByName('fec_ingme').AsDateTime           := fin.Date;
                            tb_mov.FieldByName('cod_dep3').AsString              := cde2.Text;
                            tb_mov.FieldByName('nom_dep3').AsString              := nde2.Text;
                            tb_mov.FieldByName('cod_carg3').AsString             := cca2.Text;
                            tb_mov.FieldByName('cargo3').AsString                := nca2.Text;
                            tb_mov.FieldByName('cod_dep4').AsString              := cde3.Text;
                            tb_mov.FieldByName('nom_dep4').AsString              := nde3.Text;
                            tb_mov.FieldByName('cod_carg4').AsString             := cca3.Text;
                            tb_mov.FieldByName('cargo4').AsString                := nca3.Text;
                            tb_mov.FieldByName('horas3').AsString                := cho2.Text;
                            tb_mov.FieldByName('horas4').AsString                := cho3.Text;

                            if mas.Checked then
                                tb_mov.FieldByName('sexo').AsString                  :='MASCULINO';
                            if fem.Checked then
                                tb_mov.FieldByName('sexo').AsString                  :='FEMENINO';

                            if sol.Checked then
                                tb_mov.FieldByName('edo_civil').AsString             :='SOLTERO';
                            if cas.Checked then
                                tb_mov.FieldByName('edo_civil').AsString             :='CASADO';
                            if viu.Checked then
                                tb_mov.FieldByName('edo_civil').AsString             :='VIUDO';
                            if divo.Checked then
                                tb_mov.FieldByName('edo_civil').AsString             :='DIVORCIADO';

                            if lic.Checked then
                                tb_mov.FieldByName('nivel_aca').AsString             :='LIC. O PROF.';
                            if tsu.Checked then
                                tb_mov.FieldByName('nivel_aca').AsString             :='T.S.U. EDUCACION';
                            if mae.Checked then
                                tb_mov.FieldByName('nivel_aca').AsString             :='MAESTRO';
                            if ott.Checked then
                                tb_mov.FieldByName('nivel_aca').AsString             :='OTRO TITULO';

                            if not seg.Checked then
                            begin
                            if fij.Checked then
                                tb_mov.FieldByName('tipo_nombr').AsString             :='FIJO';
                            if int.Checked then
                                tb_mov.FieldByName('tipo_nombr').AsString             :='INTERINO';



                            if dtit.Checked then
                                tb_mov.FieldByName('t_diurno').AsString             :='TITULAR';
                            if dxint.Checked then
                                tb_mov.FieldByName('t_diurno').AsString             :='INTERINO (S/P)';
                            if dwint.Checked then
                                tb_mov.FieldByName('t_diurno').AsString             :='INTERINO(P/CONCURSO)';
                            if dhva.Checked then
                                tb_mov.FieldByName('t_diurno').AsString             :='HORAS VARIABLES';

                            if ntit.Checked then
                                tb_mov.FieldByName('t_nocturno').AsString           :='TITULAR';
                            if nyint.Checked then
                                tb_mov.FieldByName('t_nocturno').AsString           :='INTERINO (S/P)';
                            if nzint.Checked then
                                tb_mov.FieldByName('t_nocturno').AsString           :='INTERINO(P/CONCURSO)';
                            end
                            else
                            begin
                                if not fij.Checked then
                                tb_mov.FieldByName('tipo_nombr').AsString             :='';
                               if not int.Checked then
                                tb_mov.FieldByName('tipo_nombr').AsString             :='';



                            if not dtit.Checked then
                                tb_mov.FieldByName('t_diurno').AsString             :='';
                            if not dxint.Checked then
                                tb_mov.FieldByName('t_diurno').AsString             :='';
                            if not dwint.Checked then
                                tb_mov.FieldByName('t_diurno').AsString             :='';
                            if not dhva.Checked then
                                tb_mov.FieldByName('t_diurno').AsString             :='';

                            if not ntit.Checked then
                                tb_mov.FieldByName('t_nocturno').AsString           :='';
                            if not nyint.Checked then
                                tb_mov.FieldByName('t_nocturno').AsString           :='';
                            if not nzint.Checked then
                                tb_mov.FieldByName('t_nocturno').AsString           :='';
                            end;


                            if bbs.Checked then
                                tb_mov.FieldByName('bb').AsString                   :='SI';
                            if bbn.Checked then
                                tb_mov.FieldByName('bb').AsString                   :='NO';


                            if cor.Checked then
                                tb_mov.FieldByName('tipo_cuenta').AsString          :='CORRIENTE';
                            if aho.Checked then
                                tb_mov.FieldByName('tipo_cuenta').AsString          :='AHORRO';

                            tb_mov.FieldByName('RETRO').AsString                    := retro.Text;
                            tb_mov.FieldByName('FEC_ELA').AsDateTime                := fec_ela.DateTime;
                            tb_mov.FieldByName('FEC_REN').AsDateTime                := fec_re.DateTime;
                            tb_mov.FieldByName('DENOTITU').AsString                 := denotitu.Text;
                            tb_mov.FieldByName('TITO').AsString                     := tito.Text;

                            //graba en base de datos
                             tb_mov.Post;
                            // cierra las consultas y tablas
                            con_mun.Close;
                            con_dep.Close;
                            con_movr.Close;
                            con_cargo.Close;
                            con_mod.Close;
                            con_tur.Close;
                            con_jer.Close;
                            con_cat.Close;
                            con_ded.Close;
                            tb_mov.Close;
                            limpiar();
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
{$IFDEF PROFILE}finally; Profint.ProfExit(215); end;{$ENDIF}
end;

procedure Tfrmin.FormShow(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,216 or $25A00000); {$ENDIF}
limpiar();
fac.SetFocus;
codigo_cargo:='';
usu.Text:=frmacceso.con_usu.fieldbyname('nombre').AsString;
{$IFDEF PROFILE}finally; Profint.ProfExit(216); end;{$ENDIF}
end;


procedure Tfrmin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,217 or $25A00000); {$ENDIF}
   if Key = 13 then
   begin
       Key := 0;
       Perform(WM_NEXTDLGCTL, 0, 0);
   end;
{$IFDEF PROFILE}finally; Profint.ProfExit(217); end;{$ENDIF}
end;

procedure Tfrmin.cdeDblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,218 or $25A00000); {$ENDIF}
   con_mun.Close;
   con_mun.Open;
   grid_mun.Visible:=true;
   grid_mun.SetFocus;
   control:=1;
{$IFDEF PROFILE}finally; Profint.ProfExit(218); end;{$ENDIF}
end;

procedure Tfrmin.grid_munDblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,219 or $25A00000); {$ENDIF}
   if seg.Checked=true then
     ude.Text:=con_mun.fieldbyname('nombre').asstring
   else
   begin
    if control=4 then
    begin
      ude.Text:=con_mun.fieldbyname('nombre').asstring;
    end;
   end;
   con_dep.Close;
   con_dep.Params[0].AsInteger:=con_mun.fieldbyname('cod').AsInteger;
   con_dep.Open;
   grid_dep.visible:=true;
   grid_dep.SetFocus;

{$IFDEF PROFILE}finally; Profint.ProfExit(219); end;{$ENDIF}
end;

procedure Tfrmin.grid_depDblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,220 or $25A00000); {$ENDIF}
   grid_dep.visible:=false;
   grid_mun.Visible:=false;

   if control=1 then
   begin
     cde.Text:=con_dep.fieldbyname('cod').asstring;
     nde.Text:=con_dep.fieldbyname('nombre').asstring;
     cde.setfocus;
   end;
   if control=2 then
   begin
     cde2.Text:=con_dep.fieldbyname('cod').asstring;
     nde2.Text:=con_dep.fieldbyname('nombre').asstring;
     cde2.setfocus;
   end;
   if control=3 then
   begin
     cde3.Text:=con_dep.fieldbyname('cod').asstring;
     nde3.Text:=con_dep.fieldbyname('nombre').asstring;
     cde3.setfocus;
   end;
   if control=4 then
   begin
     cdcp.Text:=con_dep.fieldbyname('cod').asstring;
     ndecp.Text:=con_dep.fieldbyname('nombre').asstring;
     cdcp.setfocus;
   end;

{$IFDEF PROFILE}finally; Profint.ProfExit(220); end;{$ENDIF}
end;

procedure Tfrmin.cde2DblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,221 or $25A00000); {$ENDIF}
   con_mun.Close;
   con_mun.Open;
   grid_mun.Visible:=true;
   grid_mun.SetFocus;
   control:=2;
{$IFDEF PROFILE}finally; Profint.ProfExit(221); end;{$ENDIF}
end;

procedure Tfrmin.cde3DblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,222 or $25A00000); {$ENDIF}
   con_mun.Close;
   con_mun.Open;
   grid_mun.Visible:=true;
   grid_mun.SetFocus;
   control:=3;
{$IFDEF PROFILE}finally; Profint.ProfExit(222); end;{$ENDIF}
end;

procedure Tfrmin.cdcpDblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,223 or $25A00000); {$ENDIF}
   con_mun.Close;
   con_mun.Open;
   grid_mun.Visible:=true;
   grid_mun.SetFocus;
   control:=4;
{$IFDEF PROFILE}finally; Profint.ProfExit(223); end;{$ENDIF}
end;

procedure Tfrmin.ccaDblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,224 or $25A00000); {$ENDIF}
   con_cargo.Close;
   con_cargo.Open;
   grid_cargo.Visible:=true;
   grid_cargo.SetFocus;
   control2:=1;
{$IFDEF PROFILE}finally; Profint.ProfExit(224); end;{$ENDIF}
end;

procedure Tfrmin.cca2DblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,225 or $25A00000); {$ENDIF}
   con_cargo.Close;
   con_cargo.Open;
   grid_cargo.Visible:=true;
   grid_cargo.SetFocus;
   control2:=2;
{$IFDEF PROFILE}finally; Profint.ProfExit(225); end;{$ENDIF}
end;

procedure Tfrmin.cca3DblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,226 or $25A00000); {$ENDIF}
   con_cargo.Close;
   con_cargo.Open;
   grid_cargo.Visible:=true;
   grid_cargo.SetFocus;
   control2:=3;
{$IFDEF PROFILE}finally; Profint.ProfExit(226); end;{$ENDIF}
end;

procedure Tfrmin.ccapDblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,227 or $25A00000); {$ENDIF}
   con_cargo.Close;
   con_cargo.Open;
   grid_cargo.Visible:=true;
   grid_cargo.SetFocus;
   control2:=4;
{$IFDEF PROFILE}finally; Profint.ProfExit(227); end;{$ENDIF}
end;

procedure Tfrmin.grid_cargoDblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,228 or $25A00000); {$ENDIF}
   auxcc:='';
   codigo_cargo:=con_cargo.FieldByName('pd').AsString;
   auxcc:=codigo_cargo;
   if ((codigo_cargo='5') or (codigo_cargo='6')) then
   begin
      nombre_cargo:=con_cargo.FieldByName('des').AsString;
   end;
   grid_cargo.Enabled:=false;
   con_jer.close;
   con_jer.Open;
   grid_jer.Visible:=true;
   grid_jer.SetFocus;
{$IFDEF PROFILE}finally; Profint.ProfExit(228); end;{$ENDIF}
end;

procedure Tfrmin.grid_jerDblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,229 or $25A00000); {$ENDIF}
   codigo_cargo:=codigo_cargo+con_jer.FieldByName('sd').AsString;
   grid_jer.Enabled:=false;
   con_mod.close;
   con_mod.Open;
   grid_mod.Visible:=true;
   grid_mod.SetFocus;
{$IFDEF PROFILE}finally; Profint.ProfExit(229); end;{$ENDIF}
end;

procedure Tfrmin.grid_modDblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,230 or $25A00000); {$ENDIF}
   codigo_cargo:=codigo_cargo+con_mod.FieldByName('td').AsString;
   grid_mod.Enabled:=false;
   con_cat.close;
   con_cat.Open;
   grid_cat.Visible:=true;
   grid_cat.SetFocus;
{$IFDEF PROFILE}finally; Profint.ProfExit(230); end;{$ENDIF}
end;


procedure Tfrmin.grid_catDblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,231 or $25A00000); {$ENDIF}

   codigo_cargo:=codigo_cargo+con_cat.FieldByName('cd').AsString;
   if (not((auxcc='5') or (auxcc='6'))) then
   begin
   nombre_cargo:=con_cat.FieldByName('des').AsString;
   end;
   grid_cat.Enabled:=false;
   con_tur.close;
   con_tur.Open;
   grid_turno.Visible:=true;
   grid_turno.SetFocus;
{$IFDEF PROFILE}finally; Profint.ProfExit(231); end;{$ENDIF}
end;

procedure Tfrmin.grid_turnoDblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,232 or $25A00000); {$ENDIF}
   codigo_cargo:=codigo_cargo+con_tur.FieldByName('qd').AsString;
   grid_turno.Enabled:=false;
   con_ded.close;
   con_ded.Open;
   grid_ded.Visible:=true;
   grid_ded.SetFocus;
{$IFDEF PROFILE}finally; Profint.ProfExit(232); end;{$ENDIF}
end;

procedure Tfrmin.grid_dedDblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,233 or $25A00000); {$ENDIF}
   codigo_cargo:=codigo_cargo+con_ded.FieldByName('sexd').AsString;

   grid_ded.Enabled:=true;
   grid_turno.Enabled:=true;
   grid_cat.Enabled:=true;
   grid_mod.Enabled:=true;
   grid_jer.Enabled:=true;
   grid_cargo.Enabled:=true;

   grid_ded.visible:=false;
   grid_turno.Visible:=false;
   grid_cat.visible:=false;
   grid_mod.Visible:=false;
   grid_jer.visible:=false;
   grid_cargo.Visible:=false;


   if control2=1 then
   begin
     cca.Clear;
     cca.Text:=codigo_cargo;
     nca.Text:=nombre_cargo;
     cca.setfocus;
   end;
   if control2=2 then
   begin
     cca2.Clear;
     cca2.Text:=codigo_cargo;
     nca2.Text:=nombre_cargo;
     cca2.setfocus;
   end;
   if control2=3 then
   begin
     cca3.Clear;
     cca3.Text:=codigo_cargo;
     nca3.Text:=nombre_cargo;
     cca3.setfocus;
   end;
   if control2=4 then
   begin
     ccap.Clear;
     ccap.Text:=codigo_cargo;
     ncap.Text:=nombre_cargo;
     ccap.setfocus;
   end;

   grid_turno.Enabled:=true;
   grid_cat.Enabled:=true;
   grid_mod.Enabled:=true;
   grid_jer.Enabled:=true;
   grid_cargo.Enabled:=true;

{$IFDEF PROFILE}finally; Profint.ProfExit(233); end;{$ENDIF}
end;

procedure Tfrmin.cedKeyPress(Sender: TObject; var Key: Char);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,234 or $25A00000); {$ENDIF}
  if ((key>=#48) and (key<=#57))  or (key=#8) then
  else
  begin
    if key<>#13 then
    key:=#0;
  end;
{$IFDEF PROFILE}finally; Profint.ProfExit(234); end;{$ENDIF}
end;

procedure Tfrmin.ccoKeyPress(Sender: TObject; var Key: Char);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,235 or $25A00000); {$ENDIF}
if ((key>=#48) and (key<=#57)) or ((key>=#96) and (key<=#105)) or (key=#8) then
else
  key:=#0;
{$IFDEF PROFILE}finally; Profint.ProfExit(235); end;{$ENDIF}
end;

procedure Tfrmin.cesKeyPress(Sender: TObject; var Key: Char);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,236 or $25A00000); {$ENDIF}
if ((key>=#48) and (key<=#57)) or ((key>=#96) and (key<=#105)) or (key=#8) then
else
  key:=#0;
{$IFDEF PROFILE}finally; Profint.ProfExit(236); end;{$ENDIF}
end;

procedure Tfrmin.cedExit(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,237 or $25A00000); {$ENDIF}

  if seg.Checked=true then
  begin
    fr.Visible:=true;
    fec_re.Visible:=true;
    cdcp.Enabled:=false;
    ndecp.Enabled:=false;
    ccap.Enabled:=false;
    ncap.Enabled:=false;
    hdoc.Enabled:=false;
    had.Enabled:=false;
    hto.Enabled:=false;
    asi.Enabled:=false;
    mas.Checked:=false;
    sol.Checked:=false;
    lic.Checked:=false;
    fin.Date:=date;
    fna.Date:=date;
  end
  else
  begin
    fr.Visible:=false;
    fec_re.Visible:=false;
    mas.Checked:=true;
    sol.Checked:=true;
    lic.Checked:=true;
    cdcp.Enabled:=true;
    ndecp.Enabled:=true;
    ccap.Enabled:=true;
    ncap.Enabled:=true;
    hdoc.Enabled:=true;
    had.Enabled:=true;
    hto.Enabled:=true;
    asi.Enabled:=true;
  end;


    if (not sin.Checked) and (not sre.Checked) and (not sca.Checked) and (not str.Checked) and (not sas.Checked) and (not scl.Checked)and (not slc.Checked) and (not ssu.Checked) and (not smh.Checked) and (not seg.Checked) and (not smd.Checked) and (not smc.Checked) then
    begin
{$IFDEF PROFILE}          Profint.AMessageBox('Debe Elegir el TIPO DE MOVIMIENTO...!','Mensaje al Usuario',16);{$ENDIF}
{$IFNDEF PROFILE}          application.MessageBox('Debe Elegir el TIPO DE MOVIMIENTO...!','Mensaje al Usuario',16);{$ENDIF}
          sin.SetFocus;
    end
    else
    begin
       if ced.Text <> '' then
       begin
        if ((smc.Checked=FALSE) and (smh.Checked=false)) then
        begin
         con_movr.Close;
         con_movr.Params[0].AsInteger:=strtoint(ced.Text);
         if sin.Checked then con_movr.Params[1].AsString:='INGRESO';
         if sre.Checked then con_movr.Params[1].AsString:='REINGRESO';
         if sca.Checked then con_movr.Params[1].AsString:='CARGO ADICIONAL';
         if str.Checked then con_movr.Params[1].AsString:='TRASLADO';
         if sas.Checked then con_movr.Params[1].AsString:='ASCENSO';
         if scl.Checked then con_movr.Params[1].AsString:='CLASIFICACION';
         if slc.Checked then con_movr.Params[1].AsString:='LIBERACION DE CARGO';
         if ssu.Checked then con_movr.Params[1].AsString:='SUSPENCION';
         if seg.Checked then con_movr.Params[1].AsString:='EGRESOS';
         if smd.Checked then con_movr.Params[1].AsString:='MODIFICACION DE DATOS PERSONALES';
         con_movr.Open;
         if not con_movr.IsEmpty then
         begin
{$IFDEF PROFILE}           Profint.AMessageBox('El Empleado Ya se encuentra Registrado...!','Mensaje al Usuario',16);{$ENDIF}
{$IFNDEF PROFILE}           application.MessageBox('El Empleado Ya se encuentra Registrado...!','Mensaje al Usuario',16);{$ENDIF}
           if (str.Checked) or (scl.Checked) then
              nom.SetFocus
           else
              ced.SetFocus;
         end;
        end;
       end;
    end;
{$IFDEF PROFILE}finally; Profint.ProfExit(237); end;{$ENDIF}
end;


procedure Tfrmin.udeExit(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,238 or $25A00000); {$ENDIF}
   if ude.Text='' then
      ude.SetFocus;
{$IFDEF PROFILE}finally; Profint.ProfExit(238); end;{$ENDIF}
end;

procedure Tfrmin.asiExit(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,239 or $25A00000); {$ENDIF}
if asi.Text='' then
   asi.SetFocus;
{$IFDEF PROFILE}finally; Profint.ProfExit(239); end;{$ENDIF}
end;

procedure Tfrmin.hdocKeyPress(Sender: TObject; var Key: Char);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,240 or $25A00000); {$ENDIF}
if (key='.') then
   key:=',';
{$IFDEF PROFILE}finally; Profint.ProfExit(240); end;{$ENDIF}
end;

procedure Tfrmin.choKeyPress(Sender: TObject; var Key: Char);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,241 or $25A00000); {$ENDIF}
if (key='.') then
   key:=',';
if ((key>=#48) and (key<=#57)) or ((key>=#96) and (key<=#105))  or (key=#8) then
  else
  begin
    if (key<>#13) and (key<>',') then
    key:=#0;
  end;
{$IFDEF PROFILE}finally; Profint.ProfExit(241); end;{$ENDIF}
end;

procedure Tfrmin.cho3KeyPress(Sender: TObject; var Key: Char);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,242 or $25A00000); {$ENDIF}
if (key='.') then
   key:=',';
if ((key>=#48) and (key<=#57)) or ((key>=#96) and (key<=#105))  or (key=#8) then
  else
  begin
    if (key<>#13) and (key<>',') then
    key:=#0;
  end;
{$IFDEF PROFILE}finally; Profint.ProfExit(242); end;{$ENDIF}
end;

procedure Tfrmin.hadKeyPress(Sender: TObject; var Key: Char);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,243 or $25A00000); {$ENDIF}
if (key='.') then
   key:=',';
{$IFDEF PROFILE}finally; Profint.ProfExit(243); end;{$ENDIF}
end;

procedure Tfrmin.htoKeyPress(Sender: TObject; var Key: Char);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,244 or $25A00000); {$ENDIF}
if (key='.') then
   key:=',';
{$IFDEF PROFILE}finally; Profint.ProfExit(244); end;{$ENDIF}
end;

procedure Tfrmin.cho2KeyPress(Sender: TObject; var Key: Char);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,245 or $25A00000); {$ENDIF}
if (key='.') then
   key:=',';
if ((key>=#48) and (key<=#57)) or ((key>=#96) and (key<=#105))  or (key=#8) then
  else
  begin
    if (key<>#13) and (key<>',') then
    key:=#0;
  end;
{$IFDEF PROFILE}finally; Profint.ProfExit(245); end;{$ENDIF}
end;

procedure Tfrmin.BitBtn1Click(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,246 or $25A00000); {$ENDIF}
   grid_mun.Visible:=false;
   grid_dep.Visible:=false;
   grid_ban.Visible:=false;
   grid_ded.visible:=false;
   grid_turno.Visible:=false;
   grid_cat.visible:=false;
   grid_mod.Visible:=false;
   grid_jer.visible:=false;
   grid_cargo.Visible:=false;
 close;
{$IFDEF PROFILE}finally; Profint.ProfExit(246); end;{$ENDIF}
end;

procedure Tfrmin.htoExit(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,247 or $25A00000); {$ENDIF}
if hdoc.Text='' then hdoc.Text:='0';
if had.Text=''  then had.Text:='0';
  hto.Text:=floattostr(strtofloat(hdoc.Text)+ strtofloat(had.Text));
{$IFDEF PROFILE}finally; Profint.ProfExit(247); end;{$ENDIF}
end;

procedure Tfrmin.grid_banDblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,248 or $25A00000); {$ENDIF}
    if (con_ban.fieldbyname('cod').asstring='3') or (con_ban.fieldbyname('cod').asstring='6') or (con_ban.fieldbyname('cod').asstring='7')  then
    begin
       cba.Text:='00'+con_ban.fieldbyname('cod').asstring;
    end
    else
    begin
      cba.Text:=con_ban.fieldbyname('cod').asstring;
    end;

   ban.Text:=con_ban.fieldbyname('banco').asstring;
   grid_ban.visible:=false;
   ces.SetFocus;
{$IFDEF PROFILE}finally; Profint.ProfExit(248); end;{$ENDIF}
end;

procedure Tfrmin.cbaDblClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,249 or $25A00000); {$ENDIF}
con_ban.Close;
con_ban.Open;
grid_ban.Visible:=true;
grid_ban.SetFocus;
{$IFDEF PROFILE}finally; Profint.ProfExit(249); end;{$ENDIF}
end;

procedure Tfrmin.ncapKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,250 or $25A00000); {$ENDIF}
 if Key = 13 then
 begin
     Key := 0;
     Perform(WM_NEXTDLGCTL, 0, 0);
 end;
{$IFDEF PROFILE}finally; Profint.ProfExit(250); end;{$ENDIF}
end;

procedure Tfrmin.sinClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,251 or $25A00000); {$ENDIF}
if (sin.Checked=true) then
begin
    aho.Checked:=true;
    aho.Enabled:=false;
    fin.Enabled:=false;
     fij.Checked:=true;
    dtit.Checked:=true;
end;
{$IFDEF PROFILE}finally; Profint.ProfExit(251); end;{$ENDIF}
end;

procedure Tfrmin.sreClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,252 or $25A00000); {$ENDIF}
if (sre.Checked=true) then
begin
    aho.Checked:=true;
    aho.Enabled:=false;
       fij.Checked:=true;
    dtit.Checked:=true;
end;

{$IFDEF PROFILE}finally; Profint.ProfExit(252); end;{$ENDIF}
end;

procedure Tfrmin.scaClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,253 or $25A00000); {$ENDIF}
if (sca.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
       fij.Checked:=true;
    dtit.Checked:=true;
end;
{$IFDEF PROFILE}finally; Profint.ProfExit(253); end;{$ENDIF}
end;

procedure Tfrmin.strClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,254 or $25A00000); {$ENDIF}
if (str.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
       fij.Checked:=true;
    dtit.Checked:=true;
end;
{$IFDEF PROFILE}finally; Profint.ProfExit(254); end;{$ENDIF}
end;

procedure Tfrmin.sasClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,255 or $25A00000); {$ENDIF}
if (sas.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
       fij.Checked:=true;
    dtit.Checked:=true;
end;
{$IFDEF PROFILE}finally; Profint.ProfExit(255); end;{$ENDIF}
end;

procedure Tfrmin.sclClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,256 or $25A00000); {$ENDIF}
if (scl.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
       fij.Checked:=true;
    dtit.Checked:=true;
end;
{$IFDEF PROFILE}finally; Profint.ProfExit(256); end;{$ENDIF}
end;

procedure Tfrmin.slcClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,257 or $25A00000); {$ENDIF}
if (slc.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
       fij.Checked:=true;
    dtit.Checked:=true;
end;
{$IFDEF PROFILE}finally; Profint.ProfExit(257); end;{$ENDIF}
end;

procedure Tfrmin.ssuClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,258 or $25A00000); {$ENDIF}
if (ssu.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
       fij.Checked:=true;
    dtit.Checked:=true;
end;
{$IFDEF PROFILE}finally; Profint.ProfExit(258); end;{$ENDIF}
end;

procedure Tfrmin.smhClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,259 or $25A00000); {$ENDIF}
if (smh.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
       fij.Checked:=true;
    dtit.Checked:=true;
end;
{$IFDEF PROFILE}finally; Profint.ProfExit(259); end;{$ENDIF}
end;

procedure Tfrmin.segClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,260 or $25A00000); {$ENDIF}
if (seg.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
    mas.Checked:=true;
    sol.Checked:=true;
    lic.Checked:=true;
    fij.Checked:=false;
    dtit.Checked:=false;;

end
else
begin
    fij.Checked:=true;
    dtit.Checked:=true;
    mas.Checked:=false;
    sol.Checked:=false;
    lic.Checked:=false;
end;
{$IFDEF PROFILE}finally; Profint.ProfExit(260); end;{$ENDIF}
end;

procedure Tfrmin.smcClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,261 or $25A00000); {$ENDIF}
if (smc.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
    fij.Checked:=true;
    dtit.Checked:=true;
end;
{$IFDEF PROFILE}finally; Profint.ProfExit(261); end;{$ENDIF}
end;

procedure Tfrmin.nomEnter(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,262 or $25A00000); {$ENDIF}
 if ced.Text='' then
    begin
{$IFDEF PROFILE}          Profint.AMessageBox('Debe Ingresar la cédula...!','Mensaje al Usuario',16);{$ENDIF}
{$IFNDEF PROFILE}          application.MessageBox('Debe Ingresar la cédula...!','Mensaje al Usuario',16);{$ENDIF}
          ced.SetFocus;
     end
{$IFDEF PROFILE}finally; Profint.ProfExit(262); end;{$ENDIF}
end;

procedure Tfrmin.cesExit(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,263 or $25A00000); {$ENDIF}
 
  
{$IFDEF PROFILE}finally; Profint.ProfExit(263); end;{$ENDIF}
end;

procedure Tfrmin.strExit(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,264 or $25A00000); {$ENDIF}
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
{$IFDEF PROFILE}finally; Profint.ProfExit(264); end;{$ENDIF}
end;

procedure Tfrmin.facChange(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,265 or $25A00000); {$ENDIF}
if sin.Checked=true then
   fin.Date:=fac.Date;
{$IFDEF PROFILE}finally; Profint.ProfExit(265); end;{$ENDIF}
end;

procedure Tfrmin.smdClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,266 or $25A00000); {$ENDIF}
if (smd.Checked=true) then
begin
    aho.Checked:=false;
    aho.Enabled:=false;
    fij.Checked:=true;
    dtit.Checked:=true;
end;
{$IFDEF PROFILE}finally; Profint.ProfExit(266); end;{$ENDIF}
end;

procedure Tfrmin.titoExit(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,267 or $25A00000); {$ENDIF}
 if tito.Text='' then
      tito.SetFocus;
{$IFDEF PROFILE}finally; Profint.ProfExit(267); end;{$ENDIF}
end;

procedure Tfrmin.hdocsExit(Sender: TObject);
begin
  if hdocs.Text='' then hdocs.Text:='0';
end;

procedure Tfrmin.hdocs2Exit(Sender: TObject);
begin
if hdocs2.Text='' then hdocs2.Text:='0';
end;

procedure Tfrmin.hdocsKeyPress(Sender: TObject; var Key: Char);
begin
if (key='.') then
   key:=',';
end;

procedure Tfrmin.hdocs2KeyPress(Sender: TObject; var Key: Char);
begin
if (key='.') then
   key:=',';
end;

procedure Tfrmin.hdocstExit(Sender: TObject);
begin
 if hdocst.Text='' then hdocst.Text:='0';
end;

procedure Tfrmin.hdocst2Exit(Sender: TObject);
begin
 if hdocst2.Text='' then hdocst2.Text:='0';
end;

procedure Tfrmin.hdocstKeyPress(Sender: TObject; var Key: Char);
begin
if (key='.') then
   key:=',';
end;

procedure Tfrmin.hdocst2KeyPress(Sender: TObject; var Key: Char);
begin
if (key='.') then
   key:=',';
end;

procedure Tfrmin.ccasExit(Sender: TObject);
begin
 if ces.Text <> '' then
  begin
       con_movcs.Close;
       con_movcs.Params[0].AsInteger:=strtoint(ces.Text);
       con_movcs.Params[1].AsString:= cdes.Text;
       con_movcs.Params[2].AsString:= ccas.Text;
       con_movcs.Open;
       con_movcs.FindLast;
       if not con_movcs.IsEmpty then
       begin
          if ((con_movcs.FieldByName('horasbase').AsFloat) - (con_movcs.FieldByName('horastomadas').AsFloat)=0) and (con_movcs.FieldByName('horasbase').AsFloat>0) and (con_movcs.FieldByName('horastomadas').AsFloat>0) then
          begin
                   application.MessageBox('Recurso ya Utilizado...!','Mensaje al Usuario',32);
                   ces.Clear;
                   cdes.Clear;
                   ccas.Clear;
          end
          else
          begin
             if ((con_movcs.FieldByName('horasbase').AsFloat) - (con_movcs.FieldByName('horastomadas').AsFloat)>0)  and ((con_movcs.FieldByName('horasbase').AsFloat) - (con_movcs.FieldByName('horastomadas').AsFloat)<=(con_movcs.FieldByName('horasbase').AsFloat))then
             begin
                nfs.Text:= con_movcs.FieldByName('noms').AsString;
                hdocs.Text:=floattostr(con_movcs.FieldByName('horasbase').AsFloat - con_movcs.FieldByName('horastomadas').AsFloat);
                //messagebox(0,pchar('El número de Horas disponibles es: '+ floattostr(nhoras)),'Mensaje al Usuario',16);

             end;
          end;
          ces.SetFocus;
       end;
   end;
end;

procedure Tfrmin.ccas2Exit(Sender: TObject);

begin
 if ces.Text <> '' then
  begin

       con_movcs2.Close;
       con_movcs2.Params[0].AsInteger:=strtoint(ces2.Text);
       con_movcs2.Params[1].AsString:= cdes2.Text;
       con_movcs2.Params[2].AsString:= ccas2.Text;
       con_movcs2.Open;
       con_movcs2.FindLast;
       if not con_movcs.IsEmpty then
       begin

          if ((con_movcs2.FieldByName('horasbase').AsFloat) - (con_movcs2.FieldByName('horastomadas').AsFloat)=0) and (con_movcs2.FieldByName('horasbase').AsFloat>0) and (con_movcs2.FieldByName('horastomadas').AsFloat>0) then
          begin
                   application.MessageBox('Recurso ya Utilizado...!','Mensaje al Usuario',32);
                   ces2.Clear;
                   cdes2.Clear;
                   ccas2.Clear;
          end
          else
          begin
             if ((con_movcs2.FieldByName('horasbase').AsFloat) - (con_movcs2.FieldByName('horastomadas').AsFloat)>0)  and ((con_movcs2.FieldByName('horasbase').AsFloat) - (con_movcs2.FieldByName('horastomadas').AsFloat)<=(con_movcs2.FieldByName('horasbase').AsFloat))then
             begin
               nfs2.Text:= con_movcs2.FieldByName('noms2').AsString;
               hdocs2.Text:= floattostr(con_movcs2.FieldByName('horasbase').AsFloat - con_movcs2.FieldByName('horastomadas').AsFloat);
                //messagebox(0,pchar('El número de Horas disponibles es: '+ floattostr(nhoras)),'Mensaje al Usuario',16);

             end;
          end;
          ces2.SetFocus;
       end;
   end;
end;

end.
