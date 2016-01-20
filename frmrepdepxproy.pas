unit frmrepdepxproy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppDBPipe, ppParameter, raCodMod, ppModule, daDataModule,
  ppBands, ppCtrls, ppClass, ppVar, jpeg, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, ZAbstractDataset, ZDataset, DB,
  ZAbstractRODataset, StdCtrls, DBCtrls, Buttons;

type
  Tfrmrepescxproy = class(TForm)
    Label3: TLabel;
    bt_salir: TBitBtn;
    BitBtn1: TBitBtn;
    cb_nomproy: TDBComboBox;
    nump: TListBox;
    dataexp: TDataSource;
    con_esxproy: TZReadOnlyQuery;
    con_proy: TZQuery;
    dataproy: TDataSource;
    pprepesxproy: TppReport;
    ppParameterList1: TppParameterList;
    pppro: TppDBPipeline;
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
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    ppVariable1: TppVariable;
    ppLabel10: TppLabel;
    ppVariable2: TppVariable;
    daDataModule1: TdaDataModule;
    raCodeModule1: TraCodeModule;
    ppDBText1: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppVariable5: TppVariable;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppVariable6: TppVariable;
    procedure FormShow(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure pprepesxproyStartPage(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrepescxproy: Tfrmrepescxproy;

implementation

{$R *.dfm}

procedure Tfrmrepescxproy.FormShow(Sender: TObject);
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

procedure Tfrmrepescxproy.bt_salirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmrepescxproy.BitBtn1Click(Sender: TObject);
begin
   con_esxproy.Close;
   con_esxproy.Params[0].Asinteger:=strtoint(nump.Items.Strings[cb_nomproy.itemindex]);
   con_esxproy.Open;
   pprepesxproy.Print;
end;

procedure Tfrmrepescxproy.pprepesxproyStartPage(Sender: TObject);
begin
  ppvariable1.Value:=0;
  ppvariable2.Value:=0;
  ppvariable5.Value:=0;
end;

end.
