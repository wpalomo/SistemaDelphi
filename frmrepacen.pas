unit frmrepacen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ppDB, ppDBPipe, ppParameter,
  ppModule, raCodMod, ppBands, ppCtrls, ppClass, ppVar, jpeg, ppPrnabl,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, DB, ZAbstractRODataset,
  ZDataset, DBCtrls, ZAbstractDataset;

type
  Tfrmrepace = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    BitBtn1: TBitBtn;
    bt_salir: TBitBtn;
    Label3: TLabel;
    dataocxsem: TDataSource;
    con_ocxsem: TZReadOnlyQuery;
    pprepxsem: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape19: TppShape;
    ppImage1: TppImage;
    ppLabel3: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppnum: TppVariable;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel10: TppLabel;
    ppDBText21: TppDBText;
    nula: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape8: TppShape;
    ppLine2: TppLine;
    ppLabel38: TppLabel;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel37: TppLabel;
    ppLine6: TppLine;
    ppLabel42: TppLabel;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine10: TppLine;
    ppLabel12: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppnnula: TppVariable;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppnnula1: TppVariable;
    raCodeModule1: TraCodeModule;
    ppParameterList1: TppParameterList;
    pppro: TppDBPipeline;
    ppLabel8: TppLabel;
    ppm: TppDBText;
    ppLabel2: TppLabel;
    ppLine3: TppLine;
    totoc: TppVariable;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    pptotoca: TppVariable;
    pptotoca1: TppVariable;
    ppLabel4: TppLabel;
    ppLine5: TppLine;
    ppLabel11: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    con_mun: TZQuery;
    numm: TListBox;
    cb_nomun: TDBComboBox;
    datamun: TDataSource;
    Label4: TLabel;
    ppLabel14: TppLabel;
    ppDBText2: TppDBText;
    procedure bt_salirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ppbsf1Print(Sender: TObject);
    procedure ppbsfPrint(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrepace: Tfrmrepace;

implementation

{$R *.dfm}

procedure Tfrmrepace.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmrepace.FormShow(Sender: TObject);
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

procedure Tfrmrepace.ppbsf1Print(Sender: TObject);
begin
//ppbsf1.Text:= formatfloat('#,##0.00',(con_ocxsem.fieldbyname('totaloc').AsFloat/1000));
end;

procedure Tfrmrepace.ppbsfPrint(Sender: TObject);
begin
//ppbsf.Text:= formatfloat('#,##0.00',(totoc.Value/1000));

end;

procedure Tfrmrepace.BitBtn1Click(Sender: TObject);
begin
con_ocxsem.Close;
con_ocxsem.Params[0].AsDate:=fecha1.Date;
con_ocxsem.Params[1].AsDate:=fecha2.Date;
con_ocxsem.Params[2].Asstring:=cb_nomun.Text;
con_ocxsem.Open;
if con_ocxsem.IsEmpty then
begin
  application.MessageBox('No existen O/C correspondientes a esta Semana...!','Mensaje al Usuario',16);
end
else
begin
  pprepxsem.Print;
end;
end;

procedure Tfrmrepace.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 con_ocxsem.Close;
end;

end.
