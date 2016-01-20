unit frmbusdepnac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, dxTL, dxDBCtrl, dxDBGrid, dxCntner;

type
  Tfrmbusdepbn = class(TForm)
    GroupBox1: TGroupBox;
    ndep: TEdit;
    grid_dep: TdxDBGrid;
    grid_depCod: TdxDBGridMaskColumn;
    grid_depNombredelPlantel: TdxDBGridMaskColumn;
    con_dep: TZQuery;
    datadep: TDataSource;
    bt_sel: TBitBtn;
    bt_sal: TBitBtn;
    procedure bt_selClick(Sender: TObject);
    procedure ndepKeyPress(Sender: TObject; var Key: Char);
    procedure grid_depKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_salClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    salir:string;
    v_cod_mun:string;
  end;

var
  frmbusdepbn: Tfrmbusdepbn;

implementation

uses frmbnac, frmacces;

{$R *.dfm}

procedure Tfrmbusdepbn.bt_selClick(Sender: TObject);
begin
frmbn.nom_es.Caption:=con_dep.fieldbyname('Nombre').AsString;
frmbn.cod_es.Caption:=con_dep.fieldbyname('cod').AsString;
v_cod_mun:= inttostr(con_dep.fieldbyname('cod_mun').Asinteger);
con_dep.Close;
close;
end;

procedure Tfrmbusdepbn.ndepKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
      con_dep.Close;
      con_dep.Params[0].AsString:= '%'+ndep.Text+'%';
      con_dep.Open;
      grid_dep.SetFocus;
  end;
end;

procedure Tfrmbusdepbn.grid_depKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
begin
 frmbn.nom_es.Caption:=con_dep.fieldbyname('Nombre').AsString;
 frmbn.cod_es.Caption:=con_dep.fieldbyname('cod').AsString;
 v_cod_mun:= inttostr(con_dep.fieldbyname('cod_mun').Asinteger);
 con_dep.Close;
 close;
end;
end;

procedure Tfrmbusdepbn.bt_salClick(Sender: TObject);
begin
salir:='S';
con_dep.Close;
close;
end;

procedure Tfrmbusdepbn.FormShow(Sender: TObject);
begin
 ndep.Text:=''; 
 salir:='N';
      con_dep.Close;
      con_dep.Params[0].AsString:= '%'+' '+'%';
      con_dep.Open;
      ndep.SetFocus;
end;

end.
