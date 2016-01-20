unit frmCierreNomina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmCierreNomina = class(TForm)
    cmdCierreNomina: TButton;
    conQry: TZQuery;
    procedure cmdCierreNominaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  objfrmCierreNomina: TfrmCierreNomina;

implementation

{$R *.dfm}

procedure TfrmCierreNomina.cmdCierreNominaClick(Sender: TObject);
var
  strSQL: string;

begin

    strSQL:='INSERT INTO histnom ( cedula, fecdesde, fechasta, fecnom, nombre, diastrabajados, coddep, dependencia, monto ) ' +
            ' SELECT nomcal.cedula, nomcal.fecdesde, nomcal.fechasta, nomcal.fecnom, nomcal.nombre, nomcal.diastrabajados, nomcal.coddep, nomcal.dependencia, nomcal.monto FROM nomcal;';
    conQry.SQL.Text:=strSQL;
    conQry.ExecSQL;
    strSQL:='DELETE FROM nomcal;';
    conQry.SQL.Text:=strSQL;
    conQry.ExecSQL;
    Application.MessageBox(Pchar('Cierre de Nomina Realizado Correctamente!!!'),Pchar(''));
end;

end.
