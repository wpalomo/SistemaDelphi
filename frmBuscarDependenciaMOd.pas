unit frmBuscarDependenciaMod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmBuscarDependenciaMod = class(TForm)
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
  objfrmBuscarDependenciaMod: TfrmBuscarDependenciaMod;

implementation

uses frmRecibosdePago;

{$R *.dfm}

procedure TfrmBuscarDependenciaMod.cmdAceptarClick(Sender: TObject);
begin
  if objfrmRecibosdePago.cmdBuscarDependencias.Tag=1 then
    begin
      objfrmRecibosdePago.cboDependencias.KeyValue:=condependencias.fieldbyName('COD').AsInteger ;
    end;
  if objfrmRecibosdePago.cmdBuscarDependenciasHist.Tag=1 then
    begin
      objfrmRecibosdePago.cboDependenciasHist.KeyValue:=condependencias.fieldbyName('COD').AsInteger ;
    end;
 close;

{  CodDependencia:=condependencias.fieldbyName('COD').AsInteger ;}
  { objfrmAsignaciondependencia.cboDependencias.KeyValue:=condependencias.fieldbyName('COD').AsInteger ;
   objfrmAsignaciondependencia.cboDependenciasBuscarDetalles(Sender);}
{   close;}
end;

procedure TfrmBuscarDependenciaMod.FormShow(Sender: TObject);
begin
  conDependencias.Close;
  conDependencias.Open;
  txtNombre.text:='';
end;

procedure TfrmBuscarDependenciaMod.AlCambiar(Sender: TObject);
begin
   conDependencias.Filter:='Nombre like ''*'+ txtNombre.Text + '*''';
   condependencias.Filtered:=true;
end;

procedure TfrmBuscarDependenciaMod.DblClick(Sender: TObject);
begin
  cmdAceptarClick(Sender);
end;

procedure TfrmBuscarDependenciaMod.cmdCancelarClick(Sender: TObject);
begin
  close;
end;

end.
