unit frmmanordpago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Menus, DB, ZAbstractRODataset,
  ZDataset, ExtCtrls, ZAbstractDataset, ZAbstractTable, Mask, ToolEdit,
  CurrEdit;

type
  Tfrmordenpago = class(TForm)
    GroupBox1: TGroupBox;
    nro: TEdit;
    GroupBox2: TGroupBox;
    fecha: TDateTimePicker;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    BitBtn5: TBitBtn;
    bt_eli: TBitBtn;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    Monto1: TMenuItem;
    Monto2: TMenuItem;
    con_opa: TZReadOnlyQuery;
    dataopa: TDataSource;
    Panel1: TPanel;
    Image1: TImage;
    BitBtn2: TBitBtn;
    con_nrop: TZReadOnlyQuery;
    datanrop: TDataSource;
    tb_op: TZTable;
    dataop: TDataSource;
    GroupBox5: TGroupBox;
    ck_s: TRadioButton;
    act_oac: TZReadOnlyQuery;
    dataoac: TDataSource;
    eli_op: TZReadOnlyQuery;
    dataeliop: TDataSource;
    GroupBox6: TGroupBox;
    vie: TRxCalcEdit;
    GroupBox7: TGroupBox;
    van: TRxCalcEdit;
    monto: TRxCalcEdit;
    saldo: TRxCalcEdit;
    BitBtn3: TBitBtn;
    modedo: TZReadOnlyQuery;
    dataedo: TDataSource;
    suma: TSpeedButton;
    resta: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    proy: TEdit;
    ueje: TEdit;
    accion: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    function esnum(NumStr : string) : bool;
    procedure Monto1Click(Sender: TObject);
    procedure Monto2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure nroKeyPress(Sender: TObject; var Key: Char);
    procedure montoKeyPress(Sender: TObject; var Key: Char);
    procedure saldoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nroExit(Sender: TObject);
    procedure montoExit(Sender: TObject);
    procedure t(Sender: TObject);
    procedure fechaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure bt_eliClick(Sender: TObject);
    procedure ck_sKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure sumaClick(Sender: TObject);
    procedure restaClick(Sender: TObject);
    procedure proyKeyPress(Sender: TObject; var Key: Char);
    procedure accionKeyPress(Sender: TObject; var Key: Char);
    procedure uejeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
     aux:double;
  public
    { Public declarations }
  end;

var
  frmordenpago: Tfrmordenpago;

implementation

uses frmacces, frmbus;

{$R *.dfm}
function Tfrmordenpago.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
         end;
end;

procedure Tfrmordenpago.BitBtn1Click(Sender: TObject);
begin
close;
tb_op.Close;
act_oac.Close;
eli_op.Close;
end;

procedure Tfrmordenpago.Monto1Click(Sender: TObject);
var
buscar : string;
begin
 frmbuscar.ShowModal;
       buscar:=frmbuscar.bus.Text;
       con_opa.close;
       if esnum(buscar)=true then
       begin
         con_opa.Close;
         con_opa.SQL.Text:='select * from ordenpago where nro like :n order by monto';
         con_opa.Params[0].AsString:='%'+buscar+'%';
         con_opa.Open;
         if  con_opa.IsEmpty then
         begin
             application.MessageBox('No existen ordenes de pago registradas...!','Mensaje Al Usuario',32);
             nro.ReadOnly:=false;
             nro.Text:='0';
             fecha.Date:=date;
             monto.Text:='0';
             saldo.Text:='0';

             ck_s.Checked:=true;
             vie.Text:='0';
             van.Text:='0';
         end
         else
         begin
             nro.ReadOnly:=false;
             monto.ReadOnly:=false;
             saldo.ReadOnly:=false;
             fecha.Enabled:=true;
             nro.Text:=formatfloat('#,##0',(con_opa.FieldByName('nro').Asinteger));
             monto.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('monto').asfloat));
             fecha.Date:=con_opa.fieldbyname('fecha').AsDateTime;
             saldo.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('saldo').asfloat));
             if con_opa.fieldbyname('activa').asstring='S' then
                ck_s.Checked:=true
             else
               ck_s.Checked:=false;
             vie.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('m_vie').asfloat));
             van.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('m_va').asfloat));
             proy.Text:=con_opa.fieldbyname('proy').AsString;
             accion.Text:=con_opa.fieldbyname('accion').AsString;
             ueje.Text:=con_opa.fieldbyname('ueje').AsString;
         end;
       end
       else
       begin
         application.MessageBox('Debe Ingresar solo digitos...!','Mensaje Al Usuario',16)
       end;
  nro.ReadOnly:=true;
  monto.ReadOnly:=true;
  saldo.ReadOnly:=true;
  proy.ReadOnly:=true;
  accion.ReadOnly:=true;
  ueje.ReadOnly:=true;
  ck_s.Enabled:=false;
  fecha.Enabled:=false;
  suma.Visible:=false;
  resta.Visible:=false;
  nro.SetFocus;

end;

procedure Tfrmordenpago.Monto2Click(Sender: TObject);
var
buscar : string;
begin
  frmbuscar.ShowModal;
       buscar:=frmbuscar.bus.Text;
       con_opa.close;
       if esnum(buscar)=true then
       begin
         con_opa.Close;
         con_opa.SQL.Text:='select * from ordenpago where monto like :n order by monto';
         con_opa.Params[0].AsString:='%'+buscar+'%';
         con_opa.Open;
         if  con_opa.IsEmpty then
         begin
             application.MessageBox('No existen ordenes de pago registradas...!','Mensaje Al Usuario',32);
             nro.ReadOnly:=false;
             nro.Text:='0';
             fecha.Date:=date;
             monto.Text:='0';
             saldo.Text:='0';
             ck_s.Checked:=true;
             vie.Text:='0';
             van.Text:='0';

         end
         else
         begin
             nro.ReadOnly:=false;
             monto.ReadOnly:=false;
             saldo.ReadOnly:=false;
             fecha.Enabled:=true;

             nro.Text:=formatfloat('#,##0',(con_opa.FieldByName('nro').Asinteger));
             monto.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('monto').asfloat));
             fecha.Date:=con_opa.fieldbyname('fecha').AsDateTime;
             saldo.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('saldo').asfloat));
             if con_opa.fieldbyname('activa').asstring='S' then
                ck_s.Checked:=true
             else
               ck_s.Checked:=false;

             vie.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('m_vie').asfloat));
             van.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('m_va').asfloat));
             proy.Text:=con_opa.fieldbyname('proy').AsString;
             accion.Text:=con_opa.fieldbyname('accion').AsString;
             ueje.Text:=con_opa.fieldbyname('ueje').AsString;



         end;
       end
       else
       begin
         application.MessageBox('Debe Ingresar solo digitos...!','Mensaje Al Usuario',16)
       end;
       nro.ReadOnly:=true;
       monto.ReadOnly:=true;
       saldo.ReadOnly:=true;
       proy.ReadOnly:=true;
       accion.ReadOnly:=true;
       ueje.ReadOnly:=true;
       ck_s.Enabled:=false;
       fecha.Enabled:=false;
       suma.Visible:=false;
       resta.Visible:=false;
       nro.SetFocus;
end;

procedure Tfrmordenpago.FormShow(Sender: TObject);
begin

         accion.Text:='001  ATENDER ALIMENTARIAMENTE A 4.055.136 NIÑOS, NIÑAS Y ADOLESCENTES INSCRITOS EN EL SISTEMA EDUCATIVO BOLIVARIANO';
         ueje.Text:='08006 ZONA EDUCATIVA BOLIVAR APOYO ACADÉMICO - PAE';
         aux:=0;
         bitbtn5.Enabled:=false;
         con_opa.Close;
         con_opa.SQL.Text:='select * from ordenpago where activa="S"';
         con_opa.Open;
         if  con_opa.IsEmpty then
         begin
             application.MessageBox('No existen ordenes de pago registradas...!','Mensaje Al Usuario',32);
             nro.Text:='0';
             fecha.Date:=date;
             monto.Text:='0';
             saldo.Text:='0';
             ck_s.Checked:=true;
             suma.Visible:=true;
             resta.Visible:=true;
             vie.Text:='0';
             van.Text:='0';


         end
         else
         begin
             nro.Text:=formatfloat('#,##0',(con_opa.FieldByName('nro').Asinteger));
             monto.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('monto').asfloat));
             fecha.Date:=con_opa.fieldbyname('fecha').AsDateTime;
             if con_opa.fieldbyname('saldo').asfloat >= 0 then
                 saldo.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('saldo').asfloat));
             if con_opa.fieldbyname('activa').asstring='S' then
                ck_s.Checked:=true
             else
               ck_s.Checked:=false;
             vie.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('m_vie').asfloat));
             van.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('m_va').asfloat));
             proy.Text:=con_opa.fieldbyname('proy').AsString;
             accion.Text:=con_opa.fieldbyname('accion').AsString;
             ueje.Text:=con_opa.fieldbyname('ueje').AsString;

             suma.Visible:=false;
             resta.Visible:=false;
             nro.ReadOnly:=true;
             monto.ReadOnly:=true;
             saldo.ReadOnly:=true;
             proy.ReadOnly:=true;
             accion.ReadOnly:=true;
             ueje.ReadOnly:=true;
             fecha.Enabled:=false;
             ck_s.Enabled:=false;
         end;


         

end;

procedure Tfrmordenpago.nroKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #8:;
 else
      key:=#0;
 end;
end;

procedure Tfrmordenpago.montoKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #8:;
      #46:begin
           key:=#44;
          end;
      #13:begin
           proy.SetFocus;
          end; 
 else
      key:=#0;
 end;
end;

procedure Tfrmordenpago.saldoKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #8:;
      #46:;
      #13: if ck_s.Enabled=true then ck_s.SetFocus;

 else
      key:=#0;
 end;
end;

procedure Tfrmordenpago.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 13 then
   begin
       Key := 0;
       Perform(WM_NEXTDLGCTL, 0, 0);
   end
end;

procedure Tfrmordenpago.nroExit(Sender: TObject);
begin
if nro.Text='' then nro.Text:='0';
end;

procedure Tfrmordenpago.montoExit(Sender: TObject);
begin
  if monto.Text='' then
     monto.Text:='0';
  


end;

procedure Tfrmordenpago.t(Sender: TObject);
begin
if saldo.Text='' then saldo.Text:='0';
end;

procedure Tfrmordenpago.fechaKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0
else
   monto.SetFocus();
end;

procedure Tfrmordenpago.BitBtn2Click(Sender: TObject);
begin
  nro.ReadOnly:=false;
  monto.ReadOnly:=false;
  saldo.ReadOnly:=false;
  proy.ReadOnly:=false;
  accion.ReadOnly:=false;
  ueje.ReadOnly:=false;
  fecha.Enabled:=true;
  suma.Visible:=true;
  resta.Visible:=true;
  ck_s.Enabled:=true;
  proy.Clear;
  accion.Clear;
  ueje.Clear;
  bitbtn5.Enabled:=false;

  nro.Text:='0';
  fecha.DateTime:=date;
  ck_s.Checked:=true;
  nro.SetFocus;
  vie.Text:='0';
  van.Text:='0';
         con_opa.Close;
         con_opa.SQL.Text:='select * from ordenpago';
         con_opa.Open;
         con_opa.Last;
         if  con_opa.IsEmpty then
         begin
             application.MessageBox('No existen ordenes de pago registradas...!','Mensaje Al Usuario',32);
             nro.ReadOnly:=false;
             nro.Text:='0';
             fecha.Date:=date;
             monto.Text:='0';
             saldo.Text:='0';
             ck_s.Checked:=true;
             vie.Text:='0';
             van.Text:='0';
         end
         else
         begin
             nro.Text:='0';
             monto.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('monto').asfloat));
             fecha.Date:=date;
             saldo.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('saldo').asfloat));
             ck_s.Checked:=true;
             vie.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('m_vie').asfloat));
             van.Text:=formatfloat('#,##0.00',(con_opa.fieldbyname('m_va').asfloat));
         end;

end;

procedure Tfrmordenpago.BitBtn5Click(Sender: TObject);
begin
if nro.Text='0' then
begin
   application.MessageBox('Debe ingresar numero de orden de pago...!','Mensaje al Usuario',16);
   nro.SetFocus;
end
else
begin

  if monto.Value=0 then
  begin
     application.MessageBox('Debe ingresar monto de orden de pago...!','Mensaje al Usuario',16);
     monto.SetFocus;
  end
  else
  begin
   if saldo.Value=0 then
   begin
     application.MessageBox('Debe Presionar el Boton de Suma para actualizar el SALDO de orden de pago...!','Mensaje al Usuario',16);
     monto.SetFocus;
   end
   else
   begin
     con_nrop.Close;
     con_nrop.Params[0].AsInteger:=strtoint(nro.Text);
     con_nrop.Open;
     if con_nrop.IsEmpty then
     begin
      tb_op.Close;
      tb_op.Open;
      tb_op.Append;
      tb_op.FieldByName('nro').AsInteger:=strtoint(nro.Text);
      tb_op.FieldByName('fecha').AsDateTime:=fecha.Date;
      tb_op.FieldByName('monto').Asfloat:=strtofloat(monto.Text);
      tb_op.FieldByName('saldo').Asfloat:=strtofloat(saldo.Text);
      if aux=0 then
      begin
         tb_op.FieldByName('m_vie').Asfloat:=monto.Value;
         tb_op.FieldByName('m_va').Asfloat:=aux;
      end
      else
      begin
         tb_op.FieldByName('m_vie').Asfloat:=abs(saldo.Value);
      end;

      act_oac.Close;
      act_oac.Params[0].AsInteger:=strtoint(nro.Text);
      act_oac.ExecSQL;

      if ck_s.Checked then
         tb_op.FieldByName('Activa').Asstring:='S'
      else
         tb_op.FieldByName('Activa').Asstring:='N';


      tb_op.FieldByName('proy').AsString:=proy.Text;
      tb_op.FieldByName('accion').AsString:=accion.Text;
      tb_op.FieldByName('ueje').AsString:= ueje.Text;

      aux:=0;
      tb_op.Post;
      application.MessageBox('Orden de Pago registrada con éxito...!','Mensaje al Usuario',32);
     end
     else
     begin
      application.MessageBox('Orden de Pago ya Existe...!','Mensaje al Usuario',16);
     end;
       nro.ReadOnly:=true;
       monto.ReadOnly:=true;
       saldo.ReadOnly:=true;
       fecha.Enabled:=false;
       suma.Visible:=false;
       resta.Visible:=false;
       nro.SetFocus;
   end;
  end;
 end;
end;

procedure Tfrmordenpago.bt_eliClick(Sender: TObject);
begin
 if  MessageDlg('¿Está Seguro de Eliminar la orden de Pago: '+nro.Text+' ?',
                 mtConfirmation,[mbYes, mbNo],0)=mrNo then
               else
               begin
                  eli_op.Close;
                  eli_op.Params[0].AsInteger:=strtoint(nro.Text);
                  eli_op.ExecSQL;
                  application.MessageBox('Orden de Pago eliminada con éxito...!','Mensaje al Usuario',32);
                   modedo.Close;
                   modedo.Params[0].AsString:= 'S';
                   if strtoint(nro.Text)>0 then
                      modedo.Params[1].AsInteger:=strtoint(nro.Text)-1;
                   modedo.ExecSQL;
                  BitBtn2Click(Sender);
               end;
end;

procedure Tfrmordenpago.ck_sKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
       BitBtn2.SetFocus;
end;

procedure Tfrmordenpago.BitBtn3Click(Sender: TObject);
begin
   modedo.Close;
   if ck_s.Checked=true then
      modedo.Params[0].AsString:= 'S'
   else
      modedo.Params[0].AsString:= 'N';

   modedo.Params[1].AsInteger:=strtoint(nro.Text);
   modedo.ExecSQL;

   act_oac.Close;
   act_oac.Params[0].AsInteger:=strtoint(nro.Text);
   act_oac.ExecSQL;

   application.MessageBox('Orden de Pago Activada con éxito...!','Mensaje al Usuario',32);

end;

procedure Tfrmordenpago.sumaClick(Sender: TObject);
begin
 bitbtn5.Enabled:=true;
 aux:=saldo.value;
 saldo.Text:= formatfloat('#,##0.00',(monto.value+saldo.value));
end;

procedure Tfrmordenpago.restaClick(Sender: TObject);
begin
if saldo.Value >monto.Value then
   saldo.Text:= formatfloat('#,##0.00',(saldo.value - monto.value))
else
   saldo.Text:= formatfloat('#,##0.00',(monto.value - saldo.value))
end;

procedure Tfrmordenpago.proyKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
       accion.SetFocus;
end;

procedure Tfrmordenpago.accionKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
       ueje.SetFocus;
end;

procedure Tfrmordenpago.uejeKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
       bitbtn2.SetFocus;
end;

end.
