unit frmreportedepp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, StdCtrls, Buttons,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ppCtrls, ppParameter,
  ppModule, raCodMod, ppBands, jpeg, ppPrnabl, ppClass, ppVar, ppCache,
  ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe;

type
  Tfrmreportedependencias = class(TForm)
    GroupBox1: TGroupBox;
    dep: TEdit;
    BitBtn1: TBitBtn;
    dxDBGrid1: TdxDBGrid;
    dataplanpriv: TDataSource;
    con_pp: TZQuery;
    dxDBGrid1COD: TdxDBGridMaskColumn;
    dxDBGrid1NOMBRE: TdxDBGridMaskColumn;
    con_empxpla: TZQuery;
    data_empxpla: TDataSource;
    ppDBPipeline1: TppDBPipeline;
    repempxpla: TppReport;
    ppParameterList4: TppParameterList;
    ppHeaderBand7: TppHeaderBand;
    ppSystemVariable15: TppSystemVariable;
    ppSystemVariable16: TppSystemVariable;
    ppImage7: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel52: TppLabel;
    ppShape7: TppShape;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLine41: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLabel63: TppLabel;
    ppLine47: TppLine;
    ppLabel66: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLine50: TppLine;
    ppLine42: TppLine;
    ppDetailBand7: TppDetailBand;
    ppFooterBand7: TppFooterBand;
    ppLine49: TppLine;
    ppLabel68: TppLabel;
    ppSystemVariable17: TppSystemVariable;
    raCodeModule7: TraCodeModule;
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
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    function esnum(NumStr : string) : bool;
    procedure depKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmreportedependencias: Tfrmreportedependencias;

implementation

uses frmacces, frmplanprivados;

{$R *.dfm}

function Tfrmreportedependencias.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
        end;
        end;

procedure Tfrmreportedependencias.depKeyPress(Sender: TObject;
  var Key: Char);
   var
 buscar: string;
begin
If key=#13 then
begin
 buscar := dep.Text;
If  esnum(buscar) = true then
 Begin
 con_pp.Close;
 con_pp.SQL.Text:= 'select * from dependenciaspp where cod like :c order by cod';
 con_pp.Params[0].AsString:=dep.Text+'%';
 con_pp.Open;

If con_pp.IsEmpty  then
         begin
         messagebox(0,'La Dependencia no existe!','Mensaje al Usuario',16);
         dep.clear;
         dep.SetFocus;
         end
  end
  else
Begin
     con_pp.Close;
     con_pp.SQL.Text:= 'select * from dependenciaspp where nombre like :c order by nombre';
     con_pp.Params[0].asstring:=dep.Text+'%';
     con_pp.Open;
  end;

If con_pp.IsEmpty  then
    begin
    messagebox(0,'La Dependencia no existe!','Mensaje al Usuario',16);
    dep.clear;
    dep.SetFocus;
    end;
  end;
 
end;

procedure Tfrmreportedependencias.BitBtn1Click(Sender: TObject);
begin
 con_pp.close;
 close;
end;


procedure Tfrmreportedependencias.FormShow(Sender: TObject);
begin
  dep.Clear;
end;

procedure Tfrmreportedependencias.dxDBGrid1DblClick(Sender: TObject);
begin
con_empxpla.Close;
con_empxpla.Params[0].AsFloat:=con_pp.fieldbyname('cod').AsFloat;
con_empxpla.Open;
repempxpla.Print;
end;

end.
