unit frmrepmatt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppDBPipe, ppParameter, daDataModule, ppModule, raCodMod,
  ppBands, ppClass, ppCtrls, ppVar, jpeg, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, ZAbstractDataset, ZDataset, DB,
  ZAbstractRODataset, StdCtrls, DBCtrls, Buttons;

type
  Tfrmrepmt = class(TForm)
    Label3: TLabel;
    bt_salir: TBitBtn;
    BitBtn1: TBitBtn;
    cb_nomproy: TDBComboBox;
    nump: TListBox;
    con_esxproy: TZReadOnlyQuery;
    dataexp: TDataSource;
    con_proy: TZQuery;
    dataproy: TDataSource;
    pprepesxproy: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape19: TppShape;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppnum: TppVariable;
    ppDBText2: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppLine3: TppLine;
    ppLabel9: TppLabel;
    ppVariable3: TppVariable;
    ppLabel11: TppLabel;
    ppVariable4: TppVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape8: TppShape;
    ppLine2: TppLine;
    ppLabel38: TppLabel;
    ppLabel1: TppLabel;
    ppLabel37: TppLabel;
    ppLine6: TppLine;
    ppLine4: TppLine;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppLabel5: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    ppVariable1: TppVariable;
    ppLabel10: TppLabel;
    ppVariable2: TppVariable;
    raCodeModule1: TraCodeModule;
    daDataModule1: TdaDataModule;
    ppParameterList1: TppParameterList;
    pppro: TppDBPipeline;
    procedure bt_salirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrepmt: Tfrmrepmt;

implementation

{$R *.dfm}

procedure Tfrmrepmt.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmrepmt.BitBtn1Click(Sender: TObject);
begin
   con_esxproy.Close;
   con_esxproy.Params[0].Asinteger:=strtoint(nump.Items.Strings[cb_nomproy.itemindex]);
   con_esxproy.Open;
   pprepesxproy.Print;
end;

procedure Tfrmrepmt.FormShow(Sender: TObject);
begin
cb_nomproy.Clear;
   nump.Clear;
   con_proy.Close;
   con_proy.Open;
   con_proy.FindFirst;
   while not con_proy.Eof do
   begin
     cb_nomproy.Items.Append(con_proy.fieldbyname('nom').AsString);
     nump.Items.Append(con_proy.fieldbyname('id').AsString);
     con_proy.Next;
   end;
     cb_nomproy.ItemIndex:=0;
     nump.ItemIndex:=0;
end;

end.
