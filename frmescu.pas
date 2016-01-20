unit frmescu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  RxCalc, StdCtrls, ExtCtrls, Buttons, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  ComCtrls, dxDBTLCl, dxGrClms, ZAbstractTable;

type
  Tfrmesc = class(TForm)
    pg1: TPageControl;
    pro: TTabSheet;
    gridesc: TdxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    bt_eli: TBitBtn;
    bt_mod: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    dataesc: TDataSource;
    calculadora: TRxCalculator;
    gridescCOD: TdxDBGridMaskColumn;
    gridescNOMBRE: TdxDBGridMaskColumn;
    gridescDIR: TdxDBGridMaskColumn;
    gridescDIREC: TdxDBGridMaskColumn;
    gridescTEL: TdxDBGridMaskColumn;
    gridescMAT: TdxDBGridMaskColumn;
    gridescCXA: TdxDBGridMaskColumn;
    gridescPRE: TdxDBGridMaskColumn;
    gridescFECLI: TdxDBGridDateColumn;
    gridescPAE: TdxDBGridCheckColumn;
    con_esc: TZQuery;
    eli_dep: TZQuery;
    dataeli: TDataSource;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure bt_eliClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    function  esnum(NumStr : string) : bool;
    procedure bt_modClick(Sender: TObject);
    procedure gridescDblClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmesc: Tfrmesc;

implementation

uses frmacces, frmppal, frmundep, frmbus, frmunescu;

{$R *.dfm}

function Tfrmesc.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
         end;
end;

procedure Tfrmesc.BitBtn6Click(Sender: TObject);
begin
  calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmesc.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmesc.BitBtn5Click(Sender: TObject);
begin
  frmunde.tb_dep.Close;
  frmunde.tb_dep.Open;
  frmunde.tb_dep.FindLast;
  frmunde.tb_dep.Append;
  frmunde.ShowModal;
 end;

procedure Tfrmesc.bt_eliClick(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin


               if  MessageDlg('¿Está Seguro de Eliminar la Dependencia: '+con_esc.fieldbyname('nombre').AsString+' ?',
                 mtConfirmation,[mbYes, mbNo],0)=mrNo then
               else
               begin
                 if not con_esc.IsEmpty then
                 begin

                 eli_dep.Close;
                 eli_dep.Params[0].AsInteger:=con_esc.fieldbyname('cod').AsInteger;
                 eli_dep.ExecSQL;
                 
                 con_esc.Close;
                 con_esc.SQL.Text:='select * from dependencias  where cod like :c order by cod';
                 con_esc.Params[0].Asstring:='%';
                 con_esc.open;
                 gridesc.ResetFullRefresh;
                 end;
                end;

end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmesc.FormShow(Sender: TObject);
begin

  con_esc.Close;
  con_esc.SQL.Text:='select * from dependencias  where cod like :c order by cod';
  con_esc.Params[0].Asstring:='%';
  con_esc.open;
  gridesc.ResetFullRefresh;
end;

procedure Tfrmesc.BitBtn2Click(Sender: TObject);
var
buscar : string;
begin
   frmbuscar.ShowModal;
       buscar:=frmbuscar.bus.Text;
       con_esc.close;
       if esnum(buscar)=false then
       begin
         con_esc.Close;
         con_esc.SQL.Text:='select * from dependencias where nombre like :n order by cod';
         con_esc.Params[0].AsString:='%'+buscar+'%';
         con_esc.Open;
       end
       else
       begin
          con_esc.Close;
          con_esc.SQL.Text:='select * from dependencias where cod like :c order by cod';
          con_esc.Params[0].AsString:=buscar+'%';
          con_esc.Open;
       end;

end;

procedure Tfrmesc.bt_modClick(Sender: TObject);
begin
frmunesc.ShowModal;
end;

procedure Tfrmesc.gridescDblClick(Sender: TObject);
begin
  bt_modClick(Sender);
end;

end.
