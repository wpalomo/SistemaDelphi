unit frmempleadosplapriv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, StdCtrls, ExtCtrls,
  ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, dxDBTLCl,
  dxGrClms, Buttons, RxCalc;

type
  Tfrm_nompp = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    gridpersonal: TdxDBGrid;
    con_empp: TZQuery;
    dataemplepp: TDataSource;
    gridpersonalcedula: TdxDBGridMaskColumn;
    gridpersonaltipoced: TdxDBGridMaskColumn;
    gridpersonaledad: TdxDBGridMaskColumn;
    gridpersonalapellidos: TdxDBGridMaskColumn;
    gridpersonalnombres: TdxDBGridMaskColumn;
    gridpersonaltitulodoc: TdxDBGridMaskColumn;
    gridpersonaldenominacion: TdxDBGridMaskColumn;
    gridpersonalcd: TdxDBGridMaskColumn;
    gridpersonalnombre: TdxDBGridMaskColumn;
    gridpersonalanno: TdxDBGridMaskColumn;
    gridpersonaltipodoc: TdxDBGridMaskColumn;
    gridpersonalnrohoras: TdxDBGridMaskColumn;
    gridpersonalAsignatura: TdxDBGridMaskColumn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    bt_eli: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    bt_mod: TBitBtn;
    calculadora: TRxCalculator;
    data_eli: TDataSource;
    elim_empp: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    function esnum(NumStr : string) : bool;
    procedure bt_eliClick(Sender: TObject);
    procedure bt_modClick(Sender: TObject);
    procedure gridpersonalDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_nompp: Tfrm_nompp;

implementation

uses frmacces, frmbus, frmmodempleadospp, frmregistroempleadopp;

{$R *.dfm}

function Tfrm_nompp.esnum(NumStr : string) : bool;
       begin
           result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
        end;
 end;

procedure Tfrm_nompp.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure Tfrm_nompp.FormShow(Sender: TObject);
begin
   gridpersonal.SetFocus;
   con_empp.Close;
   con_empp.SQL.Text :='select * from empleadospp order by cedula';
   con_empp.Open;
end;

procedure Tfrm_nompp.BitBtn6Click(Sender: TObject);
begin
      calculadora.Title:='CALCULADORA ZEB';
      calculadora.Execute;
end;

procedure Tfrm_nompp.BitBtn5Click(Sender: TObject);  //Ingresa un nuevo docente//
begin
    frmreempleadoplanpriv.tb_empp.Close;
    frmreempleadoplanpriv.tb_empp.Open;
    frmreempleadoplanpriv.tb_empp.FindLast;
    frmreempleadoplanpriv.tb_empp.Append;
    frmreempleadoplanpriv.ShowModal;
end;

procedure Tfrm_nompp.BitBtn2Click(Sender: TObject); //Busca un docente que se encuentre registrado//

var
    buscar: string;
begin

        frmbuscar.caption:=frmbuscar.caption+':nombre o cedula';
        frmbuscar.ShowModal;
        buscar:=frmbuscar.bus.Text;
        con_empp.close;
   if esnum(buscar)=false then
       begin
         con_empp.Close;
         con_empp.SQL.Text :='select * from empleadospp  where  nombres like :c';
         con_empp.Params[0].AsString:='%'+buscar+'%';
         con_empp.Open;
         
       end
   else
       begin
         con_empp.Close;
         con_empp.SQL.Text:='select * from empleadospp  where cedula like :n';
         con_empp.Params[0].AsString:=buscar+'%';
         con_empp.Open;
         frmbuscar.bus.Hint:= '';
      end;
end;

procedure Tfrm_nompp.bt_eliClick(Sender: TObject);  // Eliminar//
begin
     if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=3) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=14)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) then
begin

    if  MessageDlg('¿Esta Seguro de Eliminar un Docente existente en el plantel: '+con_empp.fieldbyname('cedula').AsString+ ' ?',
    mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
        if not con_empp.IsEmpty then
        begin

          elim_empp.Close;
          elim_empp.Params[0].AsInteger:=con_empp.fieldbyname('cedula').AsInteger;
          elim_empp.ExecSQL;
          con_empp.Close;
          con_empp.SQL.Text:='select * from empleadospp order by cedula';
          con_empp.Open;
          gridpersonal.ResetFullRefresh;
        end;
    end;
end;
end;

procedure Tfrm_nompp.bt_modClick(Sender: TObject);
begin

    frm_modemplepp.ShowModal;
end;   
    
procedure Tfrm_nompp.gridpersonalDblClick(Sender: TObject);
begin
    frm_modemplepp.ShowModal;
end;

end.




