unit frmocxlot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, DBCtrls, Buttons, ComCtrls, ZAbstractTable, RxGIF, Animate,
  GIFCtrl, cxControls, cxContainer, cxEdit, cxProgressBar, dxExEdtr, dxTL,
  dxDBCtrl, dxDBGrid, dxCntner;

type
  Tfrmocxlote = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    con_mun: TZQuery;
    datamun: TDataSource;
    dataproy: TDataSource;
    con_proy: TZQuery;
    bt_salir: TBitBtn;
    GroupBox1: TGroupBox;
    lis_codmun: TDBComboBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    lis_idproy: TDBComboBox;
    GroupBox4: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    fec_del: TDateTimePicker;
    fec_al: TDateTimePicker;
    con_menu: TZQuery;
    datamenu: TDataSource;
    con_escmun: TZQuery;
    dataescmun: TDataSource;
    bt_cargaoc: TBitBtn;
    con_menu2: TZQuery;
    datamenu2: TDataSource;
    con_sema: TZQuery;
    datasema: TDataSource;
    dias_oc: TZQuery;
    datadias: TDataSource;
    con_numoc: TZTable;
    datanumoc: TDataSource;
    con_uni: TZQuery;
    datauni: TDataSource;
    ins_detoc: TZQuery;
    DataSource4: TDataSource;
    con_maxid: TZQuery;
    datamaxid: TDataSource;
    tb_oc: TZTable;
    dataoc: TDataSource;
    grup_fp: TGroupBox;
    ck_ac: TRadioButton;
    ck_cc: TRadioButton;
    ck_ch: TRadioButton;
    grup_cc: TGroupBox;
    ck_cif: TRadioButton;
    ck_fob: TRadioButton;
    ck_fas: TRadioButton;
    ck_otros: TRadioButton;
    Label23: TLabel;
    ck_segs: TRadioButton;
    ck_segn: TRadioButton;
    con_prove: TZQuery;
    dataprove: TDataSource;
    con_dep: TZQuery;
    datadep: TDataSource;
    GroupBox5: TGroupBox;
    fecoc: TDateTimePicker;
    con_zon: TZQuery;
    datazon: TDataSource;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    lista_mun: TdxDBGrid;
    lis_munNOMBRE: TdxDBGridMaskColumn;
    lista_proy: TdxDBGrid;
    lista_proynom: TdxDBGridMaskColumn;
    lis_mun: TDBComboBox;
    lis_proy: TDBComboBox;
    GroupBox8: TGroupBox;
    ck_m1: TRadioButton;
    ck_m2: TRadioButton;
    progresoo2: TcxProgressBar;
    progresoo: TcxProgressBar;
    procedure FormShow(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure bt_cargaocClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bt_cargaocExit(Sender: TObject);
    procedure lis_munDblClick(Sender: TObject);
    procedure lista_munDblClick(Sender: TObject);
    procedure lis_proyDblClick(Sender: TObject);
    procedure lista_proyDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmocxlote: Tfrmocxlote;

implementation

uses frmacces, frmzeb;

{$R *.dfm}

procedure Tfrmocxlote.FormShow(Sender: TObject);
begin

   progresoo.Properties.Max:=0;
   progresoo2.Properties.Max:=0;
   progresoo.Repaint;
   progresoo2.Repaint;


   panel2.Visible:=false;
   bt_cargaoc.Visible:=false;
   fecoc.Date:=date;
   fec_del.Date:=date;
   fec_al.Date:=date;

   lis_codmun.Text:='1';
   lis_idproy.Text:='1';
   lis_mun.Text:='CARONI';
   lis_proy.Text:='EDUCACION ESPECIAL';
   lista_mun.Visible:=false;
   lista_proy.Visible:=false;

end;

procedure Tfrmocxlote.bt_salirClick(Sender: TObject);
begin
   if  MessageDlg('Está seguro que desea salir? ',mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
      close;
    end;
end;

procedure Tfrmocxlote.bt_cargaocClick(Sender: TObject);
var
 i,j,nd:integer;
 canred,toc,noc,timp:double;
begin

 con_sema.Close;
 con_sema.Params[0].Asstring:=lis_mun.Text;
 con_sema.Params[1].AsInteger:=strtoint(lis_idproy.Text);
 con_sema.Params[2].Asdate:=fec_del.date;
 con_sema.Params[3].asdate:=fec_al.date;
 con_sema.Open;
 if con_sema.recordcount=0 then
 begin

panel2.Visible:=true;
//noc:=0;
//toc:=0;
//timp:=0;
//canred:=0;

con_escmun.Close;
con_escmun.Params[0].AsInteger:=strtoint(lis_idproy.Text);
con_escmun.Params[1].AsInteger:=strtoint(lis_codmun.Text);
con_escmun.Open;
if con_escmun.IsEmpty then
begin
  messagebox(0,'No Existe relación Escuela-Proveedor-Menu  para este Proyecto...!','Mensaje al Usuario',16);
  lis_mun.SetFocus;
end
else
begin

  progresoo.Properties.Max:=con_escmun.RecordCount;
  for i:=1 to con_escmun.RecordCount do
  begin

  //     *********************************
     toc:=0;
     timp:=0;
     {con_sema.Close;
     con_sema.Params[0].AsInteger:=con_escmun.fieldbyname('cod_prove').AsInteger;
     con_sema.Params[1].AsInteger:=con_escmun.fieldbyname('cod_mod').AsInteger;
     con_sema.Params[2].AsInteger:=con_escmun.fieldbyname('cod_dep').AsInteger;
     con_sema.Open;
     con_sema.FindLast;}

         if ck_m1.Checked then
         begin
           //*************************************
              dias_oc.close;
              dias_oc.params[0].AsDate:=fec_al.Date;
              dias_oc.params[1].AsDate:=fec_del.Date;
              dias_oc.Open;
              nd:=dias_oc.FieldByName('dias').AsInteger+1;
              if (nd<1) or (nd>5) then
              begin
                messagebox(0,'Debe Ingresar una Semana de 5 dias...!','Mensaje al Usuario',16);
                fec_del.SetFocus;
              end
              else
              begin
                //*********************************

                    con_numoc.Close;
                    con_numoc.Open;
                    con_numoc.FindLast;
                    con_numoc.Edit;
                    noc:= con_numoc.fieldbyname('id').AsFloat+1;
                    con_numoc.fieldbyname('id').AsFloat:=con_numoc.fieldbyname('id').AsFloat+1;
                    con_numoc.Post;
                    con_numoc.Close;


                    con_menu.Close;
                    con_menu.Params[0].AsInteger:=con_escmun.fieldbyname('cod_mod').AsInteger;
                    con_menu.Params[1].AsInteger:=nd;
                    con_menu.Open;
                  
                    progresoo2.Properties.Max:=con_menu.RecordCount;
                    con_maxid.Close;
                    con_maxid.Open;

                    for j:=1 to con_menu.RecordCount do
                    begin
                      //---------------------------------------
                       
                        progresoo2.Position:=j;
                        progresoo2.Repaint;

                        ins_detoc.Close;
                        ins_detoc.Params[0].AsInteger:=con_maxid.fieldbyname('maxid').AsInteger;
                        ins_detoc.Open;
                        ins_detoc.FindLast;
                        ins_detoc.Edit;
                        ins_detoc.Append;

                        ins_detoc.FieldByName('cod_oc').asfloat :=noc;
                        ins_detoc.FieldByName('ren').AsInteger     :=j;
                        ins_detoc.FieldByName('articulo').AsString :=con_menu.fieldbyname('des_prod').AsString;

                        con_uni.Close;
                        con_uni.Params[0].asinteger:=con_menu.fieldbyname('cod_prod').Asinteger;
                        con_uni.Open;
                        ins_detoc.FieldByName('unidad').AsString   :=con_uni.fieldbyname('nomuni').Asstring;



                        if con_menu.fieldbyname('cod_prod').Asinteger=26 then
                        begin
                             ins_detoc.FieldByName('can').AsFloat:=con_escmun.fieldbyname('mat_pro').AsInteger;
                             canred:=con_escmun.fieldbyname('mat_pro').AsInteger;
                        end
                        else
                        begin
                          if con_menu.fieldbyname('cod_prod').Asinteger=32 then
                          begin
                             ins_detoc.FieldByName('can').AsFloat:=round(((con_menu.fieldbyname('cans').Asfloat * con_escmun.fieldbyname('mat_pro').AsInteger)/50));
                             canred:=round(((con_menu.fieldbyname('cans').Asfloat * con_escmun.fieldbyname('mat_pro').AsInteger)/50));
                          end
                          else
                          begin
                             if (((con_menu.fieldbyname('cans').Asfloat*con_escmun.fieldbyname('mat_pro').AsInteger)/1000)>=0.01) and (((con_menu.fieldbyname('cans').Asfloat*con_escmun.fieldbyname('mat_pro').AsInteger)/1000)<=0.99) then
                             begin
                                ins_detoc.FieldByName('can').AsFloat       :=1;
                                canred:=1;
                             end
                             else
                             begin
                               ins_detoc.FieldByName('can').AsFloat       := round(((con_menu.fieldbyname('cans').Asfloat*con_escmun.fieldbyname('mat_pro').AsInteger)/1000));
                               canred:=round(((con_menu.fieldbyname('cans').Asfloat*con_escmun.fieldbyname('mat_pro').AsInteger)/1000));
                             end;
                          end;
                        end;


                        ins_detoc.FieldByName('precio_uni').AsFloat:=con_uni.fieldbyname('precio').Asfloat;

                        ins_detoc.FieldByName('total').AsFloat:= canred * con_uni.fieldbyname('precio').Asfloat;
                        toc:=toc+ins_detoc.FieldByName('total').AsFloat;

                        if con_uni.FieldByName('imp').AsString='S' then
                        begin
                           ins_detoc.FieldByName('imp').Asstring      :=con_uni.fieldbyname('imp').Asstring;
                           ins_detoc.FieldByName('imp_x100').AsFloat  :=con_uni.fieldbyname('impbs').Asfloat;
                           ins_detoc.FieldByName('impbs').AsFloat     :=(canred * con_uni.fieldbyname('precio').Asfloat)*(con_uni.fieldbyname('impbs').Asfloat/100);
                           timp:=timp+ins_detoc.FieldByName('impbs').AsFloat;
                        end
                        else
                        begin
                           if con_uni.FieldByName('imp').AsString='N' then
                           begin
                             ins_detoc.FieldByName('imp').Asstring      :=con_uni.fieldbyname('imp').Asstring;
                             ins_detoc.FieldByName('imp_x100').AsFloat  :=con_uni.fieldbyname('impbs').Asfloat;
                             ins_detoc.FieldByName('impbs').AsFloat     :=(canred * con_uni.fieldbyname('precio').Asfloat)*(con_uni.fieldbyname('impbs').Asfloat/100);
                             timp:=timp+ins_detoc.FieldByName('impbs').AsFloat;
                           end;
                        end;
                        ins_detoc.Post;
                      //----------------------------------------------
                    con_menu.Next;
                  end;
                  //**************** GUARDA LA ORDEN DE COMPRA ***************//

                   progresoo.Position:=i;
                   progresoo.Repaint;
                   progresoo2.Properties.Max:=0;
                   progresoo2.Repaint;
                   
                  

                   tb_oc.Open;
                   tb_oc.Append;
                   tb_oc.Edit;
                   tb_oc.FieldByName('id').Asfloat  :=noc;
                   tb_oc.FieldByName('fec_ela').AsDateTime:=date;

                   con_zon.Close;
                   con_zon.Open;
                   tb_oc.FieldByName('anno').Asinteger  := con_zon.fieldbyname('anno').AsInteger;
                   tb_oc.FieldByName('org').asinteger   :=10;
                   tb_oc.FieldByName('uad').asstring    :=con_zon.fieldbyname('uni_adm').Asstring;
                   tb_oc.FieldByName('uej').Asstring    :=con_zon.fieldbyname('uni_eje').Asstring;
                   con_zon.Close;

                   tb_oc.FieldByName('ubi').AsString    :='ESTADO BOLÌVAR';
                   tb_oc.FieldByName('mun').AsString    := lis_mun.Text;
                   tb_oc.FieldByName('lent').AsString   := con_escmun.fieldbyname('nom_esc').AsString;

                   if ck_segs.Checked=true then
                      tb_oc.FieldByName('seg').AsString :='S';
                   if ck_segn.Checked=true then
                      tb_oc.FieldByName('seg').AsString :='N';

                   con_prove.Close;
                   con_prove.Params[0].AsInteger:=con_escmun.fieldbyname('cod_prove').Asinteger;
                   con_prove.Open;
                   tb_oc.FieldByName('tel_prov').Asstring:=con_prove.fieldbyname('tel').AsString;
                   tb_oc.FieldByName('nom_prov').Asstring:=con_prove.fieldbyname('nom').AsString;
                   tb_oc.FieldByName('dir_prov').Asstring:=con_prove.fieldbyname('dir').AsString;
                   tb_oc.FieldByName('rif_prov').Asstring:=con_prove.fieldbyname('rif').AsString;
                   tb_oc.FieldByName('cpostal_prov').Asstring:=inttostr(con_prove.fieldbyname('cpo').Asinteger);
                   tb_oc.FieldByName('pent_esc').Asstring:=con_prove.fieldbyname('pzo_ent').Asstring;
                   con_prove.Close;

                   con_dep.Close;
                   con_dep.Params[0].AsInteger:=con_escmun.fieldbyname('cod_dep').Asinteger;
                   con_dep.Open;
                   tb_oc.FieldByName('nom_esc').Asstring:=con_dep.fieldbyname('nombre').AsString;
                   tb_oc.FieldByName('dir_esc').Asstring:=con_dep.fieldbyname('dir').AsString;
                   tb_oc.FieldByName('obs').Asstring:='';
                   tb_oc.FieldByName('nom_proy').Asstring:=lis_proy.Text;
                   tb_oc.FieldByName('mat_esc').AsInteger:=con_dep.fieldbyname('mat_pro').Asinteger;
                   con_dep.Close;



                   if ck_ac.Checked=true then
                      tb_oc.FieldByName('fpag').asstring:='ABONO EN CUENTA';
                   if ck_cc.Checked=true then
                      tb_oc.FieldByName('fpag').asstring:='CARTA CREDITO';
                   if ck_ch.Checked=true then
                      tb_oc.FieldByName('fpag').asstring:='CHEQUE';

                   if ck_cif.Checked=true then
                      tb_oc.FieldByName('coc').AsString:='CIF';
                   if ck_fob.Checked=true then
                      tb_oc.FieldByName('coc').AsString:='FOB';
                   if ck_fas.Checked=true then
                      tb_oc.FieldByName('coc').AsString:='FAS';
                   if ck_otros.Checked=true then
                      tb_oc.FieldByName('coc').AsString:='OTROS';

                   tb_oc.FieldByName('est').AsString:='';

                   tb_oc.FieldByName('cod_prov').AsInteger:=con_escmun.fieldbyname('cod_prove').AsInteger;
                   tb_oc.FieldByName('cod_proy').AsInteger:=con_escmun.fieldbyname('cod_mod').AsInteger;
                   tb_oc.FieldByName('cod_esc').AsInteger:=con_escmun.fieldbyname('cod_dep').AsInteger;

                     if ck_m1.Checked  then
                        tb_oc.FieldByName('semana').asinteger:=1;
                     if ck_m2.Checked  then
                        tb_oc.FieldByName('semana').asinteger:=2;

                     tb_oc.FieldByName('fec_del').AsDateTime:=fec_del.Date;
                     tb_oc.FieldByName('fec_al').AsDateTime:=fec_al.Date;

                     tb_oc.FieldByName('ent').AsInteger:=06;


                     tb_oc.FieldByName('totaloc').Asfloat:=toc;
                     tb_oc.FieldByName('totalimp').Asfloat:=timp;

                     tb_oc.FieldByName('fecoc').AsDateTime:=fecoc.Date;
                     tb_oc.FieldByName('usuario').Asstring:=frmacceso.con_usu.fieldbyname('nombre').asstring;
                     tb_oc.Post;
                    //************************************************************************
                   end;
         end
         else
         begin
                  //**************************************************************************

           if ck_m2.Checked then
           begin
              dias_oc.close;
              dias_oc.params[0].AsDate:=fec_al.Date;
              dias_oc.params[1].AsDate:=fec_del.Date;
              dias_oc.Open;
              nd:=5+(dias_oc.FieldByName('dias').AsInteger+1);
              if (nd<6) or (nd>10) then
              begin
                messagebox(0,'Debe Ingresar una Semana de 5 dias...!','Mensaje al Usuario',16);
                fec_del.SetFocus;
              end
              else
              begin
                //*********************************
                    con_numoc.Close;
                    con_numoc.Open;
                    con_numoc.FindLast;
                    con_numoc.Edit;
                    noc:= con_numoc.fieldbyname('id').AsFloat+1;
                    con_numoc.fieldbyname('id').AsFloat:=con_numoc.fieldbyname('id').AsFloat+1;
                    con_numoc.Post;
                    con_numoc.Close;



                    con_menu2.Close;
                    con_menu2.Params[0].AsInteger:=con_escmun.fieldbyname('cod_mod').AsInteger;
                    con_menu2.Params[1].AsInteger:=nd;
                    con_menu2.Open;

                    progresoo2.Properties.Max:=con_menu2.RecordCount;
                    con_maxid.Close;
                    con_maxid.Open;

                    for j:=1 to con_menu2.RecordCount do
                    begin
                      //---------------------------------------
                     
                       progresoo2.Position:=j;
                       progresoo2.Repaint;


                        ins_detoc.Close;
                        ins_detoc.Params[0].AsInteger:=con_maxid.fieldbyname('maxid').AsInteger;
                        ins_detoc.Open;
                        ins_detoc.FindLast;
                        ins_detoc.Edit;
                        ins_detoc.Append;

                        ins_detoc.FieldByName('cod_oc').Asfloat  :=noc;
                        ins_detoc.FieldByName('ren').AsInteger     :=j;
                        ins_detoc.FieldByName('articulo').AsString :=con_menu2.fieldbyname('des_prod').AsString;

                        con_uni.Close;
                        con_uni.Params[0].asinteger:=con_menu2.fieldbyname('cod_prod').Asinteger;
                        con_uni.Open;
                        ins_detoc.FieldByName('unidad').AsString   :=con_uni.fieldbyname('nomuni').Asstring;



                        if con_menu2.fieldbyname('cod_prod').Asinteger=26 then
                        begin
                             ins_detoc.FieldByName('can').AsFloat:=con_escmun.fieldbyname('mat_pro').AsInteger;
                             canred:=con_escmun.fieldbyname('mat_pro').AsInteger;
                        end
                        else
                        begin
                          if con_menu2.fieldbyname('cod_prod').Asinteger=32 then
                          begin
                             ins_detoc.FieldByName('can').AsFloat:=round(((con_menu2.fieldbyname('cans').Asfloat * con_escmun.fieldbyname('mat_pro').AsInteger)/50));
                             canred:=round(((con_menu2.fieldbyname('cans').Asfloat * con_escmun.fieldbyname('mat_pro').AsInteger)/50));
                          end
                          else



                          if (((con_menu2.fieldbyname('cans').Asfloat*con_escmun.fieldbyname('mat_pro').AsInteger)/1000)>=0.01) and (((con_menu2.fieldbyname('cans').Asfloat*con_escmun.fieldbyname('mat_pro').AsInteger)/1000)<=0.99) then
                          begin
                             ins_detoc.FieldByName('can').AsFloat       :=1;
                             canred:=1;
                          end
                          else
                          begin
                             ins_detoc.FieldByName('can').AsFloat       := round(((con_menu2.fieldbyname('cans').Asfloat*con_escmun.fieldbyname('mat_pro').AsInteger)/1000));
                             canred:=round(((con_menu2.fieldbyname('cans').Asfloat*con_escmun.fieldbyname('mat_pro').AsInteger)/1000));
                          end;
                         end;
                        ins_detoc.FieldByName('precio_uni').AsFloat:=con_uni.fieldbyname('precio').Asfloat;

                        ins_detoc.FieldByName('total').AsFloat:= canred * con_uni.fieldbyname('precio').Asfloat;
                        toc:=toc+ins_detoc.FieldByName('total').AsFloat;

                        if con_uni.FieldByName('imp').AsString='S' then
                        begin
                           ins_detoc.FieldByName('imp').Asstring      :=con_uni.fieldbyname('imp').Asstring;
                           ins_detoc.FieldByName('imp_x100').AsFloat  :=con_uni.fieldbyname('impbs').Asfloat;
                           ins_detoc.FieldByName('impbs').AsFloat     :=(canred * con_uni.fieldbyname('precio').Asfloat)*(con_uni.fieldbyname('impbs').Asfloat/100);
                           timp:=timp+ins_detoc.FieldByName('impbs').AsFloat;
                        end
                        else
                        begin
                           if con_uni.FieldByName('imp').AsString='N' then
                           begin
                             ins_detoc.FieldByName('imp').Asstring      :=con_uni.fieldbyname('imp').Asstring;
                             ins_detoc.FieldByName('imp_x100').AsFloat  :=con_uni.fieldbyname('impbs').Asfloat;
                             ins_detoc.FieldByName('impbs').AsFloat     :=(canred * con_uni.fieldbyname('precio').Asfloat)*(con_uni.fieldbyname('impbs').Asfloat/100);
                             timp:=timp+ins_detoc.FieldByName('impbs').AsFloat;
                           end;
                        end;
                        ins_detoc.Post;
                      //----------------------------------------------
                    con_menu2.Next;
                  end;
                  //**************** GUARDA LA ORDEN DE COMPRA ***************//

                   progresoo.Position:=i;
                   progresoo.Repaint;
                   progresoo2.Properties.Max:=0;
                   progresoo2.Repaint;
                   
                  

                   tb_oc.Open;
                   tb_oc.Append;
                   tb_oc.Edit;
                   tb_oc.FieldByName('id').Asfloat  :=noc;
                   tb_oc.FieldByName('fec_ela').AsDateTime:=date;

                   con_zon.Close;
                   con_zon.Open;
                   tb_oc.FieldByName('anno').Asinteger  := con_zon.fieldbyname('anno').AsInteger;
                   tb_oc.FieldByName('org').asinteger   :=10;
                   tb_oc.FieldByName('uad').asstring    :=con_zon.fieldbyname('uni_adm').Asstring;
                   tb_oc.FieldByName('uej').Asstring    :=con_zon.fieldbyname('uni_eje').Asstring;
                   con_zon.Close;

                   tb_oc.FieldByName('ubi').AsString    :='ESTADO BOLÌVAR';
                   tb_oc.FieldByName('mun').AsString    := lis_mun.Text;
                   tb_oc.FieldByName('lent').AsString   := con_escmun.fieldbyname('nom_esc').AsString;

                   if ck_segs.Checked=true then
                      tb_oc.FieldByName('seg').AsString :='S';
                   if ck_segn.Checked=true then
                      tb_oc.FieldByName('seg').AsString :='N';

                   con_prove.Close;
                   con_prove.Params[0].AsInteger:=con_escmun.fieldbyname('cod_prove').Asinteger;
                   con_prove.Open;
                   tb_oc.FieldByName('tel_prov').Asstring:=con_prove.fieldbyname('tel').AsString;
                   tb_oc.FieldByName('nom_prov').Asstring:=con_prove.fieldbyname('nom').AsString;
                   tb_oc.FieldByName('dir_prov').Asstring:=con_prove.fieldbyname('dir').AsString;
                   tb_oc.FieldByName('rif_prov').Asstring:=con_prove.fieldbyname('rif').AsString;
                   tb_oc.FieldByName('cpostal_prov').Asstring:=inttostr(con_prove.fieldbyname('cpo').Asinteger);
                   tb_oc.FieldByName('pent_esc').Asstring:=con_prove.fieldbyname('pzo_ent').Asstring;
                   con_prove.Close;

                   con_dep.Close;
                   con_dep.Params[0].AsInteger:=con_escmun.fieldbyname('cod_dep').Asinteger;
                   con_dep.Open;
                   tb_oc.FieldByName('nom_esc').Asstring:=con_dep.fieldbyname('nombre').AsString;
                   tb_oc.FieldByName('dir_esc').Asstring:=con_dep.fieldbyname('dir').AsString;
                   tb_oc.FieldByName('obs').Asstring:='';
                   tb_oc.FieldByName('nom_proy').Asstring:=lis_proy.Text;
                   tb_oc.FieldByName('mat_esc').AsInteger:=con_dep.fieldbyname('mat_pro').Asinteger;
                   con_dep.Close;



                   if ck_ac.Checked=true then
                      tb_oc.FieldByName('fpag').asstring:='ABONO EN CUENTA';
                   if ck_cc.Checked=true then
                      tb_oc.FieldByName('fpag').asstring:='CARTA CREDITO';
                   if ck_ch.Checked=true then
                      tb_oc.FieldByName('fpag').asstring:='CHEQUE';

                   if ck_cif.Checked=true then
                      tb_oc.FieldByName('coc').AsString:='CIF';
                   if ck_fob.Checked=true then
                      tb_oc.FieldByName('coc').AsString:='FOB';
                   if ck_fas.Checked=true then
                      tb_oc.FieldByName('coc').AsString:='FAS';
                   if ck_otros.Checked=true then
                      tb_oc.FieldByName('coc').AsString:='OTROS';

                   tb_oc.FieldByName('est').AsString:='';

                   tb_oc.FieldByName('cod_prov').AsInteger:=con_escmun.fieldbyname('cod_prove').AsInteger;
                   tb_oc.FieldByName('cod_proy').AsInteger:=con_escmun.fieldbyname('cod_mod').AsInteger;
                   tb_oc.FieldByName('cod_esc').AsInteger:=con_escmun.fieldbyname('cod_dep').AsInteger;


                     if ck_m1.Checked  then
                        tb_oc.FieldByName('semana').asinteger:=1;
                     if ck_m2.Checked  then
                        tb_oc.FieldByName('semana').asinteger:=2;

                     tb_oc.FieldByName('fec_del').AsDateTime:=fec_del.Date;
                     tb_oc.FieldByName('fec_al').AsDateTime:=fec_al.Date;

                     tb_oc.FieldByName('ent').AsInteger:=06;


                     tb_oc.FieldByName('totaloc').Asfloat:=toc;
                     tb_oc.FieldByName('totalimp').Asfloat:=timp;

                     tb_oc.FieldByName('fecoc').AsDateTime:=fecoc.Date;
                     tb_oc.FieldByName('usuario').Asstring:=frmacceso.con_usu.fieldbyname('nombre').asstring;
                     tb_oc.Post;
                   end;
           end;
                  //**************************************************************************
     end;
     con_escmun.Next;
  end;
   messagebox(0,'Ordenes de Compras Generadas...!','Mensaje al Usuario',32);
   bt_salir.SetFocus;
end;
end
else
begin
 messagebox(0,'Ordenes de Compras de Semana Seleccionada ya fueron Generadas...!','Mensaje al Usuario',32);
end;
end;



procedure Tfrmocxlote.BitBtn1Click(Sender: TObject);
begin
  if (ck_ac.Checked=false) and (ck_cc.Checked=false) and (ck_ch.Checked=false) then
  begin
    messagebox(0,'Debe Seleccionar una forma de pago...!','Mensaje al Usuario',16);
  end
  else
  begin
    if (ck_cif.Checked=false) and (ck_Fob.Checked=false) and (ck_fas.Checked=false) and (ck_otros.Checked=false) then
    begin
       messagebox(0,'Debe Seleccionar Condiciones de Compra...!','Mensaje al Usuario',16);
    end
    else
    begin
       if (ck_segs.Checked=false) and (ck_segn.Checked=false) then
       begin
         messagebox(0,'Debe Seleccionar si esta asegurado o no ...!','Mensaje al Usuario',16);
       end
       else
          bt_cargaoc.Visible:=true;
    end;
  end;
end;

procedure Tfrmocxlote.bt_cargaocExit(Sender: TObject);
begin

   progresoo.Properties.Max:=0;
   progresoo2.Properties.Max:=0;
   progresoo.Repaint;
   progresoo2.Repaint;
   panel2.Visible:=false;
end;

procedure Tfrmocxlote.lis_munDblClick(Sender: TObject);
begin
lista_mun.Visible:=true;
con_mun.Close;
con_mun.Open;

end;

procedure Tfrmocxlote.lista_munDblClick(Sender: TObject);
begin
  lis_mun.Text:=con_mun.fieldbyname('nombre').asstring;
  lis_codmun.Text:=con_mun.fieldbyname('cod').asstring;
  lista_mun.Visible:=false;
  lis_mun.SetFocus;
end;

procedure Tfrmocxlote.lis_proyDblClick(Sender: TObject);
begin
  lista_proy.Visible:=true;
  con_proy.Close;
  con_proy.Open;
end;

procedure Tfrmocxlote.lista_proyDblClick(Sender: TObject);
begin
  lis_proy.Text:=con_proy.fieldbyname('nom').asstring;
  lis_idproy.Text:=con_proy.fieldbyname('id').asstring;
  lista_proy.Visible:=false;
  lis_proy.SetFocus;
end;

end.
