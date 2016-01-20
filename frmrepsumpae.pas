unit frmrepsumpae;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ppParameter, daDataModule,
  ppModule, raCodMod, ppBands, ppClass, ppRichTx, ppStrtch, ppMemo, ppVar,
  ppCtrls, myChkBox, jpeg, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, DB, ZAbstractRODataset, ZDataset, ppDB, ppDBPipe;

type
  Tfrmspae = class(TForm)
    GroupBox6: TGroupBox;
    fec1: TDateTimePicker;
    GroupBox7: TGroupBox;
    fec2: TDateTimePicker;
    bt_salir: TBitBtn;
    bt_imp: TBitBtn;
    con_sumgen: TZReadOnlyQuery;
    datasumgen: TDataSource;
    pprepocsg: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppShape8: TppShape;
    ppShape2: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppDBText15: TppDBText;
    ppDBText14: TppDBText;
    ppDBText13: TppDBText;
    ppDBText11: TppDBText;
    ppDBText10: TppDBText;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppDetailBand1: TppDetailBand;
    ppShape9: TppShape;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLine14: TppLine;
    ppren: TppVariable;
    ppFooterBand1: TppFooterBand;
    ppShape11: TppShape;
    ppLabel44: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    daDataModule1: TdaDataModule;
    ppParameterList1: TppParameterList;
    ppsumg: TppDBPipeline;
    ppLabel36: TppLabel;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    pptotalprov: TppVariable;
    pptxp: TppLabel;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppfec1: TppLabel;
    ppfec2: TppLabel;
    ppLabel5: TppLabel;
    pptp: TppLabel;
    ppvtp: TppVariable;
    procedure bt_salirClick(Sender: TObject);
    procedure bt_impClick(Sender: TObject);
    procedure ppLabel44Print(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ppLabel5Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmspae: Tfrmspae;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmspae.bt_salirClick(Sender: TObject);
begin
con_sumgen.Close;
close;
end;

procedure Tfrmspae.bt_impClick(Sender: TObject);
begin
 con_sumgen.Close;
 con_sumgen.Params[0].AsDate:=fec1.Date;
 con_sumgen.Params[1].AsDate:=fec2.Date;
 con_sumgen.Open;
    ppfec1.Caption:=datetostr(fec1.Date);
    ppfec2.Caption:=datetostr(fec2.Date);
    pprepocsg.Print;
end;

procedure Tfrmspae.ppLabel44Print(Sender: TObject);
begin
pptxp.Caption:=formatfloat('#,##0.00',pptotalprov.Value);
end;

procedure Tfrmspae.FormShow(Sender: TObject);
begin
   fec1.Date:=date;
   fec2.Date:=date;
end;

procedure Tfrmspae.ppLabel5Print(Sender: TObject);
begin
  pptp.Caption:=formatfloat('#,##0.00',ppvtp.Value);
end;

end.
