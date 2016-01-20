unit frmobser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfrmobs = class(TForm)
    obs: TMemo;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    ced: TLabel;
    nom: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    coddep: TLabel;
    desdep: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmobs: Tfrmobs;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmobs.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
