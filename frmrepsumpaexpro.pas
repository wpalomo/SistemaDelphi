unit frmrepsumpaexpro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner, ppDB, ppDBPipe,
  ppParameter, daDataModule, ppModule, raCodMod, ppBands, ppClass, ppCtrls,
  ppVar, jpeg, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, DB,
  ZAbstractRODataset, ZDataset, StdCtrls, Buttons, ComCtrls;

type
  Tfrmsumxp = class(TForm)
    GroupBox6: TGroupBox;
    fec1: TDateTimePicker;
    GroupBox7: TGroupBox;
    fec2: TDateTimePicker;
    bt_salir: TBitBtn;
    bt_imp: TBitBtn;
    con_sumxp: TZReadOnlyQuery;
    datasumxp: TDataSource;
    pprepocsxp: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
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
    pptotalprov: TppVariable;
    ppFooterBand1: TppFooterBand;
    ppShape11: TppShape;
    ppLabel44: TppLabel;
    pptxp: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape2: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText15: TppDBText;
    ppDBText14: TppDBText;
    ppDBText13: TppDBText;
    ppDBText11: TppDBText;
    ppDBText10: TppDBText;
    ppShape8: TppShape;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel36: TppLabel;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    daDataModule1: TdaDataModule;
    ppParameterList1: TppParameterList;
    ppsumxp: TppDBPipeline;
    gp: TdxDBGrid;
    con_prov: TZReadOnlyQuery;
    dataprov: TDataSource;
    gpid: TdxDBGridMaskColumn;
    gpnom: TdxDBGridMaskColumn;
    ppfec1: TppLabel;
    ppfec2: TppLabel;
    procedure bt_salirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_impClick(Sender: TObject);
    procedure ppLabel44Print(Sender: TObject);
  private

    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmsumxp: Tfrmsumxp;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmsumxp.bt_salirClick(Sender: TObject);
begin
con_prov.Close;
con_sumxp.close;
close;
end;

procedure Tfrmsumxp.FormShow(Sender: TObject);
begin
   fec1.Date:=date;
   fec2.Date:=date;
   con_prov.Close;
   con_prov.Open;
end;

procedure Tfrmsumxp.bt_impClick(Sender: TObject);
begin
 con_sumxp.Close;
 con_sumxp.Params[0].Asinteger:=con_prov.fieldbyname('id').AsInteger;
 con_sumxp.Params[1].AsDate:=fec1.Date;
 con_sumxp.Params[2].AsDate:=fec2.Date;
 con_sumxp.Open;
    ppfec1.Caption :=datetostr(fec1.Date);
    ppfec2.Caption :=datetostr(fec2.Date);
    pprepocsxp.Print;
end;

procedure Tfrmsumxp.ppLabel44Print(Sender: TObject);
begin
  pptxp.Caption:=formatfloat('#,##0.00',pptotalprov.Value);
end;

end.
