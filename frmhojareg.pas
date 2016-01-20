unit frmhojareg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ppDB, ppDBPipe, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppRichTx, ppMemo, ppSubRpt,strUtils,
  ppVar, ppParameter, ppCTMain, ppRegion;

type
  TForm2 = class(TForm)
    Label14: TLabel;
    bt_imp: TBitBtn;
    bt_salir: TBitBtn;
    mun: TComboBox;
    pphreg: TppDBPipeline;
    con_hreg: TZQuery;
    datahreg: TDataSource;
    pprephreg: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppDetailBand9: TppDetailBand;
    ppImage9: TppImage;
    ppLabel72: TppLabel;
    ppLabel64: TppLabel;
    ppLabel71: TppLabel;
    ppFooterBand9: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppShape19: TppShape;
    ppShape10: TppShape;
    ppDBText64: TppDBText;
    ppDBText66: TppDBText;
    ppced: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppShape8: TppShape;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppShape27: TppShape;
    ppShape28: TppShape;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppLabel9: TppLabel;
    ppMemo1: TppMemo;
    ppMemo2: TppMemo;
    ppLabel10: TppLabel;
    ppMemo3: TppMemo;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppMemo4: TppMemo;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppShape37: TppShape;
    ppShape38: TppShape;
    ppShape39: TppShape;
    ppShape40: TppShape;
    ppShape41: TppShape;
    ppLabel19: TppLabel;
    fnac: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppdia: TppLabel;
    ppmes: TppLabel;
    ppanno: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppShape46: TppShape;
    ppvarnum: TppVariable;
    ppParameterList1: TppParameterList;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppLabel24: TppLabel;
    ppnum1: TppLabel;
    ppnom1: TppLabel;
    pploc1: TppLabel;
    ppefe1: TppLabel;
    ppLabel25: TppLabel;
    ppShape22: TppShape;
    ppShape24: TppShape;
    ppShape42: TppShape;
    ppLabel27: TppLabel;
    ppnom2: TppLabel;
    pploc2: TppLabel;
    ppefe2: TppLabel;
    ppLabel35: TppLabel;
    ppShape2: TppShape;
    ppShape9: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppLabel37: TppLabel;
    ppnom3: TppLabel;
    pploc3: TppLabel;
    ppefe3: TppLabel;
    ppLabel41: TppLabel;
    ppShape43: TppShape;
    ppShape44: TppShape;
    ppShape45: TppShape;
    ppShape47: TppShape;
    ppLabel43: TppLabel;
    ppnom4: TppLabel;
    pploc4: TppLabel;
    ppefe4: TppLabel;
    ppLabel47: TppLabel;
    ppShape48: TppShape;
    ppShape49: TppShape;
    ppShape50: TppShape;
    ppShape51: TppShape;
    ppLabel49: TppLabel;
    ppnom5: TppLabel;
    pploc5: TppLabel;
    ppefe5: TppLabel;
    ppLabel53: TppLabel;
    ppShape52: TppShape;
    ppShape53: TppShape;
    ppShape54: TppShape;
    ppShape55: TppShape;
    ppLabel55: TppLabel;
    ppnom6: TppLabel;
    pploc6: TppLabel;
    ppefe6: TppLabel;
    ppLabel59: TppLabel;
    ppShape56: TppShape;
    ppShape57: TppShape;
    ppShape58: TppShape;
    ppShape59: TppShape;
    ppLabel61: TppLabel;
    ppnom7: TppLabel;
    pploc7: TppLabel;
    ppefe7: TppLabel;
    ppLabel66: TppLabel;
    ppShape64: TppShape;
    ppShape65: TppShape;
    ppShape66: TppShape;
    ppShape67: TppShape;
    ppLabel68: TppLabel;
    ppnom8: TppLabel;
    pploc8: TppLabel;
    ppefe8: TppLabel;
    ppLabel74: TppLabel;
    ppShape68: TppShape;
    ppShape69: TppShape;
    ppShape70: TppShape;
    ppShape71: TppShape;
    ppLabel76: TppLabel;
    ppnom9: TppLabel;
    pploc9: TppLabel;
    ppefe9: TppLabel;
    ppLabel80: TppLabel;
    ppShape72: TppShape;
    ppShape73: TppShape;
    ppShape74: TppShape;
    ppShape75: TppShape;
    ppLabel82: TppLabel;
    ppnom10: TppLabel;
    pploc10: TppLabel;
    ppefe10: TppLabel;
    ppLabel86: TppLabel;
    ppShape76: TppShape;
    ppShape77: TppShape;
    ppShape78: TppShape;
    ppShape79: TppShape;
    ppLabel88: TppLabel;
    ppnom11: TppLabel;
    pploc11: TppLabel;
    ppefe11: TppLabel;
    ppLabel107: TppLabel;
    ppShape80: TppShape;
    ppShape81: TppShape;
    ppShape82: TppShape;
    ppShape83: TppShape;
    ppLabel109: TppLabel;
    ppnom12: TppLabel;
    pploc12: TppLabel;
    ppefe12: TppLabel;
    ppLabel113: TppLabel;
    ppShape84: TppShape;
    ppShape85: TppShape;
    ppShape86: TppShape;
    ppShape87: TppShape;
    ppLabel115: TppLabel;
    ppnom13: TppLabel;
    pploc13: TppLabel;
    ppefe13: TppLabel;
    ppLabel119: TppLabel;
    ppShape88: TppShape;
    ppShape89: TppShape;
    ppShape90: TppShape;
    ppShape91: TppShape;
    ppLabel121: TppLabel;
    ppnom14: TppLabel;
    pploc14: TppLabel;
    ppefe14: TppLabel;
    ppLabel125: TppLabel;
    ppShape60: TppShape;
    ppShape61: TppShape;
    ppShape62: TppShape;
    ppShape63: TppShape;
    ppLabel127: TppLabel;
    ppnom15: TppLabel;
    pploc15: TppLabel;
    ppefe15: TppLabel;
    ppLabel26: TppLabel;
    ppShape23: TppShape;
    ppShape92: TppShape;
    ppShape93: TppShape;
    ppShape94: TppShape;
    ppLabel32: TppLabel;
    pptt: TppLabel;
    pptt2: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel42: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel48: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel54: TppLabel;
    ppShape95: TppShape;
    ppShape96: TppShape;
    ppShape97: TppShape;
    ppShape98: TppShape;
    ppShape99: TppShape;
    ppShape100: TppShape;
    ppShape101: TppShape;
    ppShape102: TppShape;
    ppShape103: TppShape;
    ppShape104: TppShape;
    ppShape105: TppShape;
    ppShape106: TppShape;
    ppShape107: TppShape;
    ppShape108: TppShape;
    ppLabel56: TppLabel;
    ppShape109: TppShape;
    ppLabel57: TppLabel;
    ppShape110: TppShape;
    ppLabel58: TppLabel;
    ppShape111: TppShape;
    ppShape112: TppShape;
    ppShape113: TppShape;
    ppShape114: TppShape;
    ppShape115: TppShape;
    ppShape116: TppShape;
    procedure bt_salirClick(Sender: TObject);
    procedure ppcedPrint(Sender: TObject);
    procedure bt_impClick(Sender: TObject);
    procedure ppLabel21Print(Sender: TObject);
    procedure ppvarnumGetText(Sender: TObject; var Text: String);
    procedure pprephregEndPage(Sender: TObject);
  private
    { Private declarations }
     contit:integer;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses frmacces;

{$R *.dfm}

procedure TForm2.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure TForm2.ppcedPrint(Sender: TObject);
var
dia,mes,anno,aux1,aux2:string;
i,cb:integer;
begin
if not (ppced.Text='') then
   contit:=contit+1;



 cb:=0;

 for i:=0 to length(fnac.Text) do
 begin
    if fnac.Text[i]=' ' then
    begin
       cb:=cb+1;
    end
    else
    begin
        if cb=0 then
           dia:=dia+fnac.Text[i];
           dia:=trimleft(dia);
           ppdia.Caption:=dia;
        if cb=1 then
           aux1:=aux1+fnac.Text[i];
        if cb=2 then
        begin
           mes:=mes+fnac.Text[i];
           if mes='ENERO'      then mes:='01';
           if mes='FEBRERO'    then mes:='02';
           if mes='MARZO'      then mes:='03';
           if mes='ABRIL'      then mes:='04';
           if mes='MAYO'       then mes:='05';
           if mes='JUNIO'      then mes:='06';
           if mes='JULIO'      then mes:='07';
           if mes='AGOSTO'     then mes:='08';
           if mes='SEPTIEMBRE' then mes:='09';
           if mes='OCTUBRE'    then mes:='10';
           if mes='NOVIEMBRE'  then mes:='11';
           if mes='DICIEMBRE'  then mes:='12';
           ppmes.Caption:=mes;
        end;
        if cb=3 then
           aux2:=aux2+fnac.Text[i];
        if cb=4 then
           anno:=anno+fnac.Text[i];
           ppanno.Caption:=anno;
        end;
 end;
end;

procedure TForm2.bt_impClick(Sender: TObject);
begin
  con_hreg.Close;
  con_hreg.Params[0].AsString:=mun.Text;
  con_hreg.Open;
  pprephreg.Print;
end;

procedure TForm2.ppLabel21Print(Sender: TObject);
begin
  ppvarnum.Value:=ppvarnum.Value+1;

end;

procedure TForm2.ppvarnumGetText(Sender: TObject; var Text: String);
var
i,j,k:integer;
aux,aux2:string;
begin
   if ppvarnum.Value=1  then
   begin
     pploc1.Text:='';
     aux:='';
     aux2:='';
     k:=0;

     ppnom1.Text:=con_hreg.fieldbyname('nombres').AsString;

     for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc1.Text:=pploc1.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc1.Text='') then
         begin
             pploc1.Text:=trimleft(pploc1.Text)
         end
         else
         begin
             pploc1.Text:=' NOTIENEESTADO'
         end;
       end
       else
       begin
         for j:=length(pploc1.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc1.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc1.Text[j];
         end;
         ppefe1.Text:=trim(aux2);
         pploc1.Text:=trim(aux);
         exit;
       end;
     end;
   end;

   if ppvarnum.Value=2  then
   begin
     pploc2.Text:='';
     aux:='';
     aux2:='';
     k:=0;


     ppnom2.Text:=con_hreg.fieldbyname('nombres').AsString;
     for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc2.Text:=pploc2.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc2.Text='') then
         begin
             pploc2.Text:=trimleft(pploc2.Text)
         end
         else
         begin
             pploc2.Text:=' NOTIENEESTADO'
         end;
       end
       else
       begin
         for j:=length(pploc2.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc2.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc2.Text[j];
         end;
         ppefe2.Text:=trim(aux2);
         pploc2.Text:=trim(aux);
         exit;
       end;
     end;
   end;

   if ppvarnum.Value=3  then
   begin
     pploc3.Text:='';
     aux:='';
     aux2:='';
     k:=0;


     ppnom3.Text:=con_hreg.fieldbyname('nombres').AsString;
      for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc3.Text:=pploc3.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc3.Text='') then
         begin
             pploc3.Text:=trimleft(pploc3.Text)
         end
         else
         begin
             pploc3.Text:=' NOTIENEESTADO'
         end;
       end
       else
       begin
         for j:=length(pploc3.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc3.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc3.Text[j];
         end;
         ppefe3.Text:=trim(aux2);
         pploc3.Text:=trim(aux);
         exit;
       end;
     end;
   end;

   if ppvarnum.Value=4  then
   begin
     pploc4.Text:='';
     aux:='';
     aux2:='';
     k:=0;


     ppnom4.Text:=con_hreg.fieldbyname('nombres').AsString;
      for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc4.Text:=pploc4.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc4.Text='') then
         begin
             pploc4.Text:=trimleft(pploc4.Text)
         end
         else
         begin
             pploc4.Text:=' NOTIENEESTADO'
         end;
       end
       else
       begin
         for j:=length(pploc4.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc4.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc4.Text[j];
         end;
         ppefe4.Text:=trim(aux2);
         pploc4.Text:=trim(aux);
         exit;
       end;
      end;
   end;

   if ppvarnum.Value=5  then
   begin
     pploc5.Text:='';
     aux:='';
     aux2:='';
     k:=0;

     ppnom5.Text:=con_hreg.fieldbyname('nombres').AsString;
      for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc5.Text:=pploc5.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc5.Text='') then
         begin
             pploc5.Text:=trimleft(pploc5.Text)
         end
         else
         begin
             pploc5.Text:=' NOTIENEESTADO'
         end;
       end
       else
       begin
         for j:=length(pploc5.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc5.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc5.Text[j];
         end;
         ppefe5.Text:=trim(aux2);
         pploc5.Text:=trim(aux);
         exit;
       end;
     end;
   end;

   if ppvarnum.Value=6  then
   begin
     pploc6.Text:='';
     aux:='';
     aux2:='';
     k:=0;


     ppnom6.Text:=con_hreg.fieldbyname('nombres').AsString;
      for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc6.Text:=pploc6.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc6.Text='') then
         begin
             pploc6.Text:=trimleft(pploc6.Text)
         end
         else
         begin
             pploc6.Text:=' NOTIENEESTADO'
         end;

       end
       else
       begin
         for j:=length(pploc6.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc6.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc6.Text[j];
         end;
         ppefe6.Text:=trim(aux2);
         pploc6.Text:=trim(aux);
         exit;
       end;
     end;
   end;

   if ppvarnum.Value=7  then
   begin
     pploc7.Text:='';
     aux:='';
     aux2:='';
     k:=0;


     ppnom7.Text:=con_hreg.fieldbyname('nombres').AsString;
     for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc7.Text:=pploc7.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc7.Text='') then
         begin
             pploc7.Text:=trimleft(pploc7.Text)
         end
         else
         begin
             pploc7.Text:=' NOTIENEESTADO'
         end;
       end
       else
       begin
         for j:=length(pploc7.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc7.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc7.Text[j];
         end;
         ppefe7.Text:=trim(aux2);
         pploc7.Text:=trim(aux);
         exit;
       end;
     end;
   end;

   if ppvarnum.Value=8  then
   begin
     pploc8.Text:='';
     aux:='';
     aux2:='';
     k:=0;


     ppnom8.Text:=con_hreg.fieldbyname('nombres').AsString;
      for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc8.Text:=pploc8.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc8.Text='') then
         begin
             pploc8.Text:=trimleft(pploc8.Text)
         end
         else
         begin
             pploc8.Text:=' NOTIENEESTADO'
         end;
       end
       else
       begin
         for j:=length(pploc8.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc8.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc8.Text[j];
         end;
         ppefe8.Text:=trim(aux2);
         pploc8.Text:=trim(aux);
         exit;
       end;
     end;
   end;

   if ppvarnum.Value=9  then
   begin
     pploc9.Text:='';
     aux:='';
     aux2:='';
     k:=0;


     ppnom9.Text:=con_hreg.fieldbyname('nombres').AsString;
      for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc9.Text:=pploc9.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc9.Text='') then
         begin
             pploc9.Text:=trimleft(pploc9.Text)
         end
         else
         begin
             pploc9.Text:=' NOTIENEESTADO'
         end;
       end
       else
       begin
         for j:=length(pploc9.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc9.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc9.Text[j];
         end;
         ppefe9.Text:=trim(aux2);
         pploc9.Text:=trim(aux);
         exit;
       end;
     end;
   end;

   if ppvarnum.Value=10  then
   begin
     pploc10.Text:='';
     aux:='';
     aux2:='';
     k:=0;


      ppnom10.Text:=con_hreg.fieldbyname('nombres').AsString;
      for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc10.Text:=pploc10.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc10.Text='') then
         begin
             pploc10.Text:=trimleft(pploc10.Text)
         end
         else
         begin
             pploc10.Text:=' NOTIENEESTADO'
         end;
       end
       else
       begin
         for j:=length(pploc10.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc10.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc10.Text[j];
         end;
         ppefe10.Text:=trim(aux2);
         pploc10.Text:=trim(aux);
         exit;
       end;
      end;
   end;

   if ppvarnum.Value=11  then
   begin
     pploc11.Text:='';
     aux:='';
     aux2:='';
     k:=0;


     ppnom11.Text:=con_hreg.fieldbyname('nombres').AsString;
      for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc11.Text:=pploc11.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc11.Text='') then
         begin
             pploc11.Text:=trimleft(pploc11.Text)
         end
         else
         begin
             pploc11.Text:=' NOTIENEESTADO'
         end;
       end
       else
       begin
         for j:=length(pploc11.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc11.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc11.Text[j];
         end;
         ppefe11.Text:=trim(aux2);
         pploc11.Text:=trim(aux);
         exit;
       end;
     end;
   end;

   if ppvarnum.Value=12  then
   begin
     pploc12.Text:='';
     aux:='';
     aux2:='';
     k:=0;


     ppnom12.Text:=con_hreg.fieldbyname('nombres').AsString;
      for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc12.Text:=pploc12.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc12.Text='') then
         begin
             pploc12.Text:=trimleft(pploc12.Text)
         end
         else
         begin
             pploc12.Text:=' NOTIENEESTADO'
         end;
       end
       else
       begin
         for j:=length(pploc12.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc12.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc12.Text[j];
         end;
         ppefe12.Text:=trim(aux2);
         pploc12.Text:=trim(aux);
         exit;
       end;
      end;
   end;

   if ppvarnum.Value=13  then
   begin
     pploc13.Text:='';
     aux:='';
     aux2:='';
     k:=0;


     ppnom13.Text:=con_hreg.fieldbyname('nombres').AsString;
      for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc13.Text:=pploc13.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc13.Text='') then
         begin
             pploc13.Text:=trimleft(pploc13.Text)
         end
         else
         begin
             pploc13.Text:=' NOTIENEESTADO'
         end;
       end
       else
       begin
         for j:=length(pploc13.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc13.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc13.Text[j];
         end;
         ppefe13.Text:=trim(aux2);
         pploc13.Text:=trim(aux);
         exit;
       end;
     end;
   end;

   if ppvarnum.Value=14  then
   begin
     pploc14.Text:='';
     aux:='';
     aux2:='';
     k:=0;


     ppnom14.Text:=con_hreg.fieldbyname('nombres').AsString;
      for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc14.Text:=pploc14.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc14.Text='') then
         begin
             pploc14.Text:=trimleft(pploc14.Text)
         end
         else
         begin
             pploc14.Text:=' NOTIENEESTADO'
         end;
       end
       else
       begin
         for j:=length(pploc14.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc14.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc14.Text[j];
         end;
         ppefe14.Text:=trim(aux2);
         pploc14.Text:=trim(aux);
         exit;
       end;
      end;
   end;

   if ppvarnum.Value=15  then
   begin
     pploc15.Text:='';
     aux:='';
     aux2:='';
     k:=0;


     ppnom15.Text:=con_hreg.fieldbyname('nombres').AsString;
      for i:=length(trimright(con_hreg.fieldbyname('lugarnac').AsString)) downto 0 do
     begin
       if  not (con_hreg.fieldbyname('lugarnac').AsString[i]=' ') then
       begin
         pploc15.Text:=pploc15.Text + con_hreg.fieldbyname('lugarnac').AsString[i];
         if not (pploc15.Text='') then
         begin
             pploc15.Text:=trimleft(pploc15.Text)
         end
         else
         begin
             pploc15.Text:=' NOTIENEESTADO'
         end;
       end
       else
       begin
         for j:=length(pploc15.Text) downto 0  do
         begin
           if (k<2) then
           begin
               aux2:=aux2+pploc15.Text[j];
               k:=k+1;
           end;
           aux:=aux+pploc15.Text[j];
         end;
         ppefe15.Text:=trim(aux2);
         pploc15.Text:=trim(aux);
         exit;
       end;
     end;
   end;










end;

procedure TForm2.pprephregEndPage(Sender: TObject);
begin
   pptt.Text:=inttostr(contit);
   pptt2.Text:=inttostr(contit);
   contit:=0;
end;

end.
