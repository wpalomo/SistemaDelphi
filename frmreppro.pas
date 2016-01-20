unit frmreppro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppVar, ppDB, ppDBPipe, ppModule, daDataModule, ppBands, ppCtrls,
  jpeg, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, DB,
  ZAbstractRODataset, ZDataset, StdCtrls, Buttons, raCodMod, ppParameter;

type
  Tfrmrepro = class(TForm)
    bt_salir: TBitBtn;
    BitBtn1: TBitBtn;
    datapro: TDataSource;
    con_pro: TZReadOnlyQuery;
    pprepro: TppReport;
    pppro: TppDBPipeline;
    ppParameterList1: TppParameterList;
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
    ppDetailBand1: TppDetailBand;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    pptipo: TppLabel;
    ppnum: TppVariable;
    pptipop: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    daDataModule1: TdaDataModule;
    raCodeModule1: TraCodeModule;
    con_proid: TIntegerField;
    con_pronom: TStringField;
    con_prorif: TStringField;
    con_proced: TIntegerField;
    con_pronac: TStringField;
    con_protpro: TIntegerField;
    con_prodir: TStringField;
    con_prociu: TStringField;
    con_protel: TStringField;
    con_prorcz: TStringField;
    con_prorpocei: TStringField;
    con_procod_banco: TStringField;
    con_probanco: TStringField;
    con_protcb: TStringField;
    con_procpo: TIntegerField;
    con_prorleg: TStringField;
    con_procel: TStringField;
    con_proimp: TStringField;
    con_proimpx100: TFloatField;
    con_propzo_ent: TIntegerField;
    ppLabel4: TppLabel;
    ppLine7: TppLine;
    ppDBText1: TppDBText;
    ppLabel5: TppLabel;
    ppLine8: TppLine;
    ppDBText2: TppDBText;
    ppLine9: TppLine;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    procedure bt_salirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ppproDataChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

      { Public declarations }
  end;

var
  frmrepro: Tfrmrepro;

implementation

{$R *.dfm}

procedure Tfrmrepro.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmrepro.BitBtn1Click(Sender: TObject);
begin
  pprepro.Print;
end;

procedure Tfrmrepro.ppproDataChange(Sender: TObject);
begin
  if pptipop.Text='1' then
   pptipo.Text:='COOPERATIVA'
  else
   pptipo.Text:='COMPAÑIA';
end;

procedure Tfrmrepro.FormShow(Sender: TObject);
begin
   con_pro.Close;
   con_pro.Open;
end;

end.
