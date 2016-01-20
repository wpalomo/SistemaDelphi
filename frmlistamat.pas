unit frmlistamat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls;

type
  Tfrmlistama = class(TForm)
    Label1: TLabel;
    des: TEdit;
    con_mat: TZQuery;
    data_mat: TDataSource;
    gridp: TdxDBGrid;
    gridpid: TdxDBGridMaskColumn;
    gridpcod_mat: TdxDBGridMaskColumn;
    gridpdes_mat: TdxDBGridMaskColumn;
    procedure desKeyPress(Sender: TObject; var Key: Char);
    procedure gridpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridpDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    v_cod :string;
    v_nom :string;
  end;

var
  frmlistama: Tfrmlistama;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmlistama.desKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
    con_mat.Close;
    con_mat.Params[0].AsString:=des.Text+'%';
    con_mat.Open;
    gridp.SetFocus;
   end;

end;

procedure Tfrmlistama.gridpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
    v_cod :=con_mat.fieldbyname('cod_mat').Asstring;
    v_nom :=con_mat.fieldbyname('des_mat').Asstring;
    close;
  end;
end;

procedure Tfrmlistama.gridpDblClick(Sender: TObject);
begin
    v_cod :=con_mat.fieldbyname('cod_mat').Asstring;
    v_nom :=con_mat.fieldbyname('des_mat').Asstring;
    close;
end;

procedure Tfrmlistama.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_escape then
   v_cod:='';
   v_nom:='';
   close;
end;

procedure Tfrmlistama.FormShow(Sender: TObject);
begin
    des.Clear;
    con_mat.Close;
    con_mat.Params[0].AsString:=des.Text+'0%';
    con_mat.Open;
    des.SetFocus;

end;

end.
