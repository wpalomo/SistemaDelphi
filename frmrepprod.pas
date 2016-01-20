unit frmrepprod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ppDB, ppDBPipe, ppParameter, daDataModule, ppModule,
  raCodMod, ppBands, ppVar, ppCtrls, jpeg, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, ZAbstractRODataset, ZDataset,
  StdCtrls, Buttons;

type
  Tfrmreprod = class(TForm)
    bt_salir: TBitBtn;
    BitBtn1: TBitBtn;
    dataprod: TDataSource;
    con_prod: TZReadOnlyQuery;
    ppreprod: TppReport;
    ppParameterList1: TppParameterList;
    ppprod: TppDBPipeline;
    con_prodid: TIntegerField;
    con_prodnom: TStringField;
    con_prodtipoprod: TIntegerField;
    con_produnidad: TIntegerField;
    con_prodcal: TFloatField;
    con_prodpro: TFloatField;
    con_prodgra: TFloatField;
    con_prodfac: TFloatField;
    con_prodval_base: TFloatField;
    con_prodprecio: TFloatField;
    con_prodimp: TStringField;
    con_prodid_1: TIntegerField;
    con_prodnom_1: TStringField;
    con_prodid_2: TIntegerField;
    con_prodnom_2: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppShape19: TppShape;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppShape8: TppShape;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel4: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel5: TppLabel;
    ppLine9: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine10: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppnum: TppVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    raCodeModule1: TraCodeModule;
    daDataModule1: TdaDataModule;
    procedure bt_salirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmreprod: Tfrmreprod;

implementation

{$R *.dfm}

procedure Tfrmreprod.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmreprod.BitBtn1Click(Sender: TObject);
begin
   ppreprod.Print;
end;

procedure Tfrmreprod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
con_prod.Close;
end;

procedure Tfrmreprod.FormShow(Sender: TObject);
begin
 con_prod.Close;
 con_prod.Open;
end;

end.
