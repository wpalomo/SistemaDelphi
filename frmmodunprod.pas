unit frmmodunprod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls,
  DBCtrls, Buttons, ExtCtrls, Mask, RxCalc;

type
  Tfrmmodpro = class(TForm)
    GroupBox3: TGroupBox;
    nom: TDBEdit;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    cb_uni: TDBComboBox;
    GroupBox4: TGroupBox;
    cb_tipoprod: TDBComboBox;
    con_tiprod: TZQuery;
    datatipo: TDataSource;
    con_uni: TZQuery;
    datauni: TDataSource;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    calculadora: TRxCalculator;
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
    GroupBox11: TGroupBox;
    prec: TEdit;
    GroupBox5: TGroupBox;
    ck_imp: TCheckBox;
    valimp: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_tipoprodChange(Sender: TObject);
    procedure cb_uniChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    { Private declarations }
  public
     ind1,ind2:integer;
    { Public declarations }
  end;

var
  frmmodpro: Tfrmmodpro;

implementation

uses frmproductos;

{$R *.dfm}

procedure Tfrmmodpro.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfrmmodpro.BitBtn6Click(Sender: TObject);
begin
 calculadora.Title:='CALCULADORA ZEB';
 calculadora.Execute;
end;

procedure Tfrmmodpro.FormShow(Sender: TObject);
begin
   prec.Text:=frmprod.con_prod.FieldByName('precio').Asstring;
   cal.Text:= frmprod.con_prod.FieldByName('cal').Asstring;
   pro.Text:= frmprod.con_prod.FieldByName('pro').Asstring;
   gra.Text:= frmprod.con_prod.FieldByName('gra').Asstring;
   facdes.Text:= frmprod.con_prod.FieldByName('fac').Asstring;
   val.Text:= frmprod.con_prod.FieldByName('val_base').Asstring;
   if frmprod.con_prod.FieldByName('imp').Asstring='S' then ck_imp.Checked:=true;
   if frmprod.con_prod.FieldByName('imp').Asstring='N' then ck_imp.Checked:=false;
   valimp.Text:=frmprod.con_prod.FieldByName('impbs').Asstring;

   cb_tipoprod.ItemIndex:=0;
   cb_tipoprod.Clear;
   con_tiprod.Close;
   con_tiprod.Open;
   con_tiprod.FindFirst;
   while not con_tiprod.Eof do
   begin
     cb_tipoprod.Items.Append(con_tiprod.fieldbyname('nom').AsString);
     con_tiprod.Next;
   end;
   if frmprod.con_prod.fieldbyname('tipoprod').asinteger>0 then
   begin
       cb_tipoprod.ItemIndex:=frmprod.con_prod.fieldbyname('tipoprod').asinteger-1;
       ind1:=cb_tipoprod.ItemIndex;
   end
   else
       cb_tipoprod.ItemIndex:=0;
   //****************************


   cb_uni.ItemIndex:=0;
   cb_uni.Clear;
   con_uni.Close;
   con_uni.Open;
   con_uni.FindFirst;
   while not con_uni.Eof do
   begin
     cb_uni.Items.Append(con_uni.fieldbyname('nom').AsString);
     con_uni.Next;
   end;
   if frmprod.con_prod.fieldbyname('unidad').asinteger>0 then
   begin
      cb_uni.ItemIndex:=frmprod.con_prod.fieldbyname('unidad').asinteger-1;
      ind2:=cb_uni.ItemIndex;
   end
   else
      cb_uni.ItemIndex:=0;


end;

procedure Tfrmmodpro.cb_tipoprodChange(Sender: TObject);
begin
 ind1:=cb_tipoprod.ItemIndex;
end;

procedure Tfrmmodpro.cb_uniChange(Sender: TObject);
begin
 ind2:=cb_uni.ItemIndex;
end;

procedure Tfrmmodpro.BitBtn1Click(Sender: TObject);
var
con1,con2:string;
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
                         frmprod.con_prod.Edit;
                         frmprod.con_prod.FieldByName('tipoprod').AsInteger:=ind1+1;
                         frmprod.con_prod.FieldByName('unidad').AsInteger:=ind2+1;
                         if ck_imp.Checked=true then
                              frmprod.con_prod.FieldByName('imp').Asstring:='S';
                         if ck_imp.Checked=false then
                              frmprod.con_prod.FieldByName('imp').Asstring:='N';

                         frmprod.con_prod.FieldByName('cal').Asfloat:=strtofloat(cal.Text);
                         frmprod.con_prod.FieldByName('pro').Asfloat:=strtofloat(pro.Text);
                         frmprod.con_prod.FieldByName('gra').Asfloat:=strtofloat(gra.Text);
                         frmprod.con_prod.FieldByName('fac').Asfloat:=strtofloat(facdes.Text);
                         frmprod.con_prod.FieldByName('val_base').Asfloat:=strtofloat(val.Text);
                         frmprod.con_prod.FieldByName('precio').Asfloat:=strtofloat(prec.Text);
                         frmprod.con_prod.FieldByName('impbs').Asfloat:=strtofloat(valimp.Text);
                         frmprod.con_prod.Post;
                         frmprod.con_prod.Close;
                         con1:='select productos.`id`,productos.`nom`, productos.precio,productos.`imp`,productos.`impbs`,tipo_producto.`nom`,unidades.`nom`,productos.`cal`,productos.`pro`,productos.`gra`,productos.`fac` ,productos.tipoprod,productos.unidad,productos.cal,productos.pro,';
                         con2:='productos.gra,productos.fac,productos.val_base  from productos,`tipo_producto`,`unidades` where productos.`tipoprod`=tipo_producto.`id` and productos.`unidad`=unidades.`id` group by productos.id';
                         frmprod.con_prod.SQL.Text:=con1+con2;
                         frmprod.con_prod.open;
                         close;
                   end;
              end;
            end;
          end;
end;

procedure Tfrmmodpro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tfrmmodpro.cb_tipoprodKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0;
end;

procedure Tfrmmodpro.cb_uniKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0;
end;

procedure Tfrmmodpro.calExit(Sender: TObject);
begin
if cal.Text='' then
   cal.SetFocus;
end;

procedure Tfrmmodpro.proExit(Sender: TObject);
begin
if pro.Text='' then
   pro.SetFocus;
end;

procedure Tfrmmodpro.graExit(Sender: TObject);
begin
if gra.Text='' then
   gra.SetFocus;
end;

procedure Tfrmmodpro.facdesExit(Sender: TObject);
begin
if facdes.Text='' then
   facdes.SetFocus;
end;

procedure Tfrmmodpro.valExit(Sender: TObject);
begin
if val.Text='' then
   val.SetFocus;
end;

procedure Tfrmmodpro.precExit(Sender: TObject);
begin
if prec.Text='' then
   prec.SetFocus;
end;

procedure Tfrmmodpro.precKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmmodpro.ck_impExit(Sender: TObject);
begin
if ck_imp.Checked=true then valimp.Enabled:=true;
if ck_imp.Checked=false then valimp.Enabled:=true;
end;

procedure Tfrmmodpro.valimpKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmmodpro.valimpExit(Sender: TObject);
begin
if valimp.Text='' then
   valimp.SetFocus;
end;

procedure Tfrmmodpro.calKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmmodpro.proKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmmodpro.graKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmmodpro.facdesKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmmodpro.valKeyPress(Sender: TObject; var Key: Char);
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
