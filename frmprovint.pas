unit frmprovint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, RxCalc, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, Buttons, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  ExtCtrls, Mask, ToolEdit, CurrEdit, ComCtrls, jpeg;

type
  Tfrmproveint = class(TForm)
    Shape2: TShape;
    Shape1: TShape;
    Image1: TImage;
    Label1: TLabel;
    ctrl_tab: TPageControl;
    tab1: TTabSheet;
    GroupBox1: TGroupBox;
    pro: TEdit;
    GroupBox2: TGroupBox;
    rif: TEdit;
    GroupBox3: TGroupBox;
    tel: TEdit;
    GroupBox4: TGroupBox;
    ck_imp: TCheckBox;
    inu: TRxCalcEdit;
    GroupBox5: TGroupBox;
    bt_buscar: TBitBtn;
    bt_nuevo: TBitBtn;
    bt_mod: TBitBtn;
    bt_eli: TBitBtn;
    bt_salir: TBitBtn;
    bt_cal: TBitBtn;
    con_provint: TZQuery;
    dataprodint: TDataSource;
    calculadora: TRxCalculator;
    con_pro: TZQuery;
    datproint: TDataSource;
    eli_prov: TZQuery;
    dataelip: TDataSource;
    bt_guardar: TBitBtn;
    GroupBox7: TGroupBox;
    ced: TEdit;
    GroupBox6: TGroupBox;
    cel: TEdit;
    pze: TRxCalcEdit;
    GroupBox8: TGroupBox;
    rpl: TEdit;
    p1: TPanel;
    gridp: TdxDBGrid;
    gridpid: TdxDBGridMaskColumn;
    gridpnom: TdxDBGridMaskColumn;
    procedure bt_salirClick(Sender: TObject);
    procedure bt_calClick(Sender: TObject);
    procedure bt_buscarClick(Sender: TObject);
    procedure gridpDblClick(Sender: TObject);
    function esnum(NumStr : string) : bool;
    procedure bt_eliClick(Sender: TObject);
    procedure bt_modClick(Sender: TObject);
    procedure bt_nuevoClick(Sender: TObject);
    procedure bt_guardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure proKeyPress(Sender: TObject; var Key: Char);
    procedure rifKeyPress(Sender: TObject; var Key: Char);
    procedure cedKeyPress(Sender: TObject; var Key: Char);
    procedure telKeyPress(Sender: TObject; var Key: Char);
    procedure celKeyPress(Sender: TObject; var Key: Char);
    procedure inuKeyPress(Sender: TObject; var Key: Char);
    procedure pzeKeyPress(Sender: TObject; var Key: Char);
    procedure gridpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ck_impKeyPress(Sender: TObject; var Key: Char);
    procedure rplKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmproveint: Tfrmproveint;

implementation

uses frmbus, frmacces;

{$R *.dfm}

function Tfrmproveint.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
        end;
end;

procedure Tfrmproveint.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmproveint.bt_calClick(Sender: TObject);
begin
 calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmproveint.bt_buscarClick(Sender: TObject);
var
  buscar: string;
begin

       frmbuscar.ShowModal;
       buscar:=frmbuscar.bus.Text;
       con_pro.close;
       if esnum(buscar)=false then
       begin
         con_pro.Close;
         con_pro.SQL.Text:='select * from proveedores_oc_int where nom like :n';
         con_pro.Params[0].AsString:='%'+buscar+'%';
         con_pro.Open;
         if not con_pro.IsEmpty then
         begin
           p1.Visible:=true;
           gridp.SetFocus;
         end
         else
         begin
           application.MessageBox('Producto no encontrado...!','Mensaje al Usuario',16);
           p1.Visible:=false;
           bt_buscar.SetFocus;
         end;
       end
       else
       begin
          con_pro.Close;
          con_pro.SQL.Text:='select * from proveedores_oc_int where id like :c';
          con_pro.Params[0].AsString:=buscar+'%';
          con_pro.Open;
          if not con_pro.IsEmpty then
          begin
           p1.Visible:=true;
           gridp.SetFocus;
          end
          else
          begin
           application.MessageBox('Proveedor no encontrado...!','Mensaje al Usuario',16);
           p1.Visible:=false;
           bt_buscar.SetFocus;
          end;
       end;


end;

procedure Tfrmproveint.gridpDblClick(Sender: TObject);
begin
 pro.Text:= con_pro.FieldByName('nom').AsString;
 rif.Text:= con_pro.FieldByName('rif').AsString;
 ced.Text:=con_pro.FieldByName('ced').AsString;
 tel.Text:=con_pro.FieldByName('tel').AsString;
 cel.Text:=con_pro.FieldByName('cel').AsString;
 if con_pro.FieldByName('imp').AsString='S' then
    ck_imp.Checked:=true
 else
    ck_imp.Checked:=false;

 inu.Text:=con_pro.FieldByName('impx100').AsString;
 pze.Text:=con_pro.FieldByName('pzo_ent').AsString;
 rpl.Text:=con_pro.FieldByName('rleg').AsString;
 p1.Visible:=false;
 bt_buscar.SetFocus;
end;

procedure Tfrmproveint.bt_eliClick(Sender: TObject);
begin
if pro.Text<>'' then
begin

if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) then
begin

    if  MessageDlg('¿Esta Seguro de Eliminar el Proveedor: '+con_pro.fieldbyname('nom').AsString+ ' ?',
        mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
          eli_prov.Close;
          eli_prov.Params[0].AsInteger:=con_pro.fieldbyname('id').AsInteger;
          eli_prov.ExecSQL;

          pro.Clear;
          rif.Clear;
          ced.Clear;
          tel.Clear;
          cel.Clear;
          ck_imp.Checked:=false;
          inu.Clear;
          pze.Clear;
          rpl.Clear;

          application.MessageBox('Proveedor Eliminado...!','Mensaje al Usuario',32);
          bt_buscar.SetFocus;
    end;

end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;
end;

procedure Tfrmproveint.bt_modClick(Sender: TObject);
begin
 if pro.Text<>'' then
begin
   con_pro.Edit;
   con_pro.FieldByName('nom').AsString:=pro.Text;
   con_pro.FieldByName('rif').AsString:=rif.Text;

   con_pro.FieldByName('ced').Asstring:=ced.Text;
   con_pro.FieldByName('tel').Asstring:=tel.Text;
   con_pro.FieldByName('cel').Asstring:=cel.Text;

   if ck_imp.Checked then
   begin
      con_pro.FieldByName('imp').asstring:='S';
      con_pro.FieldByName('impx100').asfloat:=inu.Value;
   end
   else
   begin
     con_pro.FieldByName('imp').asstring:='N';
     con_pro.FieldByName('impx100').Asfloat:=inu.Value;
   end;

   con_pro.FieldByName('pzo_ent').Asfloat:=pze.Value;
   con_pro.FieldByName('rleg').Asstring:=rpl.Text;
   con_pro.Post;
   pro.SetFocus;
 end;
end;

procedure Tfrmproveint.bt_nuevoClick(Sender: TObject);
begin
  bt_guardar.Enabled:=true;
  pro.Clear;
  rif.Clear;
  ced.Clear;
  tel.Clear;
  cel.Clear;
  ck_imp.Checked:=false;
  inu.Clear;
  pze.Clear;
  rpl.Clear;
  pro.SetFocus;
end;

procedure Tfrmproveint.bt_guardarClick(Sender: TObject);
begin
if pro.Text<>'' then
begin
 con_pro.Close;
 con_pro.Open;
 con_pro.Append;
 con_pro.Edit;

  con_pro.FieldByName('nom').AsString:=pro.Text;
  con_pro.FieldByName('rif').AsString:=rif.Text;
  con_pro.FieldByName('ced').Asstring:=ced.Text;
  con_pro.FieldByName('impx100').Asfloat:= inu.Value;
  if   ck_imp.Checked then
    con_pro.FieldByName('imp').AsString:='S'
  else
    con_pro.FieldByName('imp').AsString:='N';
  con_pro.FieldByName('tel').Asstring:=tel.Text;
  con_pro.FieldByName('cel').asstring:=cel.Text;
  con_pro.FieldByName('pzo_ent').asfloat:=pze.Value;
  con_pro.FieldByName('rleg').asstring:=rpl.Text;
  con_pro.Post;
  bt_guardar.Enabled:=false;
  bt_buscar.SetFocus;
 end;  
end;

procedure Tfrmproveint.FormShow(Sender: TObject);
begin
  pro.Clear;
  rif.Clear;
  ced.Clear;
  tel.Clear;
  cel.Clear;
  ck_imp.Checked:=false;
  inu.Clear;
  pze.Clear;
  rpl.Clear;
  bt_buscar.SetFocus;
 end;

procedure Tfrmproveint.proKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then                          { if it's an enter key }
   begin
       Key := #0;                                 { eat enter key }
       Perform(WM_NEXTDLGCTL, 0, 0);              { move to next control }
   end
end;

procedure Tfrmproveint.rifKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then                          { if it's an enter key }
   begin
       Key := #0;                                 { eat enter key }
       Perform(WM_NEXTDLGCTL, 0, 0);              { move to next control }
   end
end;

procedure Tfrmproveint.cedKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then                          { if it's an enter key }
   begin
       Key := #0;                                 { eat enter key }
       Perform(WM_NEXTDLGCTL, 0, 0);              { move to next control }
   end
end;

procedure Tfrmproveint.telKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then                          { if it's an enter key }
   begin
       Key := #0;                                 { eat enter key }
       Perform(WM_NEXTDLGCTL, 0, 0);              { move to next control }
   end
end;

procedure Tfrmproveint.celKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then                          { if it's an enter key }
   begin
       Key := #0;                                 { eat enter key }
       Perform(WM_NEXTDLGCTL, 0, 0);              { move to next control }
   end
end;

procedure Tfrmproveint.inuKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then                          { if it's an enter key }
   begin
       Key := #0;                                 { eat enter key }
       Perform(WM_NEXTDLGCTL, 0, 0);              { move to next control }
   end
end;

procedure Tfrmproveint.pzeKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then                          { if it's an enter key }
   begin
       Key := #0;                                 { eat enter key }
       Perform(WM_NEXTDLGCTL, 0, 0);              { move to next control }
   end
end;

procedure Tfrmproveint.gridpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_escape then
begin
   p1.Visible:=false;
   bt_buscar.SetFocus;
end;
if key=vk_return then
begin
  gridpDblClick(Sender);
end;
end;

procedure Tfrmproveint.ck_impKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then                          { if it's an enter key }
   begin
       Key := #0;                                 { eat enter key }
       Perform(WM_NEXTDLGCTL, 0, 0);              { move to next control }
   end
end;

procedure Tfrmproveint.rplKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then                          { if it's an enter key }
   begin
       Key := #0;                                 { eat enter key }
       bt_buscar.SetFocus;
   end
end;

end.
