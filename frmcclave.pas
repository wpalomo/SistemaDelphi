unit frmcclave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons, jpeg, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  Tfrmcamclave = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    GroupBox1: TGroupBox;
    c_ant: TMaskEdit;
    GroupBox2: TGroupBox;
    c_new: TMaskEdit;
    bt_aceptar: TBitBtn;
    bt_salir: TBitBtn;
    dataclave: TDataSource;
    cclave: TZQuery;
    con_cant: TZQuery;
    dataca: TDataSource;
    act_edo: TZQuery;
    dataedo: TDataSource;
    procedure bt_salirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure c_antKeyPress(Sender: TObject; var Key: Char);
    procedure c_newKeyPress(Sender: TObject; var Key: Char);
    procedure bt_aceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcamclave: Tfrmcamclave;

implementation

uses frmacces, frmacercade;

{$R *.dfm}

procedure Tfrmcamclave.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmcamclave.FormShow(Sender: TObject);
begin
c_ant.SetFocus;
end;

procedure Tfrmcamclave.c_antKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
   con_cant.Close;
   con_cant.Params[0].AsString:=c_ant.Text;
   con_cant.Open;
   if con_cant.IsEmpty then
   begin
      messagebox(0,'Debe ingresar una clave Válida...!','Mensaje al Usuario',16);
      c_ant.Clear;
      c_ant.SetFocus;
   end
   else
       c_new.SetFocus;
end;
end;

procedure Tfrmcamclave.c_newKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   bt_aceptar.SetFocus;
end;

procedure Tfrmcamclave.bt_aceptarClick(Sender: TObject);
begin
if (c_ant.Text<>'') and (c_new.Text<>'') then
begin
  cclave.Close;
  cclave.Params[0].AsString:=c_new.Text;
  cclave.Params[1].asstring:=frmacceso.usuario.Text;
  cclave.ExecSQL;
  close;
end
else
begin
   if c_ant.Text='' then c_ant.SetFocus
   else
   begin
       if c_new.Text='' then c_new.SetFocus;
   end;
end;
end;

procedure Tfrmcamclave.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if (c_ant.Text<>'') and (c_new.Text<>'') then
begin
 act_edo.Close;
 act_edo.Params[0].AsInteger:=0;
 act_edo.Params[1].Asstring:=frmacceso.usuario.Text;
 act_edo.Params[2].Asstring:=c_new.Text;
 act_edo.ExecSQL;
 frmacceso.Close;
end;
end;

end.
