unit unitfrmbuscadep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, Buttons, dxTL, dxDBCtrl, dxDBGrid, dxCntner;

type
  Tfrmbuscadep = class(TForm)
    grid_dep: TdxDBGrid;
    bt_sal: TBitBtn;
    GroupBox1: TGroupBox;
    ndep: TEdit;
    con_dep: TZQuery;
    datadep: TDataSource;
    grid_depCod: TdxDBGridMaskColumn;
    grid_depNombredelPlantel: TdxDBGridMaskColumn;
    bt_sel: TBitBtn;
    procedure bt_salClick(Sender: TObject);
    procedure ndepKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure grid_depDblClick(Sender: TObject);
    procedure bt_selClick(Sender: TObject);
    procedure grid_depKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    salir:string;
  end;

var
  frmbuscadep: Tfrmbuscadep;

implementation

uses unitfrmbecas, frmacces;

{$R *.dfm}

procedure Tfrmbuscadep.bt_salClick(Sender: TObject);
begin
salir:='S';
con_dep.Close;
close;
end;

procedure Tfrmbuscadep.ndepKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
  begin
      con_dep.Close;
      con_dep.Params[0].AsString:= '%'+ndep.Text+'%';
      con_dep.Open;
      grid_dep.SetFocus;
  end;

end;

procedure Tfrmbuscadep.FormShow(Sender: TObject);
begin
      salir:='N';
      frmbecas.cod_pl.Clear;
      frmbecas.npl.Clear;
      ndep.Clear;
      con_dep.Close;
      con_dep.Params[0].AsString:= '%'+' '+'%';
      con_dep.Open;
      ndep.SetFocus;
end;

procedure Tfrmbuscadep.grid_depDblClick(Sender: TObject);
begin
frmbecas.npl.Text:=con_dep.fieldbyname('Nombre').AsString;
frmbecas.cod_pl.Text:=con_dep.fieldbyname('cod').AsString;
con_dep.Close;
close;
end;

procedure Tfrmbuscadep.bt_selClick(Sender: TObject);
begin
frmbecas.npl.Text:=con_dep.fieldbyname('Nombre').AsString;
frmbecas.cod_pl.Text:=con_dep.fieldbyname('cod').AsString;
con_dep.Close;
close;
end;

procedure Tfrmbuscadep.grid_depKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
begin
 frmbecas.npl.Text:=con_dep.fieldbyname('Nombre').AsString;
 frmbecas.cod_pl.Text:=con_dep.fieldbyname('cod').AsString;
 con_dep.Close;
 close;
end;
end;

end.
