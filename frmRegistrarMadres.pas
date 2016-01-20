unit frmRegistrarMadres;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractTable, RxCalc, Mask, DBCtrls, ZSqlUpdate, Buttons,
  dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  ComCtrls;

type
  TfrmRegistrarMadres = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    pg1: TPageControl;
    pro: TTabSheet;
    data_empleados: TDataSource;
    conEmpleados: TZQuery;
    cmdSalir: TBitBtn;
    cmdBuscar: TBitBtn;
    cmdEliminar: TBitBtn;
    cmdModificar: TBitBtn;
    cmdNuevo: TBitBtn;
    gridempleados: TdxDBGrid;
    CEDULA: TdxDBGridMaskColumn;
    FEC_NAC: TdxDBGridMaskColumn;
    NOMBRE: TdxDBGridMaskColumn;
    FEC_ING: TdxDBGridMaskColumn;
    EDO_CIVIL: TdxDBGridMaskColumn;
    Qry: TZQuery;
    gridempleadosDIRMADPRO: TdxDBGridMaskColumn;
    gridempleadosPARRMADPRO: TdxDBGridMaskColumn;
    gridempleadosNROREPMADPRO: TdxDBGridMaskColumn;
    gridempleadosQUIENINGRESAMAD: TdxDBGridMaskColumn;
    dataqry: TDataSource;
    function esnum(NumStr : string) : bool;
    procedure FormShow(Sender: TObject);
    procedure cmdBuscarClick(Sender: TObject);
    procedure cmdNuevoClick(Sender: TObject);
    procedure cmdEliminarClick(Sender: TObject);
    procedure cmdModificarClick(Sender: TObject);
    procedure cmdSalirClick(Sender: TObject);
    procedure gridempleadosDblClick(Sender: TObject);
 private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  objfrmRegistrarMadres: TfrmRegistrarMadres;

implementation

uses frmbus,frmNewRegMadre,frmModMadreProcesadora;

{$R *.dfm}

function TfrmRegistrarMadres.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
        end;
end;


procedure TfrmRegistrarMadres.FormShow(Sender: TObject);
begin
  conempleados.Close;
  conempleados.Open;
  pg1.ActivePageIndex:=0;
  gridempleados.SetFocus;
end;

procedure TfrmRegistrarMadres.cmdBuscarClick(Sender: TObject);
var
  buscar: string;
begin
       frmbuscar.ShowModal;
       buscar:=frmbuscar.bus.Text;
       conempleados.close;

           if not esnum(buscar) then
              begin
                  conEmpleados.SQL.Text:='select * from empleados where  tmp=''S'' and nombre like '''+ '%'+ buscar +'%''';
              end
           else
              begin
                conEmpleados.SQL.Text:='select * from empleados where tmp=''S'' and cedula like '''+ '%'+ buscar +'%''';
              end;
           conempleados.Open;
           gridempleados.ResetFullRefresh;

end;



procedure TfrmRegistrarMadres.cmdNuevoClick(Sender: TObject);
begin
  objfrmnewregmadre.tb_empleados.Close;
  objfrmnewregmadre.tb_empleados.Open;
  objfrmnewregmadre.tb_empleados.FindLast;
  objfrmnewregmadre.tb_empleados.Append;
  objfrmnewregmadre.ShowModal;
  conempleados.close;
  conempleados.Open;
end;

procedure TfrmRegistrarMadres.cmdEliminarClick(Sender: TObject);
begin
    {*
      Necesitamos validar si esta persona esta asociada a alguna escuela porque en caso contrario
      no la podemos borrar o entonces tambien hay que borrarla de la tabla relacion madre dependencia
    *}

    if  MessageDlg('Desea Eliminar la Madre Procesadora: '+conEmpleados.fieldbyname('Nombre').AsString, mtConfirmation,[mbYes, mbNo],0)=mrYes then
      begin
        if not conEmpleados.IsEmpty then
          begin
            qry.SQL.Text:='SELECT * from empleados,rel_madresxdependencias where empleados.`CEDULA`=`rel_madresxdependencias`.`CEDULA` and empleados.`CEDULA`=''' + conempleados.fieldbyname('Cedula').AsString + '''';
            qry.Open;
            if qry.IsEmpty then
            begin
               qry.SQL.Text:='delete from empleados where empleados.`CEDULA`=''' + conempleados.fieldbyname('Cedula').AsString + '''';
               Qry.ExecSQL;
            end
            else
            begin
               qry.SQL.Text:='delete empleados,rel_madresxdependencias from empleados,rel_madresxdependencias where empleados.`CEDULA`=`rel_madresxdependencias`.`CEDULA` and empleados.`CEDULA`=''' + conempleados.fieldbyname('Cedula').AsString + '''';
               Qry.ExecSQL;
            end;
            conEmpleados.Close;
            conEmpleados.Open;
          end;
      end
end;

procedure TfrmRegistrarMadres.cmdModificarClick(Sender: TObject);
begin
  if conempleados.fieldbyname('Cedula').AsInteger>0 then
  begin
  objfrmModMadreProcesadora.tb_empleados.Close;
  objfrmModMadreProcesadora.tb_empleados.Filter:= 'Cedula = ' + IntToStr(conempleados.fieldbyname('Cedula').AsInteger) + ' AND TMP=''S''' ;
  objfrmModMadreProcesadora.tb_empleados.Filtered:=true;
  objfrmModMadreProcesadora.tb_empleados.Open;
  objfrmModMadreProcesadora.tb_empleados.Edit;
  objfrmModMadreProcesadora.ShowModal;
  conEmpleados.close;
  conEmpleados.Open;
  end
  else
  begin
    messagebox(0,'No existe Madre Procesadora Seleccionada...! ','Mensaje al Usuario',16);
    cmdBuscar.SetFocus;
  end;
end;
procedure TfrmRegistrarMadres.cmdSalirClick(Sender: TObject);
begin
  close;
end;

procedure TfrmRegistrarMadres.gridempleadosDblClick(Sender: TObject);
begin
cmdModificarClick(Sender);
end;

end.
