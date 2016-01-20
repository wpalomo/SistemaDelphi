unit frmconfpre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxExEdtr, jpeg, ExtCtrls, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset;

type
  Tfrmconpre = class(TForm)
    grid_pre: TdxDBGrid;
    Panel1: TPanel;
    Image1: TImage;
    Label2: TLabel;
    bt_salir: TBitBtn;
    data_zona: TDataSource;
    data_pre: TDataSource;
    con_zona: TZQuery;
    cb_proy: TComboBox;
    Label1: TLabel;
    con_pre: TZQuery;
    grid_prePA: TdxDBGridMaskColumn;
    grid_preGE: TdxDBGridMaskColumn;
    grid_preES: TdxDBGridMaskColumn;
    grid_preSE: TdxDBGridMaskColumn;
    grid_preDESCRIPCION: TdxDBGridMaskColumn;
    grid_prePRESUPUESTO: TdxDBGridMaskColumn;
    grid_preEJECUTADO: TdxDBGridMaskColumn;
    grid_preSALDO: TdxDBGridMaskColumn;
    act_saldo: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb_proyChange(Sender: TObject);
    procedure cb_proyKeyPress(Sender: TObject; var Key: Char);
    procedure grid_preKeyPress(Sender: TObject; var Key: Char);
    procedure grid_prePRESUPUESTOGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure grid_preEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure grid_preSALDOGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure grid_preKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconpre: Tfrmconpre;

implementation

uses frmacces, frmzeb;

{$R *.dfm}

procedure Tfrmconpre.FormShow(Sender: TObject);
begin
  con_zona.Close;
  con_zona.Open;
  label2.Caption:= con_zona.fieldbyname('anno').AsString;
  cb_proy.ItemIndex:=-1;
  
end;

procedure Tfrmconpre.bt_salirClick(Sender: TObject);
begin
  close;
end;

procedure Tfrmconpre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
con_zona.Close;
con_pre.Close;
cb_proy.ItemIndex:=-1;
end;

procedure Tfrmconpre.cb_proyChange(Sender: TObject);
begin
  case cb_proy.ItemIndex of
      0:
         begin
           con_pre.Close;
           con_pre.SQL.Text:='select pa as PA, ge as GE,es as ES,se as SE,des as DESCRIPCION,pre1 as PRESUPUESTO,eje1 as EJECUTADO,sal1 as SALDO  from partidas_int where p1="0001-001"';
           con_pre.open;
         end;
      1:
         begin
           con_pre.Close;
           con_pre.SQL.Text:='select pa as PA, ge as GE,es as ES,se as SE,des as DESCRIPCION,pre2 as PRESUPUESTO,eje2 as EJECUTADO,sal2 as SALDO  from partidas_int where p2="0002-001"';
           con_pre.open;
         end;
      2:
         begin
           con_pre.Close;
           con_pre.SQL.Text:='select pa as PA, ge as GE,es as ES,se as SE,des as DESCRIPCION,pre3 as PRESUPUESTO,eje3 as EJECUTADO,sal3 as SALDO  from partidas_int where p3="0025-001"';
           con_pre.open;
         end;
      3:
         begin
           con_pre.Close;
           con_pre.SQL.Text:='select pa as PA, ge as GE,es as ES,se as SE,des as DESCRIPCION,pre3 as PRESUPUESTO,eje3 as EJECUTADO,sal3 as SALDO  from partidas_int where p4="0025-002"';
           con_pre.open;
         end;
      4:
         begin
           con_pre.Close;
           con_pre.SQL.Text:='select pa as PA, ge as GE,es as ES,se as SE,des as DESCRIPCION,pre3 as PRESUPUESTO,eje3 as EJECUTADO,sal3 as SALDO  from partidas_int where p5="0025-003"';
           con_pre.open;
         end;
      5:
         begin
           con_pre.Close;
           con_pre.SQL.Text:='select pa as PA, ge as GE,es as ES,se as SE,des as DESCRIPCION,pre3 as PRESUPUESTO,eje3 as EJECUTADO,sal3 as SALDO  from partidas_int where p6="0025-004"';
           con_pre.open;
         end;
      6:
         begin
           con_pre.Close;
           con_pre.SQL.Text:='select pa as PA, ge as GE,es as ES,se as SE,des as DESCRIPCION,pre4 as PRESUPUESTO,eje4 as EJECUTADO,sal4 as SALDO  from partidas_int where p7="0027-001"';
           con_pre.open;
         end;
      7:
         begin
           con_pre.Close;
           con_pre.SQL.Text:='select pa as PA, ge as GE,es as ES,se as SE,des as DESCRIPCION,pre4 as PRESUPUESTO,eje4 as EJECUTADO,sal4 as SALDO  from partidas_int where p8="0027-002"';
           con_pre.open;
         end;
      8:
         begin
           con_pre.Close;
           con_pre.SQL.Text:='select pa as PA, ge as GE,es as ES,se as SE,des as DESCRIPCION,pre4 as PRESUPUESTO,eje4 as EJECUTADO,sal4 as SALDO  from partidas_int where p9="0027-003"';
           con_pre.open;
         end;
      9:
         begin
           con_pre.Close;
           con_pre.SQL.Text:='select pa as PA, ge as GE,es as ES,se as SE,des as DESCRIPCION,pre4 as PRESUPUESTO,eje4 as EJECUTADO,sal4 as SALDO  from partidas_int where p10="0027-004"';
           con_pre.open;
         end;
      10:
         begin
           con_pre.Close;
           con_pre.SQL.Text:='select pa as PA, ge as GE,es as ES,se as SE,des as DESCRIPCION,pre4 as PRESUPUESTO,eje4 as EJECUTADO,sal4 as SALDO  from partidas_int where p11="0027-005"';
           con_pre.open;
         end;



  end;
end;

procedure Tfrmconpre.cb_proyKeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Tfrmconpre.grid_preKeyPress(Sender: TObject; var Key: Char);
begin
  case key of
     #48..#57:;
     #8:;
     #46:key:=#44;
  else
    key:=#0;
  end;
end;

procedure Tfrmconpre.grid_prePRESUPUESTOGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if atext<>'' then
begin
    atext:=formatfloat('#,##0.00',strtofloat(Atext));

end;
end;

procedure Tfrmconpre.grid_preEdited(Sender: TObject;
  Node: TdxTreeListNode);
var
d:string;
begin
d:='';
if grid_pre.FocusedColumn=5 then
begin
   grid_preSALDOGetText(Sender,Node,d);
   con_pre.Post;
end;
end;

procedure Tfrmconpre.grid_preSALDOGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
var
valor:double;
begin
Atext:=formatfloat('#,##0.00',(((Anode.Values[5])-(4*(Anode.Values[5]))/100)-(Anode.values[6])));
valor:=(((Anode.Values[5])-((4*(Anode.Values[5]))/100))-(Anode.values[6]));

case cb_proy.ItemIndex of
      0:
         begin
                       act_saldo.Close;
                       act_saldo.Params[0].asfloat :=valor;
                       act_saldo.Params[1].AsString:=Anode.Values[0];
                       act_saldo.Params[2].Asstring:=Anode.Values[1];
                       act_saldo.Params[3].Asstring:=Anode.Values[2];
                       act_saldo.Params[4].Asstring:=Anode.Values[3];
                       act_saldo.SQL.Text:='update partidas_int set sal1=:valor where (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_saldo.ExecSQL;

         end;
      1:
         begin
                       act_saldo.Close;
                       act_saldo.Params[0].asfloat :=valor;
                       act_saldo.Params[1].AsString:=Anode.Values[0];
                       act_saldo.Params[2].Asstring:=Anode.Values[1];
                       act_saldo.Params[3].Asstring:=Anode.Values[2];
                       act_saldo.Params[4].Asstring:=Anode.Values[3];
                       act_saldo.SQL.Text:='update partidas_int set sal2=:valor where (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_saldo.ExecSQL;
         end;
      2:
         begin
                       act_saldo.Close;
                       act_saldo.Params[0].asfloat :=valor;
                       act_saldo.Params[1].AsString:=Anode.Values[0];
                       act_saldo.Params[2].Asstring:=Anode.Values[1];
                       act_saldo.Params[3].Asstring:=Anode.Values[2];
                       act_saldo.Params[4].Asstring:=Anode.Values[3];
                       act_saldo.SQL.Text:='update partidas_int set sal3=:valor where (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_saldo.ExecSQL;
         end;
      3:
         begin
                       act_saldo.Close;
                       act_saldo.Params[0].asfloat :=valor;
                       act_saldo.Params[1].AsString:=Anode.Values[0];
                       act_saldo.Params[2].Asstring:=Anode.Values[1];
                       act_saldo.Params[3].Asstring:=Anode.Values[2];
                       act_saldo.Params[4].Asstring:=Anode.Values[3];
                       act_saldo.SQL.Text:='update partidas_int set sal4=:valor where (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_saldo.ExecSQL;
         end;
      4:
         begin
                       act_saldo.Close;
                       act_saldo.Params[0].asfloat :=valor;
                       act_saldo.Params[1].AsString:=Anode.Values[0];
                       act_saldo.Params[2].Asstring:=Anode.Values[1];
                       act_saldo.Params[3].Asstring:=Anode.Values[2];
                       act_saldo.Params[4].Asstring:=Anode.Values[3];
                       act_saldo.SQL.Text:='update partidas_int set sal5=:valor where (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_saldo.ExecSQL;
         end;
      5:
         begin
                       act_saldo.Close;
                       act_saldo.Params[0].asfloat :=valor;
                       act_saldo.Params[1].AsString:=Anode.Values[0];
                       act_saldo.Params[2].Asstring:=Anode.Values[1];
                       act_saldo.Params[3].Asstring:=Anode.Values[2];
                       act_saldo.Params[4].Asstring:=Anode.Values[3];
                       act_saldo.SQL.Text:='update partidas_int set sal6=:valor where (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_saldo.ExecSQL;
         end;
      6:
         begin
                       act_saldo.Close;
                       act_saldo.Params[0].asfloat :=valor;
                       act_saldo.Params[1].AsString:=Anode.Values[0];
                       act_saldo.Params[2].Asstring:=Anode.Values[1];
                       act_saldo.Params[3].Asstring:=Anode.Values[2];
                       act_saldo.Params[4].Asstring:=Anode.Values[3];
                       act_saldo.SQL.Text:='update partidas_int set sal7=:valor where (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_saldo.ExecSQL;
         end;
      7:
         begin
                       act_saldo.Close;
                       act_saldo.Params[0].asfloat :=valor;
                       act_saldo.Params[1].AsString:=Anode.Values[0];
                       act_saldo.Params[2].Asstring:=Anode.Values[1];
                       act_saldo.Params[3].Asstring:=Anode.Values[2];
                       act_saldo.Params[4].Asstring:=Anode.Values[3];
                       act_saldo.SQL.Text:='update partidas_int set sal8=:valor where (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_saldo.ExecSQL;
         end;
      8:
         begin
                        act_saldo.Close;
                       act_saldo.Params[0].asfloat :=valor;
                       act_saldo.Params[1].AsString:=Anode.Values[0];
                       act_saldo.Params[2].Asstring:=Anode.Values[1];
                       act_saldo.Params[3].Asstring:=Anode.Values[2];
                       act_saldo.Params[4].Asstring:=Anode.Values[3];
                       act_saldo.SQL.Text:='update partidas_int set sal9=:valor where (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_saldo.ExecSQL;
         end;
      9:
         begin
                       act_saldo.Close;
                       act_saldo.Params[0].asfloat :=valor;
                       act_saldo.Params[1].AsString:=Anode.Values[0];
                       act_saldo.Params[2].Asstring:=Anode.Values[1];
                       act_saldo.Params[3].Asstring:=Anode.Values[2];
                       act_saldo.Params[4].Asstring:=Anode.Values[3];
                       act_saldo.SQL.Text:='update partidas_int set sal10=:valor where (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_saldo.ExecSQL;
         end;
      10:
         begin
                      act_saldo.Close;
                       act_saldo.Params[0].asfloat :=valor;
                       act_saldo.Params[1].AsString:=Anode.Values[0];
                       act_saldo.Params[2].Asstring:=Anode.Values[1];
                       act_saldo.Params[3].Asstring:=Anode.Values[2];
                       act_saldo.Params[4].Asstring:=Anode.Values[3];
                       act_saldo.SQL.Text:='update partidas_int set sal11=:valor where (pa=:pa) and (ge=:ge) and (es=:es) and (se=:se)';
                       act_saldo.ExecSQL;
         end;

  end;


end;

procedure Tfrmconpre.grid_preKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=vk_return then
     begin
            if grid_pre.FocusedColumn=5 then
            begin
                key:=vk_down;

                grid_pre.FocusedColumn:=5;

            end;
     end;



end;

end.
