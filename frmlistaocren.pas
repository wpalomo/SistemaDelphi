unit frmlistaocren;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppDBPipe, raCodMod, ppModule, daDataModule, ppBands,
  ppVar, ppCtrls, jpeg, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, DB, ZAbstractRODataset, ZDataset, StdCtrls, Buttons,
  ComCtrls, OleServer, ExcelXP;

type
  Tfrmlisocren = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    fec1: TDateTimePicker;
    fec2: TDateTimePicker;
    bt_salir: TBitBtn;
    BitBtn1: TBitBtn;
    dataoc: TDataSource;
    con_oc: TZReadOnlyQuery;
    pprepoc: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppShape8: TppShape;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel42: TppLabel;
    ppLine1: TppLine;
    ppLine4: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine7: TppLine;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel10: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel11: TppLabel;
    f1: TppLabel;
    ppLabel12: TppLabel;
    f2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    sumatotal: TppVariable;
    cuentaordenes: TppVariable;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel8: TppLabel;
    tog: TppLabel;
    ppLabel9: TppLabel;
    togb: TppLabel;
    daDataModule1: TdaDataModule;
    raCodeModule1: TraCodeModule;
    ppoc: TppDBPipeline;
    bt_exp: TBitBtn;
    ExcelApplication1: TExcelApplication;
    SaveDialog1: TSaveDialog;
    ppLine2: TppLine;
    ppLabel13: TppLabel;
    ppDBText7: TppDBText;
    ppLine8: TppLine;
    ppLabel14: TppLabel;
    ppDBText8: TppDBText;
    ppLine9: TppLine;
    ppLabel15: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    con_ocid: TFloatField;
    con_ocfecren: TDateField;
    con_ocPROVEEDOR: TStringField;
    con_ocRIF: TStringField;
    con_ocBANCO: TStringField;
    con_ocNRO_CUENTA_BANCARIA: TStringField;
    con_ocTIPO_DE_CUENTA: TStringField;
    con_ocPLANTELES_ATENDIDOS: TStringField;
    con_ocMUNICIPIO: TStringField;
    con_ocTELEFONO_DIRECTOR_PLANTEL: TStringField;
    con_ocMATRICULA: TIntegerField;
    con_ocSUBSISTEMA: TStringField;
    con_ocINGESTA: TLargeintField;
    con_ocTOTALOC: TFloatField;
    con_ocNUM_FACTURA: TStringField;
    con_ocTOTALIMP: TFloatField;
    con_ocTOTALGENERAL: TFloatField;
    con_ocFECHA_RENDICION: TDateField;
    procedure bt_salirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ppLabel11Print(Sender: TObject);
    procedure ppLabel8Print(Sender: TObject);
    procedure bt_expClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlisocren: Tfrmlisocren;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmlisocren.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmlisocren.BitBtn1Click(Sender: TObject);
begin
 con_oc.Close;
 con_oc.Params[0].AsDate:=fec1.Date;
 con_oc.Params[1].AsDate:=fec2.Date;
 con_oc.Open;
 if not con_oc.IsEmpty then
 begin
    pprepoc.Print;
 end;
end;

procedure Tfrmlisocren.FormShow(Sender: TObject);
begin
  fec1.Date:=date;
 fec2.Date:=date;
end;

procedure Tfrmlisocren.ppLabel11Print(Sender: TObject);
begin
 f1.Text:=datetostr(fec1.Date);
f2.Text:=datetostr(fec2.Date);
end;

procedure Tfrmlisocren.ppLabel8Print(Sender: TObject);
begin
 tog.Text:=inttostr(cuentaordenes.Value);
 togb.Text:=formatfloat('#,##0.00',sumatotal.Value);
end;

procedure Tfrmlisocren.bt_expClick(Sender: TObject);
var
totalpagar:double;
nlineas:integer;
nl,LineString: string;
//numd:integer;

begin
 con_oc.Close;
 con_oc.Params[0].AsDate:=fec1.Date;
 con_oc.Params[1].AsDate:=fec2.Date;
 con_oc.Open;

if con_oc.IsEmpty then
begin
   MESSAGEBOX(0,'No existen datos para exportar...!','Mensaje al usuario',16);
   fec1.SetFocus;
end
else
begin

//******************************
totalpagar:=0;
with SaveDialog1 do
begin
FileName :='ocrendidas';
Filter:= 'Excel files|*.XLS;All Files|*.*';
DefaultExt := 'XLS';
Title := 'Guardando en Excel';
if execute then
begin
with ExcelApplication1 do
begin
connect;
try
Workbooks.Add(EmptyParam,0);

// paso 1
//Encabezado de los Datos a Insertar

Range['A1','A1'].Value2:='NRO. O/C';
Range['B1','B1'].Value2:='FECHA RENDICION';
Range['C1','C1'].Value2:='PROVEEDOR';
Range['D1','D1'].Value2:='RIF';
Range['E1','E1'].Value2:='NUMERO DE CUENTA';
Range['F1','F1'].Value2:='BANCO';
Range['G1','G1'].Value2:='TIPO DE CUENTA';
Range['H1','H1'].Value2:='DEPENDENCIA';

Range['I1','I1'].Value2:='MUNICIPIO';
Range['J1','J1'].Value2:='TELEFONO DIRECTOR PLANTEL';
Range['K1','K1'].Value2:='MATRICULA';
Range['L1','L1'].Value2:='SUBSISTEMA';
Range['M1','M1'].Value2:='INGESTA';

Range['N1','N1'].Value2:='NRO. FACTURA';
Range['O1','O1'].Value2:='TOTAL O/C';
Range['P1','P1'].Value2:='TOTAL IMP O/C';
Range['Q1','Q1'].Value2:='TOTAL GENERAL O/C';

with Range['A1','R1']do
begin
HorizontalAlignment := xlcenter;
VerticalAlignment := xlBottom;
Wraptext := false;
Orientation := 0;
ShrinkTofit := false;
MergeCells := false;
Font.Bold := true;
end;
con_oc.First;
nlineas := 1;
While not con_oc.Eof do
begin
  Inc(nlineas);
    LineString:= IntToStr(nlineas);
    Range['A'+LineString,'A'+LineString].Value2:=con_oc.Fieldbyname('id').AsInteger;
    Range['B'+LineString,'B'+LineString].NumberFormat:='@';
    Range['B'+LineString,'B'+LineString].Value2:=datetostr(con_oc.Fieldbyname('fecren').AsDateTime);
    Range['C'+LineString,'C'+LineString].Value2:=con_oc.Fieldbyname('PROVEEDOR').AsString;
    Range['D'+LineString,'D'+LineString].Value2:=con_oc.Fieldbyname('RIF').Asstring;
    Range['E'+LineString,'E'+LineString].NumberFormat:='@';
    Range['E'+LineString,'E'+LineString].Value2:=con_oc.Fieldbyname('NRO_CUENTA_BANCARIA').Asstring;
    Range['F'+LineString,'F'+LineString].Value2:=con_oc.Fieldbyname('BANCO').Asstring;
    Range['G'+LineString,'G'+LineString].Value2:=con_oc.Fieldbyname('TIPO_DE_CUENTA').Asstring;
    Range['H'+LineString,'H'+LineString].Value2:=con_oc.Fieldbyname('PLANTELES_ATENDIDOS').AsSTRING;
Range['I'+LineString,'I'+LineString].Value2:=con_oc.Fieldbyname('MUNICIPIO').AsSTRING;
Range['J'+LineString,'J'+LineString].Value2:=con_oc.Fieldbyname('TELEFONO_DIRECTOR_PLANTEL').AsSTRING;
Range['K'+LineString,'K'+LineString].Value2:=con_oc.Fieldbyname('MATRICULA').AsSTRING;
Range['L'+LineString,'L'+LineString].Value2:=con_oc.Fieldbyname('SUBSISTEMA').AsSTRING;
Range['M'+LineString,'M'+LineString].Value2:=con_oc.Fieldbyname('INGESTA').AsSTRING;
    Range['N'+LineString,'N'+LineString].Value2:=con_oc.Fieldbyname('NUM_FACTURA').AsString;
    Range['O'+LineString,'O'+LineString].Value2:=con_oc.Fieldbyname('TOTALOC').AsFLOAT;
    Range['P'+LineString,'P'+LineString].Value2:=con_oc.Fieldbyname('TOTALIMP').AsFLOAT;
    Range['Q'+LineString,'Q'+LineString].Value2:=con_oc.Fieldbyname('TOTALGENERAL').AsFLOAT;
    totalpagar:=totalpagar+con_oc.Fieldbyname('TOTALGENERAL').AsFLOAT;
  con_oc.next;
end;
LineString := IntToStr(nlineas);
nl:=IntToStr(nlineas+1);

Range['Q'+nl,'Q'+nl].Value2:='TOTAL:';
Range['R'+nl,'R'+nl].Value2:=totalpagar;

Range['A1','R1'+LineString].AutoFormat(xlRangeAutoFormatlist3, true,true,true,true,true,true);
Range['A1','R1'+LineString].Columns.AutoFit;
ActiveWorkbook.SaveAs(FileName,xlNormal, '', '', false,false,xlNochange,xlUserResolution,False,EmptyParam,EmptyParam,'',0);
Quit;
MESSAGEBOX(0,'Archivo Guardado Exitosamente...!','Mensaje al usuario',32);
finally
disconnect;
end;
end;
end;
end;
end;
end;
end.
