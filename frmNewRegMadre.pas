unit frmNewRegMadre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZDataset, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, dxCntner, dxEditor,
  dxExEdtr, dxEdLib, dxDBELib, ToolEdit, RXDBCtrl;

type
  TfrmNewRegMadre = class(TForm)
    data_empleados: TDataSource;
    tb_empleados: TZTable;
    Panel1: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox9: TGroupBox;
    Cedula: TDBEdit;
    Nombre: TDBEdit;
    cmdAceptar: TBitBtn;
    cmdCancelar: TBitBtn;
    GroupBox4: TGroupBox;
    dirmadp: TDBEdit;
    GroupBox6: TGroupBox;
    parrmadp: TDBEdit;
    GroupBox7: TGroupBox;
    nrepmadp: TDBEdit;
    con_emp: TZQuery;
    data_conemp: TDataSource;
    FecNac: TDBDateEdit;
    FecIng: TDBDateEdit;
    EdoCivil: TDBComboBox;
    procedure cmdAceptarClick(Sender: TObject);
    procedure cmdCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure nrepmadpKeyPress(Sender: TObject; var Key: Char);
    procedure CedulaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CedulaKeyPress(Sender: TObject; var Key: Char);
    procedure EdoCivilKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  objfrmNewRegMadre: TfrmNewRegMadre;

implementation

uses frmacces;

{$R *.dfm}






procedure TfrmNewRegMadre.cmdAceptarClick(Sender: TObject);
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
     if  fecnac.Date=0 then
     begin
        messagebox(0,'Debe ingresar Fecha de Nacimiento...! ','Mensaje al Usuario',16);
         fecnac.SetFocus;
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
        if  fecing.date=0 then
        begin
           messagebox(0,'Debe ingresar Fecha de Ingreso...! ','Mensaje al Usuario',16);
           fecing.SetFocus;
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
                  tb_empleados.FieldByName('FEC_ACTUALIZACION').AsString := DateToStr(Date);
                  tb_empleados.FieldByName('TMP').AsString  :='S';
                  tb_empleados.FieldByName('SEXO').AsString :='FEMENINO';
                  tb_empleados.FieldByName('CARGO').AsString :='MADRE PROCESADORA';
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
end;
end;



procedure TfrmNewRegMadre.cmdCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmNewRegMadre.FormShow(Sender: TObject);
begin
 cedula.SetFocus;
end;

procedure TfrmNewRegMadre.nrepmadpKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #8:;
else
      key:=#0;
end;
end;

procedure TfrmNewRegMadre.CedulaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
   con_emp.Close;
   con_emp.Params[0].AsInteger:=strtoint(cedula.Text);
   con_emp.Open;
   if not con_emp.IsEmpty then
   begin
     messagebox(0,'Madre Procesadora ya registrada ingrese otra cédula...! ','Mensaje al Usuario',16);
     cedula.Clear;
     cedula.SetFocus;
   end
   else
   begin
     nombre.SetFocus;
   end;


end;
end;

procedure TfrmNewRegMadre.CedulaKeyPress(Sender: TObject; var Key: Char);
begin
    case key of
       #48..#57:;
       #8:;
    else
      key:=#0;

    end;
end;

procedure TfrmNewRegMadre.EdoCivilKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then key:=#0; 
end;

procedure TfrmNewRegMadre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

end.
