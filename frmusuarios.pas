unit frmusuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZDataset, StdCtrls, ExtCtrls, dxExEdtr,
  dxTL, dxDBCtrl, dxDBGrid, Buttons, dxCntner, ZAbstractDataset,
  ZAbstractTable;

type
  Tfrmman = class(TForm)
    datausuarios: TDataSource;
    bt_salir: TBitBtn;
    con_usuarios: TZQuery;
    Shape2: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    gridus: TdxDBGrid;
    gridusID: TdxDBGridMaskColumn;
    gridusCEDULA: TdxDBGridMaskColumn;
    gridusNOMBRE: TdxDBGridMaskColumn;
    gridusLOGIN: TdxDBGridMaskColumn;
    gridusNIVEL: TdxDBGridMaskColumn;
    gridusCODGRUPO: TdxDBGridMaskColumn;
    gridusCLAVE: TdxDBGridMaskColumn;
    Shape1: TShape;
    procedure bt_salirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmman: Tfrmman;

implementation

uses frmppal, frmacces, frmgrupos;

{$R *.dfm}

procedure Tfrmman.bt_salirClick(Sender: TObject);
begin
con_usuarios.Close;
close;
end;

procedure Tfrmman.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_delete then
begin
 if  MessageDlg('Esta Segur@ de Eliminar a:'+ con_usuarios.fieldbyname('NOMBRE').asstring,
        mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
        if not con_usuarios.IsEmpty then
           con_usuarios.Delete;
    end;
end;
end;

procedure Tfrmman.FormShow(Sender: TObject);
begin
label3.Caption:=inttostr(frmgrup.grp);
con_usuarios.Params[0].Asinteger:=frmgrup.grp;
con_usuarios.Open;
gridus.SetFocus;
end;

end.
