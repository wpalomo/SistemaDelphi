unit frmbusprov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, StdCtrls, dxTL, dxDBCtrl, dxDBGrid, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Buttons, dxCntner;

type
  Tfrmbuscaprov = class(TForm)
    grid_prov: TdxDBGrid;
    BitBtn1: TBitBtn;
    con_prov: TZQuery;
    dataprov: TDataSource;
    grid_provid: TdxDBGridMaskColumn;
    grid_provnom: TdxDBGridMaskColumn;
    GroupBox1: TGroupBox;
    prov: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure provKeyPress(Sender: TObject; var Key: Char);
    procedure grid_provDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbuscaprov: Tfrmbuscaprov;

implementation

uses frmacces, frmcaja;

{$R *.dfm}

procedure Tfrmbuscaprov.BitBtn1Click(Sender: TObject);
begin
con_prov.Close;
close;
end;

procedure Tfrmbuscaprov.FormShow(Sender: TObject);
begin
 prov.Text:='';
 con_prov.Close;
 con_prov.Params[0].asstring:='%'+prov.Text+'%';
 con_prov.Open;
 prov.SetFocus;
end;

procedure Tfrmbuscaprov.provKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
 con_prov.Close;
 con_prov.Params[0].asstring:='%'+prov.Text+'%';
 con_prov.Open;

end;
end;

procedure Tfrmbuscaprov.grid_provDblClick(Sender: TObject);
begin
frmcajas.prov.Text:=con_prov.fieldbyname('nom').AsString;
frmcajas.codtxt.Text:=inttostr(con_prov.fieldbyname('id').Asinteger);
close;
end;

end.
