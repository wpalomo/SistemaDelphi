unit frmunplanprivados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZDataset, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, ToolEdit, RxLookup,
  RxCalc, dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib, RXDBCtrl, dxTL,
  dxDBCtrl, dxDBGrid, jpeg;

type
  Tfrmunplanpriv = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    nom: TDBEdit;
    GroupBox2: TGroupBox;
    COD: TDBEdit;
    bt_aceptar: TBitBtn;
    BitBtn2: TBitBtn;
    con_mun: TZQuery;
    data_mun: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    DIR: TDBEdit;
    GroupBox5: TGroupBox;
    LOCALIDAD: TDBEdit;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    ANNO: TDBEdit;
    TEL: TDBEdit;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    CORREO: TDBEdit;
    BitBtn6: TBitBtn;
    calculadora: TRxCalculator;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    MAT: TDBEdit;
    DISTRITO_NUM: TDBEdit;
    MAT_PRO: TDBEdit;
    FEELA: TDBDateEdit;
    data_conpp: TDataSource;
    con_pp: TZQuery;
    tb_depp: TZTable;
    data_depp: TDataSource;
    nmun: TEdit;
    cmun: TEdit;
    gmun: TdxDBGrid;
    gmunCOD: TdxDBGridMaskColumn;
    gmunNOMBRE: TdxDBGridMaskColumn;
    Image1: TImage;
    procedure bt_aceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_munKeyPress(Sender: TObject; var Key: Char);
    procedure FEELAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MATKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MAT_PROKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure cb_munExit(Sender: TObject);
    procedure CODExit(Sender: TObject);
    procedure cmunDblClick(Sender: TObject);
    procedure gmunDblClick(Sender: TObject);
    procedure cmunKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmunplanpriv: Tfrmunplanpriv;

implementation

uses frmacces, frmplanprivados;

{$R *.dfm}

procedure Tfrmunplanpriv.bt_aceptarClick(Sender: TObject);
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
      messagebox(0,'Debe ingresar NOMBRE...!','Mensaje al Usuario',16);
      nom.SetFocus;
      end
    else
      begin
        if dir.GetTextLen =0 then
        begin
        messagebox(0,'Debe ingresar DIRECCIÓN...!','Mensaje al Usuario',16);
        dir.SetFocus;
        end
     else
          begin
             if localidad.GetTextLen =0 then
             begin
             messagebox(0,'Debe ingresar LOCALIDAD...!','Mensaje al Usuario',16);
             localidad.SetFocus;
             end
         else
               begin
                if anno.GetTextLen =0 then
                begin
                messagebox(0,'Debe ingresar ANNO...!','Mensaje al Usuario',16);
                anno.SetFocus;
                end
            else
                    begin
                      if tel.GetTextLen =0 then
                      begin
                      messagebox(0,'Debe ingresar TELEFONO...!','Mensaje al Usuario',16);
                      tel.SetFocus;
                    end
             else
                   begin
                    if correo.GetTextLen =0 then
                      begin
                       messagebox(0,'Debe ingresar CORREO...!','Mensaje al Usuario',16);
                        correo.SetFocus;
                    end
              else
                   begin
                     if mat.GetTextLen =0 then
                      begin
                       messagebox(0,'Debe ingresar MATRICULA...!','Mensaje al Usuario',16);
                       mat.SetFocus;
                   end
              else
                      begin
                        if mat_pro.GetTextLen =0 then
                        begin
                         messagebox(0,'Debe ingresar MAT_PRO...!','Mensaje al Usuario',16);
                         cod.SetFocus;
                        end
               else
                        begin
                              if distrito_num.GetTextLen =0 then
                              begin
                              messagebox(0,'Debe ingresar DISTRITO_NUM...!','Mensaje al Usuario',16);
                              distrito_num.SetFocus;
                        end
               else

                       begin

                            tb_depp.edit;
                            tb_depp.FieldByName('cod_mun').AsInteger:=strtoint( cmun.text);
                            tb_depp.post;
                            frmplan_priv.con_pp.Close;
                            frmplan_priv.con_pp.Open;
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



procedure Tfrmunplanpriv.BitBtn2Click(Sender: TObject);
begin
   close;
end;


procedure Tfrmunplanpriv.FormShow(Sender: TObject);
begin
   feela.Date:=date;
   cmun.Clear;
   nmun.Clear;
   con_mun.Close;
   con_mun.Open;
   con_mun.FindFirst;
   cod.SetFocus;
end;

procedure Tfrmunplanpriv.cb_munKeyPress(Sender: TObject; var Key: Char);
begin
  if key<>#13 then
   key:=#0;
end;

procedure Tfrmunplanpriv.FEELAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 IF key <> 13 then key:=0;
end;

procedure Tfrmunplanpriv.MATKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #8:;

else
      key:=#0;
end;
end;

procedure Tfrmunplanpriv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tfrmunplanpriv.MAT_PROKeyPress(Sender: TObject; var Key: Char);
begin
case key of
      #48..#57:;
      #8:;

else
      key:=#0;
end;
end;

procedure Tfrmunplanpriv.cb_munExit(Sender: TObject);
var
   key: char;

begin
   key := #13;
    cb_munKeyPress(Sender,key);
end;

procedure Tfrmunplanpriv.CODExit(Sender: TObject);
begin
If cod.Text<> '' then
Begin
    con_pp.Close;
    con_pp.Params[0].Asinteger:=strtoint(cod.Text);
    con_pp.Open;
    
If not con_pp.IsEmpty then
  begin
     MessageBox(0,'Este codigo de plantel ya se Encuentra Registrado...!','Mensaje al Usuario',16);
     cod.Text:='';
     cod.setfocus;
end;
end;
end;

procedure Tfrmunplanpriv.cmunDblClick(Sender: TObject);
begin
con_mun.Close;
con_mun.Open;
gmun.Visible:= true;
end;

procedure Tfrmunplanpriv.gmunDblClick(Sender: TObject);
begin
  gmun.visible := False;
  cmun.Text:= con_mun.fieldbyname('cod').AsString;
  nmun.Text:= con_mun.fieldbyname('nombre').AsString;
end;

procedure Tfrmunplanpriv.cmunKeyPress(Sender: TObject; var Key: Char);
begin
     iF key <> #13 then key:=#0;
end;

end.
