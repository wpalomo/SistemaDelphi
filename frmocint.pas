unit frmocint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, RxGIF, ComCtrls, dxExEdtr,
  dxCntner, dxTL, dxDBCtrl, dxDBGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractTable, ActnList, Mask, ToolEdit,
  CurrEdit, dxDBTLCl, dxGrClms, dxGrClEx, dxLayout, RxCalc;

type
  Tfrmocinte = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Shape4: TShape;
    panrc: TPanel;
    Label2: TLabel;
    panoc: TPanel;
    Label3: TLabel;
    panos: TPanel;
    Label4: TLabel;
    lab_nrc: TLabel;
    GroupBox1: TGroupBox;
    rb_bm: TRadioButton;
    rb_ms: TRadioButton;
    rb_se: TRadioButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    fecha: TDateTimePicker;
    Label7: TLabel;
    hora: TDateTimePicker;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    GroupBox4: TGroupBox;
    rb_so: TRadioButton;
    rb_an: TRadioButton;
    Label16: TLabel;
    GroupBox5: TGroupBox;
    Label17: TLabel;
    fecha_es: TDateTimePicker;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    GroupBox6: TGroupBox;
    obs: TEdit;
    bt_buscar: TBitBtn;
    bt_aceptar: TBitBtn;
    bt_anular: TBitBtn;
    bt_imprimir: TBitBtn;
    bt_salir: TBitBtn;
    grid_pro: TdxDBGrid;
    con_zona: TZQuery;
    datazona: TDataSource;
    lb_ano: TLabel;
    lb_uad: TLabel;
    Label21: TLabel;
    Label12: TLabel;
    Label23: TLabel;
    lb_mun: TLabel;
    Label25: TLabel;
    lb_nomz: TLabel;
    lb_dirz: TLabel;
    Label5: TLabel;
    griddiv: TdxDBGrid;
    jdiv: TEdit;
    con_div: TZQuery;
    datadiv: TDataSource;
    griddivnom: TdxDBGridMaskColumn;
    griddivjefe_div: TdxDBGridMaskColumn;
    con_reqdet: TZQuery;
    datareqdet: TDataSource;
    con_numreq: TZTable;
    datanumreq: TDataSource;
    num_req: TLabel;
    grid_propa: TdxDBGridMaskColumn;
    grid_proge: TdxDBGridMaskColumn;
    grid_proes: TdxDBGridMaskColumn;
    grid_prose: TdxDBGridMaskColumn;
    grid_procpro: TdxDBGridMaskColumn;
    grid_prodes: TdxDBGridMaskColumn;
    grid_prouni: TdxDBGridMaskColumn;
    grid_procan: TdxDBGridMaskColumn;
    grid_propre: TdxDBGridMaskColumn;
    grid_promon: TdxDBGridMaskColumn;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    eli_prod: TZQuery;
    dataelip: TDataSource;
    con_prodr: TZQuery;
    datapr: TDataSource;
    gridpa: TdxDBGridLayoutList;
    tb_proyac_int: TZTable;
    data_proyac: TDataSource;
    gridcapaItem1: TdxDBGridLayout;
    grid_propy: TdxDBGridExtLookupColumn;
    gridae: TdxDBGridLayoutList;
    gridcapaitem2: TdxDBGridLayout;
    data_acciones: TDataSource;
    griduel: TdxDBGridLayoutList;
    gridcapaitem3: TdxDBGridLayout;
    data_uel: TDataSource;
    grid_proae: TdxDBGridExtLookupColumn;
    tb_accion_es: TZTable;
    tb_uelocal_int: TZTable;
    grid_prouel: TdxDBGridExtLookupColumn;
    datasumamonto: TDataSource;
    sumamonto: TZQuery;
    sumamontototalmon: TFloatField;
    calculadora: TRxCalculator;
    act_par: TZQuery;
    con_uni: TZQuery;
    con_p: TZQuery;
    DataSource2: TDataSource;
    DataSource1: TDataSource;
    con_saldo_par: TZQuery;
    data_sal_par: TDataSource;
    BitBtn6: TBitBtn;
    Panel1: TPanel;
    Image2: TImage;
    Panel2: TPanel;
    Image3: TImage;
    Panel3: TPanel;
    Image4: TImage;
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_aceptarClick(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure jdivDblClick(Sender: TObject);
    procedure griddivDblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure con_reqdetBeforePost(DataSet: TDataSet);
    procedure Action2Execute(Sender: TObject);
    procedure grid_proKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_proKeyPress(Sender: TObject; var Key: Char);
    procedure grid_procanGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure grid_propreGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure grid_promonGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure grid_proEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure grid_proClick(Sender: TObject);
    procedure grid_propyCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure grid_promonDrawSummaryFooter(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; var AText: String;
      var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
    procedure datareqdetDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure con_reqdetAfterPost(DataSet: TDataSet);
    procedure eliminar();
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmocinte: Tfrmocinte;

implementation

uses frmacces, frmbproint;

{$R *.dfm}

procedure Tfrmocinte.Image4Click(Sender: TObject);
begin

   bt_buscar.Visible:=true;
   bt_aceptar.Visible:=true;
   bt_anular.Visible:=true;
   bt_imprimir.Visible:=true;
   bt_salir.Visible:=true;

   fecha.Date:=date;
   fecha_es.Date:=date;
   hora.Time:=time;
   panrc.Visible:=true;
   panoc.Visible:=false;
   panos.Visible:=false;
end;

procedure Tfrmocinte.Image3Click(Sender: TObject);
begin

   bt_buscar.Visible:=true;
   bt_aceptar.Visible:=true;
   bt_anular.Visible:=true;
   bt_imprimir.Visible:=true;
   bt_salir.Visible:=true;

   panrc.Visible:=false;
   panoc.Visible:=true;
   panos.Visible:=false;
end;

procedure Tfrmocinte.Image2Click(Sender: TObject);
begin

   bt_buscar.Visible:=true;
   bt_aceptar.Visible:=true;
   bt_anular.Visible:=true;
   bt_imprimir.Visible:=true;
   bt_salir.Visible:=true;

   panrc.Visible:=false;
   panoc.Visible:=false;
   panos.Visible:=true;
end;

procedure Tfrmocinte.FormShow(Sender: TObject);
begin
tb_proyac_int.open;
tb_accion_es.open;
tb_uelocal_int.open;

   con_numreq.Close;
   con_numreq.Open;
   con_numreq.FindLast;
   con_numreq.Edit;
   num_req.Caption:= floattostr(con_numreq.fieldbyname('id').AsFloat+1);
   con_numreq.fieldbyname('id').AsFloat:=con_numreq.fieldbyname('id').AsFloat+1;
   con_numreq.Post;
   con_numreq.Close;

   
   bt_buscar.Visible:=false;
   bt_aceptar.Visible:=false;
   bt_anular.Visible:=false;
   bt_imprimir.Visible:=false;
   bt_salir.Visible:=false;
   panrc.Visible:=false;
   panoc.Visible:=false;
   panos.Visible:=false;

   con_zona.Close;
   con_zona.Open;
   lb_ano.Caption:=con_zona.fieldbyname('anno').AsString;
   lb_uad.Caption:=con_zona.fieldbyname('uni_adm').AsString;
   lb_mun.Caption:=con_zona.fieldbyname('municipio').AsString;
   lb_nomz.Caption:=con_zona.fieldbyname('nom_zona').AsString;
   lb_dirz.Caption:=con_zona.fieldbyname('direccion').AsString;
   con_zona.Close;

   con_reqdet.Close;
   con_reqdet.Params[0].AsFloat:=strtofloat(num_req.Caption);
   con_reqdet.Open;

end;

procedure Tfrmocinte.bt_aceptarClick(Sender: TObject);
begin
   panrc.Visible:=false;
   panoc.Visible:=false;
   panos.Visible:=false;
  /////*******guardando requisicion encabezado*******************//////


  /////*******    finalizando encabezado     *******************//////
end;

procedure Tfrmocinte.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmocinte.jdivDblClick(Sender: TObject);
begin
  con_div.Close;
  con_div.Open;
  griddiv.Visible:=true;
end;

procedure Tfrmocinte.griddivDblClick(Sender: TObject);
begin
  jdiv.Text:=con_div.FieldByName('jefe_div').AsString+' / '+con_div.FieldByName('nom').AsString;
  griddiv.Visible:=false;
  con_div.Close;
end;

procedure Tfrmocinte.Action1Execute(Sender: TObject);
begin
   frmbp.ShowModal;
   con_prodr.Close;
   con_prodr.Params[0].AsInteger:=frmbp.v_cod;
   con_prodr.Params[1].AsInteger:=strtoint(num_req.Caption);
   con_prodr.Open;
   if con_prodr.IsEmpty then
   begin
     con_reqdet.Edit;
     con_reqdet.FieldByName('cpro').AsInteger:=frmbp.v_cod;
     con_reqdet.FieldByName('des').Asstring:=frmbp.v_nom;
     con_reqdet.FieldByName('uni').Asstring:=frmbp.v_uni;
     con_reqdet.FieldByName('can').Asfloat:=1;
     con_reqdet.FieldByName('pre').Asfloat:=frmbp.v_pre;
     con_reqdet.FieldByName('mon').Asfloat:=con_reqdet.FieldByName('can').Asfloat * con_reqdet.FieldByName('pre').Asfloat;
     con_reqdet.Post;
     con_reqdet.Close;
     con_reqdet.Open;
     grid_pro.ResetFullRefresh;
     con_reqdet.FindLast;
     con_reqdet.Append;
     grid_pro.SetFocus;
     grid_pro.FocusedColumn:=0;

   end
   else
   begin
      application.MessageBox('Producto ya registrado en Requisiciòn...!','Mensaje al Usuario',16);
   end;

end;

procedure Tfrmocinte.con_reqdetBeforePost(DataSet: TDataSet);
begin
    con_reqdet.FieldByName('num').Asfloat:=strtofloat(num_req.Caption);
end;

procedure Tfrmocinte.eliminar();
begin
  if not con_reqdet.IsEmpty then
        begin

             if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0001-001' then
             begin
              act_par.Close;
              act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
              act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
              act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
              act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
              act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
              act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
              act_par.SQL.Text:='update partidas_int set eje1=eje1-:mon,sal1=sal1+:mon where (p1=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
              act_par.ExecSQL;
             end;

             if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0002-001' then
             begin
              act_par.Close;
              act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
              act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
              act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
              act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
              act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
              act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
              act_par.SQL.Text:='update partidas_int set eje2=eje2-:mon,sal2=sal2+:mon where (p2=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
              act_par.ExecSQL;
             end;

             if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0025-001' then
             begin
              act_par.Close;
              act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
              act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
              act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
              act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
              act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
              act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
              act_par.SQL.Text:='update partidas_int set eje3=eje3-:mon,sal3=sal3+:mon where (p3=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
              act_par.ExecSQL;
             end;

             if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0025-002' then
             begin
              act_par.Close;
              act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
              act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
              act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
              act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
              act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
              act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
              act_par.SQL.Text:='update partidas_int set eje4=eje4-:mon,sal4=sal4+:mon where (p4=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
              act_par.ExecSQL;
             end;

             if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0025-003' then
             begin
              act_par.Close;
              act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
              act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
              act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
              act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
              act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
              act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
              act_par.SQL.Text:='update partidas_int set eje5=eje5-:mon,sal5=sal5+:mon where (p5=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
              act_par.ExecSQL;
             end;

             if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0025-004' then
             begin
              act_par.Close;
              act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
              act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
              act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
              act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
              act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
              act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
              act_par.SQL.Text:='update partidas_int set eje6=eje6-:mon,sal6=sal6+:mon where (p6=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
              act_par.ExecSQL;
             end;

             if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0027-001' then
             begin
              act_par.Close;
              act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
              act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
              act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
              act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
              act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
              act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
              act_par.SQL.Text:='update partidas_int set eje7=eje7-:mon,sal7=sal7+:mon where (p7=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
              act_par.ExecSQL;
             end;

             if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0027-002' then
             begin
              act_par.Close;
              act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
              act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
              act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
              act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
              act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
              act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
              act_par.SQL.Text:='update partidas_int set eje8=eje8-:mon,sal8=sal8+:mon where (p8=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
              act_par.ExecSQL;
             end;

             if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0027-003' then
             begin
              act_par.Close;
              act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
              act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
              act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
              act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
              act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
              act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
              act_par.SQL.Text:='update partidas_int set eje9=eje9-:mon,sal9=sal9+:mon where (p9=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
              act_par.ExecSQL;
             end;

             if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0027-004' then
             begin
              act_par.Close;
              act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
              act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
              act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
              act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
              act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
              act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
              act_par.SQL.Text:='update partidas_int set eje10=eje10-:mon,sal10=sal10+:mon where (p10=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
              act_par.ExecSQL;
             end;

             if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0027-005' then
             begin
              act_par.Close;
              act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
              act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
              act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
              act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
              act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
              act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
              act_par.SQL.Text:='update partidas_int set eje11=eje11-:mon,sal11=sal11+:mon where (p11=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
              act_par.ExecSQL;
             end;


             eli_prod.Close;
             eli_prod.Params[0].AsInteger:=con_reqdet.FieldByName('cpro').AsInteger;
             eli_prod.Params[1].Asinteger:=strtoint(num_req.Caption);
             eli_prod.ExecSQL;
             con_reqdet.Close;
             con_reqdet.Open;
             grid_pro.ResetFullRefresh;
          end;
end;


procedure Tfrmocinte.Action2Execute(Sender: TObject);
begin
  if  MessageDlg('Desea Eliminar PRODUCTO : '+con_reqdet.FieldByName('des').Asstring,
        mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
       eliminar();
    end;
   con_reqdet.FindLast;
   grid_pro.SetFocus;

end;

procedure Tfrmocinte.grid_proKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i:byte;

begin

if key=vk_return then
begin
if grid_pro.EditingText<>'' then
begin

    i:=grid_pro.FocusedColumn;
    case i of
         0 :begin
             tb_accion_es.Filter:='num_ac='+QuotedStr(grid_pro.EditingText);
             tb_accion_es.Filtered:=true;
             tb_accion_es.Open;
             tb_uelocal_int.Filter:='num_ac='+QuotedStr(grid_pro.EditingText);
             tb_uelocal_int.Filtered:=true;
             tb_uelocal_int.Open;
             grid_pro.FocusedColumn:=1;
            end;
         1 :begin

            grid_pro.FocusedColumn:=2;
            end;

         2 :grid_pro.FocusedColumn:=3;
         3 :grid_pro.FocusedColumn:=4;
         4 :grid_pro.FocusedColumn:=5;
         5 :grid_pro.FocusedColumn:=6;
         6 :grid_pro.FocusedColumn:=7;
         7: begin

               con_prodr.Close;
               con_prodr.Params[0].AsInteger:=strtoint(grid_pro.EditingText);
               con_prodr.Params[1].AsInteger:=strtoint(num_req.Caption);
               con_prodr.Open;
               if con_prodr.IsEmpty then
               begin
                 con_p.Close;
                 con_p.Params[0].AsInteger:=strtoint(grid_pro.EditingText);
                 con_p.Open;
                 if not con_p.IsEmpty then
                 begin
                   con_reqdet.Edit;
                   con_reqdet.FieldByName('cpro').AsInteger:=con_p.fieldbyname('id').AsInteger;
                   con_reqdet.FieldByName('des').Asstring:=con_p.fieldbyname('nom').Asstring;

                   con_uni.Close;
                   con_uni.Params[0].AsInteger:=con_p.fieldbyname('unidad').AsInteger;
                   con_uni.Open;
                   con_reqdet.FieldByName('uni').Asstring:=con_uni.fieldbyname('nom').AsString;
                   con_reqdet.FieldByName('can').Asfloat:=1;
                   con_reqdet.FieldByName('pre').Asfloat:=con_p.fieldbyname('precio').Asfloat;
                    con_reqdet.FieldByName('mon').Asfloat:=con_reqdet.fieldbyname('pre').Asfloat * con_reqdet.FieldByName('can').Asfloat;

                   con_reqdet.Post;
                   con_reqdet.Close;
                   con_reqdet.Open;
                   grid_pro.ResetFullRefresh;
                   con_reqdet.FindLast;
                   grid_pro.SetFocus;
                   key:=vk_down;
                   grid_pro.FocusedColumn:=0;
                 end
                 else
                 begin
                  application.MessageBox('Producto no Existe... !','Mensaje al Usuario',16);
                  con_reqdet.CancelUpdates;
                  grid_pro.FocusedColumn:=8;
                 end;
               end
               else
               begin

                  application.MessageBox('Producto ya registrado en Requisiciòn...!','Mensaje al Usuario',16);
                  con_reqdet.CancelUpdates;
                  grid_pro.FocusedColumn:=8;
               end;
              end;

         8 :grid_pro.FocusedColumn:=9;
         9 :grid_pro.FocusedColumn:=10;
         10 : begin
                con_reqdet.FieldByName('can').Asfloat:=strtofloat(grid_pro.EditingText);
                con_reqdet.FieldByName('mon').Asfloat:=con_reqdet.fieldbyname('pre').Asfloat * con_reqdet.FieldByName('can').Asfloat;
                key:=vk_down;
                grid_pro.FocusedColumn:=0;
              end;
         11 :grid_pro.FocusedColumn:=12;
         12 :begin
              key:=vk_down;
              grid_pro.FocusedColumn:=0;
             end;
   end;
  end;
 end;
end;

procedure Tfrmocinte.grid_proKeyPress(Sender: TObject; var Key: Char);
begin
case grid_pro.FocusedColumn of
   0..2:key:=#0;
end;

if (grid_pro.FocusedColumn=10) then
begin
   case key of
        #48..#57:;
        #46: key:=#44;
   else
    key:=#0;
   end;
end;

end;

procedure Tfrmocinte.grid_procanGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
     if atext<>'' then
      Atext:=formatfloat('#,##0.00',Anode.Values[10]);
end;

procedure Tfrmocinte.grid_propreGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if atext<>'' then
      Atext:=formatfloat('#,##0.00',Anode.Values[11]);
end;

procedure Tfrmocinte.grid_promonGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if atext<>'' then
      Atext:=formatfloat('#,##0.00',Anode.Values[12]);
end;

procedure Tfrmocinte.grid_proEdited(Sender: TObject;
  Node: TdxTreeListNode);
var
c:integer;

begin
c:=grid_pro.FocusedColumn;
if grid_pro.EditingText='' then grid_pro.FocusedColumn:=c;
end;

procedure Tfrmocinte.grid_proClick(Sender: TObject);
var
Key:Word;
Shift: TShiftState;
begin
  key:=0;
  grid_proKeyDown(Sender,key,shift);
end;

procedure Tfrmocinte.grid_propyCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
var
Key:Word;
Shift: TShiftState;
begin
 key:=vk_return;
 grid_proKeyDown(Sender,key,shift);
end;

procedure Tfrmocinte.grid_promonDrawSummaryFooter(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
   Afont.Style:=[fsBold];
   Afont.Color :=clBlue;
   afont.Size:=10;
   Atext:= floattostr(sumamonto.FieldByName('totalmon').Asfloat);

end;

procedure Tfrmocinte.datareqdetDataChange(Sender: TObject; Field: TField);
begin
   sumamonto.Close;
   sumamonto.Params[0].AsInteger:=strtoint(num_req.Caption);
   sumamonto.Open;
end;

procedure Tfrmocinte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
tb_proyac_int.Close;
tb_accion_es.Close;
tb_uelocal_int.Close;
end;

procedure Tfrmocinte.BitBtn6Click(Sender: TObject);
begin
  calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmocinte.con_reqdetAfterPost(DataSet: TDataSet);
begin

  if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0001-001' then
  begin



             con_saldo_par.Close;
             con_saldo_par.SQL.Text:='select * from partidas_int where (p1=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
             con_saldo_par.Params[0].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
             con_saldo_par.Params[1].AsString:=con_reqdet.FieldByName('pa').AsString;
             con_saldo_par.Params[2].Asstring:=con_reqdet.FieldByName('ge').Asstring;
             con_saldo_par.Params[3].Asstring:=con_reqdet.FieldByName('es').Asstring;
             con_saldo_par.Params[4].Asstring:=con_reqdet.FieldByName('se').Asstring;
             con_saldo_par.ExecSQL;
             con_saldo_par.Open;
             if not con_saldo_par.IsEmpty then
             begin
               if (con_saldo_par.FieldByName('pre1').AsFloat>0) then
               begin
                    if ((con_reqdet.FieldByName('mon').asfloat)>(con_saldo_par.FieldByName('sal1').AsFloat)) then
                    begin
                        application.MessageBox('El monto del PRODUCTO es mayor al SALDO....!','Mansaje al Usuario',16);
                        eliminar();
                    end
                    else
                    begin
                       act_par.Close;
                       act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
                       act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
                       act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
                       act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
                       act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
                       act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
                       act_par.SQL.Text:='update partidas_int set eje1=eje1+:mon, sal1=sal1-eje1 where (p1=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_par.ExecSQL;
                    end;
               end
               else
               begin
                 application.MessageBox('La Partida Ingresada NO posee Recurso Presupuestario Asignado....!','Mansaje al Usuario',16);
                 eliminar();
               end;
             end
             else
             begin
                application.MessageBox('La Partida Ingresada NO esta Asociada Al Proyecto....!','Mansaje al Usuario',16);
                eliminar();
             end;
  end;

  if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString ='0002-001' then
  begin
            con_saldo_par.Close;
             con_saldo_par.SQL.Text:='select * from partidas_int where (p2=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
             con_saldo_par.Params[0].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
             con_saldo_par.Params[1].AsString:=con_reqdet.FieldByName('pa').AsString;
             con_saldo_par.Params[2].Asstring:=con_reqdet.FieldByName('ge').Asstring;
             con_saldo_par.Params[3].Asstring:=con_reqdet.FieldByName('es').Asstring;
             con_saldo_par.Params[4].Asstring:=con_reqdet.FieldByName('se').Asstring;
             con_saldo_par.ExecSQL;
             con_saldo_par.Open;
             if not con_saldo_par.IsEmpty then
             begin
               if (con_saldo_par.FieldByName('pre2').AsFloat>0) then
               begin
                    if ((con_reqdet.FieldByName('mon').asfloat)>(con_saldo_par.FieldByName('sal2').AsFloat)) then
                    begin
                        application.MessageBox('El monto del PRODUCTO es mayor al SALDO....!','Mansaje al Usuario',16);
                        eliminar();
                    end
                    else
                    begin
                       act_par.Close;
                       act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
                       act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
                       act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
                       act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
                       act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
                       act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
                       act_par.SQL.Text:='update partidas_int set eje2=eje2+:mon, sal2=sal2-eje2 where (p2=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_par.ExecSQL;
                    end;
               end
               else
               begin
                 application.MessageBox('La Partida Ingresada NO posee Recurso Presupuestario Asignado....!','Mansaje al Usuario',16);
                 eliminar();
               end;
             end
             else
             begin
                application.MessageBox('La Partida Ingresada NO esta Asociada Al Proyecto....!','Mansaje al Usuario',16);
                eliminar();
             end;

  end;

  if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0025-001' then
  begin
              con_saldo_par.Close;
             con_saldo_par.SQL.Text:='select * from partidas_int where (p3=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
             con_saldo_par.Params[0].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
             con_saldo_par.Params[1].AsString:=con_reqdet.FieldByName('pa').AsString;
             con_saldo_par.Params[2].Asstring:=con_reqdet.FieldByName('ge').Asstring;
             con_saldo_par.Params[3].Asstring:=con_reqdet.FieldByName('es').Asstring;
             con_saldo_par.Params[4].Asstring:=con_reqdet.FieldByName('se').Asstring;
             con_saldo_par.ExecSQL;
             con_saldo_par.Open;
             if not con_saldo_par.IsEmpty then
             begin
               if (con_saldo_par.FieldByName('pre3').AsFloat>0) then
               begin
                    if ((con_reqdet.FieldByName('mon').asfloat)>(con_saldo_par.FieldByName('sal3').AsFloat)) then
                    begin
                        application.MessageBox('El monto del PRODUCTO es mayor al SALDO....!','Mansaje al Usuario',16);
                        eliminar();
                    end
                    else
                    begin
                       act_par.Close;
                       act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
                       act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
                       act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
                       act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
                       act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
                       act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
                       act_par.SQL.Text:='update partidas_int set eje3=eje3+:mon, sal3=sal3-eje3 where (p3=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_par.ExecSQL;
                    end;
               end
               else
               begin
                 application.MessageBox('La Partida Ingresada NO posee Recurso Presupuestario Asignado....!','Mansaje al Usuario',16);
                 eliminar();
               end;
             end
             else
             begin
                application.MessageBox('La Partida Ingresada NO esta Asociada Al Proyecto....!','Mansaje al Usuario',16);
                eliminar();
             end;
  end;


  if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0025-002' then
  begin
             con_saldo_par.Close;
             con_saldo_par.SQL.Text:='select * from partidas_int where (p4=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
             con_saldo_par.Params[0].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
             con_saldo_par.Params[1].AsString:=con_reqdet.FieldByName('pa').AsString;
             con_saldo_par.Params[2].Asstring:=con_reqdet.FieldByName('ge').Asstring;
             con_saldo_par.Params[3].Asstring:=con_reqdet.FieldByName('es').Asstring;
             con_saldo_par.Params[4].Asstring:=con_reqdet.FieldByName('se').Asstring;
             con_saldo_par.ExecSQL;
             con_saldo_par.Open;
             if not con_saldo_par.IsEmpty then
             begin
               if (con_saldo_par.FieldByName('pre4').AsFloat>0) then
               begin
                    if ((con_reqdet.FieldByName('mon').asfloat)>(con_saldo_par.FieldByName('sal4').AsFloat)) then
                    begin
                        application.MessageBox('El monto del PRODUCTO es mayor al SALDO....!','Mansaje al Usuario',16);
                        eliminar();
                    end
                    else
                    begin
                       act_par.Close;
                       act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
                       act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
                       act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
                       act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
                       act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
                       act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
                       act_par.SQL.Text:='update partidas_int set eje4=eje4+:mon, sal4=sal4-eje4 where (p4=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_par.ExecSQL;
                    end;
               end
               else
               begin
                 application.MessageBox('La Partida Ingresada NO posee Recurso Presupuestario Asignado....!','Mansaje al Usuario',16);
                 eliminar();
               end;
             end
             else
             begin
                application.MessageBox('La Partida Ingresada NO esta Asociada Al Proyecto....!','Mansaje al Usuario',16);
                eliminar();
             end;
  end;

  if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0025-003' then
  begin
              con_saldo_par.Close;
             con_saldo_par.SQL.Text:='select * from partidas_int where (p5=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
             con_saldo_par.Params[0].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
             con_saldo_par.Params[1].AsString:=con_reqdet.FieldByName('pa').AsString;
             con_saldo_par.Params[2].Asstring:=con_reqdet.FieldByName('ge').Asstring;
             con_saldo_par.Params[3].Asstring:=con_reqdet.FieldByName('es').Asstring;
             con_saldo_par.Params[4].Asstring:=con_reqdet.FieldByName('se').Asstring;
             con_saldo_par.ExecSQL;
             con_saldo_par.Open;
             if not con_saldo_par.IsEmpty then
             begin
               if (con_saldo_par.FieldByName('pre5').AsFloat>0) then
               begin
                    if ((con_reqdet.FieldByName('mon').asfloat)>(con_saldo_par.FieldByName('sal5').AsFloat)) then
                    begin
                        application.MessageBox('El monto del PRODUCTO es mayor al SALDO....!','Mansaje al Usuario',16);
                        eliminar();
                    end
                    else
                    begin
                       act_par.Close;
                       act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
                       act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
                       act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
                       act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
                       act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
                       act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
                       act_par.SQL.Text:='update partidas_int set eje5=eje5+:mon, sal5=sal5-eje5 where (p5=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_par.ExecSQL;
                    end;
               end
               else
               begin
                 application.MessageBox('La Partida Ingresada NO posee Recurso Presupuestario Asignado....!','Mansaje al Usuario',16);
                 eliminar();
               end;
             end
             else
             begin
                application.MessageBox('La Partida Ingresada NO esta Asociada Al Proyecto....!','Mansaje al Usuario',16);
                eliminar();
             end;
  end;

  if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0025-004' then
  begin
             con_saldo_par.Close;
             con_saldo_par.SQL.Text:='select * from partidas_int where (p6=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
             con_saldo_par.Params[0].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
             con_saldo_par.Params[1].AsString:=con_reqdet.FieldByName('pa').AsString;
             con_saldo_par.Params[2].Asstring:=con_reqdet.FieldByName('ge').Asstring;
             con_saldo_par.Params[3].Asstring:=con_reqdet.FieldByName('es').Asstring;
             con_saldo_par.Params[4].Asstring:=con_reqdet.FieldByName('se').Asstring;
             con_saldo_par.ExecSQL;
             con_saldo_par.Open;
             if not con_saldo_par.IsEmpty then
             begin
               if (con_saldo_par.FieldByName('pre6').AsFloat>0) then
               begin
                    if ((con_reqdet.FieldByName('mon').asfloat)>(con_saldo_par.FieldByName('sal6').AsFloat)) then
                    begin
                        application.MessageBox('El monto del PRODUCTO es mayor al SALDO....!','Mansaje al Usuario',16);
                        eliminar();
                    end
                    else
                    begin
                       act_par.Close;
                       act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
                       act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
                       act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
                       act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
                       act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
                       act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
                       act_par.SQL.Text:='update partidas_int set eje6=eje6+:mon, sal6=sal6-eje6 where (p6=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_par.ExecSQL;
                    end;
               end
               else
               begin
                 application.MessageBox('La Partida Ingresada NO posee Recurso Presupuestario Asignado....!','Mansaje al Usuario',16);
                 eliminar();
               end;
             end
             else
             begin
                application.MessageBox('La Partida Ingresada NO esta Asociada Al Proyecto....!','Mansaje al Usuario',16);
                eliminar();
             end;
  end;


  if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0027-001' then
  begin
             con_saldo_par.Close;
             con_saldo_par.SQL.Text:='select * from partidas_int where (p7=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
             con_saldo_par.Params[0].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
             con_saldo_par.Params[1].AsString:=con_reqdet.FieldByName('pa').AsString;
             con_saldo_par.Params[2].Asstring:=con_reqdet.FieldByName('ge').Asstring;
             con_saldo_par.Params[3].Asstring:=con_reqdet.FieldByName('es').Asstring;
             con_saldo_par.Params[4].Asstring:=con_reqdet.FieldByName('se').Asstring;
             con_saldo_par.ExecSQL;
             con_saldo_par.Open;
             if not con_saldo_par.IsEmpty then
             begin
               if (con_saldo_par.FieldByName('pre7').AsFloat>0) then
               begin
                    if ((con_reqdet.FieldByName('mon').asfloat)>(con_saldo_par.FieldByName('sal7').AsFloat)) then
                    begin
                        application.MessageBox('El monto del PRODUCTO es mayor al SALDO....!','Mansaje al Usuario',16);
                        eliminar();
                    end
                    else
                    begin
                       act_par.Close;
                       act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
                       act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
                       act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
                       act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
                       act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
                       act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
                       act_par.SQL.Text:='update partidas_int set eje7=eje7+:mon, sal7=sal7-eje7 where (p7=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_par.ExecSQL;
                    end;
               end
               else
               begin
                 application.MessageBox('La Partida Ingresada NO posee Recurso Presupuestario Asignado....!','Mansaje al Usuario',16);
                 eliminar();
               end;
             end
             else
             begin
                application.MessageBox('La Partida Ingresada NO esta Asociada Al Proyecto....!','Mansaje al Usuario',16);
                eliminar();
             end;
  end;


  if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0027-002' then
  begin
             con_saldo_par.Close;
             con_saldo_par.SQL.Text:='select * from partidas_int where (p8=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
             con_saldo_par.Params[0].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
             con_saldo_par.Params[1].AsString:=con_reqdet.FieldByName('pa').AsString;
             con_saldo_par.Params[2].Asstring:=con_reqdet.FieldByName('ge').Asstring;
             con_saldo_par.Params[3].Asstring:=con_reqdet.FieldByName('es').Asstring;
             con_saldo_par.Params[4].Asstring:=con_reqdet.FieldByName('se').Asstring;
             con_saldo_par.ExecSQL;
             con_saldo_par.Open;
             if not con_saldo_par.IsEmpty then
             begin
               if (con_saldo_par.FieldByName('pre8').AsFloat>0) then
               begin
                    if ((con_reqdet.FieldByName('mon').asfloat)>(con_saldo_par.FieldByName('sal8').AsFloat)) then
                    begin
                        application.MessageBox('El monto del PRODUCTO es mayor al SALDO....!','Mansaje al Usuario',16);
                        eliminar();
                    end
                    else
                    begin
                       act_par.Close;
                       act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
                       act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
                       act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
                       act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
                       act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
                       act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
                       act_par.SQL.Text:='update partidas_int set eje8=eje8+:mon, sal8=sal8-eje8 where (p8=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_par.ExecSQL;
                    end;
               end
               else
               begin
                 application.MessageBox('La Partida Ingresada NO posee Recurso Presupuestario Asignado....!','Mansaje al Usuario',16);
                 eliminar();
               end;
             end
             else
             begin
                application.MessageBox('La Partida Ingresada NO esta Asociada Al Proyecto....!','Mansaje al Usuario',16);
                eliminar();
             end;
  end;

  if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0027-003' then
  begin
             con_saldo_par.Close;
             con_saldo_par.SQL.Text:='select * from partidas_int where (p9=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
             con_saldo_par.Params[0].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
             con_saldo_par.Params[1].AsString:=con_reqdet.FieldByName('pa').AsString;
             con_saldo_par.Params[2].Asstring:=con_reqdet.FieldByName('ge').Asstring;
             con_saldo_par.Params[3].Asstring:=con_reqdet.FieldByName('es').Asstring;
             con_saldo_par.Params[4].Asstring:=con_reqdet.FieldByName('se').Asstring;
             con_saldo_par.ExecSQL;
             con_saldo_par.Open;
             if not con_saldo_par.IsEmpty then
             begin
               if (con_saldo_par.FieldByName('pre9').AsFloat>0) then
               begin
                    if ((con_reqdet.FieldByName('mon').asfloat)>(con_saldo_par.FieldByName('sal9').AsFloat)) then
                    begin
                        application.MessageBox('El monto del PRODUCTO es mayor al SALDO....!','Mansaje al Usuario',16);
                        eliminar();
                    end
                    else
                    begin
                       act_par.Close;
                       act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
                       act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
                       act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
                       act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
                       act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
                       act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
                       act_par.SQL.Text:='update partidas_int set eje9=eje9+:mon, sal9=sal9-eje9 where (p9=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_par.ExecSQL;
                    end;
               end
               else
               begin
                 application.MessageBox('La Partida Ingresada NO posee Recurso Presupuestario Asignado....!','Mansaje al Usuario',16);
                 eliminar();
               end;
             end
             else
             begin
                application.MessageBox('La Partida Ingresada NO esta Asociada Al Proyecto....!','Mansaje al Usuario',16);
                eliminar();
             end;
  end;

    if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0027-004' then
  begin
              con_saldo_par.Close;
             con_saldo_par.SQL.Text:='select * from partidas_int where (p10=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
             con_saldo_par.Params[0].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
             con_saldo_par.Params[1].AsString:=con_reqdet.FieldByName('pa').AsString;
             con_saldo_par.Params[2].Asstring:=con_reqdet.FieldByName('ge').Asstring;
             con_saldo_par.Params[3].Asstring:=con_reqdet.FieldByName('es').Asstring;
             con_saldo_par.Params[4].Asstring:=con_reqdet.FieldByName('se').Asstring;
             con_saldo_par.ExecSQL;
             con_saldo_par.Open;
             if not con_saldo_par.IsEmpty then
             begin
               if (con_saldo_par.FieldByName('pre10').AsFloat>0) then
               begin
                    if ((con_reqdet.FieldByName('mon').asfloat)>(con_saldo_par.FieldByName('sal10').AsFloat)) then
                    begin
                        application.MessageBox('El monto del PRODUCTO es mayor al SALDO....!','Mansaje al Usuario',16);
                        eliminar();
                    end
                    else
                    begin
                       act_par.Close;
                       act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
                       act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
                       act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
                       act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
                       act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
                       act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
                       act_par.SQL.Text:='update partidas_int set eje10=eje10+:mon, sal10=sal10-eje10 where (p10=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_par.ExecSQL;
                    end;
               end
               else
               begin
                 application.MessageBox('La Partida Ingresada NO posee Recurso Presupuestario Asignado....!','Mansaje al Usuario',16);
                 eliminar();
               end;
             end
             else
             begin
                application.MessageBox('La Partida Ingresada NO esta Asociada Al Proyecto....!','Mansaje al Usuario',16);
                eliminar();
             end;
  end;

  if con_reqdet.FieldByName('py').AsString+'-'+con_reqdet.FieldByName('ae').AsString='0027-005' then
  begin
              con_saldo_par.Close;
             con_saldo_par.SQL.Text:='select * from partidas_int where (p11=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
             con_saldo_par.Params[0].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
             con_saldo_par.Params[1].AsString:=con_reqdet.FieldByName('pa').AsString;
             con_saldo_par.Params[2].Asstring:=con_reqdet.FieldByName('ge').Asstring;
             con_saldo_par.Params[3].Asstring:=con_reqdet.FieldByName('es').Asstring;
             con_saldo_par.Params[4].Asstring:=con_reqdet.FieldByName('se').Asstring;
             con_saldo_par.ExecSQL;
             con_saldo_par.Open;
             if not con_saldo_par.IsEmpty then
             begin
               if (con_saldo_par.FieldByName('pre11').AsFloat>0) then
               begin
                    if ((con_reqdet.FieldByName('mon').asfloat)>(con_saldo_par.FieldByName('sal11').AsFloat)) then
                    begin
                        application.MessageBox('El monto del PRODUCTO es mayor al SALDO....!','Mansaje al Usuario',16);
                        eliminar();
                    end
                    else
                    begin
                       act_par.Close;
                       act_par.Params[0].Asfloat:=con_reqdet.FieldByName('mon').asfloat;
                       act_par.Params[1].AsString:=con_reqdet.FieldByName('py').asstring+'-'+con_reqdet.FieldByName('ae').AsString;
                       act_par.Params[2].AsString:=con_reqdet.FieldByName('pa').AsString;
                       act_par.Params[3].Asstring:=con_reqdet.FieldByName('ge').Asstring;
                       act_par.Params[4].Asstring:=con_reqdet.FieldByName('es').Asstring;
                       act_par.Params[5].Asstring:=con_reqdet.FieldByName('se').Asstring;
                       act_par.SQL.Text:='update partidas_int set eje11=eje11+:mon, sal11=sal11-eje11 where (p11=:p1) and (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_par.ExecSQL;
                    end;
               end
               else
               begin
                 application.MessageBox('La Partida Ingresada NO posee Recurso Presupuestario Asignado....!','Mansaje al Usuario',16);
                 eliminar();
               end;
             end
             else
             begin
                application.MessageBox('La Partida Ingresada NO esta Asociada Al Proyecto....!','Mansaje al Usuario',16);
                eliminar();
             end;
  end;

end;

end.
