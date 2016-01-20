unit frmRecibosdePago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppCtrls, ppModule, raCodMod, ppVar, ppPrnabl, ppClass, ppBands,
  ppCache, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, StdCtrls, DBCtrls, Buttons,
  ComCtrls, ExtCtrls,DateUtils, ppParameter, jpeg;

type
  TfrmRecibosdePago = class(TForm)
    pprep: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    cmdVisualizar: TButton;
    GrupoHistoricos: TGroupBox;
    cboDependenciasHist: TDBLookupComboBox;
    cmdBuscarDependenciasHist: TBitBtn;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    dtpfecDesde: TDateTimePicker;
    dtpfecHasta: TDateTimePicker;
    udSubirBajarSemana: TUpDown;
    GrupoXPersona: TGroupBox;
    Label2: TLabel;
    txtCedula: TEdit;
    rbxPersona2: TRadioButton;
    rbxPersona1: TRadioButton;
    Data_Dependencias: TDataSource;
    conDependencias: TZQuery;
    GrupoDependencias: TRadioGroup;
    RbDependencias1: TRadioButton;
    RBDependencias2: TRadioButton;
    cboDependencias: TDBLookupComboBox;
    cmdBuscarDependencias: TBitBtn;
    conQry: TZQuery;
    RadioGroup1: TRadioGroup;
    RB1: TRadioButton;
    RB2: TRadioButton;
    RB3: TRadioButton;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppShape1: TppShape;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppDBText8: TppDBText;
    ppLabel12: TppLabel;
    ppLabel4: TppLabel;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppLine1: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppDBText9: TppDBText;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    dtpFecIni: TDateTimePicker;
    dtpFecFin: TDateTimePicker;
    bt_salir: TBitBtn;
    procedure cmdBuscarDependenciasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdBuscarDependenciasHistClick(Sender: TObject);
    procedure ActivarTodos(Sender: TObject);
    procedure ActivarIndividual(Sender: TObject);
    procedure Mostrar(index:integer;valor:boolean);
    procedure MostrarOptions(valor:boolean);
    procedure ActivarXDependencia(Sender: TObject);
    procedure ActivarXPersona(Sender: TObject);
    procedure ActivarXHistoricos(Sender: TObject);
    function GenerarSQL:string;
    procedure cmdVisualizarClick(Sender: TObject);
    procedure rbxPersona1Click(Sender: TObject);
    procedure rbxPersona2Click(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
   private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  objfrmRecibosdePago: TfrmRecibosdePago;

implementation

uses frmacces, frmBuscarDependenciaMod;

{$R *.dfm}

procedure TfrmRecibosdePago.cmdBuscarDependenciasClick(Sender: TObject);

begin
  cmdBuscarDependencias.Tag:=1;
  cmdBuscarDependenciasHist.Tag:=0;
  objfrmBuscarDependenciaMod.show;


end;

procedure TfrmRecibosdePago.FormShow(Sender: TObject);
var
  FechaActual:TDate;
begin

    conQry.SQL.text:='SELECT CURDATE() as FechaActual;';
    conQry.Open;
    if not conQry.IsEmpty then
    begin
      {Tomar el dia de semana de la fecha y llevarla a lunes para fecDesde y a viernes para fecData}
      FechaActual:= conQry.FieldByName('FechaActual').AsDateTime;
      dtpfecdesde.date:=date;
      dtpfecIni.Date:=date;
{      dtpfechasta.date:=EndOfTheWeek (FechaActual)-2;}
      dtpfechasta.date:=date;
      dtpFecfin.Date:=date;
    end;

  condependencias.Close;
  condependencias.Open; 
  cmdBuscarDependenciasHist.Tag :=0;
  cmdBuscarDependencias.Tag:=0;
  cboDependencias.Visible:=false;
  cmdBuscarDependencias.Visible:=false;
  ActivarXDependencia(Sender);

end;

procedure TfrmRecibosdePago.cmdBuscarDependenciasHistClick(Sender: TObject);
begin
  cmdBuscarDependencias.Tag:=0;
  cmdBuscarDependenciasHist.Tag:=1;
  objfrmBuscarDependenciaMod.show;


end;


procedure TfrmRecibosdePago.ActivarTodos(Sender: TObject);
begin
  cboDependencias.Visible:=false;
  cmdBuscarDependencias.Visible:=false;
end;

procedure TfrmRecibosdePago.ActivarIndividual(Sender: TObject);
begin
  cboDependencias.Visible:=true;
  cmdBuscarDependencias.Visible:=true;
end;

{procedure TfrmRecibosdePago.udSubirBajarSemanaClick(Sender: TObject; Button: TUDBtnType);
var
 FechaActual:TDate;
begin
  {Toma el dia Actual, le suma 7 dias para obtener el dia pero en la semana siguiente o posterior
  dada por udSubirBajarSemana y obtiene el principio y final de semana de esa fecha dada}
 { conQry.SQL.text:='SELECT CURDATE() as FechaActual;';
  conQry.Open;
  if not conQry.IsEmpty then
  begin
    FechaActual:= conQry.FieldByName('FechaActual').AsDateTime;
    FechaActual:=FechaActual+(7*udSubirBajarSemana.Position);
    dtpfecdesde.date:=StartOfTheWeek(FechaActual);
{    dtpfechasta.date:=EndOfTheWeek (FechaActual)-2;}
  //  dtpfechasta.date:=EndOfTheWeek (FechaActual);
 // end;
//end;


{procedure TfrmRecibosdePago.udSubirBajarSemana1Click(Sender: TObject; Button: TUDBtnType);
var
 FechaActual:TDate;
begin
  {Toma el dia Actual, le suma 7 dias para obtener el dia pero en la semana siguiente o posterior
  dada por udSubirBajarSemana y obtiene el principio y final de semana de esa fecha dada}
 { conQry.SQL.text:='SELECT CURDATE() as FechaActual;';
  conQry.Open;
  if not conQry.IsEmpty then
  begin
    FechaActual:= conQry.FieldByName('FechaActual').AsDateTime;
    FechaActual:=FechaActual+(7*udSubirBajarSemana1.Position);
    dtpfecIni.Date :=StartOfTheWeek(FechaActual);
{    dtpfechasta.date:=EndOfTheWeek (FechaActual)-2;}
 //   dtpfecfin.date:=EndOfTheWeek (FechaActual);
//  end;
//end;

procedure TfrmRecibosdePago.Mostrar(index:integer;valor:boolean);
begin
  case index of
    1: Begin
          GrupoDependencias.visible:=valor;
          RBDependencias1.visible:=valor;
          RBDependencias2.visible:=valor;
          cboDependencias.visible:=valor;
          cmdBuscarDependencias.visible:=valor;
       end;

    2: Begin
          GrupoXPersona.visible:=valor;
          rbxPersona1.Checked:=true;
       end;
    3: GrupoHistoricos.visible:=valor;


  end;



end;


procedure TfrmRecibosdePago.ActivarXDependencia(Sender: TObject);
begin
   Mostrar(1,true);
   Mostrar(2,false);
   Mostrar(3,false);
end;

procedure TfrmRecibosdePago.ActivarXPersona(Sender: TObject);
begin
   Mostrar(1,false);
   Mostrar(2,true);
   Mostrar(3,False);

end;

procedure TfrmRecibosdePago.ActivarXHistoricos(Sender: TObject);
begin
   Mostrar(1,false);
   Mostrar(2,false);
   Mostrar(3,true);
end;

function TfrmRecibosdePago.GenerarSQL:string;
  var
    strSQL:string;
    FecDesde:TDate;
    FecHasta:TDate;
begin

    if RbDependencias1.Checked then {Por Dependencia Todos}
      begin
        strSQL:= 'SELECT nomcal.coddep, madresprocesadoras.NOMBRE,'+
                 ' madresprocesadoras.CEDULA, asistencia.fecdesde,'+
                 ' asistencia.fechasta, nomcal.diastrabajados,'+
                 ' nomcal.dependencia, nomcal.monto, monto/1000 AS montoBsF'+
                 ' FROM madresprocesadoras INNER JOIN (asistencia INNER JOIN nomcal'+
                 ' ON asistencia.cedula = nomcal.cedula) ON'+
                 ' madresprocesadoras.CEDULA = asistencia.cedula'+
                 ' GROUP BY nomcal.coddep, madresprocesadoras.NOMBRE'+
                 ' ORDER BY nomcal.coddep, madresprocesadoras.NOMBRE';
      end;

    if RbDependencias2.Checked then {Por Dependencia Individual }
      begin
        strSQL:= 'SELECT nomcal.coddep, madresprocesadoras.NOMBRE,' +
                 ' madresprocesadoras.CEDULA, asistencia.fecdesde,' +
                 ' asistencia.fechasta, nomcal.diastrabajados,' +
                 ' nomcal.dependencia, nomcal.monto, monto/1000 AS montoBsF' +
                 ' FROM madresprocesadoras INNER JOIN (asistencia INNER JOIN nomcal' +
                 ' ON asistencia.cedula = nomcal.cedula) ON' +
                 ' madresprocesadoras.CEDULA = asistencia.cedula' +
                 ' GROUP BY nomcal.coddep, madresprocesadoras.NOMBRE' +
                 ' HAVING nomcal.coddep=' + inttostr(cboDependencias.KeyValue)  +
                 ' ORDER BY nomcal.coddep, madresprocesadoras.NOMBRE;'
      end;

   if rb2.Checked then { Por Persona }
      begin
        if rbxpersona1.Checked then {Por Persona Nomina Actual}
          begin
            strSQL:=' SELECT nomcal.coddep, madresprocesadoras.NOMBRE,' +
                    ' madresprocesadoras.CEDULA, asistencia.fecdesde,' +
                    ' asistencia.fechasta, nomcal.diastrabajados,' +
                    ' nomcal.dependencia, nomcal.monto, monto/1000 AS montoBsF' +
                    ' FROM madresprocesadoras INNER JOIN' +
                    ' (asistencia INNER JOIN nomcal ON asistencia.cedula = nomcal.cedula)' +
                    ' ON madresprocesadoras.CEDULA = asistencia.cedula' +
                    ' GROUP BY nomcal.coddep, madresprocesadoras.NOMBRE' +
                    ' HAVING (((madresprocesadoras.CEDULA)='+ txtCedula.Text +'))' +
                    ' ORDER BY nomcal.coddep, madresprocesadoras.NOMBRE;';
          end
        else  {Por Persona Historicos}
          begin
            FecDesde:=dtpFecini.date;
            FecHasta:=dtpfecfin.date;
            strSQL:=' SELECT histnom.coddep, madresprocesadoras.NOMBRE, ' +
                    ' madresprocesadoras.CEDULA, asistencia.fecdesde, ' +
                    ' asistencia.fechasta, histnom.diastrabajados, ' +
                    ' histnom.dependencia, histnom.monto, monto/1000 AS montoBsF ' +
                    ' FROM (madresprocesadoras INNER JOIN asistencia ON ' +
                    ' madresprocesadoras.CEDULA = asistencia.cedula) ' +
                    ' INNER JOIN histnom ON asistencia.cedula = histnom.cedula ' +
                    ' GROUP BY histnom.coddep, madresprocesadoras.NOMBRE ' +
                    ' HAVING ( madresprocesadoras.CEDULA ='+ txtCedula.Text +') ' +
                    ' AND ( asistencia.fecdesde>= ' + ''''  +  FormatDateTime('yyyy-mm-dd',fecdesde) + '''' +  ' ) AND ( asistencia.fechasta <= '+ '''' +  FormatDateTime('yyyy-mm-dd',fecHasta) + '''' + ' ) ' +
                    ' ORDER BY histnom.coddep, madresprocesadoras.NOMBRE'
          end;
      end;

   if rb3.Checked then {Por Historicos}
      begin
        FecDesde:=dtpFecDesde.date;
        FecHasta:=dtpfecHasta.date;
        strSQL:=' SELECT histnom.coddep, madresprocesadoras.NOMBRE,'+
                ' madresprocesadoras.CEDULA, asistencia.fecdesde, asistencia.fechasta,'+
                ' histnom.diastrabajados, histnom.dependencia, histnom.monto, monto/1000 AS montoBsF'+
                ' FROM (madresprocesadoras INNER JOIN asistencia ON' +
                ' madresprocesadoras.CEDULA = asistencia.cedula)'+
                ' INNER JOIN histnom ON asistencia.cedula = histnom.cedula'+
                ' GROUP BY histnom.coddep, madresprocesadoras.NOMBRE'+
                ' HAVING (histnom.coddep='+ inttostr(cboDependenciasHist.KeyValue)  +') AND (asistencia.fecdesde>='+ ''''  +  FormatDateTime('yyyy-mm-dd',fecdesde) + '''' +') AND (asistencia.fechasta<='+ '''' +  FormatDateTime('yyyy-mm-dd',fecHasta) + '''' +')'+
                ' ORDER BY histnom.coddep, madresprocesadoras.NOMBRE';
      end;
   GenerarSQL:=strSQL;
end;


procedure TfrmRecibosdePago.cmdVisualizarClick(Sender: TObject);
begin
   ZQuery1.Close;
   ZQuery1.SQL.Text:=GenerarSQL;
   ZQuery1.Open ;
   pprep.Print
end;

procedure TfrmRecibosdePago.rbxPersona1Click(Sender: TObject);
begin
  MostrarOptions(false);
end;

procedure TfrmRecibosdePago.rbxPersona2Click(Sender: TObject);
begin
 MostrarOptions(true);
end;

procedure TfrmRecibosdePago.MostrarOptions(valor:boolean);
begin
    GroupBox1.Visible :=valor;
end;

procedure TfrmRecibosdePago.bt_salirClick(Sender: TObject);
begin
close;
end;

end.
