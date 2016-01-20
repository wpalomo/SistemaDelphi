unit frmbnac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset, Buttons, ComCtrls, dxExEdtr, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, Mask, ToolEdit, CurrEdit, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppCtrls, jpeg, ppPrnabl, ppBands,
  ppCache, ppStrtch, ppRichTx, ppVar;

type
  Tfrmbn = class(TForm)
    Shape4: TShape;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    datanumac: TDataSource;
    nac: TLabel;
    bbp: TBitBtn;
    cod_es: TLabel;
    nom_es: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    fecen: TDateTimePicker;
    Label5: TLabel;
    cid: TEdit;
    con_dire: TZQuery;
    dataemp: TDataSource;
    nom_dir: TLabel;
    vergrid: TGroupBox;
    grid_ma: TdxDBGrid;
    titumat: TShape;
    Label6: TLabel;
    cod_mun: TLabel;
    nom_mun: TLabel;
    con_mun: TZQuery;
    datamun: TDataSource;
    data_det: TDataSource;
    bt_e: TBitBtn;
    bt_s: TBitBtn;
    con_det: TZQuery;
    grid_manum_ac: TdxDBGridMaskColumn;
    grid_mades_mat: TdxDBGridMaskColumn;
    grid_macan: TdxDBGridMaskColumn;
    grid_maprecio: TdxDBGridMaskColumn;
    grid_matotal: TdxDBGridMaskColumn;
    bt_b: TBitBtn;
    eli_prod: TZQuery;
    dataelip: TDataSource;
    teclad: TLabel;
    con_acta: TZQuery;
    dataacta: TDataSource;
    mtg: TLabel;
    datatotalg: TDataSource;
    totalg: TZQuery;
    marcotg: TGroupBox;
    tg: TRxCalcEdit;
    con_mat: TZQuery;
    datamat: TDataSource;
    cancela: TZQuery;
    datacancela: TDataSource;
    bt_a: TBitBtn;
    elimina: TZQuery;
    dataeli: TDataSource;
    pprepac: TppReport;
    pprepoac: TppDBPipeline;
    con_rep: TZQuery;
    datarep: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel3: TppLabel;
    ppRichText1: TppRichText;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppFooterBand1: TppFooterBand;
    ppRichText2: TppRichText;
    nom_dire: TEdit;
    con_numac: TZQuery;
    tb_numac: TZTable;
    datatbnumac: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure bbpClick(Sender: TObject);
    procedure fecenKeyPress(Sender: TObject; var Key: Char);
    procedure cidKeyPress(Sender: TObject; var Key: Char);
    procedure grid_maKeyPress(Sender: TObject; var Key: Char);
    procedure grid_maKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_macanGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure grid_maprecioGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure grid_matotalGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    function esnum(NumStr : string) : bool;
    procedure bt_bClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_aClick(Sender: TObject);
    procedure bt_eClick(Sender: TObject);
    procedure nom_direKeyPress(Sender: TObject; var Key: Char);
    procedure grid_maEnter(Sender: TObject);
    procedure bt_sClick(Sender: TObject);
     private
    { Private declarations }
      
  public
    { Public declarations }
    busco:byte;
  end;

var
  frmbn: Tfrmbn;

implementation

uses frmacces, frmbusdepnac, frmbus, frmlistamat;

{$R *.dfm}


function Tfrmbn.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
         end;
end;
procedure Tfrmbn.FormShow(Sender: TObject);
begin
busco:=0;
bbp.Enabled:=true;
fecen.Enabled:=true;
cid.Enabled:=true;
fecen.Date:=date;
con_numac.Close;
con_numac.Open;
con_numac.FindLast;
nac.Caption:= floattostr(con_numac.fieldbyname('id').AsFloat+1);
titumat.Visible:=false;
vergrid.Visible:=false;
bt_e.Visible:=false;
bt_a.Visible:=false;
bt_b.Visible:=true;


teclad.Visible:=false;
mtg.Visible:=false;
marcotg.Visible:=false;
tg.Visible:=false;

cod_es.Caption:='';
nom_es.Caption:='';
cod_mun.Caption:='';
nom_mun.Caption:='';
cid.Text:='';
nom_dire.text:='';
tg.Value:=0;
bbp.SetFocus;
end;

procedure Tfrmbn.bbpClick(Sender: TObject);
begin
  frmbusdepbn.ShowModal;
 if frmbusdepbn.salir='S' then
     bbp.SetFocus
 else
 begin
    cod_mun.Caption:=frmbusdepbn.v_cod_mun;
    con_mun.Close;
    con_mun.Params[0].AsInteger:=strtoint(frmbusdepbn.v_cod_mun);
    con_mun.Open;
    if con_mun.IsEmpty then
    begin
       application.MessageBox('EL Plantel no tiene municipio asignado...!','Mensaje al Usuario',32);
       cid.SetFocus;
    end
    else
    begin
      nom_mun.Caption:=con_mun.fieldbyname('NOMBRE').AsString;
      con_mun.Close;
      cid.SetFocus;
    end;
end;

end;

procedure Tfrmbn.fecenKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
   key:=#0;
end;

procedure Tfrmbn.cidKeyPress(Sender: TObject; var Key: Char);
begin
case key of
  #48..#57:;
  #8:;
  #13:begin
      if cod_es.Caption='' then
      begin
         application.MessageBox('Debe Seleccionar un Plantel...!','Mensaje al Usuario',32);
         bbp.SetFocus;
      end
      else
      begin
       if cid.Text<>'' then
       begin
           nom_dire.SetFocus;
         //con_dire.Close;
         //con_dire.Params[0].AsInteger:=strtoint(cid.Text);
         //con_dire.Open;
         //if con_dire.IsEmpty then
         //begin
         //   application.MessageBox('No existe el Director...!','Mensaje al Usuario',16);
         //   cid.SetFocus;
         //end
         //else
         //begin
         //   vergrid.Visible:=true;
         //   titumat.Visible:=true;
         //   bt_e.Visible:=true;
         //end;
        end
        else
        begin
           cid.SetFocus;
        end;
       end;
      end;
else
  key:=#0;
end;
end;

procedure Tfrmbn.grid_maKeyPress(Sender: TObject; var Key: Char);
begin
if (grid_ma.FocusedColumn=0) or (grid_ma.FocusedColumn=2) then
begin
   case key of
        #48..#57:;
             #46: key:=#44;
              #8:;
   else
    key:=#0;
   end;
end;

end;

procedure Tfrmbn.grid_maKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

        if key=vk_f1 then
        begin
           frmlistama.ShowModal;
           if (frmlistama.v_cod<>'') and (frmlistama.v_nom<>'') then
           begin
            // con_mat.Close;
            // con_mat.Params[0].Asinteger:=strtoint(nac.Caption);
            // con_mat.Params[1].Asstring:= frmlistama.v_cod;
            // con_mat.Open;
            // if con_mat.IsEmpty then
            // begin
               con_det.Edit;
               con_det.FieldByName('num_ac').Asfloat:=strtofloat(nac.Caption);
               con_det.FieldByName('cod_mat').asstring:=frmlistama.v_cod;
               con_det.FieldByName('des_mat').asstring:=frmlistama.v_nom;
               con_det.Post;
               grid_ma.FocusedColumn:=0;
            // end
            // else
            // begin
            //  application.MessageBox('Producto ya registrado en Acta...!','Mensaje al Usuario',16);
            // end;
           end;
        end;

        if key=vk_delete then
        begin
          if  MessageDlg('Desea Eliminar PRODUCTO : '+con_det.FieldByName('des_mat').Asstring,
           mtConfirmation,[mbYes, mbNo],0)=mrNo then
        else
        begin
          if not con_det.IsEmpty then
          begin
             eli_prod.Close;
             eli_prod.Params[0].AsInteger:=con_det.FieldByName('id').AsInteger;
             eli_prod.Params[1].Asinteger:=strtoint(nac.Caption);
             eli_prod.ExecSQL;
             con_det.Close;
             con_det.Params[0].asinteger:=strtoint(nac.Caption);
             con_det.Open;
             grid_ma.ResetFullRefresh;
             totalg.Close;
             totalg.Params[0].AsFloat:=strtofloat(nac.Caption);
             totalg.open;
             tg.Text:=formatfloat('#,##0.00',totalg.fieldbyname('totalg').Asfloat);

          end;
        end;
        end;

        if key=vk_return then
        begin
           if grid_ma.FocusedColumn=0 then
           begin
              if grid_ma.editingtext<>'' then
              begin
              if con_det.FieldByName('precio').Asfloat>0 then
              begin
               con_det.Edit;
               con_det.FieldByName('num_ac').Asfloat:=strtofloat(nac.Caption);
               con_det.FieldByName('can').Asfloat:=strtofloat(grid_ma.editingtext);
               con_det.FieldByName('total').Asfloat:=con_det.fieldbyname('can').Asfloat * con_det.fieldbyname('precio').Asfloat;
               con_det.Post;

               totalg.Close;
               totalg.Params[0].AsFloat:=strtofloat(nac.Caption);
               totalg.open;
               tg.Text:=formatfloat('#,##0.00',totalg.fieldbyname('totalg').Asfloat);
              end;
              end;
            end;



           if grid_ma.FocusedColumn=2 then
           begin
              if grid_ma.editingtext<>'' then
              begin
               con_det.Edit;
               con_det.FieldByName('num_ac').Asfloat:=strtofloat(nac.Caption);
               con_det.FieldByName('precio').Asfloat:=strtofloat(grid_ma.editingtext);
               con_det.FieldByName('total').Asfloat:=con_det.fieldbyname('can').Asfloat * strtofloat(grid_ma.editingtext);
               con_det.Post;
               key:=vk_down;
               totalg.Close;
               totalg.Params[0].AsFloat:=strtofloat(nac.Caption);
               totalg.open;
               tg.Text:=formatfloat('#,##0.00',totalg.fieldbyname('totalg').Asfloat);
               grid_ma.FocusedColumn:=0;
               grid_ma.SetFocus
              end;
             end;
         end;
end;

procedure Tfrmbn.grid_macanGetText(Sender: TObject; ANode: TdxTreeListNode;
  var AText: String);
begin
if atext<>'' then
      Atext:=formatfloat('#,##0.00',Anode.Values[1]);
end;

procedure Tfrmbn.grid_maprecioGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if atext<>'' then
      Atext:=formatfloat('#,##0.00',Anode.Values[3]);
end;

procedure Tfrmbn.grid_matotalGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
 if atext<>'' then
      Atext:=formatfloat('#,##0.00',Anode.Values[4]);
end;

procedure Tfrmbn.bt_bClick(Sender: TObject);
begin
frmbuscar.ShowModal;
if frmbuscar.bus.Text<>'' then
begin
  if esnum(frmbuscar.bus.Text) then
  begin
     con_acta.Close;
     con_acta.Params[0].AsString:=frmbuscar.bus.Text;
     con_acta.Open;
     if con_acta.IsEmpty then
     begin
        application.MessageBox('Acta de Entrega no Existe...!','Mensaje al Usuario',16);

     end
     else
     begin

       ///*************cabecera de acta de entrega ************************///
       busco:=1;
       nac.Caption:=con_acta.FieldByName('num_ac').Asstring;
       cod_es.Caption:=con_acta.FieldByName('cod_dep').Asstring;
       nom_es.Caption:=con_acta.FieldByName('nom_es').Asstring;
       nom_mun.Caption:=con_acta.FieldByName('mun_es').asstring;
       fecen.Date:=con_acta.FieldByName('fecha_en').AsDateTime;
       nom_dire.Text:=con_acta.FieldByName('nom_dir').Asstring;
       cid.Text:=con_acta.FieldByName('ci_dir').Asstring;
       tg.Value:=con_acta.fieldbyname('total_ac').Asfloat;

      ///*************cuerpo de acta de entrega ************************///
       vergrid.Visible:=true;
       titumat.Visible:=true;
       bt_e.Visible:=true;
      
       teclad.Visible:=true;
       mtg.Visible:=true;
       marcotg.Visible:=true;
       marcotg.Enabled:=false;
       tg.Visible:=true;
       con_det.Close;
       con_det.Params[0].asinteger:=strtoint(frmbuscar.bus.Text);
       con_det.Open;
       bbp.Enabled:=false;
       fecen.Enabled:=false;
       grid_ma.SetFocus;


     end;
    end;
  end;
end;

procedure Tfrmbn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     con_numac.Close;
    con_det.Close;
    totalg.Close;
    con_acta.Close;
    eli_prod.Close;
end;

procedure Tfrmbn.bt_aClick(Sender: TObject);
begin


con_det.Close;
con_det.Params[0].AsInteger:=strtoint(nac.Caption);
con_det.Open;
if con_det.RecordCount>0 then
begin
    con_acta.close;
    con_acta.Params[0].Asinteger:=strtoint(nac.Caption);
    con_acta.Open;
    if con_acta.IsEmpty then
    begin
      con_acta.Edit;
      con_acta.Append;
      con_acta.FieldByName('num_ac').Asfloat:=strtofloat(nac.Caption);
      con_acta.FieldByName('cod_dep').Asinteger:=strtoint(cod_es.Caption);
      con_acta.FieldByName('nom_es').Asstring:=nom_es.Caption;
      con_acta.FieldByName('mun_es').asstring:=nom_mun.Caption;
      con_acta.FieldByName('fecha_en').AsDateTime:=fecen.Date;
      con_acta.FieldByName('nom_dir').Asstring:=nom_dire.Text;
      con_acta.FieldByName('ci_dir').Asinteger:=strtoint(cid.Text);
      totalg.Close;
      totalg.Params[0].AsFloat:=strtofloat(nac.Caption);
      totalg.open;
      con_acta.fieldbyname('total_ac').Asfloat :=totalg.fieldbyname('totalg').Asfloat;
      con_acta.Post;
    end
    else
    begin

      con_acta.Edit;
      con_acta.FieldByName('num_ac').Asfloat:=strtofloat(nac.Caption);
      con_acta.FieldByName('cod_dep').Asinteger:=strtoint(cod_es.Caption);
      con_acta.FieldByName('nom_es').Asstring:=nom_es.Caption;
      con_acta.FieldByName('mun_es').asstring:=nom_mun.Caption;
      con_acta.FieldByName('fecha_en').AsDateTime:=fecen.Date;
      con_acta.FieldByName('nom_dir').Asstring:=nom_dire.Text;
      con_acta.FieldByName('ci_dir').Asinteger:=strtoint(cid.Text);
      totalg.Close;
      totalg.Params[0].AsFloat:=strtofloat(nac.Caption);
      totalg.open;
      con_acta.fieldbyname('total_ac').Asfloat :=totalg.fieldbyname('totalg').Asfloat;
      con_acta.Post;
    end;
     if  MessageDlg('Desea Imprimir Acta...? ',
           mtConfirmation,[mbYes, mbNo],0)=mrNo then
     else
     begin
         con_rep.Close;
         con_rep.Params[0].AsString:=nac.Caption;
         con_rep.Open;
         pprepac.Print;
     end;
     if busco=0 then
     begin
       tb_numac.Close;
       tb_numac.Open;
       if tb_numac.RecordCount=0 then
       begin
         tb_numac.Append;
       end
       else
       begin
         tb_numac.FindLast;
       end;
       tb_numac.Edit;
       tb_numac.fieldbyname('id').AsFloat:=strtofloat(nac.Caption);
       tb_numac.Post;
       tb_numac.Close;
     end;
    close;
  end
  else
  begin
     application.MessageBox('Faltan datos para registrar Acta...!','Mensaje al Usuario',16);
     if  MessageDlg('Desea Salir...? ',
           mtConfirmation,[mbYes, mbNo],0)=mrNo then
     begin
        bbp.SetFocus;
     end
     else
     begin
       close;
     end;
   end;
end;

procedure Tfrmbn.bt_eClick(Sender: TObject);
begin
   if  MessageDlg('Desea Eliminar Acta Nro.: '+nac.Caption,
           mtConfirmation,[mbYes, mbNo],0)=mrNo then
   else
   begin
       cancela.Close;
       cancela.Params[0].AsInteger:=strtoint(nac.Caption);
       cancela.ExecSQL;
       elimina.Close;
       elimina.Params[0].AsInteger:=strtoint(nac.Caption);
       elimina.ExecSQL;
   end;
   close;
end;

procedure Tfrmbn.nom_direKeyPress(Sender: TObject; var Key: Char);
begin
case key of
  #65..#90:;
  #97..#122:;
  ' ':;
  #46:;
  #8:;
  #13:begin
        if nom_dire.Text<>'' then
        begin
            vergrid.Visible:=true;
            teclad.Visible:=true;
            mtg.Visible:=true;
            marcotg.Visible:=true;
            marcotg.Enabled:=false;
            tg.Visible:=true;


            con_det.Close;
            con_det.Params[0].AsInteger:=strtoint(nac.Caption);
            con_det.Open;
            grid_ma.SetFocus;
        end
        else
        begin
           application.MessageBox('Debe Ingresar Nombre del Director...!','Mensaje al Usuario',16);
           nom_dire.SetFocus;
        end;

      end;
else
key:=#0;
end;
end;

procedure Tfrmbn.grid_maEnter(Sender: TObject);
begin
     if cod_es.Caption='' then
      begin
         application.MessageBox('Debe Seleccionar un Plantel...!','Mensaje al Usuario',32);
         bbp.SetFocus;
      end
      else
      begin
        bt_a.Visible:=true;
        bt_b.Visible:=false;
      end;


end;

procedure Tfrmbn.bt_sClick(Sender: TObject);
begin
close;
end;

end.
