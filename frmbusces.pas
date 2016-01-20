unit frmbusces;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, dxTL, dxDBCtrl, dxDBGrid, dxCntner;

type
  Tfrmbuscaces = class(TForm)
    GroupBox1: TGroupBox;
    nom: TEdit;
    grid_prov: TdxDBGrid;
    grid_provid: TdxDBGridMaskColumn;
    grid_provnom: TdxDBGridMaskColumn;
    con_prov: TZQuery;
    dataprov: TDataSource;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbuscaces: Tfrmbuscaces;

implementation

uses frmacces;

{$R *.dfm}

end.
