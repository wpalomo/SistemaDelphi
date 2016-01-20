unit frmplanprivados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  RxCalc, StdCtrls, ExtCtrls, Buttons;

type
  Tfrmplan_priv = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    bt_eli: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    dataplanpriv: TDataSource;
    calculadora: TRxCalculator;
    eli_pp: TZQuery;
    dataeli: TDataSource;
    pg1: TPageControl;
    pro: TTabSheet;
    con_pp: TZQuery;
    gridplanpriv: TdxDBGrid;
    bt_mod: TBitBtn;
    gridplanprivCOD: TdxDBGridMaskColumn;
    gridplanprivNOMBRE: TdxDBGridMaskColumn;
    gridplanprivDIR: TdxDBGridMaskColumn;
    gridplanprivTEL: TdxDBGridMaskColumn;
    gridplanprivMAT: TdxDBGridMaskColumn;
    gridplanprivFEELA: TdxDBGridDateColumn;
    gridplanprivMAT_PRO: TdxDBGridMaskColumn;
    gridplanprivCORREO: TdxDBGridMaskColumn;
    gridplanprivLOCALIDAD: TdxDBGridMaskColumn;
    gridplanprivDISTRITO_NUM: TdxDBGridMaskColumn;
    gridplanprivAO_ESCOLAR: TdxDBGridMaskColumn;
    eli_emp: TZQuery;
    dataeliemp: TDataSource;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    function esnum(NumStr : string) : bool;
    procedure bt_modClick(Sender: TObject);
    procedure bt_eliClick(Sender: TObject);
    procedure gridplanprivKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmplan_priv: Tfrmplan_priv;

implementation

uses frmacces, frmunplanprivados, frmbus, frmacercade, frmmodplanpriv;

{$R *.dfm}

function Tfrmplan_priv.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
        end;
 end;
procedure Tfrmplan_priv.BitBtn5Click(Sender: TObject); //RELIZA UN INGRESO NUEVO//
begin
  frmunplanpriv.tb_depp.Close;
  frmunplanpriv.tb_depp.Open;
  frmunplanpriv.tb_depp.FindLast;
  frmunplanpriv.tb_depp.Append;
  frmunplanpriv.ShowModal;

end;

procedure Tfrmplan_priv.BitBtn1Click(Sender: TObject);  //PROCEDURE SALIR//
begin
    close;
end;

procedure Tfrmplan_priv.FormShow(Sender: TObject);//Realiza //
begin
  con_pp.Close;
  con_pp.SQL.Text:='select * from dependenciaspp order by cod';
  con_pp.Open;
  gridplanpriv.SetFocus;
end;

procedure Tfrmplan_priv.BitBtn6Click(Sender: TObject);
begin
  calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmplan_priv.BitBtn2Click(Sender: TObject); // REALIZA BUSQUEDA//
 var
 buscar: string;
begin
       frmbuscar.ShowModal;
       buscar:=frmbuscar.bus.Text;
       con_pp.close;
   if esnum(buscar)=false then
       begin
         con_pp.Close;
         con_pp.SQL.Text:='select * from dependenciaspp  where  nombre like :n';
         con_pp.Params[0].AsString:='%'+buscar+'%';
         con_pp.Open;
       end
   else
       begin
          con_pp.Close;
          con_pp.SQL.Text:='select * from dependenciaspp  where cod like :c';
          con_pp.Params[0].AsString:=buscar+'%';
          con_pp.Open;
       end;
end;


procedure Tfrmplan_priv.bt_modClick(Sender: TObject); //PROCEDIMIENTO QUE MODIFICA PLANTELES//
begin
  Frmmodpp.ShowModal;
end;

procedure Tfrmplan_priv.bt_eliClick(Sender: TObject);// PROCEDIMIENTO ELIMINAR PLANTEL//
begin
     if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=3) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=14)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) then
begin

    if  MessageDlg('¿Esta Seguro de Eliminar el Planteles Privados: '+con_pp.fieldbyname('cod').AsString+ ' ?',
    mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
        if not con_pp.IsEmpty then
        begin

          eli_emp.Close;
          eli_emp.Params[0].AsInteger:=con_pp.fieldbyname('cod').AsInteger;
          eli_emp.ExecSQL;


          eli_pp.Close;
          eli_pp.Params[0].AsInteger:=con_pp.fieldbyname('cod').AsInteger;
          eli_pp.ExecSQL;



          con_pp.Close;
          con_pp.SQL.Text:='select * from dependenciaspp order by cod';
          con_pp.Open;
          gridplanpriv.ResetFullRefresh;
        end;
    end;
end;

end;



procedure Tfrmplan_priv.gridplanprivKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if key =vk_delete then
     bt_eliClick(Sender);
end;

end.







