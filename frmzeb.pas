unit frmzeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset;

type
  Tfrmzona = class(TForm)
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    tb_zona: TZTable;
    datazona: TDataSource;
    GroupBox1: TGroupBox;
    dzon: TDBEdit;
    GroupBox4: TGroupBox;
    DBEdit3: TDBEdit;
    GroupBox2: TGroupBox;
    DBEdit2: TDBEdit;
    GroupBox5: TGroupBox;
    DBEdit5: TDBEdit;
    GroupBox3: TGroupBox;
    anno: TDBEdit;
    GroupBox6: TGroupBox;
    uadm: TDBEdit;
    GroupBox7: TGroupBox;
    ueje: TDBEdit;
    GroupBox8: TGroupBox;
    mun: TDBEdit;
    GroupBox9: TGroupBox;
    DBEdit9: TDBEdit;
    GroupBox10: TGroupBox;
    DBEdit10: TDBEdit;
    GroupBox11: TGroupBox;
    DBEdit11: TDBEdit;
    GroupBox12: TGroupBox;
    DBEdit12: TDBEdit;
    GroupBox13: TGroupBox;
    DBEdit13: TDBEdit;
    GroupBox14: TGroupBox;
    imp_gen: TDBEdit;
    Shape1: TShape;
    Shape2: TShape;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmzona: Tfrmzona;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmzona.BitBtn1Click(Sender: TObject);
begin
tb_zona.Cancel;
close;
end;

procedure Tfrmzona.BitBtn2Click(Sender: TObject);
begin
tb_zona.Edit;
tb_zona.Post;
close;
end;

procedure Tfrmzona.FormClose(Sender: TObject; var Action: TCloseAction);
begin
tb_zona.Close;
close;
end;

procedure Tfrmzona.FormShow(Sender: TObject);
begin
tb_zona.Open;
dzon.SetFocus;
end;

procedure Tfrmzona.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

end.
