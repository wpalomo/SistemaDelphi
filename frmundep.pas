unit frmundep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZAbstractTable, ZDataset, RxCalc, DB, ZAbstractRODataset,
  ZAbstractDataset, StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, dxCntner,
  dxEditor, dxExEdtr, dxEdLib, dxDBELib, ComCtrls, dxTL, dxDBCtrl, dxDBGrid,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit;

type
  Tfrmunde = class(TForm)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    cod: TDBEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    nom: TDBEdit;
    GroupBox4: TGroupBox;
    cxa: TDBEdit;
    GroupBox5: TGroupBox;
    mat: TDBEdit;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    nc1: TDBEdit;
    GroupBox8: TGroupBox;
    tele: TDBEdit;
    GroupBox10: TGroupBox;
    GroupBox12: TGroupBox;
    direc: TDBEdit;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn6: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox13: TGroupBox;
    datadep: TDataSource;
    dataproymo: TDataSource;
    con_tipomod: TZQuery;
    calculadora: TRxCalculator;
    con_dep: TZQuery;
    datade: TDataSource;
    con_mun: TZQuery;
    datamun: TDataSource;
    dir: TDBEdit;
    tb_dep: TZTable;
    fecli: TDateTimePicker;
    GroupBox9: TGroupBox;
    mat_pro: TDBEdit;
    GroupBox11: TGroupBox;
    cel: TDBEdit;
    GroupBox14: TGroupBox;
    ck_pae: TDBCheckBox;
    mun: TEdit;
    lis_mun: TdxDBGrid;
    lis_proy: TdxDBGrid;
    proy: TEdit;
    lis_munNOMBRE: TdxDBGridMaskColumn;
    lis_proynom: TdxDBGridMaskColumn;
    num_mun: TEdit;
    num_proy: TEdit;
    nc2: TDBEdit;
    GroupBox15: TGroupBox;
    cdea: TDBEdit;
    con_coddea: TZQuery;
    datacoddea: TDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure nomExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure matKeyPress(Sender: TObject; var Key: Char);
    procedure cxaKeyPress(Sender: TObject; var Key: Char);
    procedure munDblClick(Sender: TObject);
    procedure lis_munDblClick(Sender: TObject);
    procedure proyDblClick(Sender: TObject);
    procedure lis_proyDblClick(Sender: TObject);
    procedure munExit(Sender: TObject);
    procedure proyExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmunde: Tfrmunde;

implementation

uses frmacces, frmescu;

{$R *.dfm}

procedure Tfrmunde.BitBtn2Click(Sender: TObject);
begin
tb_dep.Cancel;
tb_dep.Close;
close;
end;

procedure Tfrmunde.BitBtn6Click(Sender: TObject);
begin
calculadora.Title:='CALCULADORA ZEB';
calculadora.Execute;
end;

procedure Tfrmunde.nomExit(Sender: TObject);
begin
if nom.Text<>'' then
begin
   con_dep.Close;
   con_dep.Params[0].AsInteger:=strtoint(cod.Text);
   con_dep.Open;
   if NOT con_dep.IsEmpty then
   begin
     messagebox(0,'Dependencia ya Registrada...!','Mensaje al Usuario',16);
     nom.Clear;
     cod.SetFocus;
     cod.Clear;
   end;
end;
end;

procedure Tfrmunde.BitBtn1Click(Sender: TObject);
begin
if cod.GetTextLen =0 then
begin
   messagebox(0,'Debe ingresar CODIGO...!','Mensaje al Usuario',16);
   cod.SetFocus;
end
else
begin
   if nom.GetTextLen =0 then
   begin
     messagebox(0,'Debe ingresar el NOMBRE...!','Mensaje al Usuario',16);
     nom.setfocus;
   end
   else
   begin
      if cxa.GetTextLen =0 then
      begin
         messagebox(0,'Debe ingresar COSTO x ALUMNO...!','Mensaje al Usuario',16);
         cxa.setfocus;
      end
      else
      begin
        if mat.GetTextLen =0 then
        begin
          messagebox(0,'Debe ingresar MATRÌCULA...!','Mensaje al Usuario',16);
          mat.setfocus;
        end
        else
        begin
            if tele.GetTextLen =0 then
            begin
              messagebox(0,'Debe ingresar TELEFONO...!','Mensaje al Usuario',16);
              tele.setfocus;
            end
            else
            begin
              if dir.GetTextLen =0 then
              begin
                messagebox(0,'Debe ingresar DIRECCIÒN...!','Mensaje al Usuario',16);
                dir.setfocus;
              end
              else
              begin
                  if nc1.GetTextLen =0 then
                  begin
                    messagebox(0,'Debe ingresar Nro. de Cuenta Bancaria...! ','Mensaje al Usuario',16);
                    nc1.setfocus;
                  end
                  else
                  begin
                   if nc2.GetTextLen =0 then
                   begin
                     messagebox(0,'Debe ingresar Nro. de Cuenta Bancaria...! ','Mensaje al Usuario',16);
                     nc2.setfocus;
                   end
                   else
                   begin
                    if fecli.GetTextLen =0 then
                    begin
                      messagebox(0,'Debe ingresar FECHA DE LICITACIÒN...!','Mensaje al Usuario',16);
                      fecli.setfocus;
                    end
                    else
                    begin
                       if direc.GetTextLen =0 then
                       begin
                         messagebox(0,'Debe ingresar el DIRECTOR...!','Mensaje al Usuario',16);
                         direc.setfocus;
                       end
                       else
                       begin
                            if cdea.GetTextLen =0 then
                       begin
                         messagebox(0,'Debe ingresar el CODIGO DEA DE LA DEPENDENCIA...!','Mensaje al Usuario',16);
                         cdea.SetFocus;
                       end
                       else
                       begin
                         con_coddea.Close;
                         con_coddea.Params[0].AsString:=cdea.Text;
                         con_coddea.Open;

                         if not con_coddea.IsEmpty then
                         begin
                           messagebox(0,'CODIGO DEA YA EXISTE...!','Mensaje al Usuario',16);
                           cdea.SetFocus;
                         end
                         else
                         begin
                         tb_dep.FieldByName('cod_mun').AsInteger:=strtoint(num_mun.Text);
                         tb_dep.FieldByName('modal').AsInteger:=strtoint(num_proy.Text);
                         tb_dep.FieldByName('fecli').AsDateTime:=fecli.Date;
                         tb_dep.Post;
                         tb_dep.Close;
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
         end;
        end;
       end;


end;

procedure Tfrmunde.FormShow(Sender: TObject);
begin
  cod.SetFocus;
  fecli.Date:=date;
  ck_pae.Checked:=false;
  num_mun.Text:='1';
  num_proy.Text:='1';
  lis_mun.Visible:=false;
  lis_proy.Visible:=false;

end;

procedure Tfrmunde.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tfrmunde.matKeyPress(Sender: TObject; var Key: Char);
begin
case key of
  #48..#57:;
  #8:;
else
  key:=#0;
end;
end;

procedure Tfrmunde.cxaKeyPress(Sender: TObject; var Key: Char);
begin
case key of
  #48..#57:;
  #46:key:=#44;
  #8:;
else
  key:=#0;
end;
end;

procedure Tfrmunde.munDblClick(Sender: TObject);
begin
 lis_mun.Visible:=true;
 con_mun.Close;
 con_mun.Open;
end;

procedure Tfrmunde.lis_munDblClick(Sender: TObject);
begin
 mun.Text:=con_mun.fieldbyname('nombre').asstring;
 num_mun.Text:=con_mun.fieldbyname('cod').asstring;
 lis_mun.Visible:=false;
 mun.SetFocus;
end;

procedure Tfrmunde.proyDblClick(Sender: TObject);
begin
 lis_proy.Visible:=true;
 con_tipomod.Close;
 con_tipomod.Open;
end;

procedure Tfrmunde.lis_proyDblClick(Sender: TObject);
begin
 proy.Text:=con_tipomod.fieldbyname('nom').asstring;
 num_proy.Text:=con_tipomod.fieldbyname('id').asstring;
 lis_proy.Visible:=false;
 proy.SetFocus;
end;

procedure Tfrmunde.munExit(Sender: TObject);
begin
if mun.Text='' then
   mun.SetFocus;
end;

procedure Tfrmunde.proyExit(Sender: TObject);
begin
if proy.Text='' then
   proy.SetFocus;
end;

end.
