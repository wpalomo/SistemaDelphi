unit frmlistaxtipomov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, StdCtrls, Buttons, ppStrtch, ppMemo, ppBands, ppCtrls,
  ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDBPipe, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ComCtrls,
  jpeg, ppModule, raCodMod;

type
  Tfrmlisxtm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    ctm: TComboBox;
    con_em: TZQuery;
    dataem: TDataSource;
    ppdataem: TppDBPipeline;
    pplista: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine4: TppLine;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLine6: TppLine;
    ppLine9: TppLine;
    ppLabel28: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    bt_salir: TBitBtn;
    BitBtn1: TBitBtn;
    ppDBText8: TppDBText;
    ppDBText4: TppDBText;
    ppShape12: TppShape;
    ppShape11: TppShape;
    ppShape10: TppShape;
    ppShape9: TppShape;
    ppShape8: TppShape;
    ppLabel10: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel29: TppLabel;
    ppLabel11: TppLabel;
    ppLabel9: TppLabel;
    ppShape7: TppShape;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppMemo1: TppMemo;
    pplista2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape13: TppShape;
    ppImage3: TppImage;
    ppImage4: TppImage;
    ppLabel12: TppLabel;
    ppLabel25: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppDBText3: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable5: TppSystemVariable;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLine1: TppLine;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLine3: TppLine;
    ppLine8: TppLine;
    ppLabel54: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppMemo2: TppMemo;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppdataem2: TppDBPipeline;
    con_emp2: TZQuery;
    dataem2: TDataSource;
    ppLabel20: TppLabel;
    ppLine5: TppLine;
    ppLine7: TppLine;
    ppVariable1: TppVariable;
    raCodeModule1: TraCodeModule;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppLabel21: TppLabel;
    ppVariable2: TppVariable;
    raCodeModule2: TraCodeModule;
    con_tit: TZQuery;
    datatit: TDataSource;
    repreltit: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppShape27: TppShape;
    ppImage5: TppImage;
    ppImage6: TppImage;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppShape28: TppShape;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppShape32: TppShape;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLine2: TppLine;
    ppDetailBand3: TppDetailBand;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppShape37: TppShape;
    ppShape38: TppShape;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLine10: TppLine;
    ppVariable3: TppVariable;
    ppFooterBand3: TppFooterBand;
    ppSystemVariable8: TppSystemVariable;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLine11: TppLine;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel72: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppMemo3: TppMemo;
    raCodeModule3: TraCodeModule;
    ppDBPipeline1: TppDBPipeline;
    ppDBMemo1: TppDBMemo;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBText16: TppDBText;
    ppDBText19: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    procedure bt_salirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pplistaBeforePrint(Sender: TObject);
    procedure pplistaAfterPrint(Sender: TObject);
    procedure pplista2BeforePrint(Sender: TObject);
    procedure pplista2AfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlisxtm: Tfrmlisxtm;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmlisxtm.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmlisxtm.BitBtn1Click(Sender: TObject);
begin
if ctm.Text='TITULARIDAD' then
begin
    con_tit.Close;
    con_tit.Params[0].AsDate:=fecha1.Date;
    con_tit.Params[1].AsDate:=fecha2.Date;
    con_tit.Open;
    repreltit.Print;

end
else
begin

    if  (ctm.Text='EGRESOS') or (ctm.Text='LIBERACION DE CARGO')  then
    begin
        con_emp2.Close;
        con_emp2.Params[0].AsDate:=fecha1.Date;
        con_emp2.Params[1].AsDate:=fecha2.Date;
        con_emp2.Params[2].AsString:=ctm.Text;
        con_emp2.Open;
        pplista2.Print

    end
    else
    begin
        con_em.Close;
        con_em.Params[0].AsDate:=fecha1.Date;
        con_em.Params[1].AsDate:=fecha2.Date;
        con_em.Params[2].AsString:=ctm.Text;
        con_em.Open;
        pplista.Print;
    end;
end;
end;

procedure Tfrmlisxtm.FormShow(Sender: TObject);
begin
fecha1.Date:=date;
fecha2.Date:=date;

end;

procedure Tfrmlisxtm.pplistaBeforePrint(Sender: TObject);
begin
  ppdbtext16.Visible:=false;
end;

procedure Tfrmlisxtm.pplistaAfterPrint(Sender: TObject);
begin
        ppdbtext16.Visible:=true;
end;

procedure Tfrmlisxtm.pplista2BeforePrint(Sender: TObject);
begin
        ppdbtext19.Visible:=false;
end;

procedure Tfrmlisxtm.pplista2AfterPrint(Sender: TObject);
begin
ppdbtext19.Visible:=true;
end;

end.
