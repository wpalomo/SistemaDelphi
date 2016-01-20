unit frmreprenoppae;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, DB, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxControls, cxInplaceContainer, cxVGrid,
  cxDBVGrid, cxCalc, cxCalendar, StdCtrls, Buttons, ppPrnabl, ppCtrls,
  ppBands, ppCache, ppVar, ppModule, raCodMod, ppParameter;

type
  Tfrmrepopp = class(TForm)
    gridvop: TcxDBVerticalGrid;
    con_opc: TZQuery;
    ppreop: TppReport;
    ppop: TppDBPipeline;
    dataopc: TDataSource;
    con_op: TZQuery;
    dataop: TDataSource;
    gridvopnro: TcxDBEditorRow;
    gridvopmonto: TcxDBEditorRow;
    gridvopfecha: TcxDBEditorRow;
    gridvopsaldo: TcxDBEditorRow;
    gridvopactiva: TcxDBEditorRow;
    gridvopm_vie: TcxDBEditorRow;
    gridvopm_va: TcxDBEditorRow;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ppParameterList1: TppParameterList;
    con_may: TZQuery;
    datamay: TDataSource;
    pprepmay: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDBText18: TppDBText;
    ppLabel40: TppLabel;
    ppLine23: TppLine;
    ppSystemVariable4: TppSystemVariable;
    ppLine30: TppLine;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppShape9: TppShape;
    ppLine34: TppLine;
    ppDBText27: TppDBText;
    ppLine39: TppLine;
    ppFooterBand2: TppFooterBand;
    ppLabel55: TppLabel;
    ppLine40: TppLine;
    ppLabel56: TppLabel;
    ppLine41: TppLine;
    ppSystemVariable5: TppSystemVariable;
    raCodeModule2: TraCodeModule;
    ppParameterList2: TppParameterList;
    ppmay: TppDBPipeline;
    ppLabel58: TppLabel;
    ppShape8: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppLabel32: TppLabel;
    ppLabel37: TppLabel;
    ppDBText15: TppDBText;
    ppDBText17: TppDBText;
    con_zona: TZQuery;
    datazona: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppShape3: TppShape;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    pppagos: TppLabel;
    ppLabel27: TppLabel;
    ppLine20: TppLine;
    ppLabel28: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    anno: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape4: TppShape;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppVariable2: TppVariable;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine21: TppLine;
    ppDBText14: TppDBText;
    ppLine22: TppLine;
    ppFooterBand1: TppFooterBand;
    ppShape5: TppShape;
    ppLabel23: TppLabel;
    ppVariable3: TppVariable;
    ppLabel24: TppLabel;
    ppLine17: TppLine;
    ppLabel25: TppLabel;
    ppLine18: TppLine;
    ppLabel26: TppLabel;
    ppLine19: TppLine;
    conpag: TppSystemVariable;
    raCodeModule1: TraCodeModule;
    ppDBText22: TppDBText;
    ppDBText16: TppDBText;
    procedure gridvopKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridvopnroPropertiesGetDisplayText(
      Sender: TcxCustomEditorRowProperties; ARecord: Integer;
      var AText: String);
    procedure ppDetailBand1AfterPrint(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ppopLast(Sender: TObject);
  private
    { Private declarations }
    nopa:integer;
  public
    { Public declarations }
  end;

var
  frmrepopp: Tfrmrepopp;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmrepopp.gridvopKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
    key:=#0
end;

procedure Tfrmrepopp.BitBtn3Click(Sender: TObject);
begin
con_op.Close;
con_opc.Close;
close;
end;

procedure Tfrmrepopp.BitBtn2Click(Sender: TObject);
begin
pppagos.Caption:='Calculando...!';
con_zona.close;
con_zona.open;
anno.Caption:=con_zona.fieldbyname('anno').AsString;
con_zona.Close;


con_opc.Close;
con_opc.Params[0].AsInteger:=nopa;
con_opc.Open;
if con_opc.IsEmpty then
begin
   application.MessageBox('Orden de pago No posee pagos efectuados...!','Mensaje al Usuario',32);
end
else
begin
   ppreop.Print;
end;

end;

procedure Tfrmrepopp.FormShow(Sender: TObject);
begin
    con_op.Close;
    con_op.Open;
    nopa:=con_op.fieldbyname('nro').AsInteger;
end;

procedure Tfrmrepopp.gridvopnroPropertiesGetDisplayText(
  Sender: TcxCustomEditorRowProperties; ARecord: Integer;
  var AText: String);
begin
    nopa:=strtoint(Atext);
end;

procedure Tfrmrepopp.ppDetailBand1AfterPrint(Sender: TObject);
begin
 if  ppreop.PageNo =1 then
begin

    ppFooterBand1.PrintOnFirstPage:=true;
end
else
begin
    ppFooterBand1.PrintOnFirstPage:=false;
end;
end;

procedure Tfrmrepopp.BitBtn1Click(Sender: TObject);
begin
con_may.Close;
con_may.Params[0].AsInteger:=nopa;
con_may.Open;
if con_may.IsEmpty then
begin
  application.MessageBox('Orden de pago No posee pagos efectuados...!','Mensaje al Usuario',32);
end
else
begin
  pprepmay.Print;
end;
end;

procedure Tfrmrepopp.ppopLast(Sender: TObject);
begin
pppagos.Text:= formatfloat('#,##0.00',ppvariable3.Value);
end;

end.
