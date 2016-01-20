unit frmrepbnac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tfrmrepbn = class(TForm)
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrepbn: Tfrmrepbn;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmrepbn.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0;
end;

end.
