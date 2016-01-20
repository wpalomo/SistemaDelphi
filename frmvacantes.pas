unit frmvacantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, Buttons,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, dxDBTLCl, dxGrClms;

type
  Tfrmvac = class(TForm)
    GroupBox1: TGroupBox;
    cb: TComboBox;
    grid_vac: TdxDBGrid;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    datavac: TDataSource;
    con_vac: TZQuery;
    grid_vacid: TdxDBGridMaskColumn;
    grid_vacced: TdxDBGridMaskColumn;
    grid_vacnom: TdxDBGridMaskColumn;
    grid_vaccar: TdxDBGridMaskColumn;
    grid_vachdo: TdxDBGridMaskColumn;
    grid_vachad: TdxDBGridMaskColumn;
    grid_vaccdep: TdxDBGridMaskColumn;
    grid_vacndep: TdxDBGridMaskColumn;
    grid_vacfec: TdxDBGridDateColumn;
    grid_vacmum: TdxDBGridMaskColumn;
    grid_vacaca: TdxDBGridMaskColumn;
    function  esnum(NumStr : string) : bool;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmvac: Tfrmvac;

implementation

uses frmbus, frmacces;

{$R *.dfm}

function Tfrmvac.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
         end;
end;


procedure Tfrmvac.BitBtn2Click(Sender: TObject);
var
buscar : string;
begin
   frmbuscar.ShowModal;
   if frmbuscar.bus.Text<>'' then
   begin
       buscar:=frmbuscar.bus.Text;
       con_vac.close;
       if esnum(buscar)=false then
       begin
         con_vac.Close;
         con_vac.SQL.Text:='select * from vacantes where nom like :n order by ced';
         con_vac.Params[0].AsString:='%'+buscar+'%';
         con_vac.Open;
       end
       else
       begin
          con_vac.Close;
          con_vac.SQL.Text:='select * from vacantes where ced like :c order by ced';
          con_vac.Params[0].AsString:=buscar+'%';
          con_vac.Open;
       end;
  end;
end;

procedure Tfrmvac.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmvac.FormShow(Sender: TObject);
begin
         con_vac.Close;
         con_vac.SQL.Text:='select * from vacantes where ced like :n order by ced';
         con_vac.Params[0].Asstring:='%'+''+'%';
         con_vac.Open;
end;


end.
