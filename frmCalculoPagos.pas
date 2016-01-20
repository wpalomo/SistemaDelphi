{$IFDEF PROFILE} {$O-} {$WARNINGS OFF} {$ENDIF }
{$IFDEF PROFILE} {    Do not delete previous line(s) !!! } {$ENDIF }
{$IFDEF PROFILE} { Otherwise sources can not be cleaned !!! } {$ENDIF }
unit frmCalculoPagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset,DateUtils{$IFNDEF PROFILE};{$ELSE}{},Profint;{$ENDIF}

type
  TfrmCalculoPagos = class(TForm)
    Panel1: TPanel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpfecDesde: TDateTimePicker;
    dtpfecHasta: TDateTimePicker;
    cmdCalcular: TBitBtn;
    pbCalculando: TProgressBar;
    ConQry: TZQuery;
    ExeQry: TZQuery;
    ConQry2: TZQuery;
    conQry3: TZQuery;
    conQry4: TZQuery;

    procedure cmdCalcularClick(Sender: TObject);
    procedure ProgresoBarra();
    procedure TemporizadorTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function  DiasTrabajados(Cedula:integer; FecIni:TDate; FecFin:TDate):integer;
    procedure Calcular();
    function GetSueldoXDep(CodDep:integer):double;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  objfrmCalculoPagos: TfrmCalculoPagos;

implementation

uses frmacces;

{$R *.dfm}
{////////////////////////////////////////////////////////////////////////////////////////////////////////}
procedure TfrmCalculoPagos.cmdCalcularClick(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,75 or $25A00000); {$ENDIF}
   {temporizador.Interval:=50;}
   pbcalculando.Visible:=true;
   cmdCalcular.Caption:='Calculando...';
   cmdCalcular.Enabled:=false;
   calcular();
{$IFDEF PROFILE}finally; Profint.ProfExit(75); end;{$ENDIF}
end;
{////////////////////////////////////////////////////////////////////////////////////////////////////////}
procedure TfrmCalculoPagos.ProgresoBarra();
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,76 or $25A00000); {$ENDIF}
  if pbcalculando.Position=pbcalculando.Max then
    begin
        pbcalculando.Position:=0;
        {temporizador.Interval:=0;}
{$IFDEF PROFILE}      Profint.AMessageBox(Pchar('Proceso Terminado'),Pchar(''));{$ENDIF}
{$IFNDEF PROFILE}      application.MessageBox(Pchar('Proceso Terminado'),Pchar(''));{$ENDIF}
      pbcalculando.Visible:=false;
      cmdCalcular.Caption:='Calcular';
      cmdCalcular.Enabled:=true;
    end
  else
    begin
      pbcalculando.Position:=pbcalculando.Position+1;
    end

{$IFDEF PROFILE}finally; Profint.ProfExit(76); end;{$ENDIF}
end;
{////////////////////////////////////////////////////////////////////////////////////////////////////////}
procedure TfrmCalculoPagos.TemporizadorTimer(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,77 or $25A00000); {$ENDIF}
  {ProgresoBarra();}

{$IFDEF PROFILE}finally; Profint.ProfExit(77); end;{$ENDIF}
end;
{////////////////////////////////////////////////////////////////////////////////////////////////////////}
procedure TfrmCalculoPagos.FormShow(Sender: TObject);
var
 FechaActual:TDateTime;
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,78 or $25A00000); {$ENDIF}
    pbcalculando.Position:=0;
    {temporizador.Interval:=0;}
    pbcalculando.Visible:=false;
    conQry.SQL.text:='SELECT CURDATE() as FechaActual;';
    conQry.Open;
    if not conQry.IsEmpty then
    begin
      {Tomar el dia de semana de la fecha y llevarla a lunes para fecDesde y a viernes para fecData}
      //FechaActual:= conQry.FieldByName('FechaActual').AsDateTime;
      dtpfecdesde.date:=date;
      dtpfechasta.date:=date;

    end
{$IFDEF PROFILE}finally; Profint.ProfExit(78); end;{$ENDIF}
end;
{////////////////////////////////////////////////////////////////////////////////////////////////////////}
{procedure TfrmCalculoPagos.udSubirBajarSemanaClick(Sender: TObject; Button: TUDBtnType);
var
 FechaActual:TDate;
begin
{$IFDEF PROFILE}//Profint.ProfStop; Try; Profint.ProfEnter(@self,79 or $25A00000); {$ENDIF}
  {Toma el dia Actual, le suma 7 dias para obtener el dia pero en la semana siguiente o posterior
  dada por udSubirBajarSemana y obtiene el principio y final de semana de esa fecha dada}
 { conQry.SQL.text:='SELECT CURDATE() as FechaActual;';
  conQry.Open;
  if not conQry.IsEmpty then
  begin
    FechaActual:= conQry.FieldByName('FechaActual').AsDateTime;
    FechaActual:=FechaActual+(7*udSubirBajarSemana.Position);
    dtpfecdesde.date:=StartOfTheWeek(FechaActual);
    dtpfechasta.date:=EndOfTheWeek (FechaActual);
  end;
{$IFDEF PROFILE}//finally; Profint.ProfExit(79); end;{$ENDIF}
//end;
{////////////////////////////////////////////////////////////////////////////////////////////////////////}
function TfrmCalculoPagos.DiasTrabajados(Cedula:integer; FecIni:TDate; FecFin:TDate):integer;
var
  strSQL:string;
  cuenta:integer;
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,80 or $25A00000); {$ENDIF}

  strSQL:='Select * from asistencia where (Cedula=' + intToStr(Cedula) + ') and (fecdesde>=' + '''' + FormatDateTime('yyyy-mm-dd',FecIni) + '''' + ') and  (fechasta<=' + '''' +  FormatDateTime('yyyy-mm-dd',FecFin) + '''' + ') and status=0';
  conQry2.SQL.text:=strSQL;
  conQry2.Open;
  cuenta:=0;
  if not conqry2.IsEmpty then
    begin
       DiasTrabajados:=conQry2.fieldbyname('diast').asinteger;
    end
    else
    begin
      DiasTrabajados:=0;
    end;

  conQry2.close
{$IFDEF PROFILE}finally; Profint.ProfExit(80); end;{$ENDIF}
end;

procedure TfrmCalculoPagos.Calcular();
var
  Dias:integer;
  strSQL: string;
  FecNom:TDate;
  Sueldo:Double;
  Nombre:String;
  Cedula:integer;
  Cod:integer;
  Dependencia:string;
  fecDesde:TDate;
  fecHasta:TDate;
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,81 or $25A00000); {$ENDIF}
    fecnom:=date;
    fecDesde:= dtpfecDesde.Date;
    fecHasta:=dtpfecHasta.Date;
    conQry.SQL.text:='SELECT CURDATE() as FechaActual;';
    conQry.Open;
    if not conQry.IsEmpty then FecNom:= conQry.FieldByName('FechaActual').AsDateTime;

    {conQry.SQL.text:='SELECT SueldoMadreProcesadoraXDia from defgen as FechaActual;';
    conQry.Open;
    if not conQry.IsEmpty then Sueldo:= conQry.FieldByName('SueldoMadreProcesadoraXDia').AsFloat;}


    strSQL:='SELECT DISTINCT rel_madresxdependencias.CEDULA, dependencias.COD, dependencias.NOMBRE AS DEPENDENCIA FROM (rel_madresxdependencias INNER JOIN dependencias ON rel_madresxdependencias.COD_DEP = dependencias.COD) INNER JOIN ' +
    '(SELECT DISTINCT empleados.CEDULA FROM empleados GROUP BY empleados.CEDULA, empleados.NOMBRE) A  ON rel_madresxdependencias.CEDULA = A.CEDULA;';
    conQry.SQL.Text:=strSQL;
    conqry.Open;
    if not conqry.IsEmpty then
      begin
        conQry.First;

        Nombre:=' ';

        pbcalculando.Max:=conQry.RecordCount;
        while not conQry.Eof do
          begin

            cedula:= conQry.FieldByName('CEDULA').AsInteger;

            conQry2.SQL.Text:='SELECT MAX(empleados.NOMBRE) AS NOMBREX FROM empleados WHERE empleados.CEDULA=' + inttostr(cedula);
            conQry2.Open;
            if not conqry2.IsEmpty then Nombre:=conQry2.fieldbyname('NOMBREX').AsString
            else nombre:=' ';
            cod:= conQry.FieldByName('COD').AsInteger;
            Dependencia:= conQry.FieldByName('DEPENDENCIA').AsString;
            Dias:=DiasTrabajados(cedula,dtpfecDesde.Date,dtpfecHasta.Date);
            Sueldo:=GetSueldoXDep(cod);
            strSQL:='Select * from nomcal where cedula=' + inttostr(cedula) +' and fecdesde=' + '''' + FormatDateTime('yyyy-mm-dd',fecdesde) + '''' + ' and fecHasta=' + '''' + FormatDateTime('yyyy-mm-dd',fecHasta) + '''' ;
            conqry2.SQL.text:=strSQL;
            conqry2.open;
            if conqry2.IsEmpty then
              strSQL:='Insert into nomcal (cedula,fecdesde,fechasta,fecnom,nombre,diastrabajados,coddep,dependencia,monto) values(' + inttostr(cedula) + ',' + '''' + FormatDateTime('yyyy-mm-dd',fecdesde) + '''' + ',' + '''' + FormatDateTime('yyyy-mm-dd',fechasta) + '''' +   ','   + '''' + FormatDateTime('yyyy-mm-dd',FecNom) + '''' + ',' + '''' + Nombre + '''' + ',' + inttostr(Dias) + ',' + inttostr(cod) + ',' + '''' + dependencia + '''' + ','+ FloatToStr(Dias*Sueldo) + ')'
            else
              strSQL:='Update nomcal Set nombre=' + '''' + Nombre + '''' + ',diastrabajados='+ inttostr(Dias) + ',coddep='+ inttostr(cod) + ' ,dependencia='+ '''' + dependencia + '''' +' ,monto= '+ FloatToStr(Dias*Sueldo) + ' where cedula=' + inttostr(cedula) +' and fecdesde=' + '''' + FormatDateTime('yyyy-mm-dd',fecdesde) + '''' + ' and fecHasta=' + '''' + FormatDateTime('yyyy-mm-dd',fecHasta) + '''' ;



            ExeQry.SQL.Text:=strSQL;
            ExeQry.ExecSQL;
            ExeQry.Close;
            conQry.Next;
            pbcalculando.Position:=pbcalculando.Position+1;
          end;
        if pbcalculando.Position=pbcalculando.Max then
        begin
          pbcalculando.Position:=0;
          pbcalculando.Visible:=false;
{$IFDEF PROFILE}          Profint.AMessageBox(Pchar('Proceso Terminado!!!'),Pchar(''));{$ENDIF}
{$IFNDEF PROFILE}          application.MessageBox(Pchar('Proceso Terminado!!!'),Pchar(''));{$ENDIF}
          cmdCalcular.Caption:='Calcular';
          cmdCalcular.Enabled:=true;
        end
    end
{$IFDEF PROFILE}finally; Profint.ProfExit(81); end;{$ENDIF}
end;

function TfrmCalculoPagos.GetSueldoXDep(CodDep:integer):double;
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,82 or $25A00000); {$ENDIF}
    conQry4.close;
    conQry4.SQL.text:='SELECT dependencias.COD, dependencias.NOMBRE, modalidad.id'+
                      ' FROM (modalidad INNER JOIN proy_mod ON modalidad.id = proy_mod.id)'+
                      ' INNER JOIN dependencias ON modalidad.id = dependencias.MODAL'+
                      ' WHERE (dependencias.COD=' + inttostr(codDep) + ') AND (proy_mod.nom Like "%ALMUERZO%")';
    conqry4.Open;
    if conqry4.IsEmpty then
      begin
        conQry4.close;
        conQry4.SQL.text:='SELECT SueldoMadreProcesadoraXDia from defgen where ID=1';
        conqry4.Open;
        if not conQry4.IsEmpty then GetSueldoXDep:= conQry4.FieldByName('SueldoMadreProcesadoraXDia').AsFloat;
      end
    else
      begin
        conQry4.close;
        conQry4.SQL.text:='SELECT SueldoMadreProcesadoraXDia from defgen where ID=2';
        conqry4.Open;
        if not conQry4.IsEmpty then GetSueldoXDep:= conQry4.FieldByName('SueldoMadreProcesadoraXDia').AsFloat;
      end;
    conQry4.close;

{$IFDEF PROFILE}finally; Profint.ProfExit(82); end;{$ENDIF}
end;

end.
