unit frmmodimenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, ZAbstractTable, ZDataset, DB, ZAbstractRODataset,
  ZAbstractDataset, dxDBGrid, dxTL, dxDBCtrl, dxCntner, ComCtrls, StdCtrls,
  DBCtrls, Mask, Buttons, ExtCtrls;

type
  Tfrmmodmenu = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    nummen: TDBEdit;
    GroupBox2: TGroupBox;
    cb_modnum: TDBComboBox;
    cb_modal: TComboBox;
    GroupBox3: TGroupBox;
    obs: TDBEdit;
    GroupBox4: TGroupBox;
    lun: TDBCheckBox;
    mar: TDBCheckBox;
    mie: TDBCheckBox;
    jue: TDBCheckBox;
    vie: TDBCheckBox;
    GroupBox5: TGroupBox;
    alm: TDBCheckBox;
    cen: TDBCheckBox;
    Panel2: TPanel;
    Label2: TLabel;
    GroupBox6: TGroupBox;
    con: TDBRichEdit;
    BitBtn2: TBitBtn;
    con_compro: TZQuery;
    data_compro: TDataSource;
    con_prod_rep: TZQuery;
    data_prod_rep: TDataSource;
    con_pp: TZQuery;
    data_pp: TDataSource;
    des: TDBCheckBox;
    grid_descod_prod: TdxDBGridMaskColumn;
    grid_desdes_prod: TdxDBGridColumn;
    grid_desfac: TdxDBGridMaskColumn;
    grid_descan: TdxDBGridMaskColumn;
    grid_descal: TdxDBGridMaskColumn;
    grid_desprote: TdxDBGridMaskColumn;
    grid_desgras: TdxDBGridMaskColumn;
    grid_des: TdxDBGrid;
    Label3: TLabel;
    Label5: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_modalChange(Sender: TObject);
    procedure grid_desEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure grid_desKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure conKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure conExit(Sender: TObject);
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
  frmmodmenu: Tfrmmodmenu;

implementation

uses frmacces, frmmenus, frmlistaprod;

{$R *.dfm}

procedure Tfrmmodmenu.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmmodmenu.FormShow(Sender: TObject);
begin
   
   cb_modal.Text:= frmmenu.con_menu.fieldbyname('nom').asstring;

   con_compro.Close;
   con_compro.Params[0].AsInteger:=strtoint(nummen.Text);
   con_compro.Params[1].AsInteger:=strtoint(cb_modnum.Text);
   con_compro.Open;
   if con_compro.IsEmpty then
      con_compro.Append
   else
      con_compro.FindLast;

end;

procedure Tfrmmodmenu.cb_modalChange(Sender: TObject);
begin
cb_modnum.ItemIndex:=cb_modal.ItemIndex;
end;

procedure Tfrmmodmenu.grid_desEdited(Sender: TObject;
  Node: TdxTreeListNode);
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
                   con_compro.Edit;
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

procedure Tfrmmodmenu.grid_desKeyDown(Sender: TObject; var Key: Word;
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
          con_compro.Append;
          con_compro.Edit;
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
     with grid_des.DataSource.DataSet  do
     begin
        Save := GetBookmark;
     try
      lisprod.ShowModal;

      if lisprod.v1>0 then
      begin
        if not con_compro.IsEmpty then
           GotoBookmark(Save);

        con_prod_rep.Close;
        con_prod_rep.Params[0].AsInteger:=strtoint(nummen.Text);
        con_prod_rep.Params[1].AsInteger:=strtoint(cb_modnum.Text);
        con_prod_rep.Params[2].AsInteger:= lisprod.v1;
        con_prod_rep.Open;

        if (con_prod_rep.RecordCount=0) then
        begin
          if con_compro.IsEmpty then con_compro.Append;
          con_compro.Edit;
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

procedure Tfrmmodmenu.conKeyPress(Sender: TObject; var Key: Char);
begin
key:=upcase(key);
end;

procedure Tfrmmodmenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
con_compro.Close;
con_prod_rep.Close;
con_pp.Close;
end;

procedure Tfrmmodmenu.BitBtn2Click(Sender: TObject);
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
               frmmenu.con_menu.Edit;
               frmmenu.con_menu.FieldByName('num').asinteger:= strtoint(nummen.Text);
               frmmenu.con_menu.FieldByName('modal').asinteger:= strtoint(cb_modnum.Text);
               frmmenu.con_menu.FieldByName('obs').AsString:= obs.Text;

               if lun.Checked then
                 frmmenu.con_menu.FieldByName('lun').AsString:='S'
               else
                 frmmenu.con_menu.FieldByName('lun').AsString:='N';

               if mar.Checked then
                  frmmenu.con_menu.FieldByName('mar').AsString:='S'
               else
                  frmmenu.con_menu.FieldByName('mar').AsString:='N';

               if mie.Checked then
                   frmmenu.con_menu.FieldByName('mier').AsString:='S'
               else
                  frmmenu.con_menu.FieldByName('mier').AsString:='N';

               if jue.Checked then
                  frmmenu.con_menu.FieldByName('jue').AsString:='S'
               else
                  frmmenu.con_menu.FieldByName('jue').AsString:='N';

               if vie.Checked then
                  frmmenu.con_menu.FieldByName('vier').AsString:='S'
               else
                  frmmenu.con_menu.FieldByName('vier').AsString:='N';

               if des.Checked then
                  frmmenu.con_menu.FieldByName('desa').AsString:='S'
               else
                  frmmenu.con_menu.FieldByName('desa').AsString:='N';

               if alm.Checked then
                  frmmenu.con_menu.FieldByName('alm').AsString:='S'
               else
                 frmmenu.con_menu.FieldByName('alm').AsString:='N';

               if cen.Checked then
                  frmmenu.con_menu.FieldByName('cena').AsString:='S'
               else
                  frmmenu.con_menu.FieldByName('cena').AsString:='N';
                  frmmenu.con_menu.FieldByName('des').asstring:=con.Text;


                    if con_compro.IsEmpty then
                    begin
                        messagebox(0,'Debe Ingresar un producto mínimo...!','Mensaje al Usuario',16);
                        grid_des.FocusedColumn:=0;
                     end
                     else
                     begin
                         if con_compro.FieldByName('can').asfloat=0.00 then
                         begin
                          messagebox(0,'Debe Ingresar una Cantidad Valida...!','Mensaje al Usuario',16);
                          grid_des.FocusedColumn:=3;
                         end
                         else
                         begin
                           con_compro.Append;
                           frmmenu.con_menu.Post;
                          close;
                         end;
                     end;
            end;
       end;
    end;

end;

procedure Tfrmmodmenu.conExit(Sender: TObject);
begin
grid_des.SetFocus;

end;

procedure Tfrmmodmenu.grid_descanGetText(Sender: TObject;
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

procedure Tfrmmodmenu.lunClick(Sender: TObject);
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


procedure Tfrmmodmenu.marClick(Sender: TObject);
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

procedure Tfrmmodmenu.mieClick(Sender: TObject);
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

procedure Tfrmmodmenu.jueClick(Sender: TObject);
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

procedure Tfrmmodmenu.vieClick(Sender: TObject);
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

procedure Tfrmmodmenu.grid_desKeyPress(Sender: TObject; var Key: Char);
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
