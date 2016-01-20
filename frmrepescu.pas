unit frmrepescu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZDataset, ppDB, ppDBPipe, ppParameter,
  ppBands, ppCtrls, ppStrtch, ppMemo, myChkBox, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, StdCtrls, ComCtrls, Buttons,
  ZAbstractDataset, DBCtrls, daDataModule, ppModule, raCodMod, ppVar, jpeg;

type
  Tfrmrepesc = class(TForm)
    Label3: TLabel;
    bt_salir: TBitBtn;
    BitBtn1: TBitBtn;
    dataepxm: TDataSource;
    con_ocxmun: TZReadOnlyQuery;
    cb_nomun: TDBComboBox;
    con_mun: TZQuery;
    datamun: TDataSource;
    pprepxmun: TppReport;
    ppParameterList1: TppParameterList;
    pppro: TppDBPipeline;
    numm: TListBox;
    ppHeaderBand1: TppHeaderBand;
    ppShape19: TppShape;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel4: TppLabel;
    ppmun: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText24: TppDBText;
    ppnum: TppVariable;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape8: TppShape;
    ppLine2: TppLine;
    ppLabel38: TppLabel;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel37: TppLabel;
    ppLine6: TppLine;
    ppLabel41: TppLabel;
    ppLine5: TppLine;
    ppLabel42: TppLabel;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine3: TppLine;
    raCodeModule1: TraCodeModule;
    daDataModule1: TdaDataModule;
    ppLine4: TppLine;
    ppLabel7: TppLabel;
    ppDBText2: TppDBText;
    ppLabel8: TppLabel;
    ppVariable1: TppVariable;
    ppLabel9: TppLabel;
    ppVariable2: TppVariable;
    ppLabel10: TppLabel;
    ppVariable3: TppVariable;
    ppLabel11: TppLabel;
    ppVariable4: TppVariable;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure cb_nomunChange(Sender: TObject);
    procedure ppmunPrint(Sender: TObject);
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
    procedure ppGroupFooterBand1AfterPrint(Sender: TObject);
    procedure pprepxmunStartPage(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrepesc: Tfrmrepesc;

implementation

{$R *.dfm}

procedure Tfrmrepesc.FormShow(Sender: TObject);
begin
   cb_nomun.Clear;
   numm.Clear;
   con_mun.Close;
   con_mun.Open;
   con_mun.FindFirst;
   while not con_mun.Eof do
   begin
     cb_nomun.Items.Append(con_mun.fieldbyname('nombre').AsString);
     numm.Items.Append(con_mun.fieldbyname('cod').AsString);
     con_mun.Next;
   end;
     cb_nomun.ItemIndex:=0;
     numm.ItemIndex:=0;
end;

procedure Tfrmrepesc.BitBtn1Click(Sender: TObject);
begin

   con_ocxmun.Close;
   con_ocxmun.Params[0].Asinteger:=strtoint(numm.Items.Strings[cb_nomun.itemindex]);
   con_ocxmun.Open;
   ppmun.Text:=cb_nomun.Text;
   pprepxmun.Print;
end;

procedure Tfrmrepesc.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmrepesc.cb_nomunChange(Sender: TObject);
begin
  numm.ItemIndex:=cb_nomun.ItemIndex;
end;

procedure Tfrmrepesc.ppmunPrint(Sender: TObject);
begin
ppmun.Text:=cb_nomun.Text;
end;

procedure Tfrmrepesc.ppVariable1Calc(Sender: TObject; var Value: Variant);
begin
    ppvariable1.Value:=ppvariable1.Value+1;
end;

procedure Tfrmrepesc.ppGroupFooterBand1AfterPrint(Sender: TObject);
begin
ppvariable1.Value:=0;
ppvariable2.Value:=0;
end;

procedure Tfrmrepesc.pprepxmunStartPage(Sender: TObject);
begin
ppvariable1.Value:=0;
ppvariable2.Value:=0;
end;

end.
