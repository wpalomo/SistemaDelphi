unit frmocgeneradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ppVar, ppDB, ppDBPipe, raCodMod,
  ppModule, daDataModule, ppBands, ppCtrls, jpeg, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, DB, ZAbstractRODataset,
  ZDataset, OleServer, ExcelXP;

type
  Tfrmlistaocgen = class(TForm)
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
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    daDataModule1: TdaDataModule;
    raCodeModule1: TraCodeModule;
    ppoc: TppDBPipeline;
    ppLabel1: TppLabel;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppLabel3: TppLabel;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine7: TppLine;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    sumatotal: TppVariable;
    cuentaordenes: TppVariable;
    ppLabel8: TppLabel;
    tog: TppLabel;
    ppLabel9: TppLabel;
    togb: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel10: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppDBText6: TppDBText;
    ppLabel11: TppLabel;
    f1: TppLabel;
    ppLabel12: TppLabel;
    f2: TppLabel;
    bt_exp: TBitBtn;
    ExcelApplication1: TExcelApplication;
    SaveDialog1: TSaveDialog;
    procedure bt_salirClick(Sender: TObject);
    procedure ppLabel8Print(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ppLabel1Print(Sender: TObject);
    procedure bt_expClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlistaocgen: Tfrmlistaocgen;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmlistaocgen.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmlistaocgen.ppLabel8Print(Sender: TObject);
begin
 tog.Text:=inttostr(cuentaordenes.Value);
 togb.Text:=formatfloat('#,##0.00',sumatotal.Value);
end;

procedure Tfrmlistaocgen.BitBtn1Click(Sender: TObject);
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

procedure Tfrmlistaocgen.FormShow(Sender: TObject);
begin
fec1.Date:=date;
 fec2.Date:=date;
end;

procedure Tfrmlistaocgen.ppLabel1Print(Sender: TObject);
begin
f1.Text:=datetostr(fec1.Date);
f2.Text:=datetostr(fec2.Date);
end;

procedure Tfrmlistaocgen.bt_expClick(Sender: TObject);
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
FileName :='ocgeneradas';
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
Range['B1','B1'].Value2:='FECHA ELA';
Range['C1','C1'].Value2:='PROVEEDOR';
Range['D1','D1'].Value2:='RIF';
Range['E1','E1'].Value2:='DEPENDENCIA';
Range['F1','F1'].Value2:='NRO. FACTURA';
Range['G1','G1'].Value2:='TOTAL O/C';
Range['H1','H1'].Value2:='TOTAL IMP O/C';
Range['I1','I1'].Value2:='TOTAL GENERAL O/C';

with Range['A1','I1']do
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
    Range['B'+LineString,'B'+LineString].Value2:=datetostr(con_oc.Fieldbyname('fec_ela').AsDateTime);
    Range['C'+LineString,'C'+LineString].Value2:=con_oc.Fieldbyname('nom').AsString;
    Range['D'+LineString,'D'+LineString].Value2:=con_oc.Fieldbyname('rif').Asstring;
    Range['E'+LineString,'E'+LineString].Value2:=con_oc.Fieldbyname('nombre').AsSTRING;
    Range['F'+LineString,'F'+LineString].Value2:=con_oc.Fieldbyname('nfac').AsString;
    Range['G'+LineString,'G'+LineString].Value2:=con_oc.Fieldbyname('totaloc').AsFLOAT;
    Range['H'+LineString,'H'+LineString].Value2:=con_oc.Fieldbyname('totalimp').AsFLOAT;
    Range['I'+LineString,'I'+LineString].Value2:=con_oc.Fieldbyname('totalgen').AsFLOAT;
    totalpagar:=totalpagar+con_oc.Fieldbyname('totalgen').AsFLOAT;
  con_oc.next;
end;
LineString := IntToStr(nlineas);
nl:=IntToStr(nlineas+1);

Range['H'+nl,'H'+nl].Value2:='TOTAL:';
Range['I'+nl,'I'+nl].Value2:=totalpagar;

Range['A1','I1'+LineString].AutoFormat(xlRangeAutoFormatlist3, true,true,true,true,true,true);
Range['A1','I1'+LineString].Columns.AutoFit;
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
