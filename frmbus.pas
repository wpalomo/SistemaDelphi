unit frmbus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tfrmbuscar = class(TForm)
    bus: TEdit;
    procedure busKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbuscar: Tfrmbuscar;

implementation

uses frmacces, frmmovi;

{$R *.dfm}

procedure Tfrmbuscar.busKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   close;
end;

procedure Tfrmbuscar.FormShow(Sender: TObject);
begin
bus.Clear;
end;

end.
