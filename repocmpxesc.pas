unit repocmpxesc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ppDB, ppDBPipe, ppParameter, ppModule, raCodMod, ppBands,
  ppClass, ppCtrls, ppVar, jpeg, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, DBCtrls, Buttons;

type
  Tfrmocmpxesc = class(TForm)
    Label3: TLabel;
    bt_salir: TBitBtn;
    BitBtn1: TBitBtn;
    cb_nomun: TDBComboBox;
    numm: TListBox;
    dataocxmp: TDataSource;
    con_mun: TZQuery;
    datamun: TDataSource;
    pprepxmun: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppnum: TppVariable;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel10: TppLabel;
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
    raCodeModule1: TraCodeModule;
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
    ppDBText1: TppDBText;
    ppDBText24: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppShape1: TppShape;
    ppImage2: TppImage;
    ppLabel1: TppLabel;
    ppLabel5: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel6: TppLabel;
    ppmun: TppLabel;
    ppShape8: TppShape;
    ppLine2: TppLine;
    ppLabel38: TppLabel;
    ppLabel9: TppLabel;
    ppLabel37: TppLabel;
    ppLine6: TppLine;
    ppLine5: TppLine;
    ppLabel42: TppLabel;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLabel12: TppLabel;
    ppLabel15: TppLabel;
    ppLine4: TppLine;
    ppLabel16: TppLabel;
    ppLine9: TppLine;
    ppLabel19: TppLabel;
    ppLine10: TppLine;
    ppLabel20: TppLabel;
    ppLabel41: TppLabel;
    ppLine7: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppnnula: TppVariable;
    ppnnula1: TppVariable;
    pptotoca: TppVariable;
    pptotoca1: TppVariable;
    pptotocina: TppVariable;
    pptotocia: TppVariable;
    totoc: TppVariable;
    totimp: TppVariable;
    ppLine3: TppLine;
    procedure cb_nomunChange(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppmunPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmocmpxesc: Tfrmocmpxesc;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmocmpxesc.cb_nomunChange(Sender: TObject);
begin
numm.ItemIndex:=cb_nomun.ItemIndex;
end;

procedure Tfrmocmpxesc.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmocmpxesc.FormShow(Sender: TObject);
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

procedure Tfrmocmpxesc.BitBtn1Click(Sender: TObject);
begin
con_ocxmp.Close;
con_ocxmp.Params[0].AsString:=cb_nomun.Text;
con_ocxmp.Open;
pprepxmun.Print;
end;

procedure Tfrmocmpxesc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
con_ocxmp.Close;
end;

procedure Tfrmocmpxesc.ppmunPrint(Sender: TObject);
begin
ppmun.Text:=cb_nomun.Text;
end;

end.
