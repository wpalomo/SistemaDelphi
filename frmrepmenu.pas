unit frmrepmenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppParameter, daDataModule, ppModule, raCodMod, ppBands, ppVar,
  ppCtrls, jpeg, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, DB, ZAbstractRODataset, ZDataset, StdCtrls,
  Buttons, myChkBox, ppStrtch, ppMemo;

type
  Tfrmrepmen = class(TForm)
    BitBtn1: TBitBtn;
    bt_salir: TBitBtn;
    con_menu: TZReadOnlyQuery;
    datamenu: TDataSource;
    ppmenu: TppDBPipeline;
    pprepmenu: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape19: TppShape;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppShape8: TppShape;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine6: TppLine;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppParameterList1: TppParameterList;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBMemo1: TppDBMemo;
    myDBCheckBox1: TmyDBCheckBox;
    myDBCheckBox2: TmyDBCheckBox;
    myDBCheckBox3: TmyDBCheckBox;
    myDBCheckBox4: TmyDBCheckBox;
    myDBCheckBox5: TmyDBCheckBox;
    myDBCheckBox6: TmyDBCheckBox;
    myDBCheckBox7: TmyDBCheckBox;
    myDBCheckBox8: TmyDBCheckBox;
    num: TppVariable;
    raCodeModule1: TraCodeModule;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLine3: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine4: TppLine;
    ppShape1: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    procedure bt_salirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrepmen: Tfrmrepmen;

implementation

{$R *.dfm}

procedure Tfrmrepmen.bt_salirClick(Sender: TObject);
begin
con_menu.Close;
close;
end;

procedure Tfrmrepmen.BitBtn1Click(Sender: TObject);
begin
  con_menu.Close;
  con_menu.Open;
  pprepmenu.Print;
end;

end.
