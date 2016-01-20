unit repocmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppDBPipe, ppParameter, raCodMod, ppModule, daDataModule,
  ppBands, ppCtrls, ppClass, ppVar, jpeg, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, ZAbstractDataset, ZDataset, DB,
  ZAbstractRODataset, StdCtrls, DBCtrls, Buttons, ComCtrls;

type
  Tfrmocxmunp = class(TForm)
    Label3: TLabel;
    bt_salir: TBitBtn;
    BitBtn1: TBitBtn;
    cb_nomun: TDBComboBox;
    numm: TListBox;
    dataocxmp: TDataSource;
    con_mun: TZQuery;
    datamun: TDataSource;
    pprepxmun: TppReport;
    ppParameterList1: TppParameterList;
    pppro: TppDBPipeline;
    con_ocxmp: TZQuery;
    con_ocxmpid: TFloatField;
    con_ocxmpfec_ela: TDateField;
    con_ocxmpanno: TIntegerField;
    con_ocxmporg: TIntegerField;
    con_ocxmpuad: TStringField;
    con_ocxmpuej: TStringField;
    con_ocxmpubi: TStringField;
    con_ocxmpmun: TStringField;
    con_ocxmplent: TStringField;
    con_ocxmpseg: TStringField;
    con_ocxmppen: TIntegerField;
    con_ocxmpfpag: TStringField;
    con_ocxmpcoc: TStringField;
    con_ocxmpest: TStringField;
    con_ocxmpcod_prov: TIntegerField;
    con_ocxmpsemana: TIntegerField;
    con_ocxmpcod_proy: TIntegerField;
    con_ocxmpcod_esc: TIntegerField;
    con_ocxmpfec_del: TDateField;
    con_ocxmpfec_al: TDateField;
    con_ocxmpent: TIntegerField;
    con_ocxmptel_prov: TStringField;
    con_ocxmpnom_prov: TStringField;
    con_ocxmpdir_prov: TStringField;
    con_ocxmprif_prov: TStringField;
    con_ocxmpcpostal_prov: TIntegerField;
    con_ocxmpnom_esc: TStringField;
    con_ocxmpdir_esc: TStringField;
    con_ocxmppent_esc: TStringField;
    con_ocxmpobs: TStringField;
    con_ocxmptotaloc: TFloatField;
    con_ocxmptotalimp: TFloatField;
    con_ocxmpnom_proy: TStringField;
    con_ocxmpmat_esc: TIntegerField;
    con_ocxmpfecoc: TDateField;
    con_ocxmpusuario: TStringField;
    con_ocxmpanulada: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppShape19: TppShape;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel4: TppLabel;
    ppmun: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText24: TppDBText;
    ppnum: TppVariable;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel10: TppLabel;
    ppDBText6: TppDBText;
    ppDBText21: TppDBText;
    ppm: TppDBText;
    ppi: TppDBText;
    nula: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppVariable1: TppVariable;
    ppVariable2: TppVariable;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    pptnula: TppVariable;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    pptnula1: TppVariable;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    pptotocag: TppVariable;
    pptotocag1: TppVariable;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    pptotocig: TppVariable;
    pptotocig1: TppVariable;
    ppLine11: TppLine;
    ppLine12: TppLine;
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
    ppLine4: TppLine;
    ppLabel7: TppLabel;
    ppLabel11: TppLabel;
    ppLine7: TppLine;
    ppLabel8: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLabel9: TppLabel;
    ppLine10: TppLine;
    ppLabel12: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine3: TppLine;
    ppnnula: TppVariable;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppnnula1: TppVariable;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    pptotoca: TppVariable;
    pptotoca1: TppVariable;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    pptotocina: TppVariable;
    pptotocia: TppVariable;
    totoc: TppVariable;
    totimp: TppVariable;
    raCodeModule1: TraCodeModule;
    fec1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    fec2: TDateTimePicker;
    procedure bt_salirClick(Sender: TObject);
    procedure cb_nomunChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppmunPrint(Sender: TObject);
    procedure pprepxmunStartPage(Sender: TObject);
    procedure ppGroupFooterBand1AfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmocxmunp: Tfrmocxmunp;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmocxmunp.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmocxmunp.cb_nomunChange(Sender: TObject);
begin
  numm.ItemIndex:=cb_nomun.ItemIndex;
end;

procedure Tfrmocxmunp.FormShow(Sender: TObject);
begin
 fec1.Date:=date;
 fec2.Date:=date;
 
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

procedure Tfrmocxmunp.BitBtn1Click(Sender: TObject);
begin
con_ocxmp.Close;
con_ocxmp.Params[0].AsString:=cb_nomun.Text;
con_ocxmp.Params[1].AsDate:=fec1.Date;
con_ocxmp.Params[2].AsDate:=fec2.Date;
con_ocxmp.Open;
pprepxmun.Print;
end;

procedure Tfrmocxmunp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
con_ocxmp.Close;
end;

procedure Tfrmocxmunp.ppmunPrint(Sender: TObject);
begin
ppmun.Text:=cb_nomun.Text;
end;

procedure Tfrmocxmunp.pprepxmunStartPage(Sender: TObject);
begin
ppnnula.Value:=0;
ppnnula1.value:=0;
totoc.Value:=0;
totimp.Value:=0;
pptotoca.Value:=0;
pptotoca1.Value:=0;
pptotocia.Value:=0;
pptotocina.Value:=0;
end;

procedure Tfrmocxmunp.ppGroupFooterBand1AfterPrint(Sender: TObject);
begin
ppnnula.Value:=0;
ppnnula1.value:=0;
totoc.Value:=0;
totimp.Value:=0;
pptotoca.Value:=0;
pptotoca1.Value:=0;
pptotocia.Value:=0;
pptotocina.Value:=0;
end;

end.
