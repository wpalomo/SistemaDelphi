unit frmreppencones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppBands, myChkBox, ppCtrls, ppVar, RxGIF, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls, Buttons,
  ComCtrls, jpeg;

type
  Tfrmreppcones = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    bt_salir: TBitBtn;
    BitBtn1: TBitBtn;
    cb_op: TComboBox;
    con_taq: TZQuery;
    datataq: TDataSource;
    ppdatataq: TppDBPipeline;
    pplista: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppLabel5: TppLabel;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel9: TppLabel;
    ppLine2: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    myDBCheckBox1: TmyDBCheckBox;
    myDBCheckBox2: TmyDBCheckBox;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
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
  frmreppcones: Tfrmreppcones;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmreppcones.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmreppcones.FormShow(Sender: TObject);
begin
fecha1.Date:=date;
fecha2.Date:=date;
end;

procedure Tfrmreppcones.BitBtn1Click(Sender: TObject);
begin
           con_taq.Close;
           con_taq.Params[0].AsDate:=fecha1.Date;
           con_taq.Params[1].AsDate:=fecha2.Date;
           con_taq.Params[2].AsString:=cb_op.Text;
           con_taq.Open;
           pplista.Print;
end;

procedure Tfrmreppcones.numPrint(Sender: TObject);
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
