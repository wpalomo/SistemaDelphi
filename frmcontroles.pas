unit frmcontroles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, RxCalc, dxExEdtr, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset, dxDBTLCl, dxGrClms, ComCtrls, jpeg;

type
  Tfrmces = class(TForm)
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    bt_eli: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn6: TBitBtn;
    calculadora: TRxCalculator;
    datataqui: TDataSource;
    tb_taquilla: TZTable;
    grid_ce: TdxDBGrid;
    grid_ceced: TdxDBGridMaskColumn;
    grid_cenom: TdxDBGridMaskColumn;
    grid_cefecha: TdxDBGridDateColumn;
    grid_ceobs: TdxDBGridMaskColumn;
    grid_cefece: TdxDBGridDateColumn;
    con_ced: TZQuery;
    dataced: TDataSource;
    grid_cev: TdxDBGridCheckColumn;
    grid_cec: TdxDBGridCheckColumn;
    con_max: TZQuery;
    datamaxnum: TDataSource;
    fec: TDateTimePicker;
    Label3: TLabel;
    grid_cetipe: TdxDBGridPickColumn;
    grid_ceope: TdxDBGridPickColumn;
    grid_ceedo: TdxDBGridMaskColumn;
    grid_ceent: TdxDBGridMaskColumn;
    Label2: TLabel;
    Shape1: TShape;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure grid_ceEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure grid_ceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_eliClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    function esnum(NumStr : string) : bool;
    procedure grid_ceKeyPress(Sender: TObject; var Key: Char);
    procedure cb_verKeyPress(Sender: TObject; var Key: Char);
    procedure cb_conKeyPress(Sender: TObject; var Key: Char);
    procedure cb_tipKeyPress(Sender: TObject; var Key: Char);
    procedure grid_ceEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Function Invertir(Texto: String) : String;
    procedure grid_ceExit(Sender: TObject);
    procedure fecKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
   n:integer;
    { Public declarations }
  end;

var
  frmces: Tfrmces;

implementation

uses frmacces, frmbus;

{$R *.dfm}

Function Tfrmces.Invertir(Texto: String) : String;
Var I : Integer;
ano,mes,dia:string;
Begin
    For I :=1  to Length(Texto) DO
    begin
        if i<3  then
           dia:=dia+Texto[i]
        else
        begin
         if (i>3) and (i<6) then
           mes:=mes+Texto[i]
         else
         begin
           if i>6 then
              ano:=ano+Texto[i]
         end;
        end;
        
     end;
        Result :=ano+'/'+mes+'/'+dia;
End;


function Tfrmces.esnum(NumStr : string) : bool;
begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
         end;
end;

procedure Tfrmces.BitBtn1Click(Sender: TObject);
begin
tb_taquilla.Close;
close;
end;

procedure Tfrmces.BitBtn6Click(Sender: TObject);
begin
 calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmces.grid_ceEdited(Sender: TObject; Node: TdxTreeListNode);
var
    key: word;
    Shift: TShiftState;

begin

  if grid_ce.FocusedColumn=0 then
  begin
    if tb_taquilla.FieldByName('ced').Asstring=''  then
    begin
       tb_taquilla.Cancel;
       grid_ce.FocusedColumn:=0;
    end
    else
    begin

      con_ced.Close;
      con_ced.Params[0].AsInteger:=tb_taquilla.FieldByName('ced').Asinteger;
      con_ced.Open;
      if con_ced.RecordCount>=1 then
      begin
        messagebox(0,'Cedula ya registrada....!','Mensaje al Usuario',32);
        tb_taquilla.cancel;
        grid_ce.FocusedColumn:=0;
      end;
      con_ced.close;
     end;
  end;

if grid_ce.FocusedColumn=10 then
begin
   key:=vk_down;
   grid_ceKeyDown(grid_ce,key,Shift);
   grid_ce.FocusedColumn:=0;
end;
end;

procedure Tfrmces.grid_ceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin


  if key=vk_delete then
  begin
    bt_eliClick(sender);
  end;


  if key=vk_up then
  begin
    if  (tb_taquilla.FieldByName('nom').Asstring='') or ((tb_taquilla.FieldByName('v').Asstring='') and(tb_taquilla.FieldByName('c').Asstring='')) then
    begin
        messagebox(0,'Debe ingresar todos los Datos para Continuar...!','Mensaje al Usuario',32);
        key:=0;
    end
  end;


  if key=vk_down then
  begin

    if  (tb_taquilla.FieldByName('nom').Asstring='') or ((tb_taquilla.FieldByName('v').Asstring='') and(tb_taquilla.FieldByName('c').Asstring='')) then
    begin
        messagebox(0,'Debe ingresar todos los Datos para Continuar...!','Mensaje al Usuario',32);
        key:=0;
    end
    else
    begin
       if (grid_ce.LastNode.Focused) then
       begin
         if (datetostr(fec.Date)=datetostr(now)) then
         begin
           con_max.Close;
           con_max.open;
           n:=con_max.fieldbyname('maxnum').AsInteger+1;
           tb_taquilla.FieldByName('num').AsInteger:=n;
           key:=0;
           tb_taquilla.Append;
           tb_taquilla.FieldByName('fecha').AsDateTime:=date;
           tb_taquilla.FieldByName('fece').AsDateTime:=date;
         end
         else
           key:=0;
       end;

        grid_ce.FocusedColumn:=0;
    end;

  end;

  if key=vk_return then
  begin


  end;
end;

procedure Tfrmces.bt_eliClick(Sender: TObject);
begin
    if  MessageDlg('Desea Eliminar la Solicitud: '+tb_taquilla.fieldbyname('nom').AsString,
        mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
        if not tb_taquilla.IsEmpty then
        begin
           tb_taquilla.Delete;
        end;
    end;
end;



procedure Tfrmces.BitBtn2Click(Sender: TObject);
begin
  frmbuscar.ShowModal;
  if esnum(frmbuscar.bus.Text) then
  begin
    tb_taquilla.Locate('ced',frmbuscar.bus.Text,[loCaseInsensitive]);
  end
  else
  begin
    tb_taquilla.Locate('nom',frmbuscar.bus.Text,[loCaseInsensitive]);
  end;
end;

procedure Tfrmces.grid_ceKeyPress(Sender: TObject; var Key: Char);
begin
if (grid_ce.FocusedColumn=1) then
begin
 case key of
     #65..#90:;
     ' ':;
     #8:;
 else
    key:=#0;
 end;
end;
if (grid_ce.FocusedColumn=4) or (grid_ce.FocusedColumn=5) then
begin
 case key of
     #13:;
 else
    key:=#0;
 end;
end;
if (grid_ce.FocusedColumn=9) OR (grid_ce.FocusedColumn=10) then
begin
 case key of
     #88:;
     #8:;
 else
    key:=#0;
 end;
end;
end;

procedure Tfrmces.cb_verKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0;
end;

procedure Tfrmces.cb_conKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0;
end;

procedure Tfrmces.cb_tipKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0;
end;

procedure Tfrmces.grid_ceEnter(Sender: TObject);
begin
   tb_taquilla.Close;
   tb_taquilla.Filter:= 'fecha = ' + QuotedStr(invertir(datetostr(fec.Date)));
   tb_taquilla.Filtered:=true;
   tb_taquilla.Open;
   tb_taquilla.FindLast;
   grid_ce.FocusedColumn:=0;
 end;

procedure Tfrmces.FormShow(Sender: TObject);
begin
fec.Date:=date;
fec.SetFocus;

end;

procedure Tfrmces.grid_ceExit(Sender: TObject);
begin
  if  tb_taquilla.Eof then
    tb_taquilla.Cancel;
end;

procedure Tfrmces.fecKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
   tb_taquilla.Close;
   tb_taquilla.Filter:= 'fecha = ' + QuotedStr(invertir(datetostr(fec.Date)));
   tb_taquilla.Filtered:=true;
   tb_taquilla.Open;
   tb_taquilla.FindLast;
   grid_ce.SetFocus;
   grid_ce.FocusedColumn:=0;

end;
end;

end.


