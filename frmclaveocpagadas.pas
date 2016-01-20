unit frmclaveocpagadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask;

type
  Tfrmclavepago = class(TForm)
    clave: TMaskEdit;
    Label1: TLabel;
    procedure claveKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmclavepago: Tfrmclavepago;

implementation

{$R *.dfm}

procedure Tfrmclavepago.claveKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
 begin
    close;
 end;
end;

procedure Tfrmclavepago.FormShow(Sender: TObject);
begin
   clave.Clear;
end;

end.
