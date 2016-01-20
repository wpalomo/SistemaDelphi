unit frmBuscarDependencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmBuscarDependencia = class(TForm)
    Label1: TLabel;
    txtNombre: TEdit;
    cmdAceptar: TBitBtn;
    cmdCancelar: TBitBtn;
    data_Dependencias: TDataSource;
    conDependencias: TZQuery;
    pg1: TPageControl;
    pro: TTabSheet;
    gridempleados: TdxDBGrid;
    Cod: TdxDBGridColumn;
    Nombre: TdxDBGridColumn;
    procedure cmdAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AlCambiar(Sender: TObject);
    procedure DblClick(Sender: TObject);
    procedure cmdCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  objfrmBuscarDependencia: TfrmBuscarDependencia;

implementation

uses frmAsignacionDependencia;

{$R *.dfm}

procedure TfrmBuscarDependencia.cmdAceptarClick(Sender: TObject);
begin
   objfrmAsignaciondependencia.cboDependencias.KeyValue:=condependencias.fieldbyName('COD').AsInteger ;
   objfrmAsignaciondependencia.cboDependenciasBuscarDetalles(Sender);
   close;
end;

procedure TfrmBuscarDependencia.FormShow(Sender: TObject);
begin
  conDependencias.Close;
  conDependencias.Open;
end;

procedure TfrmBuscarDependencia.AlCambiar(Sender: TObject);
begin
   conDependencias.Filter:='Nombre like ''*'+ txtNombre.Text + '*''';
   condependencias.Filtered:=true;
end;

procedure TfrmBuscarDependencia.DblClick(Sender: TObject);
begin
  cmdAceptarClick(Sender);
end;

procedure TfrmBuscarDependencia.cmdCancelarClick(Sender: TObject);
begin
  close;
end;



end.
