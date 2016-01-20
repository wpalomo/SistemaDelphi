{$IFDEF PROFILE} {$O-} {$WARNINGS OFF} {$ENDIF }
{$IFDEF PROFILE} {    Do not delete previous line(s) !!! } {$ENDIF }
{$IFDEF PROFILE} { Otherwise sources can not be cleaned !!! } {$ENDIF }
unit frmmovi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBTL, StdCtrls, ExtCtrls,
  dxDBTLCl, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, dxLayout,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxCalendar, cxMaskEdit,
  cxInplaceContainer, cxDBTL, cxControls, cxTLData, dxGrClms, dxDBGrid,
  Buttons, ZAbstractTable{$IFNDEF PROFILE};{$ELSE}{},Profint;{$ENDIF}

type
  Tfrmmov = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    gridmov: TdxDBGrid;
    BitBtn1: TBitBtn;
    con_movobs: TZQuery;
    dataobsmov: TDataSource;
    BitBtn2: TBitBtn;
    con_valor: TZQuery;
    datavalor: TDataSource;
    con_valor2: TZQuery;
    datavalor2: TDataSource;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    gridmovfec_actualizacion: TdxDBGridDateColumn;
    gridmovcedula: TdxDBGridMaskColumn;
    gridmovnombre: TdxDBGridMaskColumn;
    gridmovceds: TdxDBGridMaskColumn;
    gridmovnoms: TdxDBGridMaskColumn;
    gridmovcodcars: TdxDBGridMaskColumn;
    gridmovcoddeps: TdxDBGridMaskColumn;
    gridmovdestino: TdxDBGridMaskColumn;
    gridmovcargo: TdxDBGridMaskColumn;
    gridmovcod_dep: TdxDBGridMaskColumn;
    gridmovnom_dep: TdxDBGridMaskColumn;
    gridmovtipomov: TdxDBGridMaskColumn;
    gridmovenviado: TdxDBGridMaskColumn;
    act_enviado: TZQuery;
    dataenviado: TDataSource;
    eli_reg: TZQuery;
    dataelireg: TDataSource;
    gridmovanalista: TdxDBGridMaskColumn;
    gridmovOBSERVACIONES: TdxDBGridMemoColumn;
    gridmovtipomovt: TdxDBGridColumn;
    BitBtn5: TBitBtn;
    eli_reg2: TZQuery;
    data_eli2: TDataSource;
    tb_beli: TZTable;
    data_beli: TDataSource;
    gridmovfec_ela: TdxDBGridDateColumn;
    gridmovfec_elamov_t: TdxDBGridDateColumn;
    procedure gridmovDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    function esnum(NumStr : string) : bool;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure gridmovKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridmovKeyPress(Sender: TObject; var Key: Char);
    procedure gridmovenviadoGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure gridmovEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure BitBtn5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmov: Tfrmmov;
  s:byte;

implementation

uses frmacces, frmobser, frmbus, frmmod;

{$R *.dfm}

function Tfrmmov.esnum(NumStr : string) : bool;
       begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,417 or $25A00000); {$ENDIF}
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
        end;
{$IFDEF PROFILE}finally; Profint.ProfExit(417); end;{$ENDIF}
end;


procedure Tfrmmov.gridmovDblClick(Sender: TObject);
var
i:integer;
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,418 or $25A00000); {$ENDIF}
if s=0 then
begin
  con_movobs.Close;
  con_movobs.Params[0].AsInteger:=con_valor.fieldbyname('CEDULA').AsInteger;
  con_movobs.Params[1].Asstring:=con_valor.fieldbyname('TIPOMOV').Asstring;
  con_movobs.Open;
end
else
begin
  if s=1 then
  begin
    con_movobs.Close;
    con_movobs.Params[0].AsInteger:=con_valor2.fieldbyname('CEDULA').AsInteger;
    con_movobs.Params[1].Asstring:=con_valor2.fieldbyname('TIPOMOV').Asstring;
    con_movobs.Open;
  end;
end;
frmobs.ced.Caption:=con_movobs.fieldbyname('CEDULA').asstring;
frmobs.nom.Caption:=con_movobs.fieldbyname('NOMBRE').asstring;
frmobs.coddep.Caption:=con_movobs.fieldbyname('COD_DEP').asstring;
frmobs.desdep.Caption:=con_movobs.fieldbyname('NOM_DEP').asstring;

i:=0;
frmobs.obs.Clear;
while not con_movobs.eof   do
begin
    frmobs.obs.Lines.Insert(i,con_movobs.fieldbyname('OBSERVACIONES').asstring);
    con_movobs.Next;
    i:=i+1;
end;
frmobs.showmodal;
{$IFDEF PROFILE}finally; Profint.ProfExit(418); end;{$ENDIF}
end;

procedure Tfrmmov.BitBtn1Click(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,419 or $25A00000); {$ENDIF}
close;
{$IFDEF PROFILE}finally; Profint.ProfExit(419); end;{$ENDIF}
end;

procedure Tfrmmov.FormShow(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,420 or $25A00000); {$ENDIF}
s:=1;
con_valor2.close;
con_valor2.Params[0].AsString:=frmbuscar.bus.Text+'%';
con_valor2.Open;
gridmov.DataSource:=datavalor2;
gridmov.SetFocus;
{$IFDEF PROFILE}finally; Profint.ProfExit(420); end;{$ENDIF}
end;

procedure Tfrmmov.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,421 or $25A00000); {$ENDIF}
con_valor.close;
con_valor2.Close;
{$IFDEF PROFILE}finally; Profint.ProfExit(421); end;{$ENDIF}
end;

procedure Tfrmmov.BitBtn2Click(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,422 or $25A00000); {$ENDIF}
  frmbuscar.ShowModal;
   if esnum(frmbuscar.bus.Text) then
   begin
       con_valor.close;
       con_valor.Params[0].AsString:=frmbuscar.bus.Text+'%';
       con_valor.Open;
       gridmov.DataSource:=datavalor;
       s:=0;
    end
   else
   begin
       con_valor2.close;
       con_valor2.Params[0].AsString:=frmbuscar.bus.Text+'%';
       con_valor2.Open;
       gridmov.DataSource:=datavalor2;
       s:=1;
   end;
   gridmov.SetFocus;
{$IFDEF PROFILE}finally; Profint.ProfExit(422); end;{$ENDIF}
end;

procedure Tfrmmov.BitBtn3Click(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,423 or $25A00000); {$ENDIF}

 if frmacceso.con_usu.FieldByName('nivel').AsInteger<=2 then
 begin
   if s=0 then
   begin
     if not con_valor.IsEmpty then
     begin
{$IFDEF PROFILE} if  Profint.MessageDlg('Desea Eliminar el Empleado: '+con_valor.fieldbyname('nombre').AsString,{$ENDIF}
{$IFNDEF PROFILE}if  MessageDlg('Desea Eliminar el Empleado: '+con_valor.fieldbyname('nombre').AsString,{$ENDIF}
                         mtConfirmation,[mbYes, mbNo],0)=mrNo then

             else
             begin

             tb_beli.Close;
             tb_beli.open;
             tb_beli.Edit;
             tb_beli.Append;
             tb_beli.FieldByName('usu').AsString:=frmacceso.usuario.Text;
             tb_beli.FieldByName('numoc').AsFloat:=0;
             tb_beli.FieldByName('cedempleado').AsInteger:=con_valor.fieldbyname('cedula').AsInteger;
             tb_beli.FieldByName('tipo_movimiento').AsString:=con_valor.fieldbyname('TIPOMOV').AsString;
             tb_beli.Post;

          eli_reg.Close;
          eli_reg.Params[0].AsInteger:=con_valor.FieldByName('cedula').AsInteger;
          eli_reg.Params[1].AsInteger:=con_valor.FieldByName('id').AsInteger;
          eli_reg.ExecSQL;
          con_valor.close;
          con_valor.Params[0].AsString:='%';
          con_valor.Open;
          gridmov.DataSource:=datavalor;
          s:=0;
    end;
   end;
  end;

  if s=1 then
  begin
    if not con_valor2.IsEmpty then
    begin

{$IFDEF PROFILE}       if  Profint.MessageDlg('Desea Eliminar el Empleado: '+con_valor2.fieldbyname('nombre').AsString,{$ENDIF}
{$IFNDEF PROFILE}       if  MessageDlg('Desea Eliminar el Empleado: '+con_valor2.fieldbyname('nombre').AsString,{$ENDIF}
          mtConfirmation,[mbYes, mbNo],0)=mrNo then
       else
       begin

             tb_beli.Close;
             tb_beli.open;
             tb_beli.Edit;
             tb_beli.Append;
             tb_beli.FieldByName('usu').AsString:=frmacceso.usuario.Text;
             tb_beli.FieldByName('numoc').AsFloat:=0;
             tb_beli.FieldByName('cedempleado').AsInteger:=con_valor2.fieldbyname('cedula').AsInteger;
             tb_beli.FieldByName('tipo_movimiento').AsString:=con_valor2.fieldbyname('TIPOMOV').AsString;
             tb_beli.Post;


          eli_reg.Close;
          eli_reg.Params[0].AsInteger:=con_valor2.FieldByName('cedula').AsInteger;
          eli_reg.Params[1].AsInteger:=con_valor2.FieldByName('id').AsInteger;
          eli_reg.ExecSQL;
          con_valor2.close;
          con_valor2.Params[0].AsString:='%';
          con_valor2.Open;
          gridmov.DataSource:=datavalor2;
          s:=1;
       end;
    end;
   end;
   end
   else
   begin
{$IFDEF PROFILE}    Profint.AMessageBox('Usuario NO Autorizado para este proceso...!','Mensaje al Usuario',16);{$ENDIF}
{$IFNDEF PROFILE}    application.MessageBox('Usuario NO Autorizado para este proceso...!','Mensaje al Usuario',16);{$ENDIF}
    gridmov.SetFocus;
   end;
{$IFDEF PROFILE}finally; Profint.ProfExit(423); end;{$ENDIF}
end;

procedure Tfrmmov.BitBtn4Click(Sender: TObject);
var
   v: string;
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,424 or $25A00000); {$ENDIF}
 if frmacceso.con_usu.FieldByName('nivel').AsInteger<=2 then
 begin

   if s=0 then
   begin
    if not con_valor.IsEmpty then
    begin
      v:=frmbuscar.bus.Text+'%';
      frmmodi.con_emp.Close;
      frmmodi.con_emp.Params[0].AsInteger:=con_valor.FieldByName('id').asinteger;
      frmmodi.con_emp.Open;
      frmmodi.Showmodal;

       con_valor.close;
       con_valor.Params[0].AsString:=v;
       con_valor.Open;
       gridmov.DataSource:=datavalor;
   end;
   end;
   if s=1 then
   begin
      v:=frmbuscar.bus.Text+'%';
      frmmodi.con_emp.Close;
      frmmodi.con_emp.Params[0].AsInteger:=con_valor2.FieldByName('id').asinteger;
      frmmodi.con_emp.Open;
      frmmodi.Showmodal;

     if not con_valor2.IsEmpty then
     begin
      con_valor2.close;
      con_valor2.Params[0].AsString:=v;
      con_valor2.Open;
      gridmov.DataSource:=datavalor2;
    end;
   end;
   end
   else
   begin
{$IFDEF PROFILE}    Profint.AMessageBox('Usuario NO Autorizado para este proceso...!','Mensaje al Usuario',16);{$ENDIF}
{$IFNDEF PROFILE}    application.MessageBox('Usuario NO Autorizado para este proceso...!','Mensaje al Usuario',16);{$ENDIF}
    gridmov.SetFocus;
   end;
{$IFDEF PROFILE}finally; Profint.ProfExit(424); end;{$ENDIF}
end;

procedure Tfrmmov.gridmovKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,425 or $25A00000); {$ENDIF}
  if key=vk_return then;
{$IFDEF PROFILE}finally; Profint.ProfExit(425); end;{$ENDIF}
end;

procedure Tfrmmov.gridmovKeyPress(Sender: TObject; var Key: Char);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,426 or $25A00000); {$ENDIF}
if gridmov.FocusedColumn=0 then
begin
case key of
  #8:;
  #83:;
  #78:;
else
  key:=#0;
end;
end;
{$IFDEF PROFILE}finally; Profint.ProfExit(426); end;{$ENDIF}
end;

procedure Tfrmmov.gridmovenviadoGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,427 or $25A00000); {$ENDIF}
if atext='' then
  if s=0 then
     con_valor.Cancel
  else
     con_valor2.Cancel;
{$IFDEF PROFILE}finally; Profint.ProfExit(427); end;{$ENDIF}
end;

procedure Tfrmmov.gridmovEdited(Sender: TObject; Node: TdxTreeListNode);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,428 or $25A00000); {$ENDIF}
   if s=0 then
   begin
   act_enviado.Params[0].AsString:=con_valor.fieldbyname('enviado').AsString;
   act_enviado.Params[1].AsInteger:=con_valor.fieldbyname('cedula').Asinteger;
   act_enviado.Params[2].AsInteger:=con_valor.fieldbyname('id').Asinteger;
   act_enviado.ExecSQL;
   end
   else
   begin
    if s=1 then
    begin
      act_enviado.Params[0].AsString:=con_valor2.fieldbyname('enviado').AsString;
      act_enviado.Params[1].AsInteger:=con_valor2.fieldbyname('cedula').Asinteger;
      act_enviado.ExecSQL;
    end;
   end;
{$IFDEF PROFILE}finally; Profint.ProfExit(428); end;{$ENDIF}
end;

procedure Tfrmmov.BitBtn5Click(Sender: TObject);
begin
{$IFDEF PROFILE}Profint.ProfStop; Try; Profint.ProfEnter(@self,429 or $25A00000); {$ENDIF}
  if frmacceso.con_usu.FieldByName('nivel').AsInteger<=2 then
  begin
    if s=0 then
    begin
    if not con_valor.IsEmpty then
    begin
{$IFDEF PROFILE}       if  Profint.MessageDlg('Desea Eliminar la Condición Titular del Empleado: '+con_valor.fieldbyname('nombre').AsString,{$ENDIF}
{$IFNDEF PROFILE}       if  MessageDlg('Desea Eliminar la Condición Titular del Empleado: '+con_valor.fieldbyname('nombre').AsString,{$ENDIF}
        mtConfirmation,[mbYes, mbNo],0)=mrNo then

       else
       begin

             tb_beli.Close;
             tb_beli.open;
             tb_beli.Edit;
             tb_beli.Append;
             tb_beli.FieldByName('usu').AsString:=frmacceso.usuario.Text;
             tb_beli.FieldByName('numoc').AsFloat:=0;
             tb_beli.FieldByName('cedempleado').AsInteger:=con_valor.fieldbyname('cedula').AsInteger;
             tb_beli.FieldByName('tipo_movimiento').AsString:=con_valor.fieldbyname('tipomov_t').AsString;
             tb_beli.Post;

          eli_reg2.Close;
          eli_reg2.Params[0].AsInteger:=con_valor.FieldByName('cedula').AsInteger;
          eli_reg2.Params[1].AsInteger:=con_valor.FieldByName('id').AsInteger;
          eli_reg2.ExecSQL;
          con_valor.close;
          con_valor.Params[0].AsString:='%';
          con_valor.Open;
          gridmov.DataSource:=datavalor;
        end;
     end;
    end;



    if s=1 then
    begin
    if not con_valor2.IsEmpty then
    begin
{$IFDEF PROFILE}       if  Profint.MessageDlg('Desea Eliminar la Condición Titular del Empleado: '+con_valor2.fieldbyname('nombre').AsString,{$ENDIF}
{$IFNDEF PROFILE}       if  MessageDlg('Desea Eliminar la Condición Titular del Empleado: '+con_valor2.fieldbyname('nombre').AsString,{$ENDIF}
        mtConfirmation,[mbYes, mbNo],0)=mrNo then

       else
       begin

             tb_beli.Close;
             tb_beli.open;
             tb_beli.Edit;
             tb_beli.Append;
             tb_beli.FieldByName('usu').AsString:=frmacceso.usuario.Text;
             tb_beli.FieldByName('numoc').AsFloat:=0;
             tb_beli.FieldByName('cedempleado').AsInteger:=con_valor2.fieldbyname('cedula').AsInteger;
             tb_beli.FieldByName('tipo_movimiento').AsString:=con_valor2.fieldbyname('tipomov_t').AsString;
             tb_beli.Post;

          eli_reg2.Close;
          eli_reg2.Params[0].AsInteger:=con_valor2.FieldByName('cedula').AsInteger;
          eli_reg2.Params[1].AsInteger:=con_valor2.FieldByName('id').AsInteger;
          eli_reg2.ExecSQL;
          con_valor.close;
          con_valor.Params[0].AsString:='%';
          con_valor.Open;
          gridmov.DataSource:=datavalor2;
        end;
     end;
    end;
  end
  else
  begin
{$IFDEF PROFILE}    Profint.AMessageBox('Usuario NO Autorizado para este proceso...!','Mensaje al Usuario',16);{$ENDIF}
{$IFNDEF PROFILE}    application.MessageBox('Usuario NO Autorizado para este proceso...!','Mensaje al Usuario',16);{$ENDIF}
    gridmov.SetFocus;
  end;
{$IFDEF PROFILE}finally; Profint.ProfExit(429); end;{$ENDIF}
 end;
end.
