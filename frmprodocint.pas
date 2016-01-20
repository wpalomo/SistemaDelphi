unit frmprodocint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, StdCtrls, cxControls,
  cxInplaceContainer, cxVGrid, cxDBVGrid, ExtCtrls, jpeg, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, dxExEdtr, dxDBTLCl,
  dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner, ComCtrls, RxCalc, Buttons,
  Mask, ToolEdit, CurrEdit;

type
  Tfrmprodint = class(TForm)
    Image1: TImage;
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    con_prodint: TZQuery;
    dataprodint: TDataSource;
    ctrl_tab: TPageControl;
    tab1: TTabSheet;
    bt_buscar: TBitBtn;
    bt_nuevo: TBitBtn;
    bt_eli: TBitBtn;
    bt_mod: TBitBtn;
    bt_salir: TBitBtn;
    bt_cal: TBitBtn;
    calculadora: TRxCalculator;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    con_pro: TZQuery;
    datproint: TDataSource;
    p1: TPanel;
    gridp: TdxDBGrid;
    gridpid: TdxDBGridMaskColumn;
    gridpnom: TdxDBGridMaskColumn;
    pro: TEdit;
    tpr: TEdit;
    uni: TEdit;
    ck_imp: TCheckBox;
    imb: TRxCalcEdit;
    inu: TRxCalcEdit;
    pre: TRxCalcEdit;
    con_uni: TZQuery;
    datauni: TDataSource;
    eli_prod: TZQuery;
    dataelip: TDataSource;
    p2: TPanel;
    griduni: TdxDBGrid;
    con_unidad: TZQuery;
    dataunidad: TDataSource;
    griduniid: TdxDBGridMaskColumn;
    griduninom: TdxDBGridMaskColumn;
    bt_guardar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure bt_buscarClick(Sender: TObject);
    procedure gridpDblClick(Sender: TObject);
    function esnum(NumStr : string) : bool;
    procedure bt_calClick(Sender: TObject);
    procedure bt_eliClick(Sender: TObject);
    procedure bt_modClick(Sender: TObject);
    procedure griduniDblClick(Sender: TObject);
    procedure uniDblClick(Sender: TObject);
    procedure bt_nuevoClick(Sender: TObject);
    procedure bt_guardarClick(Sender: TObject);
    procedure preChange(Sender: TObject);
    procedure inuChange(Sender: TObject);
    procedure gridpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure proKeyPress(Sender: TObject; var Key: Char);
    procedure tprKeyPress(Sender: TObject; var Key: Char);
    procedure uniKeyPress(Sender: TObject; var Key: Char);
    procedure inuKeyPress(Sender: TObject; var Key: Char);
    procedure preKeyPress(Sender: TObject; var Key: Char);
    procedure imbKeyPress(Sender: TObject; var Key: Char);
    procedure ck_impKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    unidad:integer;
    cambio:byte;

  public
    { Public declarations }
  end;

var
  frmprodint: Tfrmprodint;

implementation

uses frmacces, frmbus;

{$R *.dfm}


function Tfrmprodint.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
        end;
end;

procedure Tfrmprodint.FormShow(Sender: TObject);
begin

    pro.Clear;
    tpr.Clear;
    uni.Clear;
    inu.Clear;
    pre.Clear;
    imb.Clear;

   con_prodint.Close;
   con_prodint.Open;
   bt_buscar.SetFocus;
end;

procedure Tfrmprodint.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmprodint.bt_buscarClick(Sender: TObject);
var
  buscar: string;
begin

       frmbuscar.ShowModal;
       buscar:=frmbuscar.bus.Text;
       con_pro.close;
       if esnum(buscar)=false then
       begin
         con_pro.Close;
         con_pro.SQL.Text:='select * from productos_oc_int where nom like :n';
         con_pro.Params[0].AsString:='%'+buscar+'%';
         con_pro.Open;
         if not con_pro.IsEmpty then
         begin
           //*****
             if con_pro.fieldbyname('precio6').Asfloat>0 then
                pre.Value :=con_pro.fieldbyname('precio6').Asfloat
             else
             begin
                if con_pro.fieldbyname('precio5').Asfloat>0 then
                   pre.Value :=con_pro.fieldbyname('precio5').Asfloat
                else
                begin
                   if con_pro.fieldbyname('precio4').Asfloat>0 then
                      pre.Value :=con_pro.fieldbyname('precio4').Asfloat
                   else
                   begin
                     if con_pro.fieldbyname('precio3').Asfloat>0 then
                        pre.Value :=con_pro.fieldbyname('precio3').Asfloat
                     else
                     begin
                       if con_pro.fieldbyname('precio2').Asfloat>0 then
                          pre.Value :=con_pro.fieldbyname('precio2').Asfloat
                       else
                       begin
                         if con_pro.fieldbyname('precio').Asfloat>0 then
                             pre.Value :=con_pro.fieldbyname('precio').Asfloat;
                       end;
                     end;
                   end;
                 end;
             end;
           //*****
           p1.Visible:=true;
           gridp.SetFocus;
         end
         else
         begin
           application.MessageBox('Producto no encontrado...!','Mensaje al Usuario',16);
           p1.Visible:=false;
           bt_buscar.SetFocus;
         end;
       end
       else
       begin
          con_pro.Close;
          con_pro.SQL.Text:='select * from productos_oc_int where id like :c';
          con_pro.Params[0].AsString:=buscar+'%';
          con_pro.Open;
          if not con_pro.IsEmpty then
          begin
           if con_pro.fieldbyname('precio6').Asfloat>0 then
                pre.Value:=con_pro.fieldbyname('precio6').Asfloat
             else
             begin
                if con_pro.fieldbyname('precio5').Asfloat>0 then
                   pre.Value :=con_pro.fieldbyname('precio5').Asfloat
                else
                begin
                   if con_pro.fieldbyname('precio4').Asfloat>0 then
                      pre.Value :=con_pro.fieldbyname('precio4').Asfloat
                   else
                   begin
                     if con_pro.fieldbyname('precio3').Asfloat>0 then
                        pre.Value :=con_pro.fieldbyname('precio3').Asfloat
                     else
                     begin
                       if con_pro.fieldbyname('precio2').Asfloat>0 then
                          pre.Value :=con_pro.fieldbyname('precio2').Asfloat
                       else
                       begin
                         if con_pro.fieldbyname('precio').Asfloat>0 then
                             pre.Value :=con_pro.fieldbyname('precio').Asfloat;
                       end;
                     end;
                   end;
                 end;
                end;
           p1.Visible:=true;
           gridp.SetFocus;
          end
          else
          begin
           application.MessageBox('Producto no encontrado...!','Mensaje al Usuario',16);
           p1.Visible:=false;
           bt_buscar.SetFocus;
          end;
       end;

end;

procedure Tfrmprodint.gridpDblClick(Sender: TObject);
begin
   pro.Text:= con_pro.FieldByName('nom').AsString;
   tpr.Text:= con_pro.FieldByName('tipo_prod').AsString;
   con_uni.Close;
   con_uni.Params[0].AsInteger:=con_pro.FieldByName('unidad').Asinteger;
   con_uni.Open;
   uni.Text:=con_uni.fieldbyname('nom').AsString;
   con_uni.Close;

   if con_pro.FieldByName('imp').Asstring='N' then
   begin
      inu.Value:=con_pro.FieldByName('impnum').Asfloat;
      ck_imp.Checked:=false;
   end
   else
   begin
       if con_pro.FieldByName('imp').Asstring='S' then
       begin
        inu.Value:=con_pro.FieldByName('impnum').Asfloat;
        ck_imp.Checked:=true;
       end;
   end;

   imb.Value:=con_pro.FieldByName('impbs').Asfloat;
   if con_pro.fieldbyname('precio6').Asfloat>0 then
               pre.Value:=con_pro.fieldbyname('precio6').Asfloat
             else
             begin
                if con_pro.fieldbyname('precio5').Asfloat>0 then
                   pre.Value :=con_pro.fieldbyname('precio5').Asfloat
                else
                begin
                   if con_pro.fieldbyname('precio4').Asfloat>0 then
                      pre.Value :=con_pro.fieldbyname('precio4').Asfloat
                   else
                   begin
                     if con_pro.fieldbyname('precio3').Asfloat>0 then
                        pre.Value :=con_pro.fieldbyname('precio3').Asfloat
                     else
                     begin
                       if con_pro.fieldbyname('precio2').Asfloat>0 then
                          pre.Value :=con_pro.fieldbyname('precio2').Asfloat
                       else
                       begin
                         if con_pro.fieldbyname('precio').Asfloat>0 then
                             pre.Value :=con_pro.fieldbyname('precio').Asfloat;
                       end;
                     end;
                   end;
                 end;
                end;
   p1.Visible:=false;
   bt_buscar.SetFocus;
end;

procedure Tfrmprodint.bt_calClick(Sender: TObject);
begin
  calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmprodint.bt_eliClick(Sender: TObject);
begin
if pro.Text<>'' then
begin

if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) then
begin

    if  MessageDlg('¿Esta Seguro de Eliminar el Producto: '+con_pro.fieldbyname('nom').AsString+ ' ?',
        mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
          eli_prod.Close;
          eli_prod.Params[0].AsInteger:=con_pro.fieldbyname('id').AsInteger;
          eli_prod.ExecSQL;

          pro.Clear;
          tpr.Clear;
          uni.Clear;
          ck_imp.Checked:=false;
          inu.Clear;
          imb.Clear;
          pre.Clear;

          application.MessageBox('Producto Eliminado...!','Mensaje al Usuario',32);
          bt_buscar.SetFocus;
    end;

end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;
end;

procedure Tfrmprodint.bt_modClick(Sender: TObject);
begin
if pro.Text<>'' then
begin
   con_pro.Edit;
   con_pro.FieldByName('nom').AsString:=pro.Text;
   con_pro.FieldByName('tipo_prod').AsString:=tpr.Text;
   if cambio=1 then
     con_pro.FieldByName('unidad').Asinteger:=unidad;

   if ck_imp.Checked then
   begin
      con_pro.FieldByName('impnum').Asfloat:=inu.Value;
   end
   else
   begin
     con_pro.FieldByName('impnum').Asfloat:=inu.Value;
   end;

   con_pro.FieldByName('impbs').Asfloat:=imb.Value;
   if pre.Value=0 then
      application.MessageBox('Debe ingresar precio del producto...!','Mensaje al Usuario',32)
   else
   begin
     if con_pro.FieldByName('precio').Asfloat=0 then
       con_pro.FieldByName('precio').Asfloat:=pre.Value
     else
     begin
         if (con_pro.FieldByName('precio').Asfloat >0)  and  (con_pro.FieldByName('precio2').Asfloat=0) and (pre.value <>con_pro.FieldByName('precio').Asfloat) then
            con_pro.FieldByName('precio2').Asfloat:=pre.Value
         else
         begin
            if (con_pro.FieldByName('precio').Asfloat >0)  and  (con_pro.FieldByName('precio2').Asfloat>0) and (con_pro.FieldByName('precio3').Asfloat=0) and (pre.value <>con_pro.FieldByName('precio2').Asfloat) then
                con_pro.FieldByName('precio3').Asfloat:=pre.Value
            else
            begin
                if (con_pro.FieldByName('precio').Asfloat >0)  and  (con_pro.FieldByName('precio2').Asfloat>0) and (con_pro.FieldByName('precio3').Asfloat>0) and (con_pro.FieldByName('precio4').Asfloat=0) and (pre.value <>con_pro.FieldByName('precio3').Asfloat) then
                   con_pro.FieldByName('precio4').Asfloat:=pre.Value
                else
                begin
                     if (con_pro.FieldByName('precio').Asfloat >0)  and  (con_pro.FieldByName('precio2').Asfloat>0) and (con_pro.FieldByName('precio3').Asfloat>0) and (con_pro.FieldByName('precio4').Asfloat>0)and (con_pro.FieldByName('precio5').Asfloat=0) and  (pre.value <>con_pro.FieldByName('precio4').Asfloat) then
                        con_pro.FieldByName('precio5').Asfloat:=pre.Value
                     else
                     begin
                         if (con_pro.FieldByName('precio').Asfloat >0)  and  (con_pro.FieldByName('precio2').Asfloat>0) and (con_pro.FieldByName('precio3').Asfloat>0) and (con_pro.FieldByName('precio4').Asfloat>0)and (con_pro.FieldByName('precio5').Asfloat>0) and (con_pro.FieldByName('precio6').Asfloat=0) and (pre.value <>con_pro.FieldByName('precio5').Asfloat)then
                            con_pro.FieldByName('precio6').Asfloat:=pre.Value;
                     end;

                end;
            end;
         end;
     end;

   end;
   con_pro.Post;
   pro.SetFocus;
 end;
end;

procedure Tfrmprodint.griduniDblClick(Sender: TObject);
begin
  uni.Text:=con_unidad.FieldByName('nom').AsString;
  unidad:=con_unidad.FieldByName('id').Asinteger;
  cambio:=1;
  p2.Visible:=false;
  uni.SetFocus;
end;

procedure Tfrmprodint.uniDblClick(Sender: TObject);
begin
   p2.Visible:=true;
   con_unidad.close;
   con_unidad.Open;
end;

procedure Tfrmprodint.bt_nuevoClick(Sender: TObject);
begin
  bt_guardar.Enabled:=true;
  pro.Clear;
  tpr.Clear;
  uni.Clear;
  ck_imp.Checked:=false;
  inu.Clear;
  imb.Clear;
  pre.Clear;
  pro.SetFocus;
end;

procedure Tfrmprodint.bt_guardarClick(Sender: TObject);
begin
if pre.Value>0 then
begin
 con_pro.Close;
 con_pro.Open;
 con_pro.Append;
 con_pro.Edit;

  con_pro.FieldByName('nom').AsString:=pro.Text;
  con_pro.FieldByName('tipo_prod').AsString:=tpr.Text;
  con_pro.FieldByName('unidad').Asinteger:=unidad;
  con_pro.FieldByName('impnum').Asfloat:= inu.Value;
  if   ck_imp.Checked then
    con_pro.FieldByName('imp').AsString:='S'
  else
    con_pro.FieldByName('imp').AsString:='N';

  con_pro.FieldByName('precio').Asfloat:=pre.Value;
  con_pro.FieldByName('impbs').Asfloat:=imb.Value;
  con_pro.Post;
  bt_guardar.Enabled:=false;
  bt_buscar.SetFocus;
end
else
begin
   application.MessageBox('Debe ingresar precio del producto...!','Mensaje al Usuario',32);
   pre.SetFocus;
end;
end;

procedure Tfrmprodint.preChange(Sender: TObject);
begin
if (pre.Text<>'') and (inu.Text<>'') then
  imb.Value:=(strtoint(pre.Text)*(strtoint(inu.Text)/100));
end;

procedure Tfrmprodint.inuChange(Sender: TObject);
begin
if (pre.Text<>'') and (inu.Text<>'') then
 imb.Value:=(strtoint(pre.Text)*(strtoint(inu.Text)/100));
end;

procedure Tfrmprodint.gridpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_escape then
begin
   p1.Visible:=false;
   bt_buscar.SetFocus;
end;
if key=vk_return then
begin
  gridpDblClick(Sender);
end;
end;

procedure Tfrmprodint.proKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
   begin
       Key := #0;
       Perform(WM_NEXTDLGCTL, 0, 0);
   end
end;

procedure Tfrmprodint.tprKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
   begin
       Key := #0;
       Perform(WM_NEXTDLGCTL, 0, 0);              
   end
 end;

procedure Tfrmprodint.uniKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
       Key := #0;
       Perform(WM_NEXTDLGCTL, 0, 0);
   end
end;

procedure Tfrmprodint.inuKeyPress(Sender: TObject; var Key: Char);
begin

   if Key = #13 then
   begin
       Key := #0;
       Perform(WM_NEXTDLGCTL, 0, 0);
   end
end;

procedure Tfrmprodint.preKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
       Key := #0;
       Perform(WM_NEXTDLGCTL, 0, 0);
   end;
   if key=#46 then
   begin
    key:=#44;
   end;         

end;

procedure Tfrmprodint.imbKeyPress(Sender: TObject; var Key: Char);
begin

if Key = #13 then
begin
       Key := #0;
       bt_buscar.SetFocus;
end

end;

procedure Tfrmprodint.ck_impKeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
   begin
       Key := #0;
       Perform(WM_NEXTDLGCTL, 0, 0);
   end
end;

end.
