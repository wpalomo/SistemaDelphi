unit frmrepocxm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ZAbstractDataset, ZDataset, DB,
  ZAbstractRODataset, ppDB, ppDBPipe, ppModule, daDataModule, ppBands,
  ppClass, ppRichTx, ppStrtch, ppMemo, ppCtrls, myChkBox, jpeg, ppPrnabl,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, Buttons, ComCtrls, raCodMod,
  ppVar;

type
  Tfrmrepocxmu = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    bt_salir: TBitBtn;
    BitBtn1: TBitBtn;
    pprepoc: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape19: TppShape;
    ppImage1: TppImage;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppShape8: TppShape;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppShape2: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppShape3: TppShape;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ck_si: TmyCheckBox;
    ck_no: TmyCheckBox;
    ppLabel27: TppLabel;
    ck_ac: TmyCheckBox;
    ck_cc: TmyCheckBox;
    ck_ch: TmyCheckBox;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ck_cif: TmyCheckBox;
    ck_otros: TmyCheckBox;
    ck_fob: TmyCheckBox;
    ck_fas: TmyCheckBox;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLabel14: TppLabel;
    ppDBText19: TppDBText;
    ppDBText18: TppDBText;
    ppDBText17: TppDBText;
    ppDBText16: TppDBText;
    ppDBText15: TppDBText;
    ppDBText14: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText11: TppDBText;
    ppDBText10: TppDBText;
    ppDBText9: TppDBText;
    ppDBText8: TppDBText;
    ppDBText7: TppDBText;
    ppDBText6: TppDBText;
    ppDBText5: TppDBText;
    ppDBText4: TppDBText;
    ppDBText3: TppDBText;
    ppDBText27: TppDBText;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppDetailBand1: TppDetailBand;
    ppShape9: TppShape;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppShape10: TppShape;
    ppLabel43: TppLabel;
    ppShape11: TppShape;
    ppLabel44: TppLabel;
    ppShape12: TppShape;
    ppLabel45: TppLabel;
    ppDBText26: TppDBText;
    ppShape7: TppShape;
    ppLabel46: TppLabel;
    myCheckBox10: TmyCheckBox;
    myCheckBox11: TmyCheckBox;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLine11: TppLine;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppShape13: TppShape;
    ppLabel53: TppLabel;
    ppMemo1: TppMemo;
    ppShape14: TppShape;
    ppLabel54: TppLabel;
    ppMemo2: TppMemo;
    ppShape15: TppShape;
    ppMemo3: TppMemo;
    ppLabel55: TppLabel;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppmonle: TppRichText;
    ppDBText2: TppDBText;
    ppmt: TppLabel;
    pptoci: TppDBText;
    pptii: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    daDataModule1: TdaDataModule;
    ppoc: TppDBPipeline;
    dataoc: TDataSource;
    con_oc: TZReadOnlyQuery;
    con_prov: TZReadOnlyQuery;
    dataprov: TDataSource;
    con_mun: TZQuery;
    datamun: TDataSource;
    Label3: TLabel;
    cb_nomun: TDBComboBox;
    numm: TListBox;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppanulada: TppImage;
    ppren: TppVariable;
    raCodeModule1: TraCodeModule;
    ppLabel68: TppLabel;
    ppDBText20: TppDBText;
    ppLine3: TppLine;
    procedure FormShow(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Function  Invertir(Texto: String) : String;
    procedure ppmonlePrint(Sender: TObject);
    procedure ck_acPrint(Sender: TObject);
    procedure ck_siPrint(Sender: TObject);
    procedure ck_noPrint(Sender: TObject);
    procedure ck_ccPrint(Sender: TObject);
    procedure ck_chPrint(Sender: TObject);
    procedure ck_cifPrint(Sender: TObject);
    procedure ck_fasPrint(Sender: TObject);
    procedure ck_fobPrint(Sender: TObject);
    procedure ck_otrosPrint(Sender: TObject);
    procedure ppDBText24Print(Sender: TObject);
    procedure ppDBText25Print(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppLabel43Print(Sender: TObject);
    procedure ppDBText1Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   
  end;

var
  frmrepocxmu: Tfrmrepocxmu;

implementation

{$R *.dfm}

Function Tfrmrepocxmu.Invertir(Texto: String) : String;
Var I : Integer;
Begin
    For I := Length(Texto) downto 1 DO
        Result := Result + Texto[i];
End;
procedure Tfrmrepocxmu.FormShow(Sender: TObject);
begin
   fecha1.Date:=date;
   fecha2.Date:=date;

   cb_nomun.Clear;
   numm.Clear;
   con_mun.Close;
   con_mun.Open;
   con_mun.FindFirst;
   while not con_mun.Eof do
   begin
     cb_nomun.Items.Append(con_mun.fieldbyname('nombre').AsString);
     numm.Items.Append(con_mun.fieldbyname('cod').AsString);
     con_mun.Next;
   end;
     cb_nomun.ItemIndex:=0;
     numm.ItemIndex:=0;
end;

procedure Tfrmrepocxmu.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmrepocxmu.BitBtn1Click(Sender: TObject);
begin
 con_oc.Close;
 con_oc.Params[0].AsDate:=fecha1.Date;
 con_oc.Params[1].AsDate:=fecha2.Date;
 con_oc.Params[2].Asstring:=cb_nomun.Text;
 con_oc.Open;
 pprepoc.Print;
end;

procedure Tfrmrepocxmu.ppmonlePrint(Sender: TObject);
   function xIntToLletras(Numero:LongInt):String;

   function xxIntToLletras(Valor:LongInt):String;
   const
    aUnidad : array[1..15] of String =
      ('UN','DOS','TRES','CUATRO','CINCO','SEIS',
       'SIETE','OCHO','NUEVE','DIEZ','ONCE','DOCE',
       'TRECE','CATORCE','QUINCE');
    aCentena: array[1..9]  of String =
      ('CIENTO','DOSCIENTOS','TRESCIENTOS',
       'CUATROCIENTOS','QUINIENTOS','SEISCIENTOS',
       'SETECIENTOS','OCHOCIENTOS','NOVECIENTOS');
    aDecena : array[1..9]  of String =
     ('DIECI','VEINTI','TREINTA','CUARENTA','CINCUENTA',
      'SESENTA','SETENTA','OCHENTA','NOVENTA');
    var
     Centena, Decena, Unidad, Doble: LongInt;
     Linea: String;
    begin
     if valor=100 then Linea:=' CIEN '
     else begin
      Linea:='';
      Centena := Valor div 100;
      Doble   := Valor - (Centena*100);
      Decena  := (Valor div 10) - (Centena*10);
      Unidad  := Valor - (Decena*10) - (Centena*100);

      if Centena>0 then Linea := Linea + Acentena[centena]+' ';

      if Doble>0 then begin
        if Doble=20 then Linea := Linea +' VEINTE '
          else begin
           if doble<16 then Linea := Linea + aUnidad[Doble]
             else begin
                  Linea := Linea +' '+ Adecena[Decena];
                  if (Decena>2) and (Unidad<>0) then Linea := Linea+' Y ';
                  if Unidad>0 then Linea := Linea + aUnidad[Unidad];
             end;
          end;
      end;
    end;
    Result := Linea;
   end;
 var
    Millones,Miles,Unidades: Longint;
    Linea : String;
 begin
   {Inicializamos el string que contendrá las letras según el valor
   numérico}
   if numero=0 then Linea := 'CERO'
   else if numero<0 then Linea := 'MENOS '
        else if numero=1 then
             begin
               Linea := 'UN';
               xIntToLletras := Linea;
               exit
             end
             else if numero>1 then Linea := '';

   {Determinamos el Nº de millones, miles y unidades de numero en
   positivo}
   Numero   := Abs(Numero);
   Millones := numero div 1000000;
   Miles     := (numero - (Millones*1000000)) div 1000;
   Unidades  := numero - ((Millones*1000000)+(Miles*1000));

   {Vamos poniendo en el string las cadenas de los números(llamando
   a subfuncion)}
   if Millones=1 then Linea:= Linea + ' UN MILLON '
   else if Millones>1 then Linea := Linea + xxIntToLletras(Millones)
                                    + ' MILLONES ';

   if Miles =1 then Linea:= Linea + ' MIL '
   else if Miles>1 then Linea := Linea + xxIntToLletras(Miles)+
                                 ' MIL ';

   if Unidades >0 then Linea := Linea + xxIntToLletras(Unidades);
   xIntToLletras := Linea;
 end;
var
 i:integer;
 monto,dec:string;
begin
   monto:=ppmt.Text;
   i:=length(monto);
   repeat
       dec:=dec+monto[i];
       i:=i-1;
   until (monto[i]=',');

   dec:=invertir(dec);
  con_prov.Close;
  con_prov.Params[0].AsInteger:=con_oc.fieldbyname('cod_prov').asinteger;
  con_prov.Open;
   if con_prov.FieldByName('imp').asstring='S' then
      ppmonle.RichText:=xIntToLletras(trunc(con_oc.FieldByName('totaloc').asfloat+ con_oc.FieldByName('totalimp').Asfloat))+' con '+dec+' Centimos.';
   if con_prov.FieldByName('imp').asstring='N' then
      ppmonle.RichText:=xIntToLletras(trunc(con_oc.FieldByName('totaloc').asfloat))+' con '+dec+' Centimos.';
  con_prov.Close;
end;

procedure Tfrmrepocxmu.ck_acPrint(Sender: TObject);
begin
 if con_oc.FieldByName('fpag').AsString='ABONO EN CUENTA' then
 begin
    ck_ac.Checked:=true;
    ck_cc.Checked:=false;
    ck_ch.Checked:=false;
 end;
end;

procedure Tfrmrepocxmu.ck_siPrint(Sender: TObject);
begin
 if con_oc.FieldByName('seg').AsString='S' then
 begin
   ck_si.Checked:=true;
   ck_no.Checked:=false;
 end;
end;

procedure Tfrmrepocxmu.ck_noPrint(Sender: TObject);
begin
if con_oc.FieldByName('seg').AsString='N' then
 begin
  ck_no.Checked:=true;
  ck_si.Checked:=false;
 end;
end;

procedure Tfrmrepocxmu.ck_ccPrint(Sender: TObject);
begin
if con_oc.FieldByName('fpag').AsString='CARTA CREDITO' then
 begin
    ck_ac.Checked:=false;
    ck_cc.Checked:=true;
    ck_ch.Checked:=false;
 end;
end;

procedure Tfrmrepocxmu.ck_chPrint(Sender: TObject);
begin
if con_oc.FieldByName('fpag').AsString='CHEQUE' then
 begin
    ck_ac.Checked:=false;
    ck_cc.Checked:=false;
    ck_ch.Checked:=true;
 end;
end;

procedure Tfrmrepocxmu.ck_cifPrint(Sender: TObject);
begin
if con_oc.FieldByName('coc').AsString='CIF' then
 begin
    ck_cif.Checked:=true;
    ck_fas.Checked:=false;
    ck_fob.Checked:=false;
    ck_otros.Checked:=false;
 end;
end;

procedure Tfrmrepocxmu.ck_fasPrint(Sender: TObject);
begin
 if con_oc.FieldByName('coc').AsString='FAS' then
 begin
    ck_cif.Checked:=false;
    ck_fas.Checked:=true;
    ck_fob.Checked:=false;
    ck_otros.Checked:=false;
 end;
end;

procedure Tfrmrepocxmu.ck_fobPrint(Sender: TObject);
begin
if con_oc.FieldByName('coc').AsString='FOB' then
 begin
    ck_cif.Checked:=false;
    ck_fas.Checked:=false;
    ck_fob.Checked:=true;
    ck_otros.Checked:=false;
 end;
end;

procedure Tfrmrepocxmu.ck_otrosPrint(Sender: TObject);
begin
if con_oc.FieldByName('coc').AsString='OTROS' then
 begin
    ck_cif.Checked:=false;
    ck_fas.Checked:=false;
    ck_fob.Checked:=false;
    ck_otros.Checked:=true;
 end;
end;

procedure Tfrmrepocxmu.ppDBText24Print(Sender: TObject);
begin
//ppunf.Text:=formatfloat('#,##0.00',(con_oc.fieldbyname('precio_uni').asfloat/1000));
end;

procedure Tfrmrepocxmu.ppDBText25Print(Sender: TObject);
begin
//pptotf.Text:=formatfloat('#,##0.00',(con_oc.fieldbyname('total').asfloat/1000));
end;

procedure Tfrmrepocxmu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
con_prov.Close;
end;

procedure Tfrmrepocxmu.ppLabel43Print(Sender: TObject);
begin
con_prov.Close;
con_prov.Params[0].AsInteger:=con_oc.fieldbyname('cod_prov').asinteger;
con_prov.Open;
if con_prov.FieldByName('imp').AsString='S' then
begin
  ppmt.Text:=formatfloat('#,##0.00',strtofloat(pptoci.Text)+strtofloat(pptii.Text));
 // ppttf.Text:=formatfloat('#,##0.00',((strtofloat(pptoci.Text)+strtofloat(pptii.Text))/1000));
end
else
begin
  ppmt.Text:=formatfloat('#,##0.00',strtofloat(pptoci.Text));
 // ppttf.Text:=formatfloat('#,##0.00',(strtofloat(pptoci.Text)/1000));
end;
con_prov.Close;
end;

procedure Tfrmrepocxmu.ppDBText1Print(Sender: TObject);
begin
if con_oc.FieldByName('anulada').AsString='S' then
    ppanulada.Visible:=true;
 if con_oc.FieldByName('anulada').AsString='N' then
    ppanulada.Visible:=false;
end;

end.
