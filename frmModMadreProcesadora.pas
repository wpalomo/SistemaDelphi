unit frmModMadreProcesadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZDataset, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, ToolEdit, RXDBCtrl;

type
  TfrmModMadreProcesadora = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Cedula: TDBEdit;
    GroupBox2: TGroupBox;
    Nombre: TDBEdit;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox9: TGroupBox;
    cmdAceptar: TBitBtn;
    cmdCancelar: TBitBtn;
    data_empleados: TDataSource;
    tb_empleados: TZTable;
    GroupBox4: TGroupBox;
    dirmadp: TDBEdit;
    GroupBox6: TGroupBox;
    parrmadp: TDBEdit;
    GroupBox7: TGroupBox;
    nrepmadp: TDBEdit;
    FecNac: TDBDateEdit;
    EdoCivil: TDBComboBox;
    FecIng: TDBDateEdit;
    procedure cmdAceptarClick(Sender: TObject);
    procedure cmdCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nrepmadpKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  objfrmModMadreProcesadora: TfrmModMadreProcesadora;

implementation

uses frmacces, frmRegistrarMadres;

{$R *.dfm}

procedure TfrmModMadreProcesadora.cmdAceptarClick(Sender: TObject);
begin
 if cedula.GetTextLen=0 then
begin
   messagebox(0,'Debe ingresar Cédula...! ','Mensaje al Usuario',16);
   cedula.SetFocus
end
else
begin
   if  nombre.GetTextLen=0 then
   begin
        messagebox(0,'Debe ingresar Nombre...! ','Mensaje al Usuario',16);
        nombre.SetFocus;
   end
   else
   begin
      if  edocivil.GetTextLen=0 then
      begin
         messagebox(0,'Debe ingresar Estado Civil...! ','Mensaje al Usuario',16);
         edocivil.SetFocus;
      end
      else
      begin
         if dirmadp.GetTextLen=0 then
         begin
           messagebox(0,'Debe ingresar Dirección...! ','Mensaje al Usuario',16);
           dirmadp.SetFocus;
         end
         else
         begin
            if parrmadp.GetTextLen=0 then
            begin
               messagebox(0,'Debe ingresar Parroquia...! ','Mensaje al Usuario',16);
               parrmadp.SetFocus;
            end
            else
            begin
               if nrepmadp.GetTextLen=0 then
               begin
                  messagebox(0,'Debe ingresar Nro de Representado...! ','Mensaje al Usuario',16);
                  nrepmadp.SetFocus;
               end
               else
               begin
                   tb_empleados.FieldByName('QUIENINGRESAMAD').AsString:=frmacceso.usuario.Text;
                   tb_empleados.Post;
                   tb_empleados.close;
                   close;
               end;
            end;
         end;
      end;
    end;
  end;
end;

procedure TfrmModMadreProcesadora.cmdCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmModMadreProcesadora.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure TfrmModMadreProcesadora.nrepmadpKeyPress(Sender: TObject;
  var Key: Char);
begin
case key of
      #48..#57:;
      #8:;
else
      key:=#0;
end;
end;

end.

