unit frmConsultasParametricas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ppDB,
  ppDBPipe, ppParameter, ppBands, jpeg, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, StdCtrls,DateUtils;

type
  TfrmConsultasParametricas = class(TForm)
    ZQuery1: TZQuery;
    cmdGenerar: TButton;
    Label1: TLabel;
    txtNombreArchivo: TEdit;
    conQry: TZQuery;
    procedure cmdGenerarClick(Sender: TObject);
    procedure GenerarArchivo();
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  objfrmConsultasParametricas: TfrmConsultasParametricas;

implementation

{$R *.dfm}


procedure TfrmConsultasParametricas.cmdGenerarClick(Sender: TObject);
begin
   GenerarArchivo();
end;

procedure TfrmConsultasParametricas.GenerarArchivo();
var
  archivo: TextFile;
  Linea: string;
begin

  if txtNombreArchivo.Text<>'' then
    begin
      AssignFile(archivo, pchar(txtNombreArchivo.Text));
      Rewrite(archivo);
      ZQuery1.Close;
      ZQuery1.Open;
      ZQuery1.First;
      while not ZQuery1.Eof do
        begin
            Linea:=ZQuery1.fieldbyname('Linea').AsString;
            Writeln(archivo, Linea);
            ZQuery1.Next;
        end;
      CloseFile(archivo);
      Application.MessageBox(Pchar('El Archivo ha sido Generado Correctamente!!!'),Pchar(''));
    end
  else
    begin
        Application.MessageBox(Pchar('Nombre del Archivo no debe estar en blanco!!!'),Pchar(''));
    end;
end;

procedure TfrmConsultasParametricas.FormShow(Sender: TObject);
var
  Year, Month, Day: Word;
  FechaActual:TDateTime;
begin
   fechaActual:=date;
  {Obtener la Fecha del Servidor}
  conQry.SQL.text:='SELECT CURDATE() as FechaActual;';
  conQry.Open;
  if not conQry.IsEmpty then
  begin
      FechaActual:= conQry.FieldByName('FechaActual').AsDateTime;
  end;
  DecodeDate(FechaActual, Year, Month, Day);
  txtNombreArchivo.Text:='C:\' + IntToStr(Day) + IntToStr(Month) + IntToStr(Year) + '.txt';
end;

end.
