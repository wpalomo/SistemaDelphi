unit frmrepcred2;

interface

uses
  Windows,Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ppDB, ppDBPipe, ppBands, ppCtrls, jpeg,
  ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppStrtch,
  ppRichTx, ppMemo, Mask, ToolEdit, CurrEdit, ppRegion;

type
  Tfrmcred2 = class(TForm)
    ppreping: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppImage2: TppImage;
    ppImage6: TppImage;
    ppLabel56: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppLabel37: TppLabel;
    ppLabel42: TppLabel;
    ppDBText13: TppDBText;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppDBText15: TppDBText;
    ppLabel52: TppLabel;
    ppLabel54: TppLabel;
    pprepin: TppLabel;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel44: TppLabel;
    ppDBText9: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppLabel14: TppLabel;
    ppDBText8: TppDBText;
    ppLabel99: TppLabel;
    ppFooterBand2: TppFooterBand;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppDBText20: TppDBText;
    pptm: TppDBPipeline;
    con_em: TZQuery;
    dataem: TDataSource;
    BitBtn1: TBitBtn;
    bt_salir: TBitBtn;
    fecha1: TDateTimePicker;
    ctm: TComboBox;
    fecha2: TDateTimePicker;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    ppDBText10: TppDBText;
    ppLabel35: TppLabel;
    ppDBText11: TppDBText;
    ppLabel55: TppLabel;
    ppLabel63: TppLabel;
    ppDBText21: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppRichText1: TppRichText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppRichText2: TppRichText;
    repcredtit: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppImage3: TppImage;
    ppLabel8: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    con_tit: TZQuery;
    datatit: TDataSource;
    ppDBPipeline1: TppDBPipeline;
    ppLabel48: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLine1: TppLine;
    ppMemo7: TppMemo;
    ppMemo8: TppMemo;
    ppLine2: TppLine;
    ppLabel23: TppLabel;
    ppLine3: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine13: TppLine;
    ld: TLabel;
    lm: TLabel;
    dia: TRxCalcEdit;
    mes: TComboBox;
    ppDBText12: TppDBText;
    ppLabel24: TppLabel;
    ppLine14: TppLine;
    ppDBText14: TppDBText;
    ppMemo1: TppMemo;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel53: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLine11: TppLine;
    ppLine12: TppLine;
    d: TppLabel;
    m: TppLabel;
    res1: TppRegion;
    ppLabel9: TppLabel;
    res2: TppRegion;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    ppLabel38: TppLabel;
    d1: TppLabel;
    m1: TppLabel;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLabel43: TppLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure ctmKeyPress(Sender: TObject; var Key: Char);
    procedure mesKeyPress(Sender: TObject; var Key: Char);
    procedure ctmEnter(Sender: TObject);
    procedure ctmExit(Sender: TObject);
    procedure ppLabel48Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcred2: Tfrmcred2;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmcred2.FormShow(Sender: TObject);
begin
ld.Visible:=false;
lm.Visible:=false;

dia.Visible:=false;
mes.Visible:=false;

dia.Clear;

fecha1.Date:=date;
fecha2.Date:=date;
ctm.ItemIndex:=0;
end;

procedure Tfrmcred2.BitBtn1Click(Sender: TObject);
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
        5:
          begin
           con_tit.Close;
           con_tit.Params[0].AsDate:=fecha1.Date;
           con_tit.Params[1].AsDate:=fecha2.Date;
           con_tit.Open;
           repcredtit.Print;
          end;
          end;
      { 1:
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
         end;}

 
end;

procedure Tfrmcred2.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmcred2.ctmKeyPress(Sender: TObject; var Key: Char);
begin
 if key<>#13 then
    key:=#0;
end;

procedure Tfrmcred2.mesKeyPress(Sender: TObject; var Key: Char);
begin
if key<>#13 then
    key:=#0;
end;

procedure Tfrmcred2.ctmEnter(Sender: TObject);
begin
           ld.Visible:=false;
           lm.Visible:=false;
           dia.Visible:=false;
           mes.Visible:=false;

end;

procedure Tfrmcred2.ctmExit(Sender: TObject);
begin
 if ctm.Text='TITULARIDAD' then
begin
           ld.Visible:=true;
           lm.Visible:=true;
           dia.Visible:=true;
           mes.Visible:=true;
           mes.ItemIndex:=0;
           dia.SetFocus;
end;
end;

procedure Tfrmcred2.ppLabel48Print(Sender: TObject);

begin

           if  con_tit.FieldByName('obs_c').AsString='2' then
           begin
             res2.Visible:=true;
             res1.Visible:=false;
             d1.Text:=dia.Text;
             m1.Text:=mes.Text;
           end;

           if  con_tit.FieldByName('obs_c').AsString='1' then
           begin
              res1.Visible:=true;
              res2.Visible:=false;
              d.Text:=dia.Text;
              m.Text:=mes.Text;
           end;
end;

end.
