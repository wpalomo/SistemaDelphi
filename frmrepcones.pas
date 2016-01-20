unit frmrepcones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppVar, ppBands, ppCtrls, RxGIF, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls, Buttons,
  ComCtrls, myChkBox, jpeg;

type
  Tfrmrepce = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    bt_salir: TBitBtn;
    BitBtn1: TBitBtn;
    con_taq: TZQuery;
    datataq: TDataSource;
    ppdatataq: TppDBPipeline;
    pplista: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel9: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    myDBCheckBox1: TmyDBCheckBox;
    myDBCheckBox2: TmyDBCheckBox;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    Label3: TLabel;
    cb_op: TComboBox;
    ppLabel13: TppLabel;
    ppDBText8: TppDBText;
    ppLabel2: TppLabel;
    num: TppLabel;
    con_tott: TZQuery;
    datatott: TDataSource;
    ppLabel14: TppLabel;
    procedure bt_salirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure numPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrepce: Tfrmrepce;

implementation

{$R *.dfm}

procedure Tfrmrepce.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmrepce.FormShow(Sender: TObject);
begin
fecha1.Date:=date;
fecha2.Date:=date;
end;

procedure Tfrmrepce.BitBtn1Click(Sender: TObject);
begin
           con_taq.Close;
           con_taq.Params[0].AsDate:=fecha1.Date;
           con_taq.Params[1].AsDate:=fecha2.Date;
           con_taq.Params[2].AsString:=cb_op.Text;
           con_taq.Open;
           pplista.Print;
end;

procedure Tfrmrepce.numPrint(Sender: TObject);
begin
  con_tott.Close;
  con_tott.Params[0].AsDate:=fecha1.Date;
  con_tott.Params[1].AsDate:=fecha2.Date;
  con_tott.Params[2].asstring:=cb_op.Text;
  con_tott.Open;
  if con_tott.RecordCount>0 then
     num.Caption:=con_tott.fieldbyname('veces').asstring;
  con_tott.Close;
end;

end.
