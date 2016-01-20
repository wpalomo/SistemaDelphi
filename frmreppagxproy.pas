unit frmreppagxproy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ppParameter,
  ppModule, raCodMod, ppBands, ppVar, ppCtrls, jpeg, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, StdCtrls,
  Buttons, ComCtrls;

type
  Tfrmreppagxproye = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    BitBtn1: TBitBtn;
    bt_salir: TBitBtn;
    ppconso: TppDBPipeline;
    pprepconso: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape3: TppShape;
    ppImage1: TppImage;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel22: TppLabel;
    ppdesde: TppLabel;
    ppLabel23: TppLabel;
    pphasta: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape1: TppShape;
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
    ppShape2: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    t2: TppLabel;
    t3: TppLabel;
    t4: TppLabel;
    t5: TppLabel;
    t1: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    raCodeModule1: TraCodeModule;
    ppParameterList1: TppParameterList;
    dataconso: TDataSource;
    con_conso: TZQuery;
    ck_s: TRadioButton;
    ck_g: TRadioButton;
    con_chedet: TZQuery;
    datachedet: TDataSource;
    pprepordet: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppImage2: TppImage;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    v1: TppVariable;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel15: TppLabel;
    ppDBText7: TppDBText;
    ppLabel16: TppLabel;
    ppDBText8: TppDBText;
    raCodeModule2: TraCodeModule;
    ppLabel24: TppLabel;
    v2: TppVariable;
    pptg: TppLabel;
    ck_d: TRadioButton;
    GroupBox1: TGroupBox;
    ppDBText6: TppDBText;
    ppLabel25: TppLabel;
    tt: TppLabel;
    ppLabel26: TppLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure ppLabel7Print(Sender: TObject);
    procedure ppLabel22Print(Sender: TObject);
    procedure ppLabel24Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmreppagxproye: Tfrmreppagxproye;

implementation

{$R *.dfm}

procedure Tfrmreppagxproye.FormShow(Sender: TObject);
begin
   fecha1.Date:=date;
   fecha2.Date:=date;
   ck_s.Checked;
end;

procedure Tfrmreppagxproye.BitBtn1Click(Sender: TObject);
begin

if ck_s.Checked then
begin
   con_conso.Close;
   con_conso.SQL.Text:='select cod_proy, nom_proy, sum(totaloc) from oc where pagada="S" and anulada="N" and (fec_del=:fec1 AND fec_al=:fec2) group by cod_proy order by nom_proy';
   con_conso.Params[0].AsDate:=fecha1.Date;
   con_conso.Params[1].AsDate:=fecha2.Date;
   con_conso.Open;
   pprepconso.Print;
end
else
begin
if ck_g.Checked then
begin
   con_conso.Close;
   con_conso.SQL.Text:='select cod_proy, nom_proy, sum(totaloc) from oc where pagada="S" and anulada="N" and (fec_ela between :fec1 AND :fec2) group by cod_proy order by nom_proy';
   con_conso.Params[0].AsDate:=fecha1.Date;
   con_conso.Params[1].AsDate:=fecha2.Date;
   con_conso.Open;
   pprepconso.Print;
end
else
if ck_d.Checked then
begin
  con_chedet.Close;
  con_chedet.Params[0].AsDate:=fecha1.Date;
  con_chedet.Params[1].AsDate:=fecha2.Date;
  con_chedet.Open;
  pprepordet.Print;
end;
end;
end;

procedure Tfrmreppagxproye.bt_salirClick(Sender: TObject);
begin
con_conso.Close;
con_chedet.Close;
close;
end;

procedure Tfrmreppagxproye.ppLabel7Print(Sender: TObject);
begin
   t1.Caption:=formatfloat('#,##0.00',m1.value);
   t2.Caption:=formatfloat('#,##0.00',m2.value);
   t3.Caption:=formatfloat('#,##0.00',m3.value);
   t4.Caption:=formatfloat('#,##0.00',m4.value);
   t5.Caption:=formatfloat('#,##0.00',m5.value);
   tt.Caption:=formatfloat('#,##0.00',(m1.value+m2.value+m3.value+m4.value+m5.value));
end;

procedure Tfrmreppagxproye.ppLabel22Print(Sender: TObject);
begin
  ppdesde.Caption:=datetostr(fecha1.date);
  pphasta.Caption:=datetostr(fecha2.Date);
end;

procedure Tfrmreppagxproye.ppLabel24Print(Sender: TObject);
begin
pptg.Text:=formatfloat('#,##0.00',v2.value);
end;

end.
