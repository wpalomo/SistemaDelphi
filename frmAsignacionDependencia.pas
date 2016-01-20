unit frmAsignacionDependencia;

interface

uses
  Windows, Messages, SysUtils,Math ,Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Mask, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, ComCtrls, ZAbstractTable, Buttons;

type
  TfrmAsignacionDependencia = class(TForm)
    data_Dependencias: TDataSource;
    conDependencias: TZQuery;
    Panel1: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    cboDependencias: TDBLookupComboBox;
    conDesDependencia: TZQuery;
    dataDesDependencia: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    COD: TDBEdit;
    MUNICIPIO: TDBEdit;
    Label4: TLabel;
    MATPRO: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MadReq: TEdit;
    MadAsig: TEdit;
    conpersonaldisponible: TZQuery;
    datapersonaldisponible: TDataSource;
    pg1: TPageControl;
    pro: TTabSheet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    conpersonalasignado: TZQuery;
    datapersonalasignado: TDataSource;
    cmdDesponibleAasignado: TButton;
    cmdAsignadoADisponible: TButton;
    conAsignarDesasignar: TZQuery;
    gridempleados: TdxDBGrid;
    grd1Cedula: TdxDBGridMaskColumn;
    grd1Nombre: TdxDBGridMaskColumn;
    dxDBGrid1: TdxDBGrid;
    grd2Cedula: TdxDBGridMaskColumn;
    grd2Nombre: TdxDBGridMaskColumn;
    cmdCerrar: TBitBtn;
    conDefGen: TZQuery;
    cmdBuscar: TBitBtn;
    bced: TEdit;
    Label8: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cboDependenciasBuscarDetalles(Sender: TObject);
    procedure PasarDisponiblesAsignados(Sender: TObject);
    procedure PasarAsignadosDisponibles(Sender: TObject);
    procedure cmdCerrarClick(Sender: TObject);
    procedure cmdBuscarClick(Sender: TObject);
    procedure BblClick(Sender: TObject);
    procedure DblClick(Sender: TObject);
    procedure bcedKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  objfrmAsignacionDependencia: TfrmAsignacionDependencia;

implementation

uses frmacces, frmBuscarDependencia;

{$R *.dfm}

procedure TfrmAsignacionDependencia.FormShow(Sender: TObject);
begin


  cod.Clear;
  cbodependencias.KeyValue:=0;
  municipio.Clear;
  matpro.Clear;
  madreq.Clear;
  madasig.Clear;
  bced.Clear;
  condependencias.Close;
  condependencias.open;
  cbodependencias.DropDownRows:=20;
  condependencias.First;
  conpersonaldisponible.Close;
  conpersonaldisponible.Open;
  conpersonalasignado.close;
  conpersonalasignado.Filter:= 'Cod_Dep = 0';
  conpersonalasignado.Filtered:=true;
  conpersonalasignado.open;
  conDefGen.Close;
  conDefGen.Open;
end;

procedure TfrmAsignacionDependencia.cboDependenciasBuscarDetalles(Sender: TObject);
var
  RelMatriculaXMadreProcesadora: integer;
  {fraccion:Extended;}
begin
 RelMatriculaXMadreProcesadora:=conDefGen.FieldByName('RelMatriculaXMadreProcesadora').asinteger;
 if RelMatriculaXMadreProcesadora>0 then
 begin
  conDesDependencia.close;
  conDesDependencia.Filter:= 'CodDep = ' + IntToStr(cboDependencias.KeyValue);
  conDesDependencia.Filtered:=true;
  conDesDependencia.open;
  {fraccion:=frac(strtoint(MatPro.text)/RelMatriculaXMadreProcesadora);}

  MadReq.Text :=  inttostr(ceil(strtoint(MatPro.text)/RelMatriculaXMadreProcesadora));

  conpersonalasignado.close;
  conpersonalasignado.Filter:= 'Cod_Dep = ' + IntToStr(cboDependencias.KeyValue);
  conpersonalasignado.Filtered:=true;
  conpersonalasignado.open;

  MadAsig.text:= IntToStr(conpersonalasignado.RecordCount);
 end;
end;

procedure TfrmAsignacionDependencia.PasarDisponiblesAsignados(Sender: TObject);
var
  strSQL: string;
  Cedula: integer;
  coddependencia:integer;
begin
  if  MadReq.text='' then
  begin
     Application.MessageBox('Debe Seleccionar una Dependencia',Pchar(''));
  end   
  else
  begin
  if strToInt(MadReq.text) > StrToInt(Madasig.Text) then
    begin
      Cedula:=conpersonaldisponible.FieldByName('CEDULA').AsInteger;
      CodDependencia:= conDependencias.FieldByName('COD').AsInteger;
      strSQL:='Insert into rel_madresxdependencias (CEDULA, COD_DEP, QUIENASIG) values (' + inttostr(Cedula) + ',' + inttostr(CodDependencia) + ','+'"'+ frmacceso.usuario.Text +'"'+ ')';
      conAsignarDesasignar.SQL.Text:=strSQL;
      conAsignarDesasignar.ExecSQL;
      conpersonaldisponible.Close;
      conpersonaldisponible.Open;
      conpersonalasignado.Close;
      conpersonalasignado.Open;
      MadAsig.text:= IntToStr(conpersonalasignado.RecordCount);
    end
  else
    begin
        Application.MessageBox('No puede Asignar mas Madres Procesadoras a esta Dependencia',Pchar(''));
    end
 end;
end;

procedure TfrmAsignacionDependencia.PasarAsignadosDisponibles(Sender: TObject);
var
  strSQL: string;
  Cedula: integer;
  coddependencia:integer;
begin

  if strToInt(MadAsig.text)>0 then
    begin
      Cedula:= conpersonalasignado.FieldByName('CEDULA').AsInteger;
      CodDependencia:= conDependencias.FieldByName('COD').AsInteger;
      strSQL:='delete from rel_madresxdependencias where CEDULA=' + inttostr(Cedula) + ' and COD_DEP=' + inttostr(CodDependencia);
      conAsignarDesasignar.SQL.Text:=strSQL;
      conAsignarDesasignar.ExecSQL;
      conpersonaldisponible.Close;
      conpersonaldisponible.Open;
      conpersonalasignado.Close;
      conpersonalasignado.Open;
      MadAsig.text:= IntToStr(conpersonalasignado.RecordCount);
    end
  else
      begin
        Application.MessageBox('No puede quitar mas Madres Procesadoras de esta Dependencia',Pchar(''));
      end;

end;

procedure TfrmAsignacionDependencia.cmdCerrarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAsignacionDependencia.cmdBuscarClick(Sender: TObject);
begin
  {Application.MessageBox(Pchar('Programar Busqueda para el combo'),Pchar(''));}
    objfrmBuscarDependencia.show;
end;

procedure TfrmAsignacionDependencia.BblClick(Sender: TObject);
begin
   PasarDisponiblesAsignados(Sender);
end;

procedure TfrmAsignacionDependencia.DblClick(Sender: TObject);
begin
  PasarAsignadosDisponibles(Sender);
end;

procedure TfrmAsignacionDependencia.bcedKeyPress(Sender: TObject;
  var Key: Char);
var
  res:boolean;
begin
case key of
      #48..#57:;
      #8:;
      #13: begin
             res:=(conpersonaldisponible.Locate('cedula',bced.Text,[loCaseInsensitive,lopartialkey]));
             if res=false then
             begin
                messagebox(0,'Cédula no está Disponible ...! ','Mensaje al Usuario',16);
                bced.setfocus;
             end;
           end;
else
      key:=#0;
end;
end;

end.
