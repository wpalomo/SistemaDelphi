unit frmrepproyeccionmad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ppDB, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppVar, jpeg,
  ppPrnabl, ppBands, ppCache, ppModule, raCodMod, ExtCtrls, RxCalc;

type
  Tfrmproyeccmad = class(TForm)
    GroupBox2: TGroupBox;
    dh1: TEdit;
    BitBtn1: TBitBtn;
    dataproymad: TDataSource;
    con_proymad: TZQuery;
    grid_proy: TdxDBGrid;
    grid_proyNOMBRE: TdxDBGridMaskColumn;
    grid_proymunicipio: TdxDBGridMaskColumn;
    grid_proynom: TdxDBGridMaskColumn;
    grid_proyMAT_PRO: TdxDBGridMaskColumn;
    grid_proynmadres: TdxDBGridMaskColumn;
    grid_proymonto: TdxDBGridMaskColumn;
    GroupBox1: TGroupBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb5: TRadioButton;
    rb4: TRadioButton;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    pprepmadproy: TppReport;
    ppDBPipeline1: TppDBPipeline;
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
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppmes: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppVariable2: TppVariable;
    ppVariable4: TppVariable;
    ppLabel9: TppLabel;
    pptot: TppLabel;
    ppLine1: TppLine;
    raCodeModule1: TraCodeModule;
    ppLabel10: TppLabel;
    ppDBText6: TppDBText;
    Panel1: TPanel;
    Label1: TLabel;
    ppLabel11: TppLabel;
    ppdh: TppLabel;
    calculadora: TRxCalculator;
    BitBtn6: TBitBtn;
    rb6: TRadioButton;
    rb7: TRadioButton;
    rb8: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ppLabel1Print(Sender: TObject);
    procedure ppLabel9Print(Sender: TObject);
    procedure dh1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure ppLabel11Print(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure grid_proymontoGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmproyeccmad: Tfrmproyeccmad;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmproyeccmad.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmproyeccmad.BitBtn3Click(Sender: TObject);
begin
  if dh1.Text='' then
  begin
     dh1.SetFocus;
  end
  else
  begin
     if rb1.Checked then
     begin
       con_proymad.Close;
       con_proymad.Params[0].AsInteger:=40;
       con_proymad.Params[1].AsInteger:=strtoint(dh1.Text);
       con_proymad.Params[2].AsInteger:=1;
       con_proymad.Open;
     end
     else
     begin
      if rb2.Checked then
      begin
       con_proymad.Close;
       con_proymad.Params[0].AsInteger:=40;
       con_proymad.Params[1].AsInteger:=strtoint(dh1.Text);
       con_proymad.Params[2].AsInteger:=2;
       con_proymad.Open;
      end
      else
      begin
        if rb3.Checked then
        begin
          con_proymad.Close;
       con_proymad.Params[0].AsInteger:=40;
       con_proymad.Params[1].AsInteger:=strtoint(dh1.Text);
       con_proymad.Params[2].AsInteger:=3;
       con_proymad.Open;
        end
        else
        begin
          if rb4.Checked then
          begin
            con_proymad.Close;
       con_proymad.Params[0].AsInteger:=40;
       con_proymad.Params[1].AsInteger:=strtoint(dh1.Text);
       con_proymad.Params[2].AsInteger:=4;
       con_proymad.Open;
          end
          else
          begin
            if rb5.Checked then
            begin
              con_proymad.Close;
       con_proymad.Params[0].AsInteger:=20;
       con_proymad.Params[1].AsInteger:=strtoint(dh1.Text);
       con_proymad.Params[2].AsInteger:=5;
       con_proymad.Open;
            end
            else
            begin
               if rb6.Checked then
               begin
                con_proymad.Close;
       con_proymad.Params[0].AsInteger:=20;
       con_proymad.Params[1].AsInteger:=strtoint(dh1.Text);
       con_proymad.Params[2].AsInteger:=7;
       con_proymad.Open;
               end
               else
               begin
                 if rb7.Checked then
                 begin
                    con_proymad.Close;
       con_proymad.Params[0].AsInteger:=20;
       con_proymad.Params[1].AsInteger:=strtoint(dh1.Text);
       con_proymad.Params[2].AsInteger:=8;
       con_proymad.Open;
                 end
                 else
                 begin
                     if rb8.Checked then
                     begin
                     con_proymad.Close;
       con_proymad.Params[0].AsInteger:=20;
       con_proymad.Params[1].AsInteger:=strtoint(dh1.Text);
       con_proymad.Params[2].AsInteger:=9;
       con_proymad.Open;
                     end;
                 end;
               end;
            end;
          end;
        end;
      end;
    end;
   end;  
end;

procedure Tfrmproyeccmad.ppLabel1Print(Sender: TObject);
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

procedure Tfrmproyeccmad.ppLabel9Print(Sender: TObject);
begin
  pptot.Text:= formatfloat('#,##0.00',ppvariable2.AsDouble);
 // pptotf.Text:= formatfloat('#,##0.00',ppvariable3.AsDouble);
end;

procedure Tfrmproyeccmad.dh1KeyPress(Sender: TObject; var Key: Char);
begin
case key of
     #8:;
     #48..#57:;
     #13:;
end;
end;

procedure Tfrmproyeccmad.BitBtn2Click(Sender: TObject);
begin
  pprepmadproy.Print;
end;

procedure Tfrmproyeccmad.ppLabel11Print(Sender: TObject);
begin
ppdh.Text:=dh1.Text;
end;

procedure Tfrmproyeccmad.BitBtn6Click(Sender: TObject);
begin
  calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmproyeccmad.grid_proymontoGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if atext<>'' then
 Atext:=formatfloat('#,##0.00',Anode.Values[5]);
end;

end.
