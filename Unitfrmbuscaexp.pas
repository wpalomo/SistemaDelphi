unit Unitfrmbuscaexp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  Tfrmbuscaexp = class(TForm)
    exp: TEdit;
    BitBtn3: TBitBtn;
    con_exp: TZQuery;
    dataexp: TDataSource;
    procedure expKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbuscaexp: Tfrmbuscaexp;

implementation

uses unitfrmbecas, frmacces;



{$R *.dfm}

procedure Tfrmbuscaexp.expKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #8:;
      #13:begin
            BitBtn3Click(Sender);
          end;
 else
      key:=#0;
 end;
end;

procedure Tfrmbuscaexp.FormShow(Sender: TObject);
begin
  exp.Clear;
  exp.SetFocus;
end;

procedure Tfrmbuscaexp.BitBtn3Click(Sender: TObject);
begin
if  exp.Text<>'' then
begin
  con_exp.Close;
  con_exp.Params[0].asinteger:=strtoint(exp.Text);
  con_exp.Open;
  if con_exp.IsEmpty then
  begin
    application.MessageBox('Expediente no esta registrado en Sistema de Becas..!','Mensaje al Usuario',16);
  exp.Clear;
  exp.SetFocus;

  end
  else
  begin

      frmbecas.cod_pl.Text  :=con_exp.fieldbyname('cod_pl').AsString;
      frmbecas.npl.Text     :=con_exp.fieldbyname('plantel').AsString;
      frmbecas.exp.Text     :=con_exp.fieldbyname('exp').AsString;
      //***** ojo
      frmbecas.cb_mun.Text  :=con_exp.fieldbyname('municipio').AsString;
      frmbecas.zon.Text  :=con_exp.fieldbyname('zona').AsString;
      frmbecas.cod_mun.Text :=con_exp.fieldbyname('cod_mun').AsString;
      frmbecas.anb.Text  :=con_exp.fieldbyname('nombres').AsString;
      frmbecas.anb3.Text  :=con_exp.fieldbyname('nombres1').AsString;
      frmbecas.anb2.Text  :=con_exp.fieldbyname('apellidos').AsString;
      frmbecas.anb4.Text  :=con_exp.fieldbyname('apellidos1').AsString;
      if con_exp.fieldbyname('tced').AsString='V' then
            frmbecas.nv.Checked:=true
      else
            frmbecas.ne.Checked:=true;

      frmbecas.ci.Text   :=con_exp.fieldbyname('cedula').AsString;
      if con_exp.fieldbyname('sexo').AsString='F' then
         frmbecas.sf.Checked:=true
      else
         frmbecas.sm.Checked:=true;

      frmbecas.fnac.Date :=con_exp.fieldbyname('fechanac').AsDateTime;
      frmbecas.ed.Text   :=con_exp.fieldbyname('edad').AsString;

      if con_exp.fieldbyname('sector').AsString='URBANO' then
          frmbecas.urb.Checked:=true;
      if con_exp.fieldbyname('sector').AsString='RURAL' then
          frmbecas.rur.Checked:=true;
      if con_exp.fieldbyname('sector').AsString='INDIGENA' then
         frmbecas.ind.Checked:=true;
      if con_exp.fieldbyname('sector').AsString='FRONTERIZO' then
         frmbecas.fro.Checked:=true;
      if con_exp.fieldbyname('escc').AsString='A' then
         frmbecas.a.Checked:=true;
      if con_exp.fieldbyname('escc').AsString='B' then
         frmbecas.b.Checked:=true;
      if  con_exp.fieldbyname('escc').AsString='C' then
         frmbecas.c.Checked:=true;
      if con_exp.fieldbyname('escc').AsString='D-E' then
         frmbecas.de.Checked:=true;

      if con_exp.fieldbyname('numhab').AsString='DE 1 A 3'then
         frmbecas.ut.Checked:=true;
      if con_exp.fieldbyname('numhab').AsString='DE 4 A 6'then
         frmbecas.cs.Checked:=true;
      if con_exp.fieldbyname('numhab').AsString='DE 7 A 8'then
         frmbecas.so.Checked:=true;
      if con_exp.fieldbyname('numhab').AsString='MAS DE 8'then
         frmbecas.mdo.Checked:=true;

      if con_exp.fieldbyname('ingresofam').AsString='MENOS DE 450' then
         frmbecas.mcs.Checked:=true;
      if con_exp.fieldbyname('ingresofam').AsString='ENTRE 450 Y 650' then
         frmbecas.ecs.Checked:=true;
      if con_exp.fieldbyname('ingresofam').AsString='ENTRE 651 Y 850 ' then
         frmbecas.eso.Checked:=true;
      if con_exp.fieldbyname('ingresofam').AsString='ENTRE 851 Y 1000' then
         frmbecas.eom.Checked:=true;
      if con_exp.fieldbyname('ingresofam').AsString='MAS DE 1000' then
         frmbecas.mam.Checked:=true;

      if con_exp.fieldbyname('tenenciaviv').AsString='PROPIA' then
         frmbecas.pro.Checked:=true;
      if con_exp.fieldbyname('tenenciaviv').AsString='GRATUITA' then
         frmbecas.gra.Checked:=true;
      if con_exp.fieldbyname('tenenciaviv').AsString='OPCION COMPRA' then
         frmbecas.optc.Checked:=true;
      if con_exp.fieldbyname('tenenciaviv').AsString='ALQUILADA' then
         frmbecas.alq.Checked:=true;
      if con_exp.fieldbyname('tenenciaviv').AsString='OTRAS' then
         frmbecas.ota.Checked:=true;


      if con_exp.fieldbyname('tipovivienda').AsString='QUINTA' then
         frmbecas.qta.Checked:=true;
      if con_exp.fieldbyname('tipovivienda').AsString='CASA' then
         frmbecas.csa.Checked:=true;
      if con_exp.fieldbyname('tipovivienda').AsString='APARTAMENTO' then
         frmbecas.apt.Checked:=true;
      if con_exp.fieldbyname('tipovivienda').AsString='PENSION' then
         frmbecas.psi.Checked:=true;
      if con_exp.fieldbyname('tipovivienda').AsString='BARRACAS' then
         frmbecas.bar.Checked:=true;

      if con_exp.fieldbyname('estcur').AsString='PREESCOLAR' then
      begin
         frmbecas.ee.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='1' then
           frmbecas.ra.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='2' then
           frmbecas.ra1.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='3' then
           frmbecas.ra2.Checked:=true;
      end;
      if con_exp.fieldbyname('estcur').AsString='PRIMARIA' then
      begin
         frmbecas.ei.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='1' then
             frmbecas.rb.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='2' then
             frmbecas.rb2.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='3' then
             frmbecas.rb3.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='4' then
             frmbecas.rb4.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='5' then
             frmbecas.rb5.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='6' then
             frmbecas.rb6.Checked:=true;
      end;
      if con_exp.fieldbyname('estcur').AsString='BASICA' then
      begin
         frmbecas.eb1.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='7' then
             frmbecas.rc1.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='8' then
             frmbecas.rc2.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='9' then
             frmbecas.rc3.Checked:=true;
      end;
      if con_exp.fieldbyname('estcur').AsString='DIVERSIFICADA' then
      begin
         frmbecas.eb2.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='1' then
            frmbecas.rd1.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='2' then
            frmbecas.rd2.Checked:=true;
      end;
      if con_exp.fieldbyname('estcur').AsString='PROFESIONAL' then
      begin
         frmbecas.eb3.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='1' then
            frmbecas.re1.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='2' then
            frmbecas.re2.Checked:=true;
         if con_exp.fieldbyname('ren').AsString='3' then
            frmbecas.re3.Checked:=true;

      end;
      if con_exp.fieldbyname('estcur').AsString='ESPECIAL' then
      begin
         frmbecas.em.Checked:=true;
         frmbecas.rf1.Checked:=true;
      end;

      frmbecas.e1.Text    :=con_exp.fieldbyname('aes').AsString;
      if con_exp.fieldbyname('tdep').AsString='MUNICIPAL' then
         frmbecas.mu.Checked:=true;
      if con_exp.fieldbyname('tdep').AsString='ESTADAL' then
         frmbecas.es.Checked:=true;
      if con_exp.fieldbyname('tdep').AsString='NACIONAL' then
         frmbecas.na.Checked:=true;

      frmbecas.pvs.Text   :=con_exp.fieldbyname('pvs').AsString;
      frmbecas.npe.Text   :=con_exp.fieldbyname('npe').AsString;
      frmbecas.npe3.Text   :=con_exp.fieldbyname('npe1').AsString;
      frmbecas.npe2.Text   :=con_exp.fieldbyname('ape').AsString;
      frmbecas.npe4.Text   :=con_exp.fieldbyname('ape1').AsString;
      frmbecas.cid.Text   :=con_exp.fieldbyname('cid').AsString;
      frmbecas.cid.Enabled:=false;
      frmbecas.puo.Text   :=con_exp.fieldbyname('puo').AsString;
      frmbecas.ldt.Text   :=con_exp.fieldbyname('ldt').AsString;

      if con_exp.fieldbyname('sexau').AsString='F' then
         frmbecas.rauf.Checked:=true;
      if con_exp.fieldbyname('sexau').AsString='M' then
         frmbecas.raum.Checked:=true;
      if con_exp.fieldbyname('nacau').AsString='V' then
         frmbecas.rauv.Checked:=true;
      if con_exp.fieldbyname('sexau').AsString='E' then
         frmbecas.raue.Checked:=true;

      frmbecas.telau.Text  :=con_exp.fieldbyname('teleau').AsString;

      frmbecas.cgo.Text   :=con_exp.fieldbyname('cgo').AsString;
      frmbecas.obs.Text   :=con_exp.fieldbyname('obs').AsString;
      frmbecas.dha.Text   :=con_exp.fieldbyname('dha').AsString;

      frmbecas.cei.Text   :=con_exp.fieldbyname('cimad').AsString;
      frmbecas.ape.Text   :=con_exp.fieldbyname('nmad').AsString;
      frmbecas.ltra.Text  :=con_exp.fieldbyname('ltmad').AsString;
      frmbecas.dhab.Text  :=con_exp.fieldbyname('dhmad').AsString;
      frmbecas.ofi.Text   :=con_exp.fieldbyname('omad').AsString;
      frmbecas.inm.Text   :=con_exp.fieldbyname('inmad').AsString;
      frmbecas.tlf.Text   :=con_exp.fieldbyname('telmad').AsString;

      frmbecas.cide.Text  :=con_exp.fieldbyname('ceipad').AsString;
      frmbecas.apell.Text :=con_exp.fieldbyname('npad').AsString;
      frmbecas.lut.Text   :=con_exp.fieldbyname('ltpad').AsString;
      frmbecas.habi.Text  :=con_exp.fieldbyname('dhpad').AsString;
      frmbecas.ocu.Text   :=con_exp.fieldbyname('opad').AsString;
      frmbecas.ing.Text   :=con_exp.fieldbyname('inpad').AsString;
      frmbecas.tel.Text   :=con_exp.fieldbyname('telpad').AsString;

      frmbecas.ciden.Text :=con_exp.fieldbyname('cgc').AsString;
      frmbecas.apn.Text   :=con_exp.fieldbyname('ngc').AsString;
      frmbecas.lutra.Text :=con_exp.fieldbyname('ltgc').AsString;
      frmbecas.dirh.Text  :=con_exp.fieldbyname('dhgc').AsString;
      frmbecas.ocup.Text  :=con_exp.fieldbyname('ogc').AsString;
      frmbecas.ingre.Text :=con_exp.fieldbyname('ingc').AsString;
      frmbecas.tlfn.Text  :=con_exp.fieldbyname('telgc').AsString;

      frmbecas.cb_usu.Text:=con_exp.fieldbyname('funre').AsString;
      frmbecas.bt_aceptar.Visible:=false;
      close;

  end;
end
else
begin
 frmbecas.bt_aceptar.Visible:=true;
 close;
end;
end;

end.
