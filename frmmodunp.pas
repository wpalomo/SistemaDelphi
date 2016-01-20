unit frmmodunp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZAbstractTable, ZDataset, RxCalc, DB, ZAbstractRODataset,
  ZAbstractDataset, StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, dxExEdtr,
  dxTL, dxDBCtrl, dxDBGrid, dxCntner;

type
  Tfrmmodunpro = class(TForm)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    GroupBox2: TGroupBox;
    rif: TDBEdit;
    GroupBox3: TGroupBox;
    nom: TDBEdit;
    GroupBox4: TGroupBox;
    ced: TDBEdit;
    GroupBox5: TGroupBox;
    nac: TDBEdit;
    GroupBox6: TGroupBox;
    cb_tipopro: TDBComboBox;
    GroupBox7: TGroupBox;
    rcz: TDBEdit;
    GroupBox8: TGroupBox;
    ciu: TDBEdit;
    GroupBox9: TGroupBox;
    tel: TDBEdit;
    GroupBox10: TGroupBox;
    rpoc: TDBEdit;
    GroupBox11: TGroupBox;
    cpos: TDBEdit;
    GroupBox12: TGroupBox;
    rl: TDBEdit;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn6: TBitBtn;
    BitBtn2: TBitBtn;
    calculadora: TRxCalculator;
    con_tipopro: TZQuery;
    datatipopro: TDataSource;
    GroupBox13: TGroupBox;
    DBEdit2: TDBEdit;
    cb_codtp: TDBComboBox;
    GroupBox14: TGroupBox;
    cel: TDBEdit;
    GroupBox15: TGroupBox;
    cb_imp: TDBComboBox;
    ck_imp: TCheckBox;
    imp: TDBEdit;
    GroupBox16: TGroupBox;
    pzo_ent: TDBEdit;
    GroupBox17: TGroupBox;
    cba: TEdit;
    ban: TEdit;
    rg: TRadioGroup;
    grid_ban2: TdxDBGrid;
    grid_ban2id: TdxDBGridMaskColumn;
    grid_ban2cod: TdxDBGridMaskColumn;
    grid_ban2banco: TdxDBGridMaskColumn;
    con_ban: TZQuery;
    databan: TDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure cb_tipoproKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_tipoproChange(Sender: TObject);
    procedure cb_tipoproExit(Sender: TObject);
    procedure impExit(Sender: TObject);
    procedure impKeyPress(Sender: TObject; var Key: Char);
    procedure banDblClick(Sender: TObject);
    procedure cbaKeyPress(Sender: TObject; var Key: Char);
    procedure grid_ban2DblClick(Sender: TObject);
    procedure rpocKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    id_prov:integer;
    { Public declarations }
  end;

var
  frmmodunpro: Tfrmmodunpro;

implementation

uses frmacces, frmprove, frmbus;

{$R *.dfm}

procedure Tfrmmodunpro.BitBtn2Click(Sender: TObject);
begin
frmprov.con_pro.Cancel;
con_tipopro.Close;
close;
end;

procedure Tfrmmodunpro.BitBtn6Click(Sender: TObject);
begin
calculadora.Title:='CALCULADORA ZEB';
calculadora.Execute;
end;

procedure Tfrmmodunpro.cb_tipoproKeyPress(Sender: TObject; var Key: Char);
begin
  if key<>#13 then
     key:=#0;
end;

procedure Tfrmmodunpro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tfrmmodunpro.BitBtn1Click(Sender: TObject);
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
                    messagebox(0,'Debe ingresar REGISTRO DE PROVEEDOR OCEI...!','Mensaje al Usuario',16);
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
                         frmprov.con_pro.Edit;
                         frmprov.con_pro.FieldByName('tpro').AsInteger:=id_prov+1;
                         if ck_imp.Checked=true then frmprov.con_pro.FieldByName('imp').Asstring:='S';
                         if ck_imp.Checked=false then frmprov.con_pro.FieldByName('imp').Asstring:='N';

                         if rg.ItemIndex=0 then frmprov.con_pro.fieldbyname('tcb').AsString:='A';
                         if rg.ItemIndex=1 then frmprov.con_pro.fieldbyname('tcb').AsString:='C';

                         frmprov.con_pro.fieldbyname('cod_banco').AsString:=cba.Text;
                         frmprov.con_pro.fieldbyname('banco').AsString:=ban.Text;

                         frmprov.con_pro.Post;
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

procedure Tfrmmodunpro.FormShow(Sender: TObject);
begin
   if frmprov.con_pro.fieldbyname('imp').AsString='S' then ck_imp.Checked:=true;
   if frmprov.con_pro.fieldbyname('imp').AsString='N' then ck_imp.Checked:=false;

   if frmprov.con_pro.fieldbyname('tcb').AsString='A' then  rg.ItemIndex:=0;
   if frmprov.con_pro.fieldbyname('tcb').AsString='C' then  rg.ItemIndex:=1;

   cba.Text:=frmprov.con_pro.fieldbyname('cod_banco').AsString;
   ban.Text:=frmprov.con_pro.fieldbyname('banco').AsString;


   id_prov:=frmprov.con_pro.fieldbyname('tpro').asinteger-1;
   cb_tipopro.Clear;
   cb_codtp.Clear;
   con_tipopro.Close;
   con_tipopro.Open;
   con_tipopro.FindFirst;
   while not con_tipopro.Eof do
   begin
     cb_tipopro.Items.Append(con_tipopro.fieldbyname('nom').AsString);
     cb_codtp.items.Append(con_tipopro.fieldbyname('id').AsString);
     cb_imp.items.Append(con_tipopro.fieldbyname('imp').AsString);
     con_tipopro.Next;
   end;
   cb_tipopro.ItemIndex:=id_prov;
   cb_codtp.ItemIndex:=id_prov;
   cb_imp.ItemIndex:=id_prov;


end;

procedure Tfrmmodunpro.cb_tipoproChange(Sender: TObject);
begin
   id_prov:=cb_tipopro.ItemIndex;
   cb_codtp.ItemIndex:=id_prov;
   cb_imp.ItemIndex:=id_prov;
end;

procedure Tfrmmodunpro.cb_tipoproExit(Sender: TObject);
begin
 if cb_imp.Text='S' then ck_imp.Checked:=true;
 if cb_imp.Text='N' then ck_imp.Checked:=false;
end;

procedure Tfrmmodunpro.impExit(Sender: TObject);
begin
if imp.Text='' then
   imp.SetFocus;
end;

procedure Tfrmmodunpro.impKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmmodunpro.banDblClick(Sender: TObject);
begin
con_ban.Close;
con_ban.Open;
grid_ban2.Visible:=true;
grid_ban2.SetFocus;
end;

procedure Tfrmmodunpro.cbaKeyPress(Sender: TObject; var Key: Char);
begin
if key <>#13 then
   key:=#0;

end;

procedure Tfrmmodunpro.grid_ban2DblClick(Sender: TObject);
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

procedure Tfrmmodunpro.rpocKeyPress(Sender: TObject; var Key: Char);
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

end.
