unit frrmreprend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner, StdCtrls, DBCtrls,
  ZAbstractDataset, ZDataset, DB, ZAbstractRODataset, ppDB, ppDBPipe,
  ppModule, daDataModule, ppBands, ppClass, ppRichTx, ppStrtch, ppMemo,
  ppCtrls, myChkBox, jpeg, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, Buttons, ComCtrls, ppVar, raCodMod, ppParameter;

type
  Tfrmrelren = class(TForm)
    bt_salir: TBitBtn;
    imprime: TBitBtn;
    ppoc: TppDBPipeline;
    dataoc: TDataSource;
    con_oc: TZReadOnlyQuery;
    con_prov: TZReadOnlyQuery;
    dataprov: TDataSource;
    con_proy: TZQuery;
    dataproy: TDataSource;
    lista_proy: TdxDBGrid;
    lista_proynom: TdxDBGridMaskColumn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    fecha1: TDateTimePicker;
    Label2: TLabel;
    fecha2: TDateTimePicker;
    GroupBox2: TGroupBox;
    cod_proy: TDBComboBox;
    lis_proy: TDBComboBox;
    pprep: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppShape19: TppShape;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel4: TppLabel;
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
    ppDetailBand1: TppDetailBand;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText24: TppDBText;
    ppnum: TppVariable;
    ppDBText2: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppLine3: TppLine;
    raCodeModule1: TraCodeModule;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    GroupBox3: TGroupBox;
    cod_ana: TDBComboBox;
    nom_ana: TDBComboBox;
    ppSystemVariable3: TppSystemVariable;
    lis_ana: TdxDBGrid;
    con_ana: TZQuery;
    dataana: TDataSource;
    lis_anaNOMBRE: TdxDBGridMaskColumn;
    ppana: TppLabel;
    ppcanoc: TppVariable;
    ppLabel8: TppLabel;
    pptotalocr: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppLine8: TppLine;
    ppLine9: TppLine;
    pproy: TppLabel;
    ppdel: TppLabel;
    ppLabel16: TppLabel;
    ppal: TppLabel;
    ppLine10: TppLine;
    ppLabel18: TppLabel;
    ppDBText4: TppDBText;
    ppShape1: TppShape;
    ppLabel14: TppLabel;
    ppDBRichText1: TppDBRichText;
    ppLabel15: TppLabel;
    ppDBRichText2: TppDBRichText;
    ppLine11: TppLine;
    ppLabel17: TppLabel;
    ppLine12: TppLine;
    ppVariable3: TppVariable;
    Label3: TLabel;
    fecha3: TDateTimePicker;
    procedure bt_salirClick(Sender: TObject);
    procedure lis_proyDblClick(Sender: TObject);
    procedure lista_proyDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imprimeClick(Sender: TObject);
    procedure nom_anaDblClick(Sender: TObject);
    procedure lis_anaDblClick(Sender: TObject);
    procedure ppLabel8Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelren: Tfrmrelren;

implementation

{$R *.dfm}

procedure Tfrmrelren.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmrelren.lis_proyDblClick(Sender: TObject);
begin
lista_proy.Visible:=true;
con_proy.Close;
con_proy.Open;
end;

procedure Tfrmrelren.lista_proyDblClick(Sender: TObject);
begin
  lis_proy.Text:=con_proy.fieldbyname('nom').asstring;
  cod_proy.Text:=con_proy.fieldbyname('id').asstring;
  lista_proy.Visible:=false;

end;

procedure Tfrmrelren.FormShow(Sender: TObject);
begin
cod_ana.Clear;
nom_ana.Clear;
cod_proy.Clear;
lis_proy.Clear;

lista_proy.Visible:=false;
lis_ana.Visible:=false;
fecha1.Date:=date;
fecha2.Date:=date;
fecha3.Date:=date;

end;

procedure Tfrmrelren.imprimeClick(Sender: TObject);
begin
con_oc.Close;
con_oc.Params[0].AsDate:=fecha1.Date;
con_oc.Params[1].AsDate:=fecha2.Date;
con_oc.Params[2].Asinteger:=strtoint(cod_proy.Text);
con_oc.Params[3].Asstring:=nom_ana.text;
con_oc.params[4].AsDate:=fecha3.Date;
con_oc.Open;
ppana.Text:=nom_ana.Text;
pproy.Text:=lis_proy.Text;
ppdel.Text:=datetostr(fecha1.Date);
ppal.Text:=datetostr(fecha2.Date);
pprep.Print;
end;

procedure Tfrmrelren.nom_anaDblClick(Sender: TObject);
begin
lis_ana.Visible:=true;
con_ana.Close;
con_ana.Open;

end;

procedure Tfrmrelren.lis_anaDblClick(Sender: TObject);
begin
  cod_ana.Text:=con_ana.fieldbyname('id').asstring;
  nom_ana.Text:=con_ana.fieldbyname('nombre').asstring;
  lis_ana.Visible:=false;

end;

procedure Tfrmrelren.ppLabel8Print(Sender: TObject);
begin
pptotalocr.Caption:=ppcanoc.Text;
end;

end.
