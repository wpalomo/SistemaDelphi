unit frmlistaprod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, dxExEdtr,
  StdCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls, Buttons;

type
  Tlisprod = class(TForm)
    con_prod: TZQuery;
    datap: TDataSource;
    grid_p: TdxDBGrid;
    grid_pid: TdxDBGridMaskColumn;
    grid_pnom: TdxDBGridMaskColumn;
    grid_pimp: TdxDBGridMaskColumn;
    grid_pcal: TdxDBGridMaskColumn;
    grid_ppro: TdxDBGridMaskColumn;
    grid_pgra: TdxDBGridMaskColumn;
    grid_pfac: TdxDBGridMaskColumn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    function esnum(NumStr : string) : bool;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grid_pDblClick(Sender: TObject);
  private
    { Private declarations }
  public
     v1:integer;
     v2:string;
     v3,v4,v5,v6,v7:double;

    { Public declarations }
  end;

var
  lisprod: Tlisprod;

implementation

uses frmbus, frmunmenu;

{$R *.dfm}
function Tlisprod.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
        end;
end;

procedure Tlisprod.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if key=vk_return then
begin
   v1:=con_prod.FieldByName('id').AsInteger;
   v2:=con_prod.FieldByName('nom').Asstring;
   v3:=con_prod.FieldByName('fac').Asfloat;
   v4:=con_prod.FieldByName('cal').Asfloat;
   v5:=con_prod.FieldByName('pro').Asfloat;
   v6:=con_prod.FieldByName('gra').Asfloat;
   close;
end;

if key=27 then
begin
   close;
end;

end;

procedure Tlisprod.BitBtn2Click(Sender: TObject);
begin
  frmbuscar.ShowModal;
  if esnum(frmbuscar.bus.Text) then
  begin
    con_prod.Close;
    con_prod.SQL.Text:='select * from productos where id like :c';
    con_prod.params[0].AsString:=frmbuscar.bus.Text+'%';
    con_prod.open;
  end
  else
  begin
    con_prod.Close;
    con_prod.SQL.Text:='select * from productos where nom like :n';
    con_prod.params[0].AsString:='%'+frmbuscar.bus.Text+'%';
    con_prod.open;
  end;
  grid_p.SetFocus;
end;

procedure Tlisprod.FormShow(Sender: TObject);
begin
   v1:=0;
   v2:='';
   v3:=0;
   v4:=0;
   v5:=0;
   v6:=0;
con_prod.Close;
con_prod.Open;
end;

procedure Tlisprod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
con_prod.Close;
end;

procedure Tlisprod.grid_pDblClick(Sender: TObject);
var
Key: Word;
Shift: TShiftState;
begin
key:=vk_return;
  FormKeyDown(grid_p,key,Shift);

end;

end.
