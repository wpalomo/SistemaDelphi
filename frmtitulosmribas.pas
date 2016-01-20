unit frmtitulosmribas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls, Buttons,
  dxDBTLCl, dxGrClms, ExtCtrls, RxCalc, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppBands, ppCache, ppPrnabl, ppCtrls;

type
  Tfrmtitulosmr = class(TForm)
    Label1: TLabel;
    bt_cal: TBitBtn;
    bt_bus: TBitBtn;
    bt_nue: TBitBtn;
    bt_eli: TBitBtn;
    bt_mod: TBitBtn;
    bt_imp: TBitBtn;
    grid_titulomr: TdxDBGrid;
    grid_titulomrcedula: TdxDBGridMaskColumn;
    grid_titulomrtiponac: TdxDBGridMaskColumn;
    grid_titulomrnombres: TdxDBGridMaskColumn;
    grid_titulomrlugarnac: TdxDBGridMaskColumn;
    grid_titulomrfecnac: TdxDBGridDateColumn;
    grid_titulomrtipotitulo: TdxDBGridMaskColumn;
    grid_titulomrcodplanes: TdxDBGridMaskColumn;
    grid_titulomrfecegre: TdxDBGridDateColumn;
    grid_titulomrlugexp: TdxDBGridMaskColumn;
    grid_titulomrfecexp: TdxDBGridDateColumn;
    grid_titulomrplantel: TdxDBGridMaskColumn;
    grid_titulomrcodplantel: TdxDBGridMaskColumn;
    grid_titulomrserialtitu: TdxDBGridMaskColumn;
    Shape1: TShape;
    bt_sal: TBitBtn;
    calculadora: TRxCalculator;
    con_titulomr: TZQuery;
    datatitulosmr: TDataSource;
    eli_titulomr: TZQuery;
    dataelititulomr: TDataSource;
    Label2: TLabel;
    ntit: TLabel;
    numtitmr: TZQuery;
    datanumtitmr: TDataSource;
    grid_titulomrmunicipio: TdxDBGridMaskColumn;
    procedure bt_calClick(Sender: TObject);
    procedure bt_busClick(Sender: TObject);
    procedure bt_eliClick(Sender: TObject);
    procedure bt_salClick(Sender: TObject);
    function esnum(NumStr : string) : bool;
    procedure FormShow(Sender: TObject);
    procedure bt_nueClick(Sender: TObject);
    procedure bt_modClick(Sender: TObject);
    procedure grid_titulomrDblClick(Sender: TObject);
    procedure bt_impClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmtitulosmr: Tfrmtitulosmr;

implementation

uses frmacces, frmbus, frmuntitumr, frmunmodtitumr, unitfrmimptit;

{$R *.dfm}

function Tfrmtitulosmr.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
         end;
end;

procedure Tfrmtitulosmr.bt_calClick(Sender: TObject);
begin
calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmtitulosmr.bt_busClick(Sender: TObject);
var
buscar : string;
begin
   frmbuscar.ShowModal;
       buscar:=frmbuscar.bus.Text;
       con_titulomr.close;
       if esnum(buscar)=false then
       begin
         con_titulomr.Close;
         con_titulomr.SQL.Text:='select * from titulosmr where nombres like :n order by cedula';
         con_titulomr.Params[0].AsString:='%'+buscar+'%';
         con_titulomr.Open;
       end
       else
       begin
          con_titulomr.Close;
          con_titulomr.SQL.Text:='select * from titulosmr where cedula like :c order by cedula';
          con_titulomr.Params[0].AsString:=buscar+'%';
          con_titulomr.Open;
       end;

end;

procedure Tfrmtitulosmr.bt_eliClick(Sender: TObject);
begin
  if  MessageDlg('¿Está Seguro de Eliminar el titulo correspondiente a: '+con_titulomr.fieldbyname('nombres').AsString+' ?',
                 mtConfirmation,[mbYes, mbNo],0)=mrNo then
               else
               begin
                 if not con_titulomr.IsEmpty then
                 begin

                 eli_titulomr.Close;
                 eli_titulomr.Params[0].AsInteger:=con_titulomr.fieldbyname('cedula').AsInteger;
                 eli_titulomr.ExecSQL;

                 con_titulomr.Close;
                 con_titulomr.SQL.Text:='select * from titulosmr  where cedula like :c order by cedula';
                 con_titulomr.Params[0].Asstring:='%';
                 con_titulomr.open;
                 grid_titulomr.ResetFullRefresh;
                 end;
                end;
end;

procedure Tfrmtitulosmr.bt_salClick(Sender: TObject);
begin
con_titulomr.close;
numtitmr.Close;
close;
end;

procedure Tfrmtitulosmr.FormShow(Sender: TObject);
begin
          con_titulomr.Close;
          con_titulomr.SQL.Text:='select * from titulosmr order by cedula limit 500';
          con_titulomr.Open;
          numtitmr.Close;
          numtitmr.Open;
          ntit.Caption:=numtitmr.fieldbyname('numtit').AsString;
end;

procedure Tfrmtitulosmr.bt_nueClick(Sender: TObject);
begin
  frmuntitmr.tb_titmr.Close;
  frmuntitmr.tb_titmr.Open;
  frmuntitmr.tb_titmr.FindLast;
  frmuntitmr.tb_titmr.Append;
  frmuntitmr.ShowModal;
end;

procedure Tfrmtitulosmr.bt_modClick(Sender: TObject);
begin
 frmmodtitumr.ShowModal;
end;

procedure Tfrmtitulosmr.grid_titulomrDblClick(Sender: TObject);
begin
   bt_modClick(Sender);
end;

procedure Tfrmtitulosmr.bt_impClick(Sender: TObject);
begin
  frmimptit.ShowModal;
end;

end.
