unit frmunprove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB,
  ZAbstractRODataset, ZDataset, dblookup, Menus, ZAbstractDataset,
  ZAbstractTable, RxCalc, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner;

type
  Tfrmunprov = class(TForm)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    DBEdit1: TDBEdit;
    nom: TDBEdit;
    rif: TDBEdit;
    ced: TDBEdit;
    nac: TDBEdit;
    ciu: TDBEdit;
    tel: TDBEdit;
    rcz: TDBEdit;
    rpoc: TDBEdit;
    cpos: TDBEdit;
    rl: TDBEdit;
    dataprov: TDataSource;
    datatipopro: TDataSource;
    cb_tipopro: TDBComboBox;
    con_tipopro: TZQuery;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn6: TBitBtn;
    calculadora: TRxCalculator;
    tb_prov: TZTable;
    BitBtn2: TBitBtn;
    GroupBox13: TGroupBox;
    DBEdit2: TDBEdit;
    con_pro: TZQuery;
    datapro: TDataSource;
    GroupBox14: TGroupBox;
    cel: TDBEdit;
    GroupBox15: TGroupBox;
    ck_imp: TDBCheckBox;
    cb_imp: TDBComboBox;
    imp: TDBEdit;
    con_zona: TZQuery;
    datazona: TDataSource;
    GroupBox16: TGroupBox;
    pzo_ent: TDBEdit;
    GroupBox17: TGroupBox;
    rg: TRadioGroup;
    cba: TEdit;
    ban: TEdit;
    databan: TDataSource;
    con_ban: TZQuery;
    grid_ban2: TdxDBGrid;
    grid_ban2id: TdxDBGridMaskColumn;
    grid_ban2cod: TdxDBGridMaskColumn;
    grid_ban2banco: TdxDBGridMaskColumn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_tipoproKeyPress(Sender: TObject; var Key: Char);
    procedure cb_codtpKeyPress(Sender: TObject; var Key: Char);
    procedure cb_tipoproChange(Sender: TObject);
    procedure nomExit(Sender: TObject);
    procedure impKeyPress(Sender: TObject; var Key: Char);
    procedure cb_tipoproEnter(Sender: TObject);
    procedure pzo_entKeyPress(Sender: TObject; var Key: Char);
    procedure cbaDblClick(Sender: TObject);
    procedure grid_banDblClick(Sender: TObject);
    procedure banDblClick(Sender: TObject);
    procedure grid_ban2DblClick(Sender: TObject);
    procedure rpocKeyPress(Sender: TObject; var Key: Char);
    procedure cbaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
     id_prov:integer;
    { Public declarations }
  end;

var
  frmunprov: Tfrmunprov;

implementation

uses frmacces, frmzeb;

{$R *.dfm}

procedure Tfrmunprov.BitBtn1Click(Sender: TObject);
begin
if nom.GetTextLen =0 then
begin
   messagebox(0,'Debe ingresar NOMBRE...!','Mensaje al Usuario',16);
   nom.SetFocus;
end
else
begin
   if rif.GetTextLen =0 then
   begin
     messagebox(0,'Debe ingresar el RIF...!','Mensaje al Usuario',16);
     rif.setfocus;
   end
   else
   begin
      if ced.GetTextLen =0 then
      begin
         messagebox(0,'Debe ingresar CEDULA...!','Mensaje al Usuario',16);
         ced.setfocus;
      end
      else
      begin
        if nac.GetTextLen =0 then
        begin
          messagebox(0,'Debe ingresar NACIONALIDAD...!','Mensaje al Usuario',16);
          nac.setfocus;
        end
        else
        begin
          if cb_tipopro.GetTextLen =0 then
          begin
            messagebox(0,'Debe ingresar TIPO...!','Mensaje al Usuario',16);
            cb_tipopro.setfocus;
          end
          else
          begin
            if ciu.GetTextLen =0 then
            begin
              messagebox(0,'Debe ingresar CIUDAD...!','Mensaje al Usuario',16);
              ciu.setfocus;
            end
            else
            begin
              if tel.GetTextLen =0 then
              begin
                messagebox(0,'Debe ingresar TELEFONO...!','Mensaje al Usuario',16);
                tel.setfocus;
              end
              else
              begin
                if rcz.GetTextLen =0 then
                begin
                  messagebox(0,'Debe ingresar REGISTRO CONTRATISTA ZEC..!','Mensaje al Usuario',16);
                  rcz.setfocus;
                end
                else
                begin
                  if rpoc.GetTextLen =0 then
                  begin
                    messagebox(0,'Debe ingresar NUMERO DE CUENTA BANCARIA...!','Mensaje al Usuario',16);
                    rpoc.setfocus;
                  end
                  else
                  begin
                    if cpos.GetTextLen =0 then
                    begin
                      messagebox(0,'Debe ingresar CODIGO POSTAL...!','Mensaje al Usuario',16);
                      cpos.setfocus;
                    end
                    else
                    begin
                       if rl.GetTextLen =0 then
                       begin
                         messagebox(0,'Debe ingresar REPRESENTANTE LEGAL...!','Mensaje al Usuario',16);
                         rl.setfocus;
                       end
                       else
                       begin
                         tb_prov.FieldByName('tpro').AsInteger:=id_prov+1;
                         tb_prov.FieldByName('cod_banco').AsString:=cba.Text;
                         tb_prov.FieldByName('banco').AsString:=ban.Text;

                         if rg.ItemIndex=0 then
                           tb_prov.FieldByName('tcb').AsString:='A';
                         if rg.ItemIndex=1 then
                           tb_prov.FieldByName('tcb').AsString:='C';

                         tb_prov.Post;
                         tb_prov.Close;
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

procedure Tfrmunprov.BitBtn6Click(Sender: TObject);
begin
calculadora.Title:='CALCULADORA ZEB';
calculadora.Execute;
end;

procedure Tfrmunprov.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tfrmunprov.BitBtn2Click(Sender: TObject);
begin
tb_prov.Cancel;
tb_prov.Close;
con_zona.Close;
close;
end;

procedure Tfrmunprov.FormShow(Sender: TObject);
begin
ban.Text:='';
cba.Text:='';
rpoc.Text:='';
rg.ItemIndex:=-1;

con_zona.Close;
con_zona.Open;
imp.Text:=con_zona.fieldbyname('impuesto').asstring;
id_prov:=0;

 cb_tipopro.Clear;
   con_tipopro.Close;
   con_tipopro.Open;
   con_tipopro.FindFirst;
   while not con_tipopro.Eof do
   begin
     cb_tipopro.Items.Append(con_tipopro.fieldbyname('nom').AsString);
     cb_imp.Items.Append(con_tipopro.fieldbyname('imp').AsString);
     con_tipopro.Next;
   end;
   cb_tipopro.ItemIndex:=0;
   cb_imp.ItemIndex:=0;

nom.SetFocus;
end;

procedure Tfrmunprov.cb_tipoproKeyPress(Sender: TObject; var Key: Char);
begin
  if key<>#13 then
     key:=#0
  else
  begin
  if cb_imp.Text='S' then
  begin
    ck_imp.Checked:=true;
    ck_imp.Enabled:=false;
    imp.Enabled:=false;
  end;
  if cb_imp.Text='N' then
  begin
    ck_imp.Checked:=false;
    ck_imp.Enabled:=false;
    imp.Text:='0';
    imp.Enabled:=false;
  end;
  end;
end;

procedure Tfrmunprov.cb_codtpKeyPress(Sender: TObject; var Key: Char);
begin
 if key<>#13 then
     key:=#0;
end;

procedure Tfrmunprov.cb_tipoproChange(Sender: TObject);
begin
cb_imp.ItemIndex:=cb_tipopro.ItemIndex;
end;

procedure Tfrmunprov.nomExit(Sender: TObject);
begin
con_pro.Close;
con_pro.Params[0].AsString:=nom.Text;
con_pro.Open;
if not con_pro.IsEmpty then
begin
     MessageBox(0,'Este proveedor ya se Encuentra Registrado...!','Mensaje al Usuario',16);
     nom.Clear;
     nom.setfocus;
end;
end;

procedure Tfrmunprov.impKeyPress(Sender: TObject; var Key: Char);
begin
  case key of
      #48..#57:;
      #8:;
      #46: begin
              key:=#44;
           end;
else
      key:=#0;
end;
end;

procedure Tfrmunprov.cb_tipoproEnter(Sender: TObject);
begin
cb_tipopro.ItemIndex:=0;
end;

procedure Tfrmunprov.pzo_entKeyPress(Sender: TObject; var Key: Char);
begin
  case key of
      #48..#57:;
      #8:;
      #46: begin
              key:=#44;
           end;
else
      key:=#0;
end;
end;

procedure Tfrmunprov.cbaDblClick(Sender: TObject);
begin
con_ban.Close;
con_ban.Open;
grid_ban2.Visible:=true;
grid_ban2.SetFocus;
end;

procedure Tfrmunprov.grid_banDblClick(Sender: TObject);
begin
    if (con_ban.fieldbyname('cod').asstring='3') or (con_ban.fieldbyname('cod').asstring='6') or (con_ban.fieldbyname('cod').asstring='7')  then
    begin
       cba.Text:='00'+con_ban.fieldbyname('cod').asstring;
    end
    else
    begin
      cba.Text:=con_ban.fieldbyname('cod').asstring;
    end;
end;

procedure Tfrmunprov.banDblClick(Sender: TObject);
begin
con_ban.Close;
con_ban.Open;
grid_ban2.Visible:=true;
grid_ban2.SetFocus;
end;

procedure Tfrmunprov.grid_ban2DblClick(Sender: TObject);
begin
if (con_ban.fieldbyname('cod').asstring='3') or (con_ban.fieldbyname('cod').asstring='6') or (con_ban.fieldbyname('cod').asstring='7')  then
    begin
       cba.Text:='00'+con_ban.fieldbyname('cod').asstring;
    end
    else
    begin
      cba.Text:=con_ban.fieldbyname('cod').asstring;
    end;

   ban.Text:=con_ban.fieldbyname('banco').asstring;
   grid_ban2.visible:=false;
   rg.SetFocus;
end;

procedure Tfrmunprov.rpocKeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #46: begin
              key:=#44;
           end;
 else
      key:=#0;
 end;
end;

procedure Tfrmunprov.cbaKeyPress(Sender: TObject; var Key: Char);
begin
if key <>#13 then
   key:=#0; 

end;

end.
