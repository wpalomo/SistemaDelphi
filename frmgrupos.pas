unit frmgrupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, Buttons, ExtCtrls;

type
  Tfrmgrup = class(TForm)
    tregrup: TTreeView;
    con_grupos: TZQuery;
    datagrup: TDataSource;
    bt_salir: TBitBtn;
    Shape2: TShape;
    Label1: TLabel;
    Shape1: TShape;
    procedure tregrupDblClick(Sender: TObject);
    procedure tregrupClick(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    grp:integer;
  end;

var
  frmgrup: Tfrmgrup;

implementation

uses frmacces, frmusuarios;

{$R *.dfm}

procedure Tfrmgrup.tregrupDblClick(Sender: TObject);
var
t: ttreenode;
begin
  con_grupos.Close;
  con_grupos.Open;
  con_grupos.FindFirst;
   t := TTreeView(Sender).Selected;
   if (t.Level=0) and (t.Count=0) then
   begin
     while not con_grupos.Eof do
     begin
       tregrup.Items.AddChild(t,con_grupos.fieldbyname('nom').AsString);
       con_grupos.Next;
     end;
     t.Expand(true);
   end;
end;

procedure Tfrmgrup.tregrupClick(Sender: TObject);
var t:ttreenode;
    ind:integer;
begin
 t := TTreeView(Sender).Selected;
 if t.Level=1 then
 begin
      ind:=tregrup.Selected.Index+1;
      grp:=ind;
      frmman.ShowModal;
 end;
end;

procedure Tfrmgrup.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmgrup.FormShow(Sender: TObject);
begin
tregrup.SetFocus;
end;

end.
