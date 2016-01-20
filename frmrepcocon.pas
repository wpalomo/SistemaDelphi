unit frmrepcocon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ppBands, ppCtrls, ppVar, jpeg, ppPrnabl,
  ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppModule, raCodMod, ppParameter;

type
  Tfrmrepcomcon = class(TForm)
    Label1: TLabel;
    fecha1: TDateTimePicker;
    Label2: TLabel;
    fecha2: TDateTimePicker;
    BitBtn1: TBitBtn;
    bt_salir: TBitBtn;
    ppconso: TppDBPipeline;
    pprepconso: TppReport;
    dataconso: TDataSource;
    con_conso: TZQuery;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    m1: TppVariable;
    m2: TppVariable;
    m3: TppVariable;
    m4: TppVariable;
    imp1: TppVariable;
    imp2: TppVariable;
    imp3: TppVariable;
    imp4: TppVariable;
    imp5: TppVariable;
    m5: TppVariable;
    ppFooterBand1: TppFooterBand;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    t2: TppLabel;
    t3: TppLabel;
    t4: TppLabel;
    t5: TppLabel;
    raCodeModule1: TraCodeModule;
    t1: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel22: TppLabel;
    ppdesde: TppLabel;
    ppLabel23: TppLabel;
    pphasta: TppLabel;
    ck_g: TRadioButton;
    ck_s: TRadioButton;
    GroupBox1: TGroupBox;
    ppLabel5: TppLabel;
    tt: TppLabel;
    ppLabel17: TppLabel;
    procedure bt_salirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ppLabel7Print(Sender: TObject);
    procedure ppLabel22Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrepcomcon: Tfrmrepcomcon;

implementation

{$R *.dfm}

procedure Tfrmrepcomcon.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmrepcomcon.FormShow(Sender: TObject);
begin
   fecha1.Date:=date;
   fecha2.Date:=date;
   ck_s.Checked:=true;
end;

procedure Tfrmrepcomcon.BitBtn1Click(Sender: TObject);
begin
if ck_s.Checked then
begin
   con_conso.Close;
   con_conso.SQL.Text:='select cod_proy, nom_proy, sum(totaloc),sum(totalimp) from oc where anulada<>"N" and (fec_del= :fec1 AND fec_al=:fec2)group by cod_proy order by nom_proy';
   con_conso.Params[0].AsDate:=fecha1.Date;
   con_conso.Params[1].AsDate:=fecha2.Date;
   con_conso.Open;
   if not  con_conso.IsEmpty then
      pprepconso.Print;
end
else
begin
  if ck_g.Checked then
  begin
   con_conso.Close;
   con_conso.SQL.Text:='select cod_proy, nom_proy, sum(totaloc),sum(totalimp) from oc where anulada="N" and (fec_ela BETWEEN :fec1 AND :fec2)group by cod_proy order by nom_proy';
   con_conso.Params[0].AsDate:=fecha1.Date;
   con_conso.Params[1].AsDate:=fecha2.Date;
   con_conso.Open;
   if not  con_conso.IsEmpty then
      pprepconso.Print;
  end;
end;
end;

procedure Tfrmrepcomcon.ppLabel7Print(Sender: TObject);
begin
   t1.Caption:=formatfloat('#,##0.00',m1.value);
   t2.Caption:=formatfloat('#,##0.00',m2.value);
   t3.Caption:=formatfloat('#,##0.00',m3.value);
   t4.Caption:=formatfloat('#,##0.00',m4.value);
   t5.Caption:=formatfloat('#,##0.00',m5.value);
   tt.Caption:=formatfloat('#,##0.00',(m1.value+m2.value+m3.value+m4.value+m5.value));


end;

procedure Tfrmrepcomcon.ppLabel22Print(Sender: TObject);
begin
     ppdesde.Caption:=datetostr(fecha1.date);
  pphasta.Caption:=datetostr(fecha2.Date);
end;

end.
