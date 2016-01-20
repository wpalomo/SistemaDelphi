unit frmplanillas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, ppStrtch, ppMemo, ppVar, StdCtrls, Buttons,
  ZAbstractTable, ZDataset, DB, ZAbstractRODataset, ZAbstractDataset, ppDB,
  ppDBPipe, Animate, GIFCtrl;

type
  Tfrmimppla = class(TForm)
    pppla: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppShape5: TppShape;
    ppLabel3: TppLabel;
    ppShape6: TppShape;
    ppLabel4: TppLabel;
    ppShape7: TppShape;
    ppLabel5: TppLabel;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppShape11: TppShape;
    ppLabel8: TppLabel;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppLabel9: TppLabel;
    ppShape14: TppShape;
    ppLabel10: TppLabel;
    ppShape15: TppShape;
    ppLabel11: TppLabel;
    ppShape16: TppShape;
    ppLabel12: TppLabel;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppLabel13: TppLabel;
    ppShape20: TppShape;
    ppLabel14: TppLabel;
    ppShape21: TppShape;
    ppLabel15: TppLabel;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppLabel16: TppLabel;
    ppShape26: TppShape;
    ppShape27: TppShape;
    ppShape28: TppShape;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppLabel19: TppLabel;
    ppLabel18: TppLabel;
    ppShape31: TppShape;
    ppLabel17: TppLabel;
    ppLabel20: TppLabel;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppLabel22: TppLabel;
    ppShape34: TppShape;
    ppLabel23: TppLabel;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppLabel24: TppLabel;
    ppShape37: TppShape;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppShape38: TppShape;
    ppShape39: TppShape;
    ppLabel27: TppLabel;
    ppShape40: TppShape;
    ppShape41: TppShape;
    ppLabel28: TppLabel;
    ppShape42: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppShape43: TppShape;
    ppShape44: TppShape;
    ppLabel31: TppLabel;
    ppShape45: TppShape;
    ppShape46: TppShape;
    ppLabel32: TppLabel;
    ppShape47: TppShape;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppShape48: TppShape;
    ppShape49: TppShape;
    ppLabel35: TppLabel;
    ppShape50: TppShape;
    ppShape51: TppShape;
    ppLabel36: TppLabel;
    ppShape52: TppShape;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppShape53: TppShape;
    ppShape54: TppShape;
    ppLabel39: TppLabel;
    ppShape55: TppShape;
    ppShape56: TppShape;
    ppLabel40: TppLabel;
    ppShape57: TppShape;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppShape58: TppShape;
    ppShape59: TppShape;
    ppLabel43: TppLabel;
    ppShape60: TppShape;
    ppShape61: TppShape;
    ppLabel44: TppLabel;
    ppShape62: TppShape;
    ppShape63: TppShape;
    ppShape64: TppShape;
    ppShape65: TppShape;
    ppShape66: TppShape;
    ppShape67: TppShape;
    ppShape68: TppShape;
    ppShape69: TppShape;
    ppShape70: TppShape;
    ppShape71: TppShape;
    ppShape72: TppShape;
    ppShape73: TppShape;
    ppShape74: TppShape;
    ppLabel45: TppLabel;
    ppShape75: TppShape;
    ppShape76: TppShape;
    ppShape77: TppShape;
    ppShape78: TppShape;
    ppShape79: TppShape;
    ppShape80: TppShape;
    ppShape81: TppShape;
    ppShape83: TppShape;
    ppShape84: TppShape;
    ppShape85: TppShape;
    ppShape82: TppShape;
    ppLabel46: TppLabel;
    ppShape86: TppShape;
    ppShape87: TppShape;
    ppShape88: TppShape;
    ppShape89: TppShape;
    ppShape90: TppShape;
    ppShape91: TppShape;
    ppShape92: TppShape;
    ppShape93: TppShape;
    ppShape94: TppShape;
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
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppShape107: TppShape;
    ppShape108: TppShape;
    ppShape109: TppShape;
    ppShape110: TppShape;
    ppShape111: TppShape;
    ppShape112: TppShape;
    ppShape113: TppShape;
    ppShape114: TppShape;
    ppShape115: TppShape;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppShape116: TppShape;
    ppImage3: TppImage;
    ppImage4: TppImage;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppMemo1: TppMemo;
    ppShape117: TppShape;
    ppImage5: TppImage;
    ppImage6: TppImage;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppMemo2: TppMemo;
    ppShape118: TppShape;
    ppImage7: TppImage;
    ppImage8: TppImage;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppMemo3: TppMemo;
    ppShape119: TppShape;
    ppImage9: TppImage;
    ppImage10: TppImage;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppMemo4: TppMemo;
    ppShape120: TppShape;
    ppImage11: TppImage;
    ppImage12: TppImage;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppMemo5: TppMemo;
    ppShape121: TppShape;
    ppImage13: TppImage;
    ppImage14: TppImage;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppMemo6: TppMemo;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppShape122: TppShape;
    ppLabel79: TppLabel;
    ppShape123: TppShape;
    ppLabel80: TppLabel;
    ppShape124: TppShape;
    ppLabel81: TppLabel;
    ppShape125: TppShape;
    ppShape126: TppShape;
    ppShape127: TppShape;
    ppLabel82: TppLabel;
    ppShape128: TppShape;
    ppShape129: TppShape;
    ppShape130: TppShape;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppShape131: TppShape;
    ppLabel85: TppLabel;
    ppShape132: TppShape;
    ppLine6: TppLine;
    ppShape135: TppShape;
    ppShape136: TppShape;
    ppShape137: TppShape;
    ppLabel86: TppLabel;
    ppShape138: TppShape;
    ppShape139: TppShape;
    ppShape140: TppShape;
    ppShape141: TppShape;
    ppShape142: TppShape;
    ppShape143: TppShape;
    ppShape144: TppShape;
    ppShape145: TppShape;
    ppShape146: TppShape;
    ppShape147: TppShape;
    ppShape148: TppShape;
    ppShape149: TppShape;
    ppShape150: TppShape;
    ppShape151: TppShape;
    ppShape152: TppShape;
    ppShape153: TppShape;
    ppShape154: TppShape;
    ppShape155: TppShape;
    ppShape156: TppShape;
    ppShape157: TppShape;
    ppShape158: TppShape;
    ppShape159: TppShape;
    ppShape160: TppShape;
    ppShape161: TppShape;
    ppShape162: TppShape;
    ppShape163: TppShape;
    ppShape164: TppShape;
    ppShape165: TppShape;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppShape166: TppShape;
    ppLabel101: TppLabel;
    ppShape167: TppShape;
    ppLabel102: TppLabel;
    ppShape168: TppShape;
    ppShape169: TppShape;
    ppShape170: TppShape;
    ppLabel103: TppLabel;
    ppShape171: TppShape;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppShape2: TppShape;
    ppSystemVariable2: TppSystemVariable;
    Label1: TLabel;
    salir: TBitBtn;
    con_numpla: TZQuery;
    datanumpla: TDataSource;
    datatbnumpla: TDataSource;
    imprimir: TBitBtn;
    numpla: TEdit;
    ppn1: TppLabel;
    ppn2: TppLabel;
    ppn3: TppLabel;
    ppn4: TppLabel;
    ppn5: TppLabel;
    ppn6: TppLabel;
    ppn7: TppLabel;
    tb_numpla: TZTable;
    impani: TRxGIFAnimator;
    ppShape3: TppShape;
    ppLabel108: TppLabel;
    ppShape4: TppShape;
    ppn8: TppLabel;
    ppShape133: TppShape;
    ppLabel21: TppLabel;
    ppShape134: TppShape;
    ppShape172: TppShape;
    ppLabel109: TppLabel;
    ppShape173: TppShape;
    procedure salirClick(Sender: TObject);
    procedure numplaKeyPress(Sender: TObject; var Key: Char);
    procedure imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    npla:double;
  public
    { Public declarations }
  end;

var
  frmimppla: Tfrmimppla;

implementation

uses frmacces, frmacercade;

{$R *.dfm}

procedure Tfrmimppla.salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmimppla.numplaKeyPress(Sender: TObject; var Key: Char);
begin
case key of
   #48..#57:;
   #8:;
else
key:=#0;
end;

end;

procedure Tfrmimppla.imprimirClick(Sender: TObject);
var
i:integer;
begin
if (numpla.Text='') or (strtoint(numpla.Text)>200)  then
begin
  application.MessageBox('Debe Ingresar el Número de Planillas a Imprimir...(Menor a 200)!','Mensaje al Usuario',16);
  numpla.Text:='1';
  numpla.SetFocus;
end
else
begin
 impani.Animate:=true;
 con_numpla.Close;
 con_numpla.Open;
 if con_numpla.fieldbyname('id').AsFloat=0 then
    npla:=con_numpla.fieldbyname('id').AsFloat+1
 else
    npla:=con_numpla.fieldbyname('id').AsFloat;

 for i:=1 to strtoint(numpla.Text) do
 begin
      ppn1.Text:=floattostr(npla);
      ppn2.Text:=floattostr(npla);
      ppn3.Text:=floattostr(npla);
      ppn4.Text:=floattostr(npla);
      ppn5.Text:=floattostr(npla);
      ppn6.Text:=floattostr(npla);
      ppn7.Text:=floattostr(npla);
      ppn8.Text:=floattostr(npla);
      pppla.Print;
      npla:=npla+1;
 end;

 tb_numpla.Close;
 tb_numpla.Open;
 tb_numpla.Edit;
 tb_numpla.FieldByName('id').AsFloat:=npla;
 tb_numpla.Post;
 tb_numpla.Close;
 impani.Animate:=false;
end;


end;

procedure Tfrmimppla.FormShow(Sender: TObject);
begin
numpla.Text:='1';
end;

end.
