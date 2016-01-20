unit frmunproduc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ExtCtrls, Mask, DBCtrls, ZAbstractTable, RxCalc;

type
  Tfrmunprod = class(TForm)
    GroupBox3: TGroupBox;
    nom: TDBEdit;
    Panel1: TPanel;
    Label1: TLabel;
    con_prod: TZQuery;
    datade: TDataSource;
    BitBtn1: TBitBtn;
    calculadora: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    tb_prod: TZTable;
    dataprod: TDataSource;
    cb_tipoprod: TDBComboBox;
    cb_uni: TDBComboBox;
    con_tiprod: TZQuery;
    datatipo: TDataSource;
    con_uni: TZQuery;
    datauni: TDataSource;
    calcula: TRxCalculator;
    GroupBox6: TGroupBox;
    cal: TEdit;
    GroupBox7: TGroupBox;
    pro: TEdit;
    GroupBox8: TGroupBox;
    gra: TEdit;
    GroupBox9: TGroupBox;
    facdes: TEdit;
    GroupBox10: TGroupBox;
    val: TEdit;
    GroupBox1: TGroupBox;
    prec: TEdit;
    GroupBox5: TGroupBox;
    ck_imp: TCheckBox;
    valimp: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure nomExit(Sender: TObject);
    procedure cb_tipoprodEnter(Sender: TObject);
    procedure cb_uniEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cb_tipoprodChange(Sender: TObject);
    procedure cb_uniChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure calculadoraClick(Sender: TObject);
    procedure cb_tipoprodKeyPress(Sender: TObject; var Key: Char);
    procedure cb_uniKeyPress(Sender: TObject; var Key: Char);
    procedure calExit(Sender: TObject);
    procedure proExit(Sender: TObject);
    procedure graExit(Sender: TObject);
    procedure facdesExit(Sender: TObject);
    procedure valExit(Sender: TObject);
    procedure precExit(Sender: TObject);
    procedure precKeyPress(Sender: TObject; var Key: Char);
    procedure ck_impExit(Sender: TObject);
    procedure valimpKeyPress(Sender: TObject; var Key: Char);
    procedure valimpExit(Sender: TObject);
    procedure calKeyPress(Sender: TObject; var Key: Char);
    procedure proKeyPress(Sender: TObject; var Key: Char);
    procedure graKeyPress(Sender: TObject; var Key: Char);
    procedure facdesKeyPress(Sender: TObject; var Key: Char);
    procedure valKeyPress(Sender: TObject; var Key: Char);
  private
     ind1,ind2:integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmunprod: Tfrmunprod;

implementation

uses frmacces, frmzeb;

{$R *.dfm}

procedure Tfrmunprod.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfrmunprod.nomExit(Sender: TObject);
begin
con_prod.Close;
con_prod.Params[0].AsString:=nom.Text;
con_prod.Open;
  if not con_prod.IsEmpty then
  begin
     messagebox(0,'Producto ya se Encuentra Registrado...!','Mensaje al Usuario',16);
     nom.setfocus;
     nom.Clear;
  end;
end;

procedure Tfrmunprod.cb_tipoprodEnter(Sender: TObject);
begin
   cb_tipoprod.Clear;
   con_tiprod.Close;
   con_tiprod.Open;
   con_tiprod.FindFirst;
   while not con_tiprod.Eof do
   begin
     cb_tipoprod.Items.Append(con_tiprod.fieldbyname('nom').AsString);
     con_tiprod.Next;
   end;
   cb_tipoprod.ItemIndex:=0;
end;

procedure Tfrmunprod.cb_uniEnter(Sender: TObject);
begin
   cb_uni.Clear;
   con_uni.Close;
   con_uni.Open;
   con_uni.FindFirst;
   while not con_uni.Eof do
   begin
     cb_uni.Items.Append(con_uni.fieldbyname('nom').AsString);
     con_uni.Next;
   end;
   cb_uni.ItemIndex:=0;
end;

procedure Tfrmunprod.BitBtn1Click(Sender: TObject);
begin


                  if nom.GetTextLen =0 then
                  begin
                    messagebox(0,'Debe ingresar NOMBRE...! ','Mensaje al Usuario',16);
                    nom.setfocus;
                  end
                  else
                  begin
                    if cb_tipoprod.GetTextLen =0 then
                    begin
                      messagebox(0,'Debe ingresar TIPO DE PRODUCTO...!','Mensaje al Usuario',16);
                      cb_tipoprod.setfocus;
                    end
                    else
                    begin
                       if cb_uni.GetTextLen =0 then
                       begin
                         messagebox(0,'Debe ingresar la UNIDAD DEL PRODUCTO...!','Mensaje al Usuario',16);
                         cb_uni.setfocus;
                       end
                       else
                       begin
                           if prec.GetTextLen =0 then
                           begin
                               messagebox(0,'Debe ingresar PRECIO...! ','Mensaje al Usuario',16);
                               prec.setfocus;
                           end
                           else
                           begin
                              tb_prod.FieldByName('tipoprod').AsInteger:=ind1+1;
                              tb_prod.FieldByName('unidad').AsInteger:=ind2+1;
                              if ck_imp.Checked=true then
                                 tb_prod.FieldByName('imp').Asstring:='S';
                              if ck_imp.Checked=false then
                                  tb_prod.FieldByName('imp').Asstring:='N';

                              tb_prod.FieldByName('cal').Asfloat:=strtofloat(cal.Text);
                              tb_prod.FieldByName('pro').Asfloat:=strtofloat(pro.Text);
                              tb_prod.FieldByName('gra').Asfloat:=strtofloat(gra.Text);
                              tb_prod.FieldByName('fac').Asfloat:=strtofloat(facdes.Text);
                              tb_prod.FieldByName('val_base').AsFloat:=strtofloat(val.Text);
                              tb_prod.FieldByName('precio').AsFloat:=strtofloat(prec.Text);
                              tb_prod.FieldByName('impbs').AsFloat:=strtofloat(valimp.Text);
                              tb_prod.Post;
                              tb_prod.Close;
                              close;
                           end;
                    end;
                 end;
              end;
end;

procedure Tfrmunprod.cb_tipoprodChange(Sender: TObject);
begin
ind1:=cb_tipoprod.ItemIndex;
end;

procedure Tfrmunprod.cb_uniChange(Sender: TObject);
begin
ind2:=cb_uni.ItemIndex;
end;

procedure Tfrmunprod.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tfrmunprod.FormShow(Sender: TObject);
begin
nom.Text:='0';
cal.text:='0';
pro.Text:='0';
facdes.Text:='0';
val.text:='0';
prec.text:='0';
nom.SetFocus;
end;

procedure Tfrmunprod.calculadoraClick(Sender: TObject);
begin
 calcula.Title:='CALCULADORA ZEB';
 calcula.Execute;
end;

procedure Tfrmunprod.cb_tipoprodKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0;
end;

procedure Tfrmunprod.cb_uniKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0;
end;

procedure Tfrmunprod.calExit(Sender: TObject);
begin
if cal.Text='' then
   cal.SetFocus;
end;

procedure Tfrmunprod.proExit(Sender: TObject);
begin
if pro.Text='' then
   pro.SetFocus;
end;

procedure Tfrmunprod.graExit(Sender: TObject);
begin
if gra.Text='' then
   gra.SetFocus;
end;

procedure Tfrmunprod.facdesExit(Sender: TObject);
begin
if facdes.Text='' then
   facdes.SetFocus;
end;

procedure Tfrmunprod.valExit(Sender: TObject);
begin
if val.Text='' then
   val.SetFocus;
end;

procedure Tfrmunprod.precExit(Sender: TObject);
begin
if prec.Text='' then
   prec.SetFocus;
end;

procedure Tfrmunprod.precKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmunprod.ck_impExit(Sender: TObject);
begin
if ck_imp.Checked=true then valimp.Enabled:=true;
if ck_imp.Checked=false then valimp.Enabled:=true;
end;

procedure Tfrmunprod.valimpKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmunprod.valimpExit(Sender: TObject);
begin
if valimp.Text='' then
   valimp.SetFocus;
end;

procedure Tfrmunprod.calKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmunprod.proKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmunprod.graKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmunprod.facdesKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmunprod.valKeyPress(Sender: TObject; var Key: Char);
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
