unit frmproductos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RxCalc, StdCtrls, ExtCtrls, Buttons,
  dxCntner, ComCtrls, dxDBTLCl, dxGrClms;

type
  Tfrmprod = class(TForm)
    pg1: TPageControl;
    pro: TTabSheet;
    gridprod: TdxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    bt_eli: TBitBtn;
    bt_mod: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    dataprod: TDataSource;
    calculadora: TRxCalculator;
    gridprodid: TdxDBGridMaskColumn;
    gridprodnom: TdxDBGridMaskColumn;
    gridprodnom_1: TdxDBGridMaskColumn;
    gridprodnom_2: TdxDBGridMaskColumn;
    gridprodcal: TdxDBGridMaskColumn;
    gridprodpro: TdxDBGridMaskColumn;
    gridprodgra: TdxDBGridMaskColumn;
    gridprodfac: TdxDBGridMaskColumn;
    gridprodprecio: TdxDBGridMaskColumn;
    gridprodimp: TdxDBGridCheckColumn;
    con_prod: TZQuery;
    gridprodimpbs: TdxDBGridMaskColumn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure bt_eliClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    function  esnum(NumStr : string) : bool;
    procedure BitBtn5Click(Sender: TObject);
    procedure gridprodDblClick(Sender: TObject);
    procedure bt_modClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprod: Tfrmprod;

implementation

uses frmbus, frmundep, frmunproduc, frmmodunprod, frmacces;

{$R *.dfm}

function Tfrmprod.esnum(NumStr : string) : bool;
begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
         end;
end;

procedure Tfrmprod.BitBtn1Click(Sender: TObject);
begin
con_prod.Close;
close;
end;

procedure Tfrmprod.BitBtn6Click(Sender: TObject);
begin
  calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmprod.bt_eliClick(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   if  MessageDlg('Desea Eliminar el Proveedor: '+con_prod.fieldbyname('nom').AsString,
        mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
    if not con_prod.IsEmpty then
    begin
          con_prod.Delete;
          gridprod.ResetFullRefresh;
     end;
    end;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprod.BitBtn2Click(Sender: TObject);
var
 con1,con2:string;
begin
  frmbuscar.ShowModal;
  if esnum(frmbuscar.bus.Text) then
  begin
   // con_prod.Locate('id',frmbuscar.bus.Text,[loPartialKey]);
    con1:='select productos.`id`,productos.`nom`, productos.precio,productos.`imp`,productos.`impbs`,tipo_producto.`nom`,unidades.`nom`,productos.`cal`,productos.`pro`,productos.`gra`,productos.`fac` ,productos.tipoprod,productos.unidad,productos.cal,productos.pro,';
    con2:=' productos.gra,productos.fac,productos.val_base from productos,tipo_producto,unidades where productos.tipoprod=tipo_producto.id and productos.unidad=unidades.id and productos.id like :c';
    con_prod.Close;
    con_prod.SQL.Text:=con1+con2;
    con_prod.Params[0].AsString:=frmbuscar.bus.Text+'%';
    con_prod.Open;
    gridprod.ResetFullRefresh;
  end
  else
  begin
    //con_prod.Locate('nom',frmbuscar.bus.Text,[loPartialKey]);
    con1:='select productos.`id`,productos.`nom`, productos.precio,productos.`imp`,productos.`impbs`,tipo_producto.`nom`,unidades.`nom`,productos.`cal`,productos.`pro`,productos.`gra`,productos.`fac` ,productos.tipoprod,productos.unidad,productos.cal,productos.pro,';
    con2:=' productos.gra,productos.fac,productos.val_base from productos,tipo_producto,unidades where productos.tipoprod=tipo_producto.id and productos.unidad=unidades.id and productos.nom like :n';
    con_prod.Close;
    con_prod.SQL.Text:=con1+con2;
    con_prod.Params[0].AsString:='%'+frmbuscar.bus.Text+'%';
    con_prod.Open;
    gridprod.ResetFullRefresh;
  end;
end;

procedure Tfrmprod.BitBtn5Click(Sender: TObject);
var
con1,con2:string;
begin
  frmunprod.tb_prod.Close;
  frmunprod.tb_prod.Open;
  frmunprod.tb_prod.FindLast;
  frmunprod.tb_prod.Append;
  frmunprod.ShowModal;
  con1:='select productos.`id`,productos.`nom`, productos.precio,productos.`imp`,productos.`impbs`,tipo_producto.`nom`,unidades.`nom`,productos.`cal`,productos.`pro`,productos.`gra`,productos.`fac` ,productos.tipoprod,productos.unidad,productos.cal,productos.pro,';
  con2:='productos.gra,productos.fac,productos.val_base  from productos,`tipo_producto`,`unidades` where productos.`tipoprod`=tipo_producto.`id` and productos.`unidad`=unidades.`id` group by productos.id';
  con_prod.Close;
  con_prod.SQL.Text:=con1+con2;
  con_prod.Open;
  gridprod.ResetFullRefresh;
end;

procedure Tfrmprod.gridprodDblClick(Sender: TObject);
begin
bt_modClick(Sender);
end;

procedure Tfrmprod.bt_modClick(Sender: TObject);
begin
   frmmodpro.ShowModal;
end;

procedure Tfrmprod.FormShow(Sender: TObject);
var
con1,con2:string;
begin
 con1:='select productos.`id`,productos.`nom`, productos.precio,productos.`imp`,productos.`impbs`,tipo_producto.`nom`,unidades.`nom`,productos.`cal`,productos.`pro`,productos.`gra`,productos.`fac` ,productos.tipoprod,productos.unidad,productos.cal,productos.pro,';
 con2:='productos.gra,productos.fac,productos.val_base  from productos,`tipo_producto`,`unidades` where productos.`tipoprod`=tipo_producto.`id` and productos.`unidad`=unidades.`id` group by productos.id';
con_prod.Close;
con_prod.SQL.Text:=con1+con2;
con_prod.Open;
gridprod.ResetFullRefresh;
end;

end.
