unit frmacces;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ZConnection, Mask, ExtCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Animate, GIFCtrl, jpeg,
  IdBaseComponent, IdComponent, IdTCPServer, IdCustomHTTPServer,
  IdHTTPServer, HTTPApp, OleCtrls, SHDocVw;

type
  Tfrmacceso = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    clave: TMaskEdit;
    usuario: TEdit;
    con_usu: TZQuery;
    datauscla: TDataSource;
    bt_acepta: TBitBtn;
    bt_salir: TBitBtn;
    Shape1: TShape;
    Image1: TImage;
    Shape2: TShape;
    Image2: TImage;
    dataedo: TDataSource;
    act_edo: TZQuery;
    Image3: TImage;
    conex_dbp: TZConnection;
    procedure bt_salirClick(Sender: TObject);
    procedure bt_aceptaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmacceso: Tfrmacceso;

implementation

uses frmppal, unitfrmbecas;

{$R *.dfm}

procedure Tfrmacceso.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmacceso.bt_aceptaClick(Sender: TObject);
begin
 con_usu.Close;
 con_usu.Params[0].AsString:=usuario.Text;
 con_usu.Params[1].AsString:=clave.Text;
 con_usu.Open;           
 if not con_usu.IsEmpty then
 begin
   if con_usu.FieldByName('activo').AsInteger=0 then
   begin
      act_edo.Close;
      act_edo.Params[0].AsInteger:=1;
      act_edo.Params[1].Asstring:=con_usu.FieldByName('login').Asstring;
      act_edo.Params[2].Asstring:=con_usu.FieldByName('clave').Asstring;
      act_edo.ExecSQL;

      frmprin.bs.Panels[0].Text:='USUARIO : '+usuario.Text;
      frmprin.ShowModal;
   end
   else
   begin
    application.MessageBox('Usuario Ya Conectado...!','Mensaje al Usuario',32);
    close;
   end;
 end
 else
 begin
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
   usuario.Clear;
   clave.Clear;
   usuario.SetFocus;

 end;
 end;

procedure Tfrmacceso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
begin
key:=0;                                            
if  (usuario.Text='') then
        usuario.SetFocus
   else
   begin
       if  (clave.Text='') then
          clave.SetFocus
       else
           bt_acepta.SetFocus;
   end;
end;
end;



procedure Tfrmacceso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if  (usuario.Text <>'') and (clave.Text <>'') then
begin
 act_edo.Close;
 act_edo.Params[0].AsInteger:=0;
 act_edo.Params[1].Asstring:=usuario.Text;
 act_edo.Params[2].Asstring:=clave.Text;
 act_edo.ExecSQL;
 con_usu.close;
end;
end;

end.
