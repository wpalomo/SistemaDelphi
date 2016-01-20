unit frmrepmxf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppDBPipe, ppParameter, ppModule, raCodMod, ppCtrls,
  ppBands, ppClass, ppVar, jpeg, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, ComCtrls, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  Tfrmrepmovf = class(TForm)
    bt_salir: TBitBtn;
    GroupBox6: TGroupBox;
    fec_del: TDateTimePicker;
    GroupBox7: TGroupBox;
    fec_al: TDateTimePicker;
    BitBtn1: TBitBtn;
    con_mov: TZQuery;
    dataconmov: TDataSource;
    pprepf: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppImage2: TppImage;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppfecd: TppLabel;
    ppfech: TppLabel;
    ppDBPipeline1: TppDBPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    raCodeModule1: TraCodeModule;
    ppLabel3: TppLabel;
    pptotalg: TppLabel;
    ppVariable2: TppVariable;
    ppVariable3: TppVariable;
    procedure ppLabel4Print(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ppGroupFooterBand1AfterPrint(Sender: TObject);
    procedure ppFooterBand2AfterPrint(Sender: TObject);
    procedure ppFooterBand2BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrepmovf: Tfrmrepmovf;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmrepmovf.ppLabel4Print(Sender: TObject);
begin
  ppfecd.Text:=datetostr(fec_del.Date);
  ppfech.Text:=datetostr(fec_al.Date);
end;

procedure Tfrmrepmovf.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmrepmovf.BitBtn1Click(Sender: TObject);
begin
con_mov.Close;
con_mov.Params[0].AsDate:=fec_del.Date;
con_mov.Params[1].AsDate:=fec_al.Date;
con_mov.Open;
pprepf.Print;
end;

procedure Tfrmrepmovf.FormShow(Sender: TObject);
begin
   fec_del.Date:=date;
   fec_al.Date:=date;
end;

procedure Tfrmrepmovf.ppGroupFooterBand1AfterPrint(Sender: TObject);
begin
  ppvariable2.Clear;
end;

procedure Tfrmrepmovf.ppFooterBand2AfterPrint(Sender: TObject);
begin
  ppvariable3.Clear;
end;

procedure Tfrmrepmovf.ppFooterBand2BeforePrint(Sender: TObject);
begin
 pptotalg.Text:=floattostr(ppvariable3.Value)
end;

end.
