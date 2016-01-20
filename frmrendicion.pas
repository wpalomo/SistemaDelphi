unit frmrendicion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  RxCalc, dxCntner, dxEditor, dxEdLib, dxTL, dxDBCtrl, dxDBGrid, StdCtrls,
  Buttons, ExtCtrls, ComCtrls;

type
  Tfrmrendir = class(TForm)
    grupo_base2: TGroupBox;
    grup_esc: TGroupBox;
    lab_nomdep: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    lab_dire: TLabel;
    Label34: TLabel;
    lab_plazo: TLabel;
    Label6: TLabel;
    lab_matri: TLabel;
    lab_mun: TLabel;
    Label10: TLabel;
    grup_fp: TGroupBox;
    ck_ac: TRadioButton;
    ck_cc: TRadioButton;
    ck_ch: TRadioButton;
    grup_cc: TGroupBox;
    ck_cif: TRadioButton;
    ck_fob: TRadioButton;
    ck_fas: TRadioButton;
    ck_otros: TRadioButton;
    grupo_base4: TGroupBox;
    obs: TEdit;
    grupo_base: TGroupBox;
    grup_prov: TGroupBox;
    Label12: TLabel;
    lab_nomprov: TLabel;
    lab_dirprov: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    lab_telprov: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    lab_rifprov: TLabel;
    Label27: TLabel;
    lab_cpprov: TLabel;
    ck_segs: TRadioButton;
    ck_segn: TRadioButton;
    anulada: TGroupBox;
    Image1: TImage;
    grup_des: TGroupBox;
    lab_fec: TLabel;
    lab_f: TLabel;
    lab_o: TLabel;
    lab_org: TLabel;
    lab: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    lab_ua: TLabel;
    lab_ue: TLabel;
    lab_ug: TLabel;
    lab_efe: TLabel;
    Label2: TLabel;
    lab_anno: TLabel;
    grupo_unaesc: TGroupBox;
    lab_esc: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    fec_uno: TDateTimePicker;
    fec_dos: TDateTimePicker;
    fecoc: TDateTimePicker;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    bt_aceptar: TBitBtn;
    GroupBox1: TGroupBox;
    lab_numoc: TLabel;
    GroupBox7: TGroupBox;
    lab_prov: TLabel;
    GroupBox8: TGroupBox;
    lab_proy: TLabel;
    grupo_base3: TPanel;
    Panel2: TPanel;
    Label5: TLabel;
    Panel3: TPanel;
    lab_men: TLabel;
    Label7: TLabel;
    ttimp: TdxEdit;
    ttoc: TdxEdit;
    aux_tot: TdxEdit;
    aux_imp: TdxEdit;
    BitBtn6: TBitBtn;
    calculadora: TRxCalculator;
    BitBtn2: TBitBtn;
    dataoc: TDataSource;
    con_oc: TZQuery;
    rinde_oc: TZQuery;
    data_rinde: TDataSource;
    norinde_oc: TZQuery;
    datanorinde: TDataSource;
    Label13: TLabel;
    Label14: TLabel;
    analistar: TEdit;
    tocbs: TdxEdit;
    Label15: TLabel;
    GroupBox3: TGroupBox;
    ck_m1: TRadioButton;
    ck_m2: TRadioButton;
    fecren: TDateTimePicker;
    Label19: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    con_facrep: TZQuery;
    DataSource1: TDataSource;
    mensaje: TPanel;
    con_nerep: TZQuery;
    DataSource2: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_aceptarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure caden(Cadena:string);
    procedure caden2(Cadena:string);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit30KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure Edit14KeyPress(Sender: TObject; var Key: Char);
    procedure Edit15KeyPress(Sender: TObject; var Key: Char);
    procedure Edit16KeyPress(Sender: TObject; var Key: Char);
    procedure Edit17KeyPress(Sender: TObject; var Key: Char);
    procedure Edit18KeyPress(Sender: TObject; var Key: Char);
    procedure Edit19KeyPress(Sender: TObject; var Key: Char);
    procedure Edit20KeyPress(Sender: TObject; var Key: Char);
    procedure Edit21KeyPress(Sender: TObject; var Key: Char);
    procedure Edit22KeyPress(Sender: TObject; var Key: Char);
    procedure Edit23KeyPress(Sender: TObject; var Key: Char);
    procedure Edit24KeyPress(Sender: TObject; var Key: Char);
    procedure Edit25KeyPress(Sender: TObject; var Key: Char);
    procedure Edit26KeyPress(Sender: TObject; var Key: Char);
    procedure Edit27KeyPress(Sender: TObject; var Key: Char);
    procedure Edit28KeyPress(Sender: TObject; var Key: Char);
    procedure Edit29KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure Edit6Enter(Sender: TObject);
    procedure Edit7Enter(Sender: TObject);
    procedure Edit8Enter(Sender: TObject);
    procedure Edit9Enter(Sender: TObject);
    procedure Edit10Enter(Sender: TObject);
    procedure Edit11Enter(Sender: TObject);
    procedure Edit12Enter(Sender: TObject);
    procedure Edit13Enter(Sender: TObject);
    procedure Edit14Enter(Sender: TObject);
    procedure Edit15Enter(Sender: TObject);
    procedure Edit16Enter(Sender: TObject);
    procedure Edit17Enter(Sender: TObject);
    procedure Edit18Enter(Sender: TObject);
    procedure Edit19Enter(Sender: TObject);
    procedure Edit20Enter(Sender: TObject);
    procedure Edit21Enter(Sender: TObject);
    procedure Edit22Enter(Sender: TObject);
    procedure Edit23Enter(Sender: TObject);
    procedure Edit24Enter(Sender: TObject);
    procedure Edit25Enter(Sender: TObject);
    procedure Edit26Enter(Sender: TObject);
    procedure Edit27Enter(Sender: TObject);
    procedure Edit28Enter(Sender: TObject);
    procedure Edit29Enter(Sender: TObject);
    procedure Edit30Enter(Sender: TObject);
  private
    { Private declarations }
  public
        { Public declarations }
  end;

var
  frmrendir: Tfrmrendir;

implementation

uses frmacces, frmcocrendi;

{$R *.dfm}
 procedure Tfrmrendir.caden(Cadena:string);
 var
    n:integer;
    numg:integer;
    num1:string;
    num2:string;
    num3:string;
    num4:string;
    num5:string;
    num6:string;
    num7:string;
    num8:string;
    num9:string;
    num10:string;
    num11:string;
    num12:string;
    num13:string;
    num14:string;
    num15:string;
 begin
   numg:=0;
   for n:=1 to Length(Cadena) do
   begin
     if Cadena[n]<>'-' then
     begin
        case numg of
         0:begin
              num1:=num1+Cadena[n];
           end;
         1:
           num2:=num2+Cadena[n];
         2:
           num3:=num3+Cadena[n];
         3:
           num4:=num4+Cadena[n];
         4:
           num5:=num5+Cadena[n];
         5:
           num6:=num6+Cadena[n];
         6:
           num7:=num7+Cadena[n];
         7:
           num8:=num8+Cadena[n];
         8:
           num9:=num9+Cadena[n];
         9:
           num10:=num10+Cadena[n];
         10:
           num11:=num11+Cadena[n];
         11:
           num12:=num12+Cadena[n];
         12:
           num13:=num13+Cadena[n];
         13:
           num14:=num14+Cadena[n];
         14:
           num15:=num15+Cadena[n];
        end;
     end
     else
     begin
       numg:=numg+1;
     end;
   end;
edit1.Text:=num1;
edit2.Text:=num2;
edit3.Text:=num3;
edit4.Text:=num4;
edit5.Text:=num5;
edit6.Text:=num6;
edit7.Text:=num7;
edit8.Text:=num8;
edit9.Text:=num9;
edit10.Text:=num10;
edit11.Text:=num11;
edit12.Text:=num12;
edit13.Text:=num13;
edit14.Text:=num14;
edit15.Text:=num15;
end;

procedure Tfrmrendir.caden2(Cadena:string);
var
    n:integer;
    numg:integer;
    num1:string;
    num2:string;
    num3:string;
    num4:string;
    num5:string;
    num6:string;
    num7:string;
    num8:string;
    num9:string;
    num10:string;
    num11:string;
    num12:string;
    num13:string;
    num14:string;
    num15:string;
 begin
   numg:=0;
   for n:=1 to Length(Cadena) do
   begin
     if Cadena[n]<>'-' then
     begin
        case numg of
         0:
           num1:=num1+Cadena[n];
         1:
           num2:=num2+Cadena[n];
         2:
           num3:=num3+Cadena[n];
         3:
           num4:=num4+Cadena[n];
         4:
           num5:=num5+Cadena[n];
         5:
           num6:=num6+Cadena[n];
         6:
           num7:=num7+Cadena[n];
         7:
           num8:=num8+Cadena[n];
         8:
           num9:=num9+Cadena[n];
         9:
           num10:=num10+Cadena[n];
         10:
           num11:=num11+Cadena[n];
         11:
           num12:=num12+Cadena[n];
         12:
           num13:=num13+Cadena[n];
         13:
           num14:=num14+Cadena[n];
         14:
           num15:=num15+Cadena[n];
        end;
     end
     else
     begin
       numg:=numg+1;
     end;
  end;
edit16.Text:=num1;
edit17.Text:=num2;
edit18.Text:=num3;
edit19.Text:=num4;
edit20.Text:=num5;
edit21.Text:=num6;
edit22.Text:=num7;
edit23.Text:=num8;
edit24.Text:=num9;
edit25.Text:=num10;
edit26.Text:=num11;
edit27.Text:=num12;
edit28.Text:=num13;
edit29.Text:=num14;
edit30.Text:=num15;
end;

procedure Tfrmrendir.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmrendir.BitBtn6Click(Sender: TObject);
begin
calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmrendir.FormShow(Sender: TObject);
begin
mensaje.Visible:=false;
edit1.SetFocus;
caden(frmcocren.con_oc.FieldByName('nfac').Asstring);
caden2(frmcocren.con_oc.FieldByName('nne').Asstring);

 aux_tot.Text:='';
 aux_imp.Text:='';

 if frmcocren.con_oc.FieldByName('anulada').AsString='S' then
    anulada.Visible:=true;
 if frmcocren.con_oc.FieldByName('anulada').AsString='N' then
    anulada.Visible:=false;

 lab_numoc.Caption:=frmcocren.con_oc.FieldByName('id').AsString;
 lab_prov.Caption :=frmcocren.con_oc.FieldByName('nom_prov').AsString;
 lab_proy.Caption :=frmcocren.con_oc.FieldByName('nom_proy').AsString;
 lab_fec.Caption  :=frmcocren.con_oc.FieldByName('fec_ela').AsString;
 lab_org.Caption  :=frmcocren.con_oc.FieldByName('org').AsString;
 lab_ua.Caption   :=frmcocren.con_oc.FieldByName('uad').AsString;
 lab_ue.Caption   :=frmcocren.con_oc.FieldByName('uej').AsString;
 lab_ug.Caption   :=frmcocren.con_oc.FieldByName('ubi').AsString;
 lab_efe.Caption  :=frmcocren.con_oc.FieldByName('ent').AsString;
 lab_anno.Caption :=frmcocren.con_oc.FieldByName('anno').AsString;
 lab_nomprov.Caption:=frmcocren.con_oc.FieldByName('nom_prov').AsString;
 lab_dirprov.Caption:=frmcocren.con_oc.FieldByName('dir_prov').AsString;
 lab_telprov.Caption:=frmcocren.con_oc.FieldByName('tel_prov').AsString;
 if frmcocren.con_oc.FieldByName('seg').AsString='S' then
 begin
    ck_segs.Checked:=true;
    ck_segn.Checked:=false;
 end;
 if frmcocren.con_oc.FieldByName('seg').AsString='N' then
 begin
    ck_segs.Checked:=false;
    ck_segn.Checked:=true;
 end;
 lab_rifprov.Caption:=frmcocren.con_oc.FieldByName('rif_prov').AsString;
 lab_cpprov.Caption :=frmcocren.con_oc.FieldByName('cpostal_prov').AsString;
 lab_esc.Caption    :=frmcocren.con_oc.FieldByName('nom_esc').AsString;
 fecoc.Date         :=frmcocren.con_oc.FieldByName('fecoc').AsDateTime;
 fec_uno.Date       :=frmcocren.con_oc.FieldByName('fec_del').AsDateTime;
 fec_dos.Date       :=frmcocren.con_oc.FieldByName('fec_al').AsDateTime;
 lab_nomdep.Caption :=frmcocren.con_oc.FieldByName('nom_esc').Asstring;
 lab_mun.Caption    :=frmcocren.con_oc.FieldByName('mun').Asstring;
 lab_dire.Caption   :=frmcocren.con_oc.FieldByName('dir_esc').Asstring;
 lab_plazo.Caption  :=frmcocren.con_oc.FieldByName('pent_esc').Asstring;
 lab_matri.Caption  :=frmcocren.con_oc.FieldByName('mat_esc').Asstring;
 if frmcocren.con_oc.FieldByName('fpag').Asstring='ABONO EN CUENTA' then
 begin
    ck_ac.Checked:=true;
 end;
 if frmcocren.con_oc.FieldByName('fpag').Asstring='CARTA CREDITO' then
 begin
    ck_cc.Checked:=true;
 end;
 if frmcocren.con_oc.FieldByName('fpag').Asstring='CHEQUE' then
 begin
    ck_ch.Checked:=true;
 end;


 if frmcocren.con_oc.FieldByName('coc').Asstring='CIF' then
 begin
    ck_cif.Checked:=true;
 end;
 if frmcocren.con_oc.FieldByName('coc').Asstring='FAS' then
 begin
    ck_fas.Checked:=true;
 end;
 if frmcocren.con_oc.FieldByName('coc').Asstring='FOB' then
 begin
    ck_fob.Checked:=true;
 end;
 if frmcocren.con_oc.FieldByName('coc').Asstring='OTROS' then
 begin
    ck_otros.Checked:=true;
 end;

 if (frmcocren.con_oc.FieldByName('semana').Asinteger=1) or (frmcocren.con_oc.FieldByName('semana').Asinteger=3) or (frmcocren.con_oc.FieldByName('semana').Asinteger=5) or (frmcocren.con_oc.FieldByName('semana').Asinteger=7)then ck_m1.Checked:=true;
 if (frmcocren.con_oc.FieldByName('semana').Asinteger=2) or (frmcocren.con_oc.FieldByName('semana').Asinteger=4) or (frmcocren.con_oc.FieldByName('semana').Asinteger=6) or (frmcocren.con_oc.FieldByName('semana').Asinteger=8)then ck_m2.Checked:=true;


 obs.Text:=frmcocren.con_oc.FieldByName('obs').Asstring;
 analistar.Text:=frmacceso.con_usu.fieldbyname('nombre').asstring;
 fecren.Date:=date;


 ttoc.Text:=formatfloat('#,##0.00',frmcocren.con_oc.FieldByName('totaloc').Asfloat);
 ttimp.Text:=formatfloat('#,##0.00',frmcocren.con_oc.FieldByName('totalimp').Asfloat);
 tocbs.Text:=formatfloat('#,##0.00',(frmcocren.con_oc.FieldByName('totaloc').Asfloat +frmcocren.con_oc.FieldByName('totalimp').Asfloat));
 //impbsf.Text:=formatfloat('#,##0.00',(frmcocren.con_oc.FieldByName('totalimp').Asfloat/1000));
 //ocbsf.Text:=formatfloat('#,##0.00',(frmcocren.con_oc.FieldByName('totaloc').Asfloat/1000));
 //tocbsf.Text:=formatfloat('#,##0.00',((frmcocren.con_oc.FieldByName('totaloc').Asfloat +frmcocren.con_oc.FieldByName('totalimp').Asfloat)/1000));
end;

procedure Tfrmrendir.bt_aceptarClick(Sender: TObject);
begin
if edit1.Text='' then
begin
   application.MessageBox('Debe Ingresar Factura...!','Mensaje al Usuario',16);
   edit1.SetFocus;
end
else
begin
   rinde_oc.Close;
   rinde_oc.Params[0].asstring:=edit1.Text+'-'+edit2.Text+'-'+edit3.Text+'-'+edit4.Text+'-'+edit5.Text+'-'+edit6.Text+'-'+edit7.Text+'-'+edit8.Text+'-'+edit9.Text+'-'+edit10.Text+'-'+edit11.Text+'-'+edit12.Text+'-'+edit13.Text+'-'+edit14.Text+'-'+edit15.Text;
   rinde_oc.Params[1].AsString:=edit16.Text+'-'+edit17.Text+'-'+edit18.Text+'-'+edit19.Text+'-'+edit20.Text+'-'+edit21.Text+'-'+edit22.Text+'-'+edit23.Text+'-'+edit24.Text+'-'+edit25.Text+'-'+edit26.Text+'-'+edit27.Text+'-'+edit28.Text+'-'+edit29.Text+'-'+edit30.Text;
   rinde_oc.Params[2].AsString:=analistar.Text;
   rinde_oc.Params[3].AsFloat:=frmcocren.con_oc.FieldByName('id').Asfloat;
   rinde_oc.Params[4].Asdate:=fecren.Date;
   rinde_oc.ExecSQL;
   close;
end;
end;

procedure Tfrmrendir.BitBtn2Click(Sender: TObject);
begin

if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
norinde_oc.Close;
norinde_oc.Params[0].asstring:='';
norinde_oc.Params[1].AsString:='';
norinde_oc.Params[2].AsString:='';
norinde_oc.Params[3].AsFloat:=frmcocren.con_oc.FieldByName('id').Asfloat;
norinde_oc.Params[4].Asdate:=0;
norinde_oc.ExecSQL;
close;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);


end;

procedure Tfrmrendir.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmcocren.con_oc.Close;
frmcocren.con_oc.SQL.Text:='select * from oc where pagada="N" limit 50';
frmcocren.con_oc.ExecSQL;
frmcocren.con_oc.Open;
end;

procedure Tfrmrendir.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit1.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit1.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;    
end;

procedure Tfrmrendir.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tfrmrendir.Edit30KeyPress(Sender: TObject; var Key: Char);
begin
  case key of
      #48..#57:;
      #8:;
      #13:
      begin
       if edit30.Text<>'' then
       begin
         con_nerep.Close;
         con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
         con_nerep.Params[1].AsInteger:=strtoint(edit30.text);
         con_nerep.Open;
         if con_nerep.RecordCount>0 then
         begin
           mensaje.Visible:=true;
           mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
           edit30.SetFocus;
         end
         else
           bt_aceptar.SetFocus;
       end;
      end;
    else
        key:=#0;
    end;

end;

procedure Tfrmrendir.Edit1Enter(Sender: TObject);
begin
 edit1.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit2.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit2.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
        
       end;
       end;
      end;
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit3.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit3.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
         
       end;
       end;
      end;
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit4.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit4.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       
       end;
       end;
      end;
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit5.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit5.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
         
       end;
       end;
      end;
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit6.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit6.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;

       end;
       end;
      end; 
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit7.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit7.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
         
       end;
       end;
      end;
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit8.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit8.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
         
       end;
       end;
      end;
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit9.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit9.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
         
       end;
       end;
      end;
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit10.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit10.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
         
       end;
       end;
      end; 
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit11.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit11.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
         
       end;
       end;
      end; 
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit12.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit12.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
         
       end;
       end;
      end;
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit13KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit13.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit13.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
        
       end;
       end;
      end; 
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit14KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit14.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit14.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
         
       end;
       end;
      end;
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit15KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit15.Text<>'' then
      begin
       con_facrep.Close;
       con_facrep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_facrep.Params[1].AsInteger:=strtoint(edit15.text);
       con_facrep.Open;
       if con_facrep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Factura Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
         
       end;
       end;
      end; 
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit16KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit16.Text<>'' then
      begin
       con_nerep.Close;
       con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_nerep.Params[1].AsInteger:=strtoint(edit16.text);
       con_nerep.Open;
       if con_nerep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_nerep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;
end;

procedure Tfrmrendir.Edit17KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit17.Text<>'' then
      begin
       con_nerep.Close;
       con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_nerep.Params[1].AsInteger:=strtoint(edit17.text);
       con_nerep.Open;
       if con_nerep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;

end;

procedure Tfrmrendir.Edit18KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit18.Text<>'' then
      begin
       con_nerep.Close;
       con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_nerep.Params[1].AsInteger:=strtoint(edit18.text);
       con_nerep.Open;
       if con_nerep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;

end;

procedure Tfrmrendir.Edit19KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit19.Text<>'' then
      begin
       con_nerep.Close;
       con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_nerep.Params[1].AsInteger:=strtoint(edit19.text);
       con_nerep.Open;
       if con_nerep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;

end;

procedure Tfrmrendir.Edit20KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit20.Text<>'' then
      begin
       con_nerep.Close;
       con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_nerep.Params[1].AsInteger:=strtoint(edit20.text);
       con_nerep.Open;
       if con_nerep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;

end;

procedure Tfrmrendir.Edit21KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit21.Text<>'' then
      begin
       con_nerep.Close;
       con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_nerep.Params[1].AsInteger:=strtoint(edit21.text);
       con_nerep.Open;
       if con_nerep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;

end;

procedure Tfrmrendir.Edit22KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit22.Text<>'' then
      begin
       con_nerep.Close;
       con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_nerep.Params[1].AsInteger:=strtoint(edit22.text);
       con_nerep.Open;
       if con_nerep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;

end;

procedure Tfrmrendir.Edit23KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit23.Text<>'' then
      begin
       con_nerep.Close;
       con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_nerep.Params[1].AsInteger:=strtoint(edit23.text);
       con_nerep.Open;
       if con_nerep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;

end;

procedure Tfrmrendir.Edit24KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit24.Text<>'' then
      begin
       con_nerep.Close;
       con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_nerep.Params[1].AsInteger:=strtoint(edit24.text);
       con_nerep.Open;
       if con_nerep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;

end;

procedure Tfrmrendir.Edit25KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit25.Text<>'' then
      begin
       con_nerep.Close;
       con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_nerep.Params[1].AsInteger:=strtoint(edit25.text);
       con_nerep.Open;
       if con_nerep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;

end;

procedure Tfrmrendir.Edit26KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit26.Text<>'' then
      begin
       con_nerep.Close;
       con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_nerep.Params[1].AsInteger:=strtoint(edit26.text);
       con_nerep.Open;
       if con_nerep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;

end;

procedure Tfrmrendir.Edit27KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit27.Text<>'' then
      begin
       con_nerep.Close;
       con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_nerep.Params[1].AsInteger:=strtoint(edit27.text);
       con_nerep.Open;
       if con_nerep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;

end;

procedure Tfrmrendir.Edit28KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit28.Text<>'' then
      begin
       con_nerep.Close;
       con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_nerep.Params[1].AsInteger:=strtoint(edit28.text);
       con_nerep.Open;
       if con_nerep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;

end;

procedure Tfrmrendir.Edit29KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
      #48..#57:;
      #8:;
      #13:
      begin
      if edit29.Text<>'' then
      begin
       con_nerep.Close;
       con_nerep.Params[0].AsInteger:=frmcocren.con_oc.FieldByName('cod_prov').Asinteger;
       con_nerep.Params[1].AsInteger:=strtoint(edit29.text);
       con_nerep.Open;
       if con_nerep.RecordCount>0 then
       begin
         mensaje.Visible:=true;
         mensaje.Caption:='Nota de Entrega Ya Registrada!....en Orden de Compra Nro.:'+con_facrep.fieldbyname('id').asstring;
       end;
       end;
      end;
    else
        key:=#0;
    end;

end;

procedure Tfrmrendir.Edit2Enter(Sender: TObject);
begin
 edit2.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit3Enter(Sender: TObject);
begin
 edit3.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit4Enter(Sender: TObject);
begin
 edit4.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit5Enter(Sender: TObject);
begin
 edit5.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit6Enter(Sender: TObject);
begin
 edit6.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit7Enter(Sender: TObject);
begin
 edit7.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit8Enter(Sender: TObject);
begin
 edit8.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit9Enter(Sender: TObject);
begin
 edit9.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit10Enter(Sender: TObject);
begin
 edit10.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit11Enter(Sender: TObject);
begin
 edit11.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit12Enter(Sender: TObject);
begin
 edit12.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit13Enter(Sender: TObject);
begin
 edit13.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit14Enter(Sender: TObject);
begin
edit14.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit15Enter(Sender: TObject);
begin
 edit15.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit16Enter(Sender: TObject);
begin
 edit16.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit17Enter(Sender: TObject);
begin
 edit17.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit18Enter(Sender: TObject);
begin
 edit18.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit19Enter(Sender: TObject);
begin
 edit19.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit20Enter(Sender: TObject);
begin
 edit20.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit21Enter(Sender: TObject);
begin
 edit21.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit22Enter(Sender: TObject);
begin
 edit22.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit23Enter(Sender: TObject);
begin
 edit23.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit24Enter(Sender: TObject);
begin
 edit24.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit25Enter(Sender: TObject);
begin
 edit25.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit26Enter(Sender: TObject);
begin
 edit26.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit27Enter(Sender: TObject);
begin
 edit27.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit28Enter(Sender: TObject);
begin
 edit28.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit29Enter(Sender: TObject);
begin
 edit29.Clear;
 mensaje.Visible:=false;
end;

procedure Tfrmrendir.Edit30Enter(Sender: TObject);
begin
 edit30.Clear;
 mensaje.Visible:=false;
end;

end.
