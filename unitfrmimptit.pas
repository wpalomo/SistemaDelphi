unit unitfrmimptit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ppDB, ppDBPipe, ppCtrls, ppBands, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport;

type
  Tfrmimptit = class(TForm)
    bt_imp: TBitBtn;
    valor: TComboBox;
    bt_salir: TBitBtn;
    ppreptit: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    pptitulo: TppDBPipeline;
    con_titmr_imp: TZQuery;
    datatitumrimp: TDataSource;
    Label14: TLabel;
    mun: TComboBox;
    Label1: TLabel;
    ppDBText12: TppDBText;
    ppLabel1: TppLabel;
    procedure bt_impClick(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure valorKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure munKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmimptit: Tfrmimptit;

implementation

uses frmacces, frmtitulosmribas;

{$R *.dfm}

procedure Tfrmimptit.bt_impClick(Sender: TObject);
begin

case valor.ItemIndex of
0:
   begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=200000;
   con_titmr_imp.Params[1].AsInteger:=300000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;

 1:
   begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=600000;
   con_titmr_imp.Params[1].AsInteger:=700000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 2:
   begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=700000;
   con_titmr_imp.Params[1].AsInteger:=800000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 3:
   begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=800000;
   con_titmr_imp.Params[1].AsInteger:=900000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
  4:
   begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=900000;
   con_titmr_imp.Params[1].AsInteger:=1000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;

 5:
   begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=1000000;
   con_titmr_imp.Params[1].AsInteger:=2000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 6:
    begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=2000000;
   con_titmr_imp.Params[1].AsInteger:=3000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 7:
    begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=3000000;
   con_titmr_imp.Params[1].AsInteger:=4000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 8:
      begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=4000000;
   con_titmr_imp.Params[1].AsInteger:=5000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 9:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=5000000;
   con_titmr_imp.Params[1].AsInteger:=6000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;

 10:
   begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=6000000;
   con_titmr_imp.Params[1].AsInteger:=7000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;

 11:
   begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=7000000;
   con_titmr_imp.Params[1].AsInteger:=8000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;

 12:
    begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=8000000;
   con_titmr_imp.Params[1].AsInteger:=9000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 13:
    begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=9000000;
   con_titmr_imp.Params[1].AsInteger:=10000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 14:
     begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=10000000;
   con_titmr_imp.Params[1].AsInteger:=11000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 15:
     begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=11000000;
   con_titmr_imp.Params[1].AsInteger:=12000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 16:
      begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=12000000;
   con_titmr_imp.Params[1].AsInteger:=13000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 17:
      begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=13000000;
   con_titmr_imp.Params[1].AsInteger:=14000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 18:
      begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=14000000;
   con_titmr_imp.Params[1].AsInteger:=15000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 19:
      begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=15000000;
   con_titmr_imp.Params[1].AsInteger:=16000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 20:
      begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=16000000;
   con_titmr_imp.Params[1].AsInteger:=17000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 21:
      begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=17000000;
   con_titmr_imp.Params[1].AsInteger:=18000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 22:
      begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=18000000;
   con_titmr_imp.Params[1].AsInteger:=19000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 23:
      begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=19000000;
   con_titmr_imp.Params[1].AsInteger:=20000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 24:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=20000000;
   con_titmr_imp.Params[1].AsInteger:=21000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 25:
         begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=21000000;
   con_titmr_imp.Params[1].AsInteger:=22000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 26:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=22000000;
   con_titmr_imp.Params[1].AsInteger:=23000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 27:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=23000000;
   con_titmr_imp.Params[1].AsInteger:=24000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 28:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=24000000;
   con_titmr_imp.Params[1].AsInteger:=25000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 29:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=25000000;
   con_titmr_imp.Params[1].AsInteger:=26000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 30:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=26000000;
   con_titmr_imp.Params[1].AsInteger:=27000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 31:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=27000000;
   con_titmr_imp.Params[1].AsInteger:=28000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 32:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=28000000;
   con_titmr_imp.Params[1].AsInteger:=29000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 33:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=29000000;
   con_titmr_imp.Params[1].AsInteger:=30000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 34:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=30000000;
   con_titmr_imp.Params[1].AsInteger:=31000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 35:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=80000000;
   con_titmr_imp.Params[1].AsInteger:=81000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 36:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=81000000;
   con_titmr_imp.Params[1].AsInteger:=82000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 37:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=82000000;
   con_titmr_imp.Params[1].AsInteger:=83000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 38:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=83000000;
   con_titmr_imp.Params[1].AsInteger:=84000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 39:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=84000000;
   con_titmr_imp.Params[1].AsInteger:=85000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;
 40:
       begin
   con_titmr_imp.Close;
   con_titmr_imp.Params[0].AsInteger:=85000000;
   con_titmr_imp.Params[1].AsInteger:=86000000;
   con_titmr_imp.Params[2].AsString:=mun.Text;
   con_titmr_imp.Open;
   ppreptit.Print;
   end;

end;



close;
end;

procedure Tfrmimptit.bt_salirClick(Sender: TObject);
begin
 close;
end;

procedure Tfrmimptit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   con_titmr_imp.Close;
end;

procedure Tfrmimptit.valorKeyPress(Sender: TObject; var Key: Char);
begin
   if key<>#13 then
      key:=#0;
end;

procedure Tfrmimptit.FormShow(Sender: TObject);
begin
valor.SetFocus;
end;

procedure Tfrmimptit.munKeyPress(Sender: TObject; var Key: Char);
begin
  if key<>#13 then
      key:=#0;
end;

end.
