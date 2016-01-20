unit frmmenus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, dxExEdtr, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RxCalc, Buttons, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, ComCtrls, dxDBTL, dxDBTLCl, dxGrClms;

type
  Tfrmmenu = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    pg1: TPageControl;
    pro: TTabSheet;
    BitBtn1: TBitBtn;
    bt_eli: TBitBtn;
    bt_mod: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    calculadora: TRxCalculator;
    con_menu: TZQuery;
    datamenu: TDataSource;
    datamenudet: TDataSource;
    con_menudet: TZQuery;
    borra_menudet: TZQuery;
    databorramenudet: TDataSource;
    con_menunom: TStringField;
    con_menunum: TIntegerField;
    con_menuobs: TStringField;
    con_menulun: TStringField;
    con_menumar: TStringField;
    con_menumier: TStringField;
    con_menujue: TStringField;
    con_menuvier: TStringField;
    con_menudesa: TStringField;
    con_menualm: TStringField;
    con_menucena: TStringField;
    con_menumodal: TIntegerField;
    grid_menu: TdxDBGrid;
    grid_menunom: TdxDBGridMaskColumn;
    grid_menunum: TdxDBGridMaskColumn;
    grid_menuobs: TdxDBGridMaskColumn;
    grid_menudes: TdxDBGridMemoColumn;
    grid_menulun: TdxDBGridCheckColumn;
    grid_menumar: TdxDBGridCheckColumn;
    grid_menumier: TdxDBGridCheckColumn;
    grid_menujue: TdxDBGridCheckColumn;
    grid_menuvier: TdxDBGridCheckColumn;
    grid_menudesa: TdxDBGridCheckColumn;
    grid_menualm: TdxDBGridCheckColumn;
    grid_menucena: TdxDBGridCheckColumn;
    con_menudetnum_menu: TIntegerField;
    con_menudetmod_menu: TIntegerField;
    con_menudetcod_prod: TIntegerField;
    con_menudetid: TIntegerField;
    con_menudetdes_prod: TStringField;
    con_menudetfac: TIntegerField;
    con_menudetcan: TFloatField;
    con_menudetcal: TFloatField;
    con_menudetprote: TFloatField;
    con_menudetgras: TFloatField;
    con_menudes: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_eliClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_modClick(Sender: TObject);
    procedure grid_menuDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmenu: Tfrmmenu;

implementation

uses frmacces, frmunmenu, frmmodimenu;

{$R *.dfm}

procedure Tfrmmenu.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmmenu.BitBtn6Click(Sender: TObject);
begin
  calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmmenu.BitBtn5Click(Sender: TObject);
begin
  frmunmen.tb_menu.Close;
  frmunmen.tb_menu.Open;
  frmunmen.tb_menu.FindLast;
  frmunmen.tb_menu.Append;
  frmunmen.ShowModal;
  con_menu.Close;
  con_menu.Open;
end;

procedure Tfrmmenu.FormShow(Sender: TObject);
begin
con_menu.Close;
con_menu.Open;
grid_menu.SetFocus;
end;

procedure Tfrmmenu.bt_eliClick(Sender: TObject);
begin

if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
    if  MessageDlg('Desea Eliminar el Menu..:'+con_menu.fieldbyname('num').AsString,
        mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
           con_menudet.Close;
           con_menudet.Params[0].AsInteger:=con_menu.fieldbyname('num').Asinteger;
           con_menudet.Params[1].AsInteger:=con_menu.fieldbyname('modal').Asinteger;
           con_menudet.Open;
           if not  con_menudet.IsEmpty then
           begin
               borra_menudet.Close;
               borra_menudet.Params[0].AsInteger:=con_menu.fieldbyname('num').Asinteger;
               borra_menudet.Params[1].AsInteger:=con_menu.fieldbyname('modal').Asinteger;
               borra_menudet.ExecSQL;
           end;
           con_menu.Delete;
    end;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmmenu.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_delete then
   bt_eliClick(Sender);
end;

procedure Tfrmmenu.bt_modClick(Sender: TObject);
begin
   frmmodmenu.ShowModal;
end;

procedure Tfrmmenu.grid_menuDblClick(Sender: TObject);
begin
bt_modClick(Sender);
end;

end.
