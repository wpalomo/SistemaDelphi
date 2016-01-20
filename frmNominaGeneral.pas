unit frmNominaGeneral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppModule, raCodMod, ppBands, ppCtrls, ppClass, jpeg,
  ppPrnabl, ppCache, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ppDBPipe, ppParameter, ppComm, ppRelatv, ppProd, ppReport, ppVar,
  StdCtrls;

type
  TfrmNominaGeneral = class(TForm)
    pprep: TppReport;
    ppParameterList1: TppParameterList;
    ppDBPipeline1: TppDBPipeline;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppImage2: TppImage;
    ppImage1: TppImage;
    ppLabel11: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel12: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape14: TppShape;
    ppShape11: TppShape;
    ppShape5: TppShape;
    ppShape4: TppShape;
    ppShape3: TppShape;
    ppShape2: TppShape;
    ppShape1: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape13: TppShape;
    ppShape12: TppShape;
    ppShape10: TppShape;
    ppShape9: TppShape;
    ppShape8: TppShape;
    ppShape7: TppShape;
    ppShape6: TppShape;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape15: TppShape;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    raCodeModule1: TraCodeModule;
    cmdVisualizarReporte: TButton;
    ppSystemVariable2: TppSystemVariable;
    procedure cmdVisualizarReporteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  objfrmNominaGeneral: TfrmNominaGeneral;

implementation

uses frmacces;

{$R *.dfm}

procedure TfrmNominaGeneral.cmdVisualizarReporteClick(Sender: TObject);
begin
  pprep.Print;
end;

end.
