unit frmreppagxmun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppParameter, ppModule, raCodMod, ppCtrls, ppBands, ppVar, jpeg,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ppDB, ppComm, ppRelatv, ppDBPipe, StdCtrls,
  DBCtrls, Buttons, ComCtrls;

type
  Tfrmreppagxmuni = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    BitBtn1: TBitBtn;
    bt_salir: TBitBtn;
    cb_nomun: TDBComboBox;
    conso: TppDBPipeline;
    con_mun: TZQuery;
    datamun: TDataSource;
    pprepconso: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppImage2: TppImage;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppdesde: TppLabel;
    ppLabel12: TppLabel;
    pphasta: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppShape2: TppShape;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape4: TppShape;
    ppDBText1: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand2: TppFooterBand;
    raCodeModule1: TraCodeModule;
    ppParameterList1: TppParameterList;
    con_conso: TZQuery;
    dataconso: TDataSource;
    ppShape1: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel11: TppLabel;
    t2: TppLabel;
    t3: TppLabel;
    t4: TppLabel;
    t5: TppLabel;
    t1: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    m1: TppVariable;
    m2: TppVariable;
    m3: TppVariable;
    m4: TppVariable;
    m5: TppVariable;
    imp2: TppVariable;
    imp1: TppVariable;
    imp4: TppVariable;
    imp3: TppVariable;
    imp5: TppVariable;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    GroupBox1: TGroupBox;
    ck_g: TRadioButton;
    ck_s: TRadioButton;
    ppLabel4: TppLabel;
    tt: TppLabel;
    ppLabel5: TppLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure ppLabel10Print(Sender: TObject);
    procedure ppLabel7Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmreppagxmuni: Tfrmreppagxmuni;

implementation

{$R *.dfm}

procedure Tfrmreppagxmuni.FormShow(Sender: TObject);
begin
fecha1.Date:=date;
   fecha2.Date:=date;
   ck_s.Checked:=true;
   cb_nomun.Clear;
   con_mun.Close;
   con_mun.Open;
   con_mun.FindFirst;
   while not con_mun.Eof do
   begin
     cb_nomun.Items.Append(con_mun.fieldbyname('nombre').AsString);
     con_mun.Next;
   end;
     cb_nomun.ItemIndex:=0;
end;

procedure Tfrmreppagxmuni.BitBtn1Click(Sender: TObject);
begin
if ck_s.Checked then
begin
 con_conso.Close;
 con_conso.SQL.Text:='select mun,cod_proy,nom_proy,sum(totaloc),sum(totalimp) from oc where pagada="S" and (fec_del=:fec1 AND fec_al=:fec2) and mun=:mun group by mun,cod_proy order by nom_proy';
 con_conso.Params[0].AsDate:=fecha1.Date;
 con_conso.Params[1].AsDate:=fecha2.Date;
 con_conso.Params[2].Asstring:=cb_nomun.Text;
 con_conso.Open;
 if not con_conso.IsEmpty then
 begin
    pprepconso.Print;
 end;
end
else
begin
 if ck_g.Checked then
 begin
   con_conso.Close;
   con_conso.SQL.Text:='select mun,cod_proy,nom_proy,sum(totaloc),sum(totalimp) from oc where pagada="S" and (fec_ela between :fec1 AND :fec2) and mun=:mun group by mun,cod_proy order by nom_proy';
   con_conso.Params[0].AsDate:=fecha1.Date;
   con_conso.Params[1].AsDate:=fecha2.Date;
   con_conso.Params[2].Asstring:=cb_nomun.Text;
   con_conso.Open;
   if not con_conso.IsEmpty then
   begin
    pprepconso.Print;
   end;
 end;
end;
end;

procedure Tfrmreppagxmuni.bt_salirClick(Sender: TObject);
begin
 con_conso.Close;
 close;
end;

procedure Tfrmreppagxmuni.ppLabel10Print(Sender: TObject);
begin
  ppdesde.Caption:=datetostr(fecha1.date);
  pphasta.Caption:=datetostr(fecha2.Date);
end;

procedure Tfrmreppagxmuni.ppLabel7Print(Sender: TObject);
begin
  t1.Caption:=formatfloat('#,##0.00',m1.value);
   t2.Caption:=formatfloat('#,##0.00',m2.value);
   t3.Caption:=formatfloat('#,##0.00',m3.value);
   t4.Caption:=formatfloat('#,##0.00',m4.value);
   t5.Caption:=formatfloat('#,##0.00',m5.value);
   tt.Caption:=formatfloat('#,##0.00',(m1.value+m2.value+m3.value+m4.value+m5.value));


end;

end.
