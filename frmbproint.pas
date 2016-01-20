unit frmbproint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl,
  dxGrClms, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls;

type
  Tfrmbp = class(TForm)
    dxDBGrid1: TdxDBGrid;
    des: TEdit;
    Label1: TLabel;
    gridp: TdxDBGrid;
    con_prod: TZQuery;
    data_prod: TDataSource;
    gridpid: TdxDBGridMaskColumn;
    gridpnom: TdxDBGridMaskColumn;
    gridptipo_prod: TdxDBGridMaskColumn;
    gridpnom_1: TdxDBGridMaskColumn;
    gridpprecio: TdxDBGridMaskColumn;
    gridpimp: TdxDBGridMaskColumn;
    gridpimpbs: TdxDBGridMaskColumn;
    gridpimpnum: TdxDBGridMaskColumn;
    procedure gridpprecioGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure gridpimpbsGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure FormShow(Sender: TObject);
    function esnum(NumStr : string) : bool;
    procedure desKeyPress(Sender: TObject; var Key: Char);
    procedure gridpDblClick(Sender: TObject);
    procedure gridpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    v_cod :integer;
    v_nom :string;
    v_uni :string;
    v_pre :double;
    v_imp :integer;

  end;

var
  frmbp: Tfrmbp;

implementation

uses frmacces;

{$R *.dfm}


function Tfrmbp.esnum(NumStr : string) : bool;
begin
        result := true;
        try
          StrToInt(NumStr);
        except
          result := false;
end;
end;

procedure Tfrmbp.gridpprecioGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
if atext<>'' then
   atext:=formatfloat('#,##0.00',strtofloat(Atext));
end;

procedure Tfrmbp.gridpimpbsGetText(Sender: TObject; ANode: TdxTreeListNode;
  var AText: String);
begin
if atext<>'' then
   atext:=formatfloat('#,##0.00',strtofloat(Atext));
end;

procedure Tfrmbp.FormShow(Sender: TObject);
begin
    des.Text:='';
    con_prod.Close;
    con_prod.Params[0].AsString:=des.Text+'%';
    con_prod.Open;
    gridp.SetFocus;
end;

procedure Tfrmbp.desKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  if esnum(des.Text) then
  begin
    con_prod.Close;
    con_prod.Params[0].AsString:=des.Text+'%';
    con_prod.Open;

  end
  else
  begin
    con_prod.Close;
    con_prod.Params[0].AsString:='%'+des.Text+'%';
    con_prod.Open;
end;
 end;
if key=#27 then
begin
   con_prod.Close;
   close;
end;
end;

procedure Tfrmbp.gridpDblClick(Sender: TObject);
begin
    v_cod :=con_prod.fieldbyname('id').AsInteger;
    v_nom :=con_prod.fieldbyname('nom').Asstring;
    v_uni :=con_prod.fieldbyname('nom_1').Asstring;
    if con_prod.fieldbyname('precio6').Asfloat>0 then
        v_pre :=con_prod.fieldbyname('precio6').Asfloat
    else
    begin
        if con_prod.fieldbyname('precio5').Asfloat>0 then
           v_pre :=con_prod.fieldbyname('precio5').Asfloat
        else
        begin
            if con_prod.fieldbyname('precio4').Asfloat>0 then
                v_pre :=con_prod.fieldbyname('precio4').Asfloat
            else
            begin
                if con_prod.fieldbyname('precio3').Asfloat>0 then
                   v_pre :=con_prod.fieldbyname('precio3').Asfloat
                else
                begin
                    if con_prod.fieldbyname('precio2').Asfloat>0 then
                       v_pre :=con_prod.fieldbyname('precio2').Asfloat
                    else
                    begin
                        if con_prod.fieldbyname('precio').Asfloat>0 then
                             v_pre :=con_prod.fieldbyname('precio').Asfloat
                    end;
                end;
            end;
        end;
    end;
    v_imp :=con_prod.fieldbyname('impnum').AsInteger;
    close;
end;

procedure Tfrmbp.gridpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
  begin
    v_cod :=con_prod.fieldbyname('id').AsInteger;
    v_nom :=con_prod.fieldbyname('nom').Asstring;
    v_uni :=con_prod.fieldbyname('nom_1').Asstring;
    v_pre :=con_prod.fieldbyname('precio').Asfloat;
    v_imp :=con_prod.fieldbyname('impnum').AsInteger;
    close;
  end;
end;

end.
