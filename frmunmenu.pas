unit frmunmenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, ComCtrls, dxExEdtr,
  dxCntner, dxTL, dxDBCtrl, dxDBGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractTable, Menus, dxDBTLCl, dxGrClEx,
  dxGrClms;

type
  Tfrmunmen = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    nummen: TDBEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    obs: TDBEdit;
    GroupBox4: TGroupBox;
    lun: TDBCheckBox;
    mar: TDBCheckBox;
    mie: TDBCheckBox;
    jue: TDBCheckBox;
    vie: TDBCheckBox;
    GroupBox5: TGroupBox;
    des: TDBCheckBox;
    alm: TDBCheckBox;
    cen: TDBCheckBox;
    Panel2: TPanel;
    Label2: TLabel;
    GroupBox6: TGroupBox;
    con_modal: TZQuery;
    data_modal: TDataSource;
    con_num: TZQuery;
    data_num: TDataSource;
    cb_modnum: TDBComboBox;
    tb_menu: TZTable;
    data_menu: TDataSource;
    BitBtn2: TBitBtn;
    cb_modal: TComboBox;
    con_modalid: TIntegerField;
    con_modalnom: TStringField;
    con: TDBRichEdit;
    con_compro: TZQuery;
    data_compro: TDataSource;
    con_prod_rep: TZQuery;
    data_prod_rep: TDataSource;
    con_pp: TZQuery;
    data_pp: TDataSource;
    aborta_com: TZQuery;
    data_aborta: TDataSource;
    grid_des: TdxDBGrid;
    grid_descod_prod: TdxDBGridMaskColumn;
    grid_desdes_prod: TdxDBGridColumn;
    grid_desfac: TdxDBGridMaskColumn;
    grid_descan: TdxDBGridMaskColumn;
    grid_descal: TdxDBGridMaskColumn;
    grid_desprote: TdxDBGridMaskColumn;
    grid_desgras: TdxDBGridMaskColumn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure cb_modalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_modalExit(Sender: TObject);
    procedure cb_modalKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure conExit(Sender: TObject);
    procedure grid_desEnter(Sender: TObject);
    procedure BitBtn1KeyPress(Sender: TObject; var Key: Char);
    procedure grid_desKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_desEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure conKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure grid_descanGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure lunClick(Sender: TObject);
    procedure marClick(Sender: TObject);
    procedure mieClick(Sender: TObject);
    procedure jueClick(Sender: TObject);
    procedure vieClick(Sender: TObject);
    procedure grid_desKeyPress(Sender: TObject; var Key: Char);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmunmen: Tfrmunmen;

implementation

uses frmacces, frmbus,frmlistaprod, frmmenus;

{$R *.dfm}




procedure Tfrmunmen.BitBtn1Click(Sender: TObject);
begin
aborta_com.Close;
aborta_com.Params[0].AsInteger:=strtoint(nummen.Text);
aborta_com.Params[1].AsInteger:=strtoint(cb_modnum.Text);
aborta_com.ExecSQL;
aborta_com.Close;
con_compro.Close;
tb_menu.Cancel;
close;
end;

procedure Tfrmunmen.cb_modalChange(Sender: TObject);
begin
cb_modnum.ItemIndex:=cb_modal.ItemIndex;
end;

procedure Tfrmunmen.FormShow(Sender: TObject);
begin

   lun.Enabled:=true;
   mar.Enabled:=true;
   mie.Enabled:=true;
   jue.Enabled:=true;
   vie.Enabled:=true;

   lun.Checked:=false;
   mar.Checked:=false;
   mie.Checked:=false;
   jue.Checked:=false;
   vie.Checked:=false;
   des.Checked:=false;
   alm.Checked:=false;
   cen.Checked:=false;
   cb_modal.Clear;
   cb_modnum.Clear;
   con_modal.close;
   con_modal.Open;
   if not con_modal.IsEmpty then
   con_modal.FindFirst;
   while not con_modal.Eof do
   begin
      cb_modal.AddItem(con_modal.fieldbyname('nom').AsString,cb_modal);
      cb_modnum.AddItem(inttostr(con_modal.fieldbyname('id').AsInteger),cb_modnum);
      con_modal.Next;
   end;

   cb_modal.ItemIndex:=0;
   cb_modnum.ItemIndex:=0;
   cb_modal.SetFocus;

end;

procedure Tfrmunmen.cb_modalExit(Sender: TObject);
begin
con_num.Close;
con_num.Params[0].AsInteger:=strtoint(cb_modnum.Text);
con_num.Open;
if con_num.RecordCount=0 then
   tb_menu.FieldByName('num').AsInteger:=1
else
   tb_menu.FieldByName('num').AsInteger:=con_num.fieldbyname('maximo').asinteger+1;

end;

procedure Tfrmunmen.cb_modalKeyPress(Sender: TObject; var Key: Char);
begin
if key <> #13 then
key:=#0;
end;

procedure Tfrmunmen.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tfrmunmen.conExit(Sender: TObject);
begin
grid_des.SetFocus;
end;

procedure Tfrmunmen.grid_desEnter(Sender: TObject);
begin
con_compro.Close;
con_compro.Params[0].AsInteger:=strtoint(nummen.Text);
con_compro.Params[1].AsInteger:=strtoint(cb_modnum.Text);
con_compro.Open;
if con_compro.IsEmpty then
   con_compro.Append
else
   con_compro.FindLast;
end;

procedure Tfrmunmen.BitBtn1KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  cb_modal.SetFocus;
end;

procedure Tfrmunmen.grid_desKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   Save: TBookmark;
begin

   if key=27 then
      key:=0;

   if key=vk_f1 then
   begin

    if con_compro.FieldByName('num_menu').AsInteger=0 then
    begin
          lisprod.ShowModal;
          if lisprod.v1<>0 then
          begin
            con_compro.FieldByName('num_menu').AsInteger:=strtoint(nummen.Text);
            con_compro.FieldByName('mod_menu').AsInteger:=strtoint(cb_modnum.Text);
            con_compro.FieldByName('cod_prod').AsInteger:=lisprod.v1;
            con_compro.FieldByName('des_prod').Asstring:=lisprod.v2;
            con_compro.FieldByName('fac').Asfloat:=lisprod.v3;
            con_compro.FieldByName('cal').Asfloat:=lisprod.v4;
            con_compro.FieldByName('prote').Asfloat:=lisprod.v5;
            con_compro.FieldByName('gras').Asfloat:=lisprod.v6;
            grid_des.FocusedColumn:=3;
          end
          else
            grid_des.FocusedColumn:=0;
     end
     else
     begin
     with grid_des.DataSource.DataSet  do
     begin
           Save := GetBookmark;
     try
      lisprod.ShowModal;

      if lisprod.v1>0 then
      begin
           GotoBookmark(Save);

        con_prod_rep.Close;
        con_prod_rep.Params[0].AsInteger:=strtoint(nummen.Text);
        con_prod_rep.Params[1].AsInteger:=strtoint(cb_modnum.Text);
        con_prod_rep.Params[2].AsInteger:= lisprod.v1;
        con_prod_rep.Open;

        if (con_prod_rep.RecordCount=0) then
        begin
          con_compro.FieldByName('num_menu').AsInteger:=strtoint(nummen.Text);
          con_compro.FieldByName('mod_menu').AsInteger:=strtoint(cb_modnum.Text);
          con_compro.FieldByName('cod_prod').AsInteger:=lisprod.v1;
          con_compro.FieldByName('des_prod').Asstring:=lisprod.v2;
          con_compro.FieldByName('fac').Asfloat:=lisprod.v3;
          con_compro.FieldByName('cal').Asfloat:=lisprod.v4;
          con_compro.FieldByName('prote').Asfloat:=lisprod.v5;
          con_compro.FieldByName('gras').Asfloat:=lisprod.v6;
          grid_des.FocusedColumn:=3;
       end
        else
        begin
              messagebox(0,'Producto ya se encuentra Registrado...!','Mensaje al Usuario',16);
              con_compro.Cancel;
              grid_des.FocusedColumn:=0;
        end;
       end;
      finally
        FreeBookmark(Save);
     end;
   end;
  end;
 end;

 if key=vk_down then
 begin
   if (grid_des.FocusedColumn<>0) and (grid_des.LastNode.Focused) then
      key:=0;
 end;

 if key=vk_delete then
 begin
    if  MessageDlg('Esta Segur@ de Eliminar a:'+ con_compro.fieldbyname('des_prod').asstring,
        mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
        if not con_compro.IsEmpty then
           con_compro.Delete;
    end;
  end;

end;


procedure Tfrmunmen.grid_desEdited(Sender: TObject; Node: TdxTreeListNode);
begin


  if grid_des.FocusedColumn=0 then
  begin
    if (node.Values[0]<>NULL)  then
    begin
     if con_compro.FieldByName('cod_prod').AsInteger<>0 then
     begin
        con_prod_rep.Close;
        con_prod_rep.Params[0].AsInteger:=strtoint(nummen.Text);
        con_prod_rep.Params[1].AsInteger:=strtoint(cb_modnum.Text);
        con_prod_rep.Params[2].AsInteger:= con_compro.FieldByName('cod_prod').AsInteger;
        con_prod_rep.Open;

        if (con_prod_rep.RecordCount=0) then
        begin
              con_pp.Close;
              con_pp.Params[0].AsInteger:=con_compro.FieldByName('cod_prod').AsInteger;
              con_pp.Open;
              if con_pp.RecordCount>0 then
              begin
                   con_compro.FieldByName('num_menu').AsInteger:=strtoint(nummen.Text);
                   con_compro.FieldByName('mod_menu').AsInteger:=strtoint(cb_modnum.Text);
                   con_compro.FieldByName('cod_prod').AsInteger:=con_pp.fieldbyname('id').AsInteger;
                   con_compro.FieldByName('des_prod').Asstring:=con_pp.fieldbyname('nom').Asstring;
                   con_compro.FieldByName('fac').Asfloat:=con_pp.fieldbyname('fac').AsInteger;
                   con_compro.FieldByName('cal').Asfloat:=con_pp.fieldbyname('cal').AsInteger;
                   con_compro.FieldByName('prote').Asfloat:=con_pp.fieldbyname('pro').AsInteger;
                   con_compro.FieldByName('gras').Asfloat:=con_pp.fieldbyname('gra').AsInteger;

                   grid_des.FocusedColumn:=3;
              end
              else
              begin
                  messagebox(0,'Producto NO existe...!','Mensaje al Usuario',16);
                  con_compro.Cancel;
                  grid_des.FocusedColumn:=0;
              end;
        end
        else
        begin
              messagebox(0,'Producto ya se encuentra Registrado...!','Mensaje al Usuario',16);
              con_compro.Cancel;
              grid_des.FocusedColumn:=0;
        end;

     end;
    end
    else
    begin
      con_compro.Cancel;
      grid_des.FocusedColumn:=0;
    end;
  end;


end;

procedure Tfrmunmen.conKeyPress(Sender: TObject; var Key: Char);
begin
key:=upcase(key);
end;

procedure Tfrmunmen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
con_compro.Close;
con_prod_rep.Close;
con_pp.Close;
end;

procedure Tfrmunmen.BitBtn2Click(Sender: TObject);
begin

  if (not lun.Checked) and (not mar.Checked) and (not mie.Checked) and (not jue.Checked) and (not vie.Checked) then
  begin
        messagebox(0,'Debe marcar al menos un dia...!','Mensaje al Usuario',32);
        con.SetFocus;
  end
  else
  begin
      if (not des.Checked) and (not alm.Checked) and (not cen.Checked)  then
      begin
          messagebox(0,'Debe marcar al menos una Comida...!','Mensaje al Usuario',32);
          con.SetFocus;
      end
      else
      begin
            if con.Text='' then
            begin
              messagebox(0,'Debe ingresar el CONTENIDO del menu...!','Mensaje al Usuario',32);
              con.SetFocus;
            end
            else
            begin
               tb_menu.edit;
               tb_menu.FieldByName('num').asinteger:= strtoint(nummen.Text);
               tb_menu.FieldByName('modal').asinteger:= strtoint(cb_modnum.Text);
               tb_menu.FieldByName('obs').AsString:= obs.Text;

               if lun.Checked then
                 tb_menu.FieldByName('lun').AsString:='S'
               else
                 tb_menu.FieldByName('lun').AsString:='N';

               if mar.Checked then
                  tb_menu.FieldByName('mar').AsString:='S'
               else
                  tb_menu.FieldByName('mar').AsString:='N';

               if mie.Checked then
                   tb_menu.FieldByName('mier').AsString:='S'
               else
                   tb_menu.FieldByName('mier').AsString:='N';

               if jue.Checked then
                  tb_menu.FieldByName('jue').AsString:='S'
               else
                  tb_menu.FieldByName('jue').AsString:='N';

               if vie.Checked then
                  tb_menu.FieldByName('vier').AsString:='S'
               else
                  tb_menu.FieldByName('vier').AsString:='N';

               if des.Checked then
                  tb_menu.FieldByName('desa').AsString:='S'
               else
                  tb_menu.FieldByName('desa').AsString:='N';

               if alm.Checked then
                  tb_menu.FieldByName('alm').AsString:='S'
               else
                  tb_menu.FieldByName('alm').AsString:='N';

               if cen.Checked then
                  tb_menu.FieldByName('cena').AsString:='S'
               else
                  tb_menu.FieldByName('cena').AsString:='N';

                  tb_menu.FieldByName('des').asstring:=con.Text;

                     if con_compro.IsEmpty then
                     begin
                        messagebox(0,'Debe Ingresar un producto mínimo...!','Mensaje al Usuario',16);
                        grid_des.FocusedColumn:=0;
                     end
                     else
                     begin
                       if con_compro.FieldByName('can').Asfloat=0.00 then
                       begin
                          messagebox(0,'Debe Ingresar una Cantidad Valida...!','Mensaje al Usuario',16);
                          grid_des.FocusedColumn:=3;
                       end
                       else
                       begin
                          con_compro.Append;
                          tb_menu.Post;
                          close;
                        end;
                      end;
           end;
       end;
    end;
end;

procedure Tfrmunmen.grid_descanGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
  if grid_des.FocusedColumn=3 then
   begin
      if atext='' then
      begin
         atext:='1';
         con_compro.FieldByName('can').AsInteger:=1;
         grid_des.FocusedColumn:=3;
      end;
   end;
end;

procedure Tfrmunmen.lunClick(Sender: TObject);
begin
if lun.Checked then
begin
   mar.Enabled:=false;
   mie.Enabled:=false;
   jue.Enabled:=false;
   vie.Enabled:=false;
end
else
begin
   lun.Enabled:=true;
   mar.Enabled:=true;
   mie.Enabled:=true;
   jue.Enabled:=true;
   vie.Enabled:=true;
end;
end;

procedure Tfrmunmen.marClick(Sender: TObject);
begin
if mar.Checked then
begin
   mie.Enabled:=false;
   jue.Enabled:=false;
   vie.Enabled:=false;
   lun.Enabled:=false;
end
else
begin
   lun.Enabled:=true;
   mar.Enabled:=true;
   mie.Enabled:=true;
   jue.Enabled:=true;
   vie.Enabled:=true;
end;
end;

procedure Tfrmunmen.mieClick(Sender: TObject);
begin
  if mie.Checked then
  begin
   jue.Enabled:=false;
   vie.Enabled:=false;
   lun.Enabled:=false;
   mar.Enabled:=false;
end
else
begin
   lun.Enabled:=true;
   mar.Enabled:=true;
   mie.Enabled:=true;
   jue.Enabled:=true;
   vie.Enabled:=true;
end;
end;

procedure Tfrmunmen.jueClick(Sender: TObject);
begin
if jue.Checked then
begin
   vie.Enabled:=false;
   lun.Enabled:=false;
   mar.Enabled:=false;
   mie.Enabled:=false;
end
else
begin
   lun.Enabled:=true;
   mar.Enabled:=true;
   mie.Enabled:=true;
   jue.Enabled:=true;
   vie.Enabled:=true;
end;
end;

procedure Tfrmunmen.vieClick(Sender: TObject);
begin
if vie.Checked then
begin
   lun.Enabled:=false;
   mar.Enabled:=false;
   mie.Enabled:=false;
   jue.Enabled:=false;
end
else
begin
   lun.Enabled:=true;
   mar.Enabled:=true;
   mie.Enabled:=true;
   jue.Enabled:=true;
   vie.Enabled:=true;
end;
end;

procedure Tfrmunmen.grid_desKeyPress(Sender: TObject; var Key: Char);
begin
if grid_des.FocusedColumn=3 then
begin
   case key of
    #46:key:=#44;
    #48..#57:;
    #8:;
    #13:;
   else
   key:=#0;
   end;
end;

end;

end.
