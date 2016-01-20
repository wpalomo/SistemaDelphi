unit frmcred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppStrtch, ppMemo, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls, Buttons,
  ComCtrls, OleServer, WordXP, jpeg;

type
  Tfrmcre = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    bt_salir: TBitBtn;
    BitBtn1: TBitBtn;
    con_em: TZQuery;
    dataem: TDataSource;
    pptm: TppDBPipeline;
    Label3: TLabel;
    ctm: TComboBox;
    pprepeg: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText3: TppDBText;
    ppLabel13: TppLabel;
    ppDBText4: TppDBText;
    e2: TppDBText;
    tc2: TppLabel;
    c2: TppDBText;
    e3: TppDBText;
    tc3: TppLabel;
    c3: TppDBText;
    m1: TppLabel;
    udb1: TppDBText;
    ed1: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppreping: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppImage2: TppImage;
    ppLabel32: TppLabel;
    ppLabel34: TppLabel;
    ppDBText10: TppDBText;
    ppLabel35: TppLabel;
    ppDBText11: TppDBText;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel42: TppLabel;
    ppDBText13: TppDBText;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppDBText15: TppDBText;
    ppLabel48: TppLabel;
    ppLabel52: TppLabel;
    ppLabel54: TppLabel;
    pprepin: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppDBText20: TppDBText;
    ppLabel55: TppLabel;
    ppLabel63: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLabel43: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel44: TppLabel;
    pprepca: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppImage3: TppImage;
    ppLabel45: TppLabel;
    ppLabel51: TppLabel;
    ppDBText12: TppDBText;
    ppLabel53: TppLabel;
    ppDBText14: TppDBText;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppDBText16: TppDBText;
    ppDetailBand3: TppDetailBand;
    ppLabel69: TppLabel;
    ppLabel71: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel82: TppLabel;
    ppFooterBand3: TppFooterBand;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppDBText26: TppDBText;
    pprepmh: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppImage4: TppImage;
    ppLabel89: TppLabel;
    ppLabel91: TppLabel;
    ppDBText27: TppDBText;
    ppLabel92: TppLabel;
    ppDBText28: TppDBText;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppDBText29: TppDBText;
    ppDetailBand4: TppDetailBand;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel111: TppLabel;
    ppFooterBand4: TppFooterBand;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppDBText34: TppDBText;
    ppLabel130: TppLabel;
    ppDBText41: TppDBText;
    u1: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppDBText19: TppDBText;
    ppdataem: TppDBPipeline;
    u2: TppLabel;
    ed2: TppLabel;
    udb2: TppDBText;
    m2: TppLabel;
    u3: TppLabel;
    ed3: TppLabel;
    udb3: TppDBText;
    m3: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppImage5: TppImage;
    ppImage6: TppImage;
    ppDBText9: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText7: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppImage7: TppImage;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppLabel20: TppLabel;
    ppLabel50: TppLabel;
    ppImage8: TppImage;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppLabel73: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppLabel14: TppLabel;
    ppDBText8: TppDBText;
    ppLabel15: TppLabel;
    ppLabel18: TppLabel;
    ppDBText17: TppDBText;
    ppLabel19: TppLabel;
    ppDBText18: TppDBText;
    ppLabel33: TppLabel;
    ppDBText24: TppDBText;
    ppLabel49: TppLabel;
    ppDBText25: TppDBText;
    ppLabel67: TppLabel;
    ppDBText39: TppDBText;
    ppLabel68: TppLabel;
    ppLabel70: TppLabel;
    ppDBText40: TppDBText;
    ppLabel72: TppLabel;
    ppLabel77: TppLabel;
    ppLabel90: TppLabel;
    ppLabel96: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel102: TppLabel;
    ppDBText46: TppDBText;
    ppLabel106: TppLabel;
    ppDBText50: TppDBText;
    ppLabel107: TppLabel;
    ppDBText51: TppDBText;
    ppLabel108: TppLabel;
    ppDBText52: TppDBText;
    ppLabel109: TppLabel;
    ppDBText53: TppDBText;
    ppLabel110: TppLabel;
    ppLabel118: TppLabel;
    ppDBText54: TppDBText;
    ppLabel56: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppreptra: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppImage9: TppImage;
    ppLabel101: TppLabel;
    ppLabel119: TppLabel;
    ppDBText33: TppDBText;
    ppLabel123: TppLabel;
    ppDBText44: TppDBText;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppDBText45: TppDBText;
    ppImage10: TppImage;
    ppLabel127: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppDBText55: TppDBText;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppDBText62: TppDBText;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppLabel137: TppLabel;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppFooterBand5: TppFooterBand;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    ppDBText71: TppDBText;
    ppLabel143: TppLabel;
    ppDBText70: TppDBText;
    ppLabel138: TppLabel;
    ppLabel152: TppLabel;
    procedure FormShow(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ctmKeyPress(Sender: TObject; var Key: Char);
    procedure ppdataemDataChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcre: Tfrmcre;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmcre.FormShow(Sender: TObject);
begin
fecha1.Date:=date;
fecha2.Date:=date;
ctm.ItemIndex:=0;
end;

procedure Tfrmcre.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmcre.BitBtn1Click(Sender: TObject);
begin

case ctm.ItemIndex of
       0:
         begin
           con_em.Close;
           con_em.Params[0].AsDate:=fecha1.Date;
           con_em.Params[1].AsDate:=fecha2.Date;
           con_em.Params[2].AsString:=ctm.Text;
           con_em.Open;
           ppreping.Print;
           con_em.Close;
         end;
       1:
          begin
           con_em.Close;
           con_em.Params[0].AsDate:=fecha1.Date;
           con_em.Params[1].AsDate:=fecha2.Date;
           con_em.Params[2].AsString:=ctm.Text;
           con_em.Open;
           pprepca.Print;
           con_em.Close;
         end;

       2:begin
           con_em.Close;
           con_em.Params[0].AsDate:=fecha1.Date;
           con_em.Params[1].AsDate:=fecha2.Date;
           con_em.Params[2].AsString:=ctm.Text;
           con_em.Open;
           pprepmh.Print;
           con_em.Close;
         end;


       3:
         begin
           con_em.Close;
           con_em.Params[0].AsDate:=fecha1.Date;
           con_em.Params[1].AsDate:=fecha2.Date;
           con_em.Params[2].AsString:=ctm.Text;
           con_em.Open;
           pprepeg.Print;
         end;
       4:
         begin
           con_em.Close;
           con_em.Params[0].AsDate:=fecha1.Date;
           con_em.Params[1].AsDate:=fecha2.Date;
           con_em.Params[2].AsString:=ctm.Text;
           con_em.Open;
           ppreptra.Print;
         end;


end;

end;

procedure Tfrmcre.ctmKeyPress(Sender: TObject; var Key: Char);
begin
 if key<>#13 then
    key:=#0;
end;

procedure Tfrmcre.ppdataemDataChange(Sender: TObject);
begin

  if (con_em.FieldByName('cod_dep2').asstring<>'') and (con_em.FieldByName('cod_dep3').asstring='')and (con_em.FieldByName('cod_dep4').asstring='') then
 begin
     e2.Visible:=false;
     c2.Visible:=false;
     tc2.Visible:=false;

     e3.Visible:=false;
     c3.Visible:=false;
     tc3.Visible:=false;
     u1.Visible:=false;
     m1.Visible:=false;
     udb1.Visible:=false;
     ed1.Visible:=false;
     u2.Visible:=false;
     m2.Visible:=false;
     udb2.Visible:=false;
     ed2.Visible:=false;
     u3.visible:=true;
     m3.visible:=true;
     udb3.visible:=true;
     ed3.visible:=true;

 end;

 if (con_em.FieldByName('cod_dep2').asstring<>'') and (con_em.FieldByName('cod_dep3').asstring<>'')and (con_em.FieldByName('cod_dep4').asstring='') then
 begin

     e2.Visible:=true;
     c2.Visible:=true;
     tc2.Visible:=true;

     e3.Visible:=false;
     c3.Visible:=false;
     tc3.Visible:=false;
     u1.Visible:=false;
     m1.Visible:=false;
     udb1.Visible:=false;
     ed1.Visible:=false;
     u2.Visible:=true;
     m2.Visible:=true;
     udb2.Visible:=true;
     ed2.Visible:=true;
     u3.visible:=false;
     m3.visible:=false;
     udb3.visible:=false;
     ed3.visible:=false;

 end;
 if (con_em.FieldByName('cod_dep2').asstring<>'') and (con_em.FieldByName('cod_dep3').asstring<>'')and (con_em.FieldByName('cod_dep4').asstring<>'') then
 begin

     e2.Visible:=true;
     c2.Visible:=true;
     tc2.Visible:=true;
    
     e3.Visible:=true;
     c3.Visible:=true;
     tc3.Visible:=true;
     u1.Visible:=true;
     m1.Visible:=true;
     udb1.Visible:=true;
     ed1.Visible:=true;
     u2.Visible:=false;
     m2.Visible:=false;
     udb2.Visible:=false;
     ed2.Visible:=false;
     u3.visible:=false;
     m3.visible:=false;
     udb3.visible:=false;
     ed3.visible:=false;


 end;
end;

end.
