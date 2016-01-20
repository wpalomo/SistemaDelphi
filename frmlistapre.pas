unit frmlistapre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, dxExEdtr, DB, ZAbstractRODataset,
  ZAbstractDataset, ZAbstractTable, ZDataset, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, dxDBTLCl, dxGrClms;

type
  Tfrmlistaprecios = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    grid_lista: TdxDBGrid;
    datapro: TDataSource;
    grid_listaid: TdxDBGridMaskColumn;
    grid_listanom: TdxDBGridMaskColumn;
    tb_productos: TZTable;
    tb_productosid: TIntegerField;
    tb_productosnom: TStringField;
    tb_productostipoprod: TIntegerField;
    tb_productoscal: TFloatField;
    tb_productospro: TFloatField;
    tb_productosgra: TFloatField;
    tb_productosfac: TFloatField;
    tb_productosval_base: TFloatField;
    tb_productosprecio: TFloatField;
    BitBtn2: TBitBtn;
    grid_listacal: TdxDBGridMaskColumn;
    grid_listapro: TdxDBGridMaskColumn;
    grid_listagra: TdxDBGridMaskColumn;
    grid_listafac: TdxDBGridMaskColumn;
    grid_listaval_base: TdxDBGridMaskColumn;
    grid_listaprecio: TdxDBGridMaskColumn;
    tb_productosimp: TStringField;
    grid_listaimp: TdxDBGridCheckColumn;
    tb_productosunidad: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grid_listaChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure grid_listaprecioGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure grid_listaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_listaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    function esnum(NumStr : string) : bool;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlistaprecios: Tfrmlistaprecios;

implementation

uses frmacces, frmbus;

{$R *.dfm}

function Tfrmlistaprecios.esnum(NumStr : string) : bool;
begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
         end;
end;
procedure Tfrmlistaprecios.BitBtn1Click(Sender: TObject);
begin
tb_productos.Close;
close;
end;

procedure Tfrmlistaprecios.FormShow(Sender: TObject);
begin
tb_productos.Close;
tb_productos.Open;
grid_lista.SetFocus;
grid_lista.FocusedColumn:=2;
end;

procedure Tfrmlistaprecios.grid_listaChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
grid_lista.FocusedColumn:=2;
end;

procedure Tfrmlistaprecios.grid_listaprecioGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if atext='' then
tb_productos.Cancel;
end;

procedure Tfrmlistaprecios.grid_listaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if grid_lista.FocusedColumn=2 then
begin
   if (key=vk_up) or (key=vk_down) or (key=vk_return) then
     if (grid_lista.EditingText='') or (grid_lista.EditingText='0') then
        tb_productos.Cancel;
end;
end;

procedure Tfrmlistaprecios.grid_listaKeyPress(Sender: TObject;
  var Key: Char);
begin
    case key of
       #48..#57:;
       #46: key:=#44;
       #8:;
    else
       key:=#0;
    end;
end;


procedure Tfrmlistaprecios.BitBtn2Click(Sender: TObject);
begin
   frmbuscar.ShowModal;
  if esnum(frmbuscar.bus.Text) then
  begin
    tb_productos.Locate('id',frmbuscar.bus.Text,[loPartialKey]);
  end
  else
  begin
    tb_productos.Locate('nom',frmbuscar.bus.Text,[loPartialKey]);
  end;
end;

end.
