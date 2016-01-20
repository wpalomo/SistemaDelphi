unit frmunescu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxCalc, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, ZAbstractTable, ComCtrls,
  dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner;

type
  Tfrmunesc = class(TForm)
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn6: TBitBtn;
    BitBtn2: TBitBtn;
    calculadora: TRxCalculator;
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
    fecli: TDateTimePicker;
    GroupBox12: TGroupBox;
    direc: TDBEdit;
    GroupBox13: TGroupBox;
    dir: TDBEdit;
    dataproymo: TDataSource;
    con_tipomod: TZQuery;
    con_mun: TZQuery;
    datamun: TDataSource;
    GroupBox9: TGroupBox;
    mat_pro: TDBEdit;
    GroupBox11: TGroupBox;
    cel: TDBEdit;
    GroupBox14: TGroupBox;
    ck_pae: TDBCheckBox;
    lis_mun: TdxDBGrid;
    lis_munNOMBRE: TdxDBGridMaskColumn;
    lis_proy: TdxDBGrid;
    lis_proynom: TdxDBGridMaskColumn;
    datamuni: TDataSource;
    con_munv: TZQuery;
    mun: TEdit;
    con_proyv: TZQuery;
    dataproyv: TDataSource;
    proy: TEdit;
    muni: TEdit;
    proye: TEdit;
    nc2: TDBEdit;
    GroupBox15: TGroupBox;
    cdea: TDBEdit;
    con_coddea: TZQuery;
    datacoddea: TDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cb_nomunKeyPress(Sender: TObject; var Key: Char);
    procedure cb_nomodKeyPress(Sender: TObject; var Key: Char);
    procedure matKeyPress(Sender: TObject; var Key: Char);
    procedure cxaKeyPress(Sender: TObject; var Key: Char);
    procedure mat_proKeyPress(Sender: TObject; var Key: Char);
    procedure munDblClick(Sender: TObject);
    procedure proyDblClick(Sender: TObject);
    procedure munExit(Sender: TObject);
    procedure proyExit(Sender: TObject);
    procedure lis_munDblClick(Sender: TObject);
    procedure lis_proyDblClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    
    { Public declarations }
  end;

var
  frmunesc: Tfrmunesc;

implementation

uses frmacces, frmescu;

{$R *.dfm}

procedure Tfrmunesc.BitBtn2Click(Sender: TObject);
begin
frmesc.con_esc.Cancel;
con_mun.Close;
con_tipomod.Close;
close;
end;

procedure Tfrmunesc.BitBtn1Click(Sender: TObject);
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
                    messagebox(0,'Debe ingresar Nro. Cuenta Bancaria...! ','Mensaje al Usuario',16);
                    nc1.setfocus;
                  end
                  else
                  begin
                  if nc2.GetTextLen =0 then
                  begin
                    messagebox(0,'Debe ingresar Nro. Cuenta Bancaria...! ','Mensaje al Usuario',16);
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
                           frmesc.con_esc.Edit;
                           frmesc.con_esc.FieldByName('cod_mun').AsInteger:=strtoint(muni.Text);
                           frmesc.con_esc.FieldByName('modal').AsInteger:=strtoint(proye.Text);
                           frmesc.con_esc.FieldByName('fecli').AsDateTime:=fecli.Date;
                           frmesc.con_esc.Post;
                           frmesc.con_esc.Close;
                           frmesc.con_esc.SQL.Text:='select * from dependencias  where cod like :c order by cod';
                           frmesc.con_esc.Params[0].Asstring:='%';
                           frmesc.con_esc.open;
                           frmesc.gridesc.ResetFullRefresh;
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

procedure Tfrmunesc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tfrmunesc.FormShow(Sender: TObject);
begin
lis_mun.Visible:=false;
lis_proy.Visible:=false;

con_munv.Close;
con_munv.Params[0].AsInteger:=frmesc.con_esc.fieldbyname('cod_mun').AsInteger;
con_munv.Open;
mun.Text:=con_munv.fieldbyname('nombre').AsString;
muni.Text:=con_munv.fieldbyname('cod').AsString;
con_munv.Close;

con_proyv.Close;
con_proyv.Params[0].AsInteger:=frmesc.con_esc.fieldbyname('modal').AsInteger;
con_proyv.Open;
proy.Text:=con_proyv.fieldbyname('nom').AsString;
proye.Text:=con_proyv.fieldbyname('id').AsString;
con_proyv.Close;

end;

procedure Tfrmunesc.cb_nomunKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0;
end;

procedure Tfrmunesc.cb_nomodKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0;
end;

procedure Tfrmunesc.matKeyPress(Sender: TObject; var Key: Char);
begin
case key of
  #48..#57:;
  #8:;
else
  key:=#0;
end;
end;

procedure Tfrmunesc.cxaKeyPress(Sender: TObject; var Key: Char);
begin
 case key of
  #48..#57:;
  #46:key:=#44;
  #8:;
else
  key:=#0;
end;
end;

procedure Tfrmunesc.mat_proKeyPress(Sender: TObject; var Key: Char);
begin
case key of
  #48..#57:;
  #8:;
else
  key:=#0;
end;
end;

procedure Tfrmunesc.munDblClick(Sender: TObject);
begin
 lis_mun.Visible:=true;
 con_mun.Close;
 con_mun.Open;
end;

procedure Tfrmunesc.proyDblClick(Sender: TObject);
begin
lis_proy.Visible:=true;
 con_tipomod.Close;
 con_tipomod.Open;
end;

procedure Tfrmunesc.munExit(Sender: TObject);
begin
if mun.Text='' then
   mun.SetFocus;
end;

procedure Tfrmunesc.proyExit(Sender: TObject);
begin
if proy.Text='' then
   proy.SetFocus;
end;

procedure Tfrmunesc.lis_munDblClick(Sender: TObject);
begin
 mun.Text:=con_mun.fieldbyname('nombre').asstring;
 muni.Text:=con_mun.fieldbyname('cod').asstring;
 lis_mun.Visible:=false;
 mun.SetFocus;
end;

procedure Tfrmunesc.lis_proyDblClick(Sender: TObject);
begin
 proy.Text:=con_tipomod.fieldbyname('nom').asstring;
 proye.Text:=con_tipomod.fieldbyname('id').asstring;
 lis_proy.Visible:=false;
 proy.SetFocus;
end;

procedure Tfrmunesc.BitBtn6Click(Sender: TObject);
begin
calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

end.
