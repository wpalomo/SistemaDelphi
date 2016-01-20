unit frmacercade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, dxCntner, dxEditor, dxExEdtr,
  dxEdLib,ShellApi;

type
  Tfrmacerde = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    enlace: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure enlaceDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmacerde: Tfrmacerde;

implementation

{$R *.dfm}

procedure Tfrmacerde.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmacerde.enlaceDblClick(Sender: TObject);
const
URL = 'http://bolivar.me.gob.ve';
begin
ShellExecute(Handle,'open',URL,nil,nil,SW_SHOWNORMAL);

end;

end.
