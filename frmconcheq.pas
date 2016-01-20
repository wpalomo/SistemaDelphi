unit frmconcheq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, dxExEdtr, dxCntner, dxEditor, dxEdLib,
  dxDBGrid, dxTL, dxDBCtrl, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, RxCalc, Buttons, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppCtrls, ppVar, jpeg, ppPrnabl, ppBands, ppCache,
  ppModule, raCodMod, dxDBTLCl, dxGrClms;

type
  Tfrmconche = class(TForm)
    GroupBox1: TGroupBox;
    ncheq: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    con_ocxnumc: TZQuery;
    con_ocxnumcid: TFloatField;
    con_ocxnumcfec_ela: TDateField;
    con_ocxnumcanno: TIntegerField;
    con_ocxnumcorg: TIntegerField;
    con_ocxnumcuad: TStringField;
    con_ocxnumcuej: TStringField;
    con_ocxnumcubi: TStringField;
    con_ocxnumcmun: TStringField;
    con_ocxnumclent: TStringField;
    con_ocxnumcseg: TStringField;
    con_ocxnumcpen: TIntegerField;
    con_ocxnumcfpag: TStringField;
    con_ocxnumccoc: TStringField;
    con_ocxnumcest: TStringField;
    con_ocxnumccod_prov: TIntegerField;
    con_ocxnumcsemana: TIntegerField;
    con_ocxnumccod_proy: TIntegerField;
    con_ocxnumccod_esc: TIntegerField;
    con_ocxnumcfec_del: TDateField;
    con_ocxnumcfec_al: TDateField;
    con_ocxnumcent: TIntegerField;
    con_ocxnumctel_prov: TStringField;
    con_ocxnumcnom_prov: TStringField;
    con_ocxnumcdir_prov: TStringField;
    con_ocxnumcrif_prov: TStringField;
    con_ocxnumccpostal_prov: TIntegerField;
    con_ocxnumcnom_esc: TStringField;
    con_ocxnumcdir_esc: TStringField;
    con_ocxnumcpent_esc: TStringField;
    con_ocxnumcobs: TStringField;
    con_ocxnumctotaloc: TFloatField;
    con_ocxnumctotalimp: TFloatField;
    con_ocxnumcnom_proy: TStringField;
    con_ocxnumcmat_esc: TIntegerField;
    con_ocxnumcfecoc: TDateField;
    con_ocxnumcusuario: TStringField;
    con_ocxnumcanulada: TStringField;
    con_ocxnumcrendida: TStringField;
    con_ocxnumcnfac: TStringField;
    con_ocxnumcnne: TStringField;
    con_ocxnumcanalista_rinde: TStringField;
    con_ocxnumcpagada: TStringField;
    con_ocxnumcfecren: TDateField;
    con_ocxnumcfecpago: TDateField;
    con_ocxnumcanalista_paga: TStringField;
    con_ocxnumcimputacionp: TStringField;
    con_ocxnumcnumcheque: TLargeintField;
    con_ocxnumcdesimp: TStringField;
    dataocxnumc: TDataSource;
    GroupBox4: TGroupBox;
    Label30: TLabel;
    gridocxnum: TdxDBGrid;
    gridocxnumid: TdxDBGridMaskColumn;
    gridocxnumtotaloc: TdxDBGridMaskColumn;
    gridocxnumtotalimp: TdxDBGridMaskColumn;
    gridocxnumnumcheque: TdxDBGridColumn;
    totbs: TdxEdit;
    totimp: TdxEdit;
    totche: TdxEdit;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    calculadora: TRxCalculator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    eli_cheq: TZQuery;
    data_elicheq: TDataSource;
    pprepre: TppReport;
    ppdataoc: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppLabel1: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    con_cheq: TZQuery;
    FloatField1: TFloatField;
    DateField1: TDateField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField3: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    DateField2: TDateField;
    DateField3: TDateField;
    IntegerField8: TIntegerField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    IntegerField9: TIntegerField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField18: TStringField;
    IntegerField10: TIntegerField;
    DateField4: TDateField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    DateField5: TDateField;
    DateField6: TDateField;
    StringField26: TStringField;
    StringField27: TStringField;
    LargeintField1: TLargeintField;
    StringField28: TStringField;
    datacheq: TDataSource;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel10: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel4: TppLabel;
    raCodeModule1: TraCodeModule;
    ppLabel15: TppLabel;
    ppDBText10: TppDBText;
    con_ocxnumcid_1: TIntegerField;
    con_ocxnumcnom: TStringField;
    con_ocxnumcrif: TStringField;
    con_ocxnumcced: TIntegerField;
    con_ocxnumcnac: TStringField;
    con_ocxnumctpro: TIntegerField;
    con_ocxnumcdir: TStringField;
    con_ocxnumcciu: TStringField;
    con_ocxnumctel: TStringField;
    con_ocxnumcrcz: TIntegerField;
    con_ocxnumcrpocei: TIntegerField;
    con_ocxnumccpo: TIntegerField;
    con_ocxnumcrleg: TStringField;
    con_ocxnumccel: TStringField;
    con_ocxnumcimp: TStringField;
    con_ocxnumcimpx100: TFloatField;
    con_ocxnumcpzo_ent: TIntegerField;
    gridocxnumimp: TdxDBGridCheckColumn;
    ppmonche: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    totchebsf: TdxEdit;
    ppLabel12: TppLabel;
    ppDBText8: TppDBText;
    act_op: TZQuery;
    dataop: TDataSource;
    con_op: TZQuery;
    dataops: TDataSource;
    ppDBText9: TppDBText;
    ppLabel11: TppLabel;
    pimprime: TppLabel;
    ppLabel13: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    procedure BitBtn6Click(Sender: TObject);
    procedure ncheqKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ppLabel11Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconche: Tfrmconche;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmconche.BitBtn6Click(Sender: TObject);
begin
calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmconche.ncheqKeyPress(Sender: TObject; var Key: Char);
var
  mon,imp:double;
  i:integer;
begin
mon:=0;
imp:=0;
case key of
   #48..#57:;
        #13: begin
             if ncheq.Text='' then
             begin
                messagebox(0,'Debe Ingresar Un numero de Cheque...!','Mensaje al Usuario',16);
                ncheq.Clear;
                ncheq.SetFocus;
             end
             else
             begin
                 con_ocxnumc.Close;
                 con_ocxnumc.Params[0].AsInteger:=strtoint(ncheq.text);
                 con_ocxnumc.Open;
                 if con_ocxnumc.RecordCount>0 then
                 begin
                   for i:=1 to con_ocxnumc.RecordCount do
                   begin
                       if con_ocxnumc.fieldbyname('imp').AsString='S' then
                       begin
                         mon:=mon+con_ocxnumc.fieldbyname('totaloc').AsFloat;
                         imp:=imp+con_ocxnumc.fieldbyname('totalimp').AsFloat;
                       end
                       else
                       begin
                         if con_ocxnumc.fieldbyname('imp').AsString='N' then
                         begin
                           mon:=mon+con_ocxnumc.fieldbyname('totaloc').AsFloat;
                         end;
                        end;
                      con_ocxnumc.Next;
                     end;
                     totbs.Text:=formatfloat('#,##0.00',mon);
                     totimp.Text:=formatfloat('#,##0.00',imp);
                     totche.Text:=formatfloat('#,##0.00',(mon+imp));
                     totchebsf.Text:=formatfloat('#,##0.00',((mon+imp)/1000));
                 end
                 else
                 begin
                   totbs.Clear;
                   totimp.Clear;
                   totche.Clear;
                   messagebox(0,'No existen Ordenes de compras Asignadas al numero de Cheque Ingresado...!','Mensaje al Usuario',16);
                   ncheq.SetFocus;
                 end;
              end;
            end;
         #8:;
 else
   key:=#0;
 end;
end;

procedure Tfrmconche.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmconche.FormShow(Sender: TObject);
begin
con_ocxnumc.Close;
totbs.Clear;
totimp.Clear;
totche.Clear;
totchebsf.Clear;
ncheq.Clear;
ncheq.SetFocus;
end;

procedure Tfrmconche.BitBtn3Click(Sender: TObject);
var
 i:integer;
begin


if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) then
begin
   if  MessageDlg('¿Está Seguro de Anular Cheque: '+ncheq.Text+' ?',
       mtConfirmation,[mbYes, mbNo],0)=mrNo then
   else
   begin
      con_op.Close;
      con_op.Open;
      if not con_op.IsEmpty then
      begin
       con_ocxnumc.Close;
       con_ocxnumc.Params[0].AsInteger:=strtoint(ncheq.text);
       con_ocxnumc.Open;
       if con_ocxnumc.RecordCount>0 then
       begin
           act_op.Close;
          for i:=1 to con_ocxnumc.RecordCount do
          begin
            if con_ocxnumc.FieldByName('tpro').AsInteger=2 then
            begin
              act_op.Params[0].AsFloat:=con_ocxnumc.fieldbyname('totaloc').AsFloat+con_ocxnumc.fieldbyname('totalimp').AsFloat;
              act_op.Params[1].AsFloat:=con_ocxnumc.fieldbyname('totaloc').AsFloat+con_ocxnumc.fieldbyname('totalimp').AsFloat;
            end
            else
            begin
              act_op.Params[0].AsFloat:=con_ocxnumc.fieldbyname('totaloc').AsFloat;
              act_op.Params[1].AsFloat:=con_ocxnumc.fieldbyname('totaloc').AsFloat;
            end;
            act_op.ExecSQL;

            eli_cheq.Close;
            eli_cheq.Params[0].AsFloat:=con_ocxnumc.fieldbyname('id').AsFloat;
            eli_cheq.ExecSQL;
            con_ocxnumc.Next;
          end;
          con_ocxnumc.Close;
          totbs.Clear;
          totimp.Clear;
          totche.Clear;
          totchebsf.Clear;
          messagebox(0,'Cheque Anulado...!','Mensaje al Usuario',32);
          ncheq.Clear;
          ncheq.SetFocus;
      end;
      end
      else
      begin
         messagebox(0,'No existen Ordenes de Pago Activas...!','Mensaje al Usuario',16);
         ncheq.SetFocus;
      end;
   end;

end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);


end;

procedure Tfrmconche.BitBtn2Click(Sender: TObject);
begin
if ncheq.Text<>'' then
begin
  con_cheq.Close;
  con_cheq.Params[0].Asinteger:=strtoint(ncheq.text);
  con_cheq.Open;
  ppmonche.Text:= totche.Text;
 // ppmonche2.Text:= totchebsf.Text;
  pprepre.Print;
end
else
 ncheq.SetFocus;
end;

procedure Tfrmconche.ppLabel11Print(Sender: TObject);
begin
 pimprime.Text:=frmacceso.usuario.Text;
end;

end.
