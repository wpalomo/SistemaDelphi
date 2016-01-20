unit frmrepproyeccionpae;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, StdCtrls, ExtCtrls, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, Buttons, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands,
  ppCache, ppModule, raCodMod, ppCtrls, ppVar, jpeg, ppPrnabl, RxCalc;

type
  Tfrmpaeproy = class(TForm)
    con_proypae: TZQuery;
    GroupBox2: TGroupBox;
    dh1: TEdit;
    ck1: TRadioButton;
    ck2: TRadioButton;
    ck3: TRadioButton;
    ck4: TRadioButton;
    ck8: TRadioButton;
    ck7: TRadioButton;
    ck6: TRadioButton;
    ck5: TRadioButton;
    ck12: TRadioButton;
    ck11: TRadioButton;
    ck10: TRadioButton;
    ck9: TRadioButton;
    GroupBox1: TGroupBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb5: TRadioButton;
    rb4: TRadioButton;
    BitBtn3: TBitBtn;
    grid_proy: TdxDBGrid;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    pprepproypae: TppReport;
    ppdbproypae: TppDBPipeline;
    dataproypae: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppmes: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppdh: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppLabel9: TppLabel;
    pptot: TppLabel;
    ppVariable1: TppVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppVariable3: TppVariable;
    raCodeModule1: TraCodeModule;
    grid_proyNOMBRE: TdxDBGridMaskColumn;
    grid_proymunicipio: TdxDBGridMaskColumn;
    grid_proynom: TdxDBGridMaskColumn;
    grid_proyMAT_PRO: TdxDBGridMaskColumn;
    grid_proymonto: TdxDBGridMaskColumn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    calculadora: TRxCalculator;
    BitBtn6: TBitBtn;
    rb6: TRadioButton;
    rb7: TRadioButton;
    rb8: TRadioButton;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure dh1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ppLabel1Print(Sender: TObject);
    procedure ppLabel11Print(Sender: TObject);
    procedure ppLabel9Print(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure grid_proymontoGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpaeproy: Tfrmpaeproy;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmpaeproy.BitBtn3Click(Sender: TObject);
begin
   if dh1.Text='' then
  begin
     dh1.SetFocus;
  end
  else
  begin
     if rb1.Checked then
     begin
       con_proypae.Close;
       con_proypae.Params[0].Asfloat:=5.5;
       con_proypae.Params[1].AsInteger:=strtoint(dh1.Text);
       con_proypae.Params[2].Asfloat:=1;
       con_proypae.Open;
     end
     else
     begin
      if rb2.Checked then
      begin
       con_proypae.Close;
       con_proypae.Params[0].Asfloat:=5.0;
       con_proypae.Params[1].AsInteger:=strtoint(dh1.Text);
       con_proypae.Params[2].Asfloat:=2;
       con_proypae.Open;
      end
      else
      begin
        if rb3.Checked then
        begin
          con_proypae.Close;
          con_proypae.Params[0].Asfloat:=5.0;
          con_proypae.Params[1].AsInteger:=strtoint(dh1.Text);
          con_proypae.Params[2].Asfloat:=3;
          con_proypae.Open;
        end
        else
        begin
          if rb4.Checked then
          begin
            con_proypae.Close;
            con_proypae.Params[0].Asfloat:=6.5;
            con_proypae.Params[1].AsInteger:=strtoint(dh1.Text);
            con_proypae.Params[2].Asfloat:=4;
            con_proypae.Open;
          end
          else
          begin
            if rb5.Checked then
            begin
              con_proypae.Close;
              con_proypae.Params[0].Asfloat:=4;
              con_proypae.Params[1].AsInteger:=strtoint(dh1.Text);
              con_proypae.Params[2].Asfloat:=5;
              con_proypae.Open;
            end

            //******
          else
          begin
            if rb6.Checked then
            begin
              con_proypae.Close;
              con_proypae.Params[0].Asfloat:=3.5;
              con_proypae.Params[1].AsInteger:=strtoint(dh1.Text);
              con_proypae.Params[2].Asfloat:=7;
              con_proypae.Open;

          end
          else
          begin
            if rb7.Checked then
            begin
              con_proypae.Close;
              con_proypae.Params[0].Asfloat:=3.0;
              con_proypae.Params[1].AsInteger:=strtoint(dh1.Text);
              con_proypae.Params[2].Asfloat:=8;
              con_proypae.Open;
          end
          else
          begin
            if rb8.Checked then
            begin
              con_proypae.Close;
              con_proypae.Params[0].Asfloat:=4.0;
              con_proypae.Params[1].AsInteger:=strtoint(dh1.Text);
              con_proypae.Params[2].Asfloat:=9;
              con_proypae.Open;
            end;
           end;
           end;
           end;
 
            //******
          end;
        end;
      end;
    end;
   end;
end;

procedure Tfrmpaeproy.dh1KeyPress(Sender: TObject; var Key: Char);
begin
case key of
     #8:;
     #48..#57:;
     #13:;
end;
end;

procedure Tfrmpaeproy.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmpaeproy.BitBtn2Click(Sender: TObject);
begin
  pprepproypae.Print;
end;

procedure Tfrmpaeproy.ppLabel1Print(Sender: TObject);
begin
if ck1.Checked then
ppmes.Text:='ENERO';
if ck2.Checked then
ppmes.Text:='FEBRERO';
if ck3.Checked then
ppmes.Text:='MARZO';
if ck4.Checked then
ppmes.Text:='ABRIL';
if ck5.Checked then
ppmes.Text:='MAYO';
if ck6.Checked then
ppmes.Text:='JUNIO';
if ck7.Checked then
ppmes.Text:='JULIO';
if ck8.Checked then
ppmes.Text:='AGOSTO';
if ck9.Checked then
ppmes.Text:='SEPTIEMBRE';
if ck10.Checked then
ppmes.Text:='OCTUBRE';
if ck11.Checked then
ppmes.Text:='NOVIEMBRE';
if ck12.Checked then
ppmes.Text:='DICIEMBRE';
end;

procedure Tfrmpaeproy.ppLabel11Print(Sender: TObject);
begin
ppdh.Text:=dh1.Text;
end;

procedure Tfrmpaeproy.ppLabel9Print(Sender: TObject);
begin
  pptot.Text:= formatfloat('#,##0.00',ppvariable3.AsDouble);
 // pptotf.Text:= formatfloat('#,##0.00',ppvariable4.AsDouble);

end;

procedure Tfrmpaeproy.BitBtn6Click(Sender: TObject);
begin
 calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmpaeproy.grid_proymontoGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
//if atext<>'' then
// Atext:=formatfloat('#,##0.00',Anode.Values[4]/2);
end;

end.
