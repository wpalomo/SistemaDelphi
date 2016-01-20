unit frmControlAsistencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Mask, DBCtrls, DateUtils;

type
  TfrmControlAsistencia = class(TForm)
    GroupBox1: TGroupBox;
    dtpfecDesde: TDateTimePicker;
    dtpfecHasta: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    conPersonal: TZQuery;
    dataPersonal: TDataSource;
    GroupBox2: TGroupBox;
    pLunes: TPanel;
    pMartes: TPanel;
    pJueves: TPanel;
    pViernes: TPanel;
    pMiercoles: TPanel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txtCedula: TEdit;
    cmdBuscar: TBitBtn;
    txtNombre: TDBEdit;
    txtDependencia: TDBEdit;
    Panel1: TPanel;
    Label6: TLabel;
    cmdGuardar: TBitBtn;
    cmdSalir: TBitBtn;
    conQry: TZQuery;
    udSubirBajarSemana: TUpDown;
    pSabado: TPanel;
    pDomingo: TPanel;
    Label7: TLabel;
    diast: TEdit;
    procedure pLunesClick(Sender: TObject);
    procedure SubirBajar(var Sender:TPanel);
    procedure BajarTodas();
    procedure pMartesClick(Sender: TObject);
    procedure pMiercolesClick(Sender: TObject);
    procedure pJuevesClick(Sender: TObject);
    procedure pViernesClick(Sender: TObject);
    procedure pSabadoClick(Sender: TObject);
    procedure pDomingoClick(Sender: TObject);
    procedure cmdBuscarClick(Sender: TObject);
    procedure cmdGuardarClick(Sender: TObject);
    function GetState(Sender:TPanel): boolean;
    procedure FormShow(Sender: TObject);
    procedure udSubirBajarSemanaClick(Sender: TObject; Button: TUDBtnType);
    procedure cmdSalirClick(Sender: TObject);
    procedure diastKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  objfrmControlAsistencia: TfrmControlAsistencia;

implementation

{$R *.dfm}
{//////////////////////////////////////////////////////////////////////////////}
procedure TfrmControlAsistencia.SubirBajar(var Sender:TPanel);
begin
    case Sender.BevelOuter  of
      bvLowered: Sender.BevelOuter:= bvRaised	;
      bvRaised : Sender.BevelOuter:= bvLowered;
    end;

end;
{//////////////////////////////////////////////////////////////////////////////}
procedure TfrmControlAsistencia.pLunesClick(Sender: TObject);
begin
    subirbajar(pLunes);
end;
{//////////////////////////////////////////////////////////////////////////////}
procedure TfrmControlAsistencia.pMartesClick(Sender: TObject);
begin
 subirbajar(pMartes);
end;
{//////////////////////////////////////////////////////////////////////////////}
procedure TfrmControlAsistencia.pMiercolesClick(Sender: TObject);
begin
   subirbajar(pMiercoles);
end;
{//////////////////////////////////////////////////////////////////////////////}
procedure TfrmControlAsistencia.pJuevesClick(Sender: TObject);
begin
subirbajar(pJueves);
end;
{//////////////////////////////////////////////////////////////////////////////}
procedure TfrmControlAsistencia.pViernesClick(Sender: TObject);
begin
 subirbajar(pViernes);
end;
{//////////////////////////////////////////////////////////////////////////////}
procedure TfrmControlAsistencia.pSabadoClick(Sender: TObject);
begin
 subirbajar(pSabado);
end;
{//////////////////////////////////////////////////////////////////////////////}
procedure TfrmControlAsistencia.pDomingoClick(Sender: TObject);
begin
 subirbajar(pDomingo);
end;

{//////////////////////////////////////////////////////////////////////////////}
procedure TfrmControlAsistencia.BajarTodas();
begin
  pLunes.BevelOuter:= bvLowered;
  pMartes.BevelOuter:= bvLowered;
  pMiercoles.BevelOuter:= bvLowered;
  pJueves.BevelOuter:= bvLowered;
  pViernes.BevelOuter:= bvLowered;
  pSabado.BevelOuter:= bvRaised;
  pDomingo.BevelOuter:= bvRaised;
end;
{//////////////////////////////////////////////////////////////////////////////}


procedure TfrmControlAsistencia.cmdBuscarClick(Sender: TObject);
begin
if txtcedula.Text<>'' then
begin
  conpersonal.Filter:= 'Cedula = ' + txtCedula.Text;
  conpersonal.Filtered:=true;
  conpersonal.Close;
  conpersonal.Open;
    if conpersonal.IsEmpty then
    begin
      application.MessageBox(Pchar('No Encontrado'),Pchar(''));
      txtCedula.Text:='';
    end else
    begin
       diast.SetFocus;
    end;
    BajarTodas;
end
else
begin
  application.MessageBox('Debe Ingresar una cedula...!','Mensaje al Usuario',16);
end;
end;
{//////////////////////////////////////////////////////////////////////////////}
function TfrmControlAsistencia.GetState(Sender:TPanel): boolean;
begin
  GetState:=Sender.BevelOuter=bvLowered;
end;
{//////////////////////////////////////////////////////////////////////////////}

procedure TfrmControlAsistencia.cmdGuardarClick(Sender: TObject);
var
  //dias:array[1..7]of string;
  strSQL: string;
begin


  //{/Asignar al arreglo dias los valores correspondientes a los botones}
//  if GetState(pLunes) then dias[1]:='TRUE'
//  else dias[1]:='FALSE';
//  if GetState(pMartes) then dias[2]:='TRUE'
//  else dias[2]:='FALSE';
//  if GetState(pMiercoles) then dias[3]:='TRUE'
//  else dias[3]:='FALSE';
//  if GetState(pJueves) then dias[4]:='TRUE'
//  else dias[4]:='FALSE';
//  if GetState(pViernes) then dias[5]:='TRUE'
//  else dias[5]:='FALSE';
//  if GetState(pSabado) then dias[6]:='TRUE'
//  else dias[6]:='FALSE';
//  if GetState(pDomingo) then dias[7]:='TRUE'
//  else dias[7]:='FALSE';


  conQry.SQL.Text:='Select * from asistencia where (Cedula=' + txtcedula.Text + ') and (fecdesde=' + '''' + FormatDateTime('yyyy-mm-dd',dtpfecdesde.date) + '''' + ') and  (fechasta=' + '''' +  FormatDateTime('yyyy-mm-dd',dtpfecHasta.date) + '''' + ') and (status=0 or status=1)';
  conQry.Open;
  if conQry.IsEmpty then
  begin

   if  MessageDlg('Ya esta registrado...Verifique las Fechas de Asistencia...¿Desea Continuar?!',
           mtConfirmation,[mbYes, mbNo],0)=mrNo then
   else
   begin
      strSQL:='Insert into asistencia(Cedula,fecdesde,fechasta,lunes,martes,miercoles,jueves,viernes,sabado,domingo,status,diast) values('+txtcedula.Text + ',' + '''' + FormatDateTime('yyyy-mm-dd',dtpfecdesde.date) + '''' + ',' + ''''                   + FormatDateTime('yyyy-mm-dd',dtpfecHasta.date) + '''' +','+'0'+','+'0'+','+'0'+','+'0'+','+'0'+','+'0'+','+'0'+','+'0'+','+diast.Text+')';
      {application.MessageBox(Pchar(strSQL),Pchar(''));}
      conQry.SQL.Text:=strSQL;
      conQry.ExecSQL;
   end;   
  end
  else
  begin
      if conQry.FieldByName('status').AsInteger =0 then
      begin
         strSQL:='update asistencia set diast=' + diast.Text +' where (Cedula=' + txtcedula.Text + ') and (fecdesde=' + '''' + FormatDateTime('yyyy-mm-dd',dtpfecdesde.date) + '''' + ') and  (fechasta=' + '''' +  FormatDateTime('yyyy-mm-dd',dtpfecHasta.date) + '''' + ')';
          {application.MessageBox(Pchar(strSQL),Pchar(''));}
          conQry.SQL.Text:=strSQL;
          conQry.ExecSQL;
      end
      else
      begin
           application.MessageBox(PChar('Ya existe un registro procesado para este Empleado en esta fecha, no se puede modificar'),PChar('Mensaje al Usuario'));
      end;
    end;


  conQry.Close;
  txtcedula.Clear;
  txtnombre.Clear;
  txtdependencia.Clear;
  diast.Clear;
  txtcedula.SetFocus;
end;

procedure TfrmControlAsistencia.FormShow(Sender: TObject);
var
 FechaActual:TDateTime;
begin
  conQry.SQL.text:='SELECT CURDATE() as FechaActual;';
  conQry.Open;
  if not conQry.IsEmpty then
  begin
      {Tomar el dia de semana de la fecha y llevarla a lunes para fecDesde y a viernes para fecData}
      //FechaActual:= conQry.FieldByName('FechaActual').AsDateTime;
      //EndOfTheWeek (FechaActual)
      dtpfecdesde.date:=date;
      dtpfechasta.date:=date;

  end;
    txtcedula.Clear;
    txtnombre.Clear;
    txtdependencia.Clear;
    diast.Clear;
    bajartodas();
    txtcedula.SetFocus;
end;

procedure TfrmControlAsistencia.udSubirBajarSemanaClick(Sender: TObject; Button: TUDBtnType);
var
 FechaActual:TDate;
begin
  {Toma el dia Actual, le suma 7 dias para obtener el dia pero en la semana siguiente o posterior
  dada por udSubirBajarSemana y obtiene el principio y final de semana de esa fecha dada}
  conQry.SQL.text:='SELECT CURDATE() as FechaActual;';
  conQry.Open;
  if not conQry.IsEmpty then
  begin
    FechaActual:= conQry.FieldByName('FechaActual').AsDateTime;
    FechaActual:=FechaActual+(7*udSubirBajarSemana.Position);
    dtpfecdesde.date:=StartOfTheWeek(FechaActual);
    dtpfechasta.date:=EndOfTheWeek (FechaActual);
  end;
end;

procedure TfrmControlAsistencia.cmdSalirClick(Sender: TObject);
begin
close;
end;

procedure TfrmControlAsistencia.diastKeyPress(Sender: TObject;
  var Key: Char);
begin
   case key of
   #48..#57:;
   #8:;
   else
   key:=#0;
   end;
end;

end.
