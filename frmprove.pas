unit frmprove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, DB,
  ZAbstractRODataset, ZDataset, dxCntner, StdCtrls, ExtCtrls, Buttons,
  RxCalc, ZAbstractDataset, ZAbstractTable, dxDBTLCl, dxGrClms;

type
  Tfrmprov = class(TForm)
    pg1: TPageControl;
    pro: TTabSheet;
    datapro: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    bt_eli: TBitBtn;
    bt_mod: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    calculadora: TRxCalculator;
    con_pro: TZQuery;
    gridpro: TdxDBGrid;
    gridproid: TdxDBGridMaskColumn;
    gridproimp: TdxDBGridCheckColumn;
    gridproimpx100: TdxDBGridMaskColumn;
    gridpronom: TdxDBGridMaskColumn;
    gridprorif: TdxDBGridMaskColumn;
    gridproced: TdxDBGridMaskColumn;
    gridpronac: TdxDBGridMaskColumn;
    gridprodir: TdxDBGridMaskColumn;
    gridprociu: TdxDBGridMaskColumn;
    gridprotel: TdxDBGridMaskColumn;
    gridprorcz: TdxDBGridMaskColumn;
    gridprorpocei: TdxDBGridMaskColumn;
    gridprocpo: TdxDBGridMaskColumn;
    gridprorleg: TdxDBGridMaskColumn;
    gridpropzo_ent: TdxDBGridMaskColumn;
    eli_prov: TZQuery;
    dataeli: TDataSource;
    con_proid: TIntegerField;
    con_pronom: TStringField;
    con_prorif: TStringField;
    con_proced: TIntegerField;
    con_pronac: TStringField;
    con_protpro: TIntegerField;
    con_prodir: TStringField;
    con_prociu: TStringField;
    con_protel: TStringField;
    con_prorcz: TStringField;
    con_prorpocei: TStringField;
    con_procod_banco: TStringField;
    con_probanco: TStringField;
    con_protcb: TStringField;
    con_procpo: TIntegerField;
    con_prorleg: TStringField;
    con_procel: TStringField;
    con_proimp: TStringField;
    con_proimpx100: TFloatField;
    con_propzo_ent: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_eliClick(Sender: TObject);
    procedure bt_modClick(Sender: TObject);
    procedure gridproDblClick(Sender: TObject);
    function esnum(NumStr : string) : bool;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprov: Tfrmprov;

implementation

uses frmacces, frmbus, frmunprove, frmmodunp;

{$R *.dfm}


function Tfrmprov.esnum(NumStr : string) : bool;
       begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
        end;
end;

procedure Tfrmprov.BitBtn1Click(Sender: TObject);
begin
con_pro.Close;
close;
end;

procedure Tfrmprov.BitBtn6Click(Sender: TObject);
begin
  calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmprov.BitBtn2Click(Sender: TObject);
var
  buscar: string;
begin
       frmbuscar.ShowModal;
       buscar:=frmbuscar.bus.Text;
       con_pro.close;
       if esnum(buscar)=false then
       begin
         con_pro.Close;
         con_pro.SQL.Text:='select * from proveedores where nom like :n';
         con_pro.Params[0].AsString:='%'+buscar+'%';
         con_pro.Open;
       end
       else
       begin
          con_pro.Close;
          con_pro.SQL.Text:='select * from proveedores where id like :c';
          con_pro.Params[0].AsString:=buscar+'%';
          con_pro.Open;
       end;
end;

procedure Tfrmprov.BitBtn5Click(Sender: TObject);
begin
  frmunprov.tb_prov.Close;
  frmunprov.tb_prov.Open;
  frmunprov.tb_prov.FindLast;
  frmunprov.tb_prov.Append;
  frmunprov.ShowModal;
  con_pro.Close;
  con_pro.Open;
end;

procedure Tfrmprov.FormShow(Sender: TObject);
begin
  con_pro.Close;
  con_pro.Open;
  pg1.ActivePageIndex:=0;
  gridpro.SetFocus;
end;

procedure Tfrmprov.FormClose(Sender: TObject; var Action: TCloseAction);
begin
con_pro.Close;
end;

procedure Tfrmprov.bt_eliClick(Sender: TObject);
begin

if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin

    if  MessageDlg('¿Esta Seguro de Eliminar el Proveedor: '+con_pro.fieldbyname('nom').AsString+ ' ?',
        mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
        if not con_pro.IsEmpty then
        begin

          eli_prov.Close;
          eli_prov.Params[0].AsInteger:=con_pro.fieldbyname('id').AsInteger;
          eli_prov.ExecSQL;

          con_pro.Close;
          con_pro.SQL.Text:='select * from proveedores order by id';
          con_pro.Open;
          gridpro.ResetFullRefresh;
        end;
    end;

end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);



end;

procedure Tfrmprov.bt_modClick(Sender: TObject);
begin
  frmmodunpro.ShowModal;
end;

procedure Tfrmprov.gridproDblClick(Sender: TObject);
begin
   bt_modClick(Sender);
end;

end.
