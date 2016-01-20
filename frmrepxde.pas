unit frmrepxde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppStrtch, ppMemo, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls, Buttons,
  ComCtrls, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner, jpeg;

type
  Tfrmrepxdep = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    bt_salir: TBitBtn;
    BitBtn1: TBitBtn;
    con_em: TZQuery;
    dataem: TDataSource;
    ppdataem: TppDBPipeline;
    pplista: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine3: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppLabel15: TppLabel;
    ppMemo1: TppMemo;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine4: TppLine;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLine6: TppLine;
    ppLine9: TppLine;
    ppLabel28: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    dxDBGrid1: TdxDBGrid;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    con_dep: TZQuery;
    datadep: TDataSource;
    dxDBGrid1COD: TdxDBGridMaskColumn;
    dxDBGrid1NOMBRE: TdxDBGridMaskColumn;
    ppLabel25: TppLabel;
    ppDBText7: TppDBText;
    ppLabel29: TppLabel;
    ppDBText8: TppDBText;
    procedure bt_salirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    function  esnum(NumStr : string) : bool;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrepxdep: Tfrmrepxdep;

implementation

uses frmacces, frmbus;

{$R *.dfm}

function Tfrmrepxdep.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
        end;
end;


procedure Tfrmrepxdep.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmrepxdep.FormShow(Sender: TObject);
begin
fecha1.Date:=date;
fecha2.Date:=date;
con_dep.Open;
end;

procedure Tfrmrepxdep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
con_dep.Close;
end;

procedure Tfrmrepxdep.BitBtn2Click(Sender: TObject);
begin
 frmbuscar.ShowModal;
  if esnum(frmbuscar.bus.Text) then
  begin
    con_dep.Locate('cod',frmbuscar.bus.Text,[loPartialKey]);
  end
  else
  begin
    con_dep.Locate('nombre',frmbuscar.bus.Text,[loPartialKey]);
  end;

end;

procedure Tfrmrepxdep.BitBtn1Click(Sender: TObject);
begin
           con_em.Close;
           con_em.Params[0].AsDate:=fecha1.Date;
           con_em.Params[1].AsDate:=fecha2.Date;
           con_em.Params[2].AsInteger:=con_dep.fieldbyname('cod').asinteger;
           con_em.Open;
           pplista.Print;
end;

end.
