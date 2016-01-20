unit frmrepana;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, StdCtrls, Buttons, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  DBCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ComCtrls,
  ppModule, raCodMod, ppVar, ppCtrls, ppBands, jpeg, ppPrnabl, ppCache,
  ppParameter;

type
  Tfrmrepanalista = class(TForm)
    con_ana: TZQuery;
    dataana: TDataSource;
    con_mov: TZQuery;
    dataconmov: TDataSource;
    GroupBox2: TGroupBox;
    lis_ana: TDBComboBox;
    lista_ana: TdxDBGrid;
    GroupBox1: TGroupBox;
    lis_codana: TDBComboBox;
    bt_salir: TBitBtn;
    GroupBox6: TGroupBox;
    fec_del: TDateTimePicker;
    GroupBox7: TGroupBox;
    fec_al: TDateTimePicker;
    BitBtn1: TBitBtn;
    ppRepana: TppReport;
    ppDBPipeline1: TppDBPipeline;
    lista_anaNOMBRE: TdxDBGridMaskColumn;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppcon: TppVariable;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText2: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    pptotalgen: TppLabel;
    raCodeModule1: TraCodeModule;
    ppLabel3: TppLabel;
    PPTOTA: TppVariable;
    ppVariable1: TppVariable;
    procedure bt_salirClick(Sender: TObject);
    procedure lis_anaDblClick(Sender: TObject);
    procedure lista_anaDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ppLabel2Print(Sender: TObject);
    procedure ppLabel3Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrepanalista: Tfrmrepanalista;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmrepanalista.bt_salirClick(Sender: TObject);
begin
con_mov.Close;
close;
end;

procedure Tfrmrepanalista.lis_anaDblClick(Sender: TObject);
begin
lista_ana.Visible:=true;
con_ana.Close;
con_ana.Open;
end;

procedure Tfrmrepanalista.lista_anaDblClick(Sender: TObject);
begin
  lis_ana.Text:=con_ana.fieldbyname('nombre').asstring;
  lis_codana.Text:=con_ana.fieldbyname('id').asstring;
  lista_ana.Visible:=false;
  fec_del.SetFocus;
end;

procedure Tfrmrepanalista.BitBtn1Click(Sender: TObject);
begin
con_mov.Close;
con_mov.Params[0].AsString:=lis_ana.Text;
con_mov.Params[1].AsDate:=fec_del.Date;
con_mov.Params[2].AsDate:=fec_al.Date;
con_mov.Open;
pprepana.Print;
end;

procedure Tfrmrepanalista.FormShow(Sender: TObject);
begin
 lista_ana.Visible:=false;
 fec_del.Date:=date;
 fec_al.Date:=date;
end;

procedure Tfrmrepanalista.ppLabel2Print(Sender: TObject);
begin
 pptotalgen.Text:=inttostr(ppcon.Value);
 ppcon.Value:=0;

end;

procedure Tfrmrepanalista.ppLabel3Print(Sender: TObject);
begin
pptota.Text:=inttostr(ppvariable1.Value);
end;

end.
