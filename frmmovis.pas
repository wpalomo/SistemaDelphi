unit frmmovis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, Buttons, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, ExtCtrls;

type
  Tfrmmovps = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    gridmov: TdxDBGrid;
    gridmovfec_actualizacion: TdxDBGridDateColumn;
    gridmovcedula: TdxDBGridMaskColumn;
    gridmovnombre: TdxDBGridMaskColumn;
    gridmovcargo: TdxDBGridMaskColumn;
    gridmovcod_dep: TdxDBGridMaskColumn;
    gridmovnom_dep: TdxDBGridMaskColumn;
    gridmovceds: TdxDBGridMaskColumn;
    gridmovnoms: TdxDBGridMaskColumn;
    gridmovcodcars: TdxDBGridMaskColumn;
    gridmovcoddeps: TdxDBGridMaskColumn;
    gridmovdestino: TdxDBGridMaskColumn;
    gridmovfecha: TdxDBGridDateColumn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    con_valor: TZQuery;
    datavalor: TDataSource;
    con_valor2: TZQuery;
    datavalor2: TDataSource;
    gridmovtipomov: TdxDBGridMaskColumn;
    dataelireg: TDataSource;
    eli_reg: TZQuery;
    gridmovOBSERVACIONES: TdxDBGridMemoColumn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    function esnum(NumStr : string) : bool;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmovps: Tfrmmovps;
  s:byte;

implementation

uses frmppal, frmbus, frmacces, frmmod;

{$R *.dfm}

function Tfrmmovps.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
        end;
end;
procedure Tfrmmovps.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmmovps.BitBtn2Click(Sender: TObject);
begin
frmbuscar.ShowModal;
   if esnum(frmbuscar.bus.Text) then
   begin
       con_valor.close;
       con_valor.Params[0].AsString:=frmbuscar.bus.Text+'%';
       con_valor.Open;
       gridmov.DataSource:=datavalor;
       gridmov.ResetFullRefresh;
       s:=0;
    end
   else
   begin
       con_valor2.close;
       con_valor2.Params[0].AsString:=frmbuscar.bus.Text+'%';
       con_valor2.Open;
       con_valor2.RecordCount;
       gridmov.DataSource:=datavalor2;
       gridmov.ResetFullRefresh;
       s:=1;
   end;
   gridmov.SetFocus;
end;

procedure Tfrmmovps.BitBtn3Click(Sender: TObject);
begin
 if frmacceso.con_usu.FieldByName('nivel').AsInteger<=2 then
  begin
   if s=0 then
   begin
      if  MessageDlg('Desea Eliminar el Empleado: '+con_valor.fieldbyname('noms').AsString,
        mtConfirmation,[mbYes, mbNo],0)=mrNo then

    else
    begin
          eli_reg.Close;
          eli_reg.Params[0].AsInteger:=con_valor.FieldByName('ceds').AsInteger;
          eli_reg.ExecSQL;
          con_valor.close;
          con_valor.Params[0].AsString:='%';
          con_valor.Open;
          gridmov.DataSource:=datavalor;
    end;
   end;
   if s=1 then
   begin
       if  MessageDlg('Desea Eliminar el Empleado: '+con_valor2.fieldbyname('noms').AsString,
          mtConfirmation,[mbYes, mbNo],0)=mrNo then
       else
       begin
          eli_reg.Close;
          eli_reg.Params[0].AsInteger:=con_valor2.FieldByName('ceds').AsInteger;
          eli_reg.ExecSQL;
          con_valor2.close;
          con_valor2.Params[0].AsString:='%';
          con_valor2.Open;
          gridmov.DataSource:=datavalor2;
       end;
   end;
   end
   else
   begin
    application.MessageBox('Usuario NO Autorizado para este proceso...!','Mensaje al Usuario',16);
    gridmov.SetFocus;
   end;
end;

procedure Tfrmmovps.BitBtn4Click(Sender: TObject);
begin
 if frmacceso.con_usu.FieldByName('nivel').AsInteger<=2 then
 begin
 if s=0 then
   begin
      frmmodi.con_emp.Close;
      frmmodi.con_emp.Params[0].AsInteger:=con_valor.FieldByName('id').asinteger;
      frmmodi.con_emp.Open;
      frmmodi.Showmodal;
   end;
   if s=1 then
   begin
      frmmodi.con_emp.Close;
      frmmodi.con_emp.Params[0].AsInteger:=con_valor2.FieldByName('id').asinteger;
      frmmodi.con_emp.Open;
      frmmodi.Showmodal;
   end;
   end
   else
   begin
    application.MessageBox('Usuario NO Autorizado para este proceso...!','Mensaje al Usuario',16);
    gridmov.SetFocus;
   end;   
end;

procedure Tfrmmovps.FormShow(Sender: TObject);
begin
s:=1;
con_valor2.close;
con_valor2.Params[0].AsString:=frmbuscar.bus.Text+'%';
con_valor2.Open;
gridmov.DataSource:=datavalor2;
gridmov.SetFocus;
end;

end.
