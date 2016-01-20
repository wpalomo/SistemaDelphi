unit frmrepchequeen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppCtrls, ppVar, jpeg, ppPrnabl, ppBands, ppCache,
  ppModule, raCodMod;

type
  Tfrmrepcheqen = class(TForm)
    fecha2: TDateTimePicker;
    fecha1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    bt_salir: TBitBtn;
    con_cheqen: TZQuery;
    datacheqen: TDataSource;
    pprepche: TppReport;
    ppcheqen: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    eti: TppLabel;
    desde: TppLabel;
    hasta: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel7: TppLabel;
    ppDBText4: TppDBText;
    ppLabel9: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel10: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine1: TppLine;
    ppShape1: TppShape;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    raCodeModule1: TraCodeModule;
    ppLabel13: TppLabel;
    ppLine9: TppLine;
    ppDBText10: TppDBText;
    usu: TppLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure ppLabel2Print(Sender: TObject);
    procedure ppLabel12Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrepcheqen: Tfrmrepcheqen;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmrepcheqen.FormShow(Sender: TObject);
begin
fecha1.Date:=date;
fecha2.Date:=date;


end;

procedure Tfrmrepcheqen.BitBtn1Click(Sender: TObject);
begin
con_cheqen.Close;
con_cheqen.Params[0].AsDate:=fecha1.Date;
con_cheqen.Params[1].AsDate:=fecha2.Date;
con_cheqen.Open;
if not con_cheqen.IsEmpty then
begin
  pprepche.Print;
end;
end;

procedure Tfrmrepcheqen.bt_salirClick(Sender: TObject);
begin
con_cheqen.Close;
close;
end;

procedure Tfrmrepcheqen.ppLabel2Print(Sender: TObject);
begin
desde.Text:= datetostr(fecha1.date);
hasta.Text:= datetostr(fecha2.Date);
end;

procedure Tfrmrepcheqen.ppLabel12Print(Sender: TObject);
begin
 usu.Text:=frmacceso.usuario.Text;
end;

end.
