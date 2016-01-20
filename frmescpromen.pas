unit frmescpromen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxCalc, StdCtrls, Buttons, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, dxCntner, Grids,
  DBGrids, ExtCtrls, ZAbstractTable;

type
  Tfrmescprovmen = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn6: TBitBtn;
    calculadora: TRxCalculator;
    dataesc: TDataSource;
    con_esc: TZQuery;
    con_prov: TZQuery;
    dataprov: TDataSource;
    con_menu: TZQuery;
    datamenu: TDataSource;
    con_menumodal: TIntegerField;
    con_menunum: TIntegerField;
    con_menunom: TStringField;
    con_menuobs: TStringField;
    con_menulun: TStringField;
    con_menumar: TStringField;
    con_menumier: TStringField;
    con_menujue: TStringField;
    con_menuvier: TStringField;
    con_menualm: TStringField;
    con_menudesa: TStringField;
    con_menucena: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    grid_esc: TDBGrid;
    Panel3: TPanel;
    grid_prov: TDBGrid;
    Panel4: TPanel;
    grid_menu: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    bus_esc: TBitBtn;
    bus_prov: TBitBtn;
    bus_menu: TBitBtn;
    datarela: TDataSource;
    Panel5: TPanel;
    grupo_esc: TGroupBox;
    cod_esc: TEdit;
    nom_esc: TEdit;
    grupo_prov: TGroupBox;
    grupo_menu: TGroupBox;
    elimenu: TBitBtn;
    cod_prov: TEdit;
    nom_prov: TEdit;
    Label5: TLabel;
    cod_menu: TEdit;
    cod_modal: TEdit;
    nom_modal: TEdit;
    ver_data: TZQuery;
    data_ver: TDataSource;
    bt_eli: TBitBtn;
    busca_esc: TEdit;
    busca_prov: TEdit;
    busca_men: TEdit;
    con_rela: TZTable;
    grid_rela: TdxDBGrid;
    grid_relacod_dep: TdxDBGridMaskColumn;
    grid_relacod_prove: TdxDBGridMaskColumn;
    grid_relacod_menu: TdxDBGridMaskColumn;
    grid_relacod_mod: TdxDBGridMaskColumn;
    grid_relanom_esc: TdxDBGridMaskColumn;
    grid_relanom_prov: TdxDBGridMaskColumn;
    grid_relanom_moda: TdxDBGridMaskColumn;
    procedure BitBtn1Click(Sender: TObject);
    procedure grid_escCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure grid_provCellClick(Column: TColumn);
    procedure grid_menuCellClick(Column: TColumn);
    procedure grid_escEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure grid_provEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure grid_menuEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure grid_relaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure bt_eliClick(Sender: TObject);
    procedure cod_escDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cod_escDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure nom_escDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cod_provDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure cod_provDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure nom_provDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cod_menuDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cod_menuDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure cod_modalDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure nom_modalDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cod_escChange(Sender: TObject);
    procedure bus_escClick(Sender: TObject);
    function esnum(NumStr : string) : bool;
    procedure bus_provClick(Sender: TObject);
    procedure bus_menuClick(Sender: TObject);
    procedure busca_escKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure busca_provKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure busca_menKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  frmescprovmen: Tfrmescprovmen;

implementation

uses frmacces;

{$R *.dfm}

function Tfrmescprovmen.esnum(NumStr : string) : bool;
begin
         result := true;
         try
           StrToInt(NumStr);
         except
           result := false;
         end;
end;

procedure Tfrmescprovmen.BitBtn1Click(Sender: TObject);
begin
con_esc.Close;
con_prov.Close;
con_menu.Close;
con_rela.Close;
close;
end;

procedure Tfrmescprovmen.grid_escCellClick(Column: TColumn);
begin
 grid_esc.BeginDrag(true);
end;

procedure Tfrmescprovmen.FormShow(Sender: TObject);
var
 cad:string;
begin
  cod_esc.Clear;
  nom_esc.Clear;
  cod_prov.Clear;
  nom_prov.Clear;
  cod_menu.Clear;
  cod_modal.Clear;
  nom_modal.Clear;
  busca_esc.Clear;
  busca_prov.Clear;
  busca_men.Clear;
  panel2.Enabled:=true;
  panel3.Enabled:=false;
  panel4.Enabled:=false;
  grupo_esc.Enabled:=true;
  grupo_prov.Enabled:=false;
  grupo_menu.Enabled:=false;

  con_esc.close;
  cad:='select dependencias.cod,dependencias.nombre,proy_mod.`nom`,municipios.nombre,dependencias.mat,dependencias.mat_pro';
  con_esc.SQL.Text:=cad+' from dependencias,proy_mod,municipios where dependencias.modal=proy_mod.id and dependencias.cod_mun=municipios.cod and dependencias.pae="S" order by dependencias.cod';
  con_esc.Open;

  con_prov.close;
  con_prov.SQL.Text:='select proveedores.id,proveedores.nom,proveedores.rif,proveedores.tel,proveedores.dir,proveedores.rleg from proveedores order by proveedores.id';
  con_prov.Open;

  con_menu.Close;
  con_menu.SQL.Text:='select menu.modal,menu.num,proy_mod.nom,menu.obs,menu.lun,menu.mar,menu.mier,menu.jue,menu.vier,menu.alm,menu.desa,menu.cena from menu,proy_mod where menu.modal=proy_mod.id order by modal,num';
  con_menu.Open;
  grid_esc.SetFocus;
end;

procedure Tfrmescprovmen.grid_provCellClick(Column: TColumn);
begin
grid_prov.BeginDrag(true);

end;

procedure Tfrmescprovmen.grid_menuCellClick(Column: TColumn);
begin
grid_menu.BeginDrag(true);

end;



procedure Tfrmescprovmen.grid_escEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
if cod_esc.Text<>'' then
begin
  grupo_esc.Enabled:=false;
  grupo_prov.Enabled:=true;
  grupo_menu.Enabled:=false;
  panel2.Enabled:=false;
  panel3.Enabled:=true;
  panel4.Enabled:=false;
  grid_prov.SetFocus;
end;
end;

procedure Tfrmescprovmen.grid_provEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
 if cod_prov.Text<>'' then
 begin
       grupo_esc.Enabled:=false;
       grupo_prov.Enabled:=false;
       grupo_menu.Enabled:=true;

       panel2.Enabled:=false;
       panel3.Enabled:=false;
       panel4.Enabled:=true;
       grid_menu.SetFocus;
  end;

end;                            

procedure Tfrmescprovmen.grid_menuEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
if cod_menu.Text<>'' then
begin

      if  MessageDlg('Desea Ingresar Esta RELACION...?',
          mtConfirmation,[mbYes, mbNo],0)=mrNO then
      begin
         con_rela.Close;
      end
      else
      begin
         ver_data.Close;
         ver_data.Params[0].AsInteger:=strtoint(cod_esc.Text);
         ver_data.Params[1].AsInteger:=strtoint(cod_prov.Text);
         ver_data.Params[2].AsInteger:=strtoint(cod_menu.Text);
         ver_data.Params[3].AsInteger:=strtoint(cod_modal.Text);
         ver_data.Open;
         if ver_data.IsEmpty then
         begin
          con_rela.Edit;
          con_rela.Append;
          con_rela.FieldByName('cod_dep').AsInteger:=strtoint(cod_esc.Text);
          con_rela.FieldByName('cod_prove').AsInteger:=strtoint(cod_prov.Text);
          con_rela.FieldByName('cod_menu').AsInteger:=strtoint(cod_menu.Text);
          con_rela.FieldByName('cod_mod').AsInteger:=strtoint(cod_modal.Text);

          con_rela.FieldByName('nom_esc').Asstring:=nom_esc.Text;
          con_rela.FieldByName('nom_prov').Asstring:=nom_prov.Text;
          con_rela.FieldByName('nom_moda').Asstring:=nom_modal.Text;
          con_rela.Post;
          end
          else
          begin
                  messagebox(0,'Relaciòn ya Registrada...!','Mensaje al Usuario',16);
                  con_rela.Cancel;
          end;

       end;
       cod_esc.Clear;
       nom_esc.Clear;
       cod_prov.Clear;
       nom_prov.Clear;
       cod_menu.Clear;
       cod_modal.Clear;
       nom_modal.Clear;
       busca_esc.Clear;
       busca_prov.Clear;
       busca_men.Clear;

       grupo_esc.Enabled:=true;
       grupo_prov.Enabled:=false;
       grupo_menu.Enabled:=false;

       panel2.Enabled:=true;
       panel3.Enabled:=false;
       panel4.Enabled:=false;
       grid_esc.SetFocus;
 end;       
end;

procedure Tfrmescprovmen.grid_relaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   key:=0;
end;

procedure Tfrmescprovmen.BitBtn6Click(Sender: TObject);
begin
calculadora.Title:='CALCULADORA ZEB';
  calculadora.Execute;
end;

procedure Tfrmescprovmen.bt_eliClick(Sender: TObject);
begin
    if  MessageDlg('Desea Eliminar Asignación',
        mtConfirmation,[mbYes, mbNo],0)=mrNo then
    else
    begin
        if not con_rela.IsEmpty then
        begin
          con_rela.Delete;
        end;
    end;
end;

procedure Tfrmescprovmen.cod_escDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
Accept := Source IS TDBGrid;
end;

procedure Tfrmescprovmen.cod_escDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
    cod_esc.Text:= grid_esc.Fields[0].AsString;
    nom_esc.Text:= grid_esc.Fields[1].AsString;
end;

procedure Tfrmescprovmen.nom_escDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
Accept := Source IS TDBGrid;
end;

procedure Tfrmescprovmen.cod_provDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
    cod_prov.Text:= grid_prov.Fields[0].AsString;
    nom_prov.Text:= grid_prov.Fields[1].AsString;
end;

procedure Tfrmescprovmen.cod_provDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source IS TDBGrid;
end;

procedure Tfrmescprovmen.nom_provDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
Accept := Source IS TDBGrid;
end;

procedure Tfrmescprovmen.cod_menuDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source IS TDBGrid;
end;

procedure Tfrmescprovmen.cod_menuDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
    cod_modal.Text:=grid_menu.Fields[0].AsString;
    cod_menu.Text:=grid_menu.Fields[1].AsString;
    nom_modal.Text:= grid_menu.Fields[2].AsString;
end;

procedure Tfrmescprovmen.cod_modalDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
 Accept := Source IS TDBGrid;
end;

procedure Tfrmescprovmen.nom_modalDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
Accept := Source IS TDBGrid;
end;

procedure Tfrmescprovmen.cod_escChange(Sender: TObject);
begin
      if cod_esc.Text<>'' then
      begin
        con_rela.Close;
        con_rela.Filter:='cod_dep='+QuotedStr(cod_esc.Text);
        con_rela.Filtered:=true;
        con_rela.Open;
      end;
end;

procedure Tfrmescprovmen.bus_escClick(Sender: TObject);
var
cad:string;
begin
  if panel2.Enabled=true then
  begin
    if esnum(busca_esc.Text) then
    begin
      //con_esc.Locate('cod',busca_esc.Text,[loCaseInsensitive]);
      con_esc.close;
      cad:='select dependencias.cod,dependencias.nombre,proy_mod.`nom`,municipios.nombre,dependencias.mat,dependencias.mat_pro';
      con_esc.SQL.Text:=cad+' from dependencias,proy_mod,municipios where dependencias.modal=proy_mod.id and dependencias.cod_mun=municipios.cod and dependencias.pae="S" and dependencias.COD like :c order by dependencias.cod';
      con_esc.Params[0].Asstring:=busca_esc.Text+'%';
      con_esc.Open;
      grid_esc.SetFocus;
    end
    else
    begin
       //con_esc.Locate('nombre',busca_esc.Text,[loPartialKey,loCaseInsensitive]);
       con_esc.Close;
       cad:='select dependencias.cod,dependencias.nombre,proy_mod.`nom`,municipios.nombre,dependencias.mat,dependencias.mat_pro';
       con_esc.SQL.Text:=cad+' from dependencias,proy_mod,municipios where dependencias.modal=proy_mod.id and dependencias.cod_mun=municipios.cod and dependencias.pae="S" and dependencias.nombre like :n order by dependencias.cod';
       con_esc.Params[0].AsString:='%'+busca_esc.Text+'%';
       con_esc.open;
       grid_esc.SetFocus;
    end;
  end;
end;

procedure Tfrmescprovmen.bus_provClick(Sender: TObject);
begin
 if panel3.Enabled=true then
  begin
    if esnum(busca_prov.Text) then
    begin
      //con_prov.Locate('id',busca_prov.Text,[loCaseInsensitive]);
      con_prov.close;
      con_prov.SQL.Text:='select proveedores.id,proveedores.nom,proveedores.rif,proveedores.tel,proveedores.dir,proveedores.rleg from proveedores where proveedores.nom like :n order by proveedores.id';
      con_prov.Params[0].Asstring:=busca_prov.Text+'%';
      con_prov.Open;
      grid_prov.SetFocus;
    end
    else
    begin
       //con_prov.Locate('nom',busca_prov.Text,[loPartialKey,loCaseInsensitive]);
      con_prov.close;
      con_prov.SQL.Text:='select proveedores.id,proveedores.nom,proveedores.rif,proveedores.tel,proveedores.dir,proveedores.rleg from proveedores where proveedores.nom like :n order by proveedores.id';
      con_prov.Params[0].Asstring:='%'+busca_prov.Text+'%';
      con_prov.Open;
      grid_prov.SetFocus;
    end;
  end;
end;

procedure Tfrmescprovmen.bus_menuClick(Sender: TObject);
begin
if panel4.Enabled=true then
  begin
    if esnum(busca_men.Text) then
    begin
      //con_menu.Locate('num',busca_men.Text,[loCaseInsensitive]);
      con_menu.Close;
      con_menu.SQL.Text:='select menu.modal,menu.num,proy_mod.nom,menu.obs,menu.lun,menu.mar,menu.mier,menu.jue,menu.vier,menu.alm,menu.desa,menu.cena from menu,proy_mod where menu.modal=proy_mod.id and menu.num like :c order by modal,num';
      con_menu.Params[0].Asstring:=busca_men.Text+'%';
      con_menu.Open;
      grid_menu.SetFocus;
    end
    else
    begin
      // con_menu.Locate('nom',busca_men.Text,[loPartialKey,loCaseInsensitive]);
      con_menu.Close;
      con_menu.SQL.Text:='select menu.modal,menu.num,proy_mod.nom,menu.obs,menu.lun,menu.mar,menu.mier,menu.jue,menu.vier,menu.alm,menu.desa,menu.cena from menu,proy_mod where menu.modal=proy_mod.id and proy_mod.nom like :n order by modal,num';
      con_menu.Params[0].Asstring:='%'+busca_men.Text+'%';
      con_menu.Open;
      grid_menu.SetFocus;
    end;
  end;
end;

procedure Tfrmescprovmen.busca_escKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key= vk_return then
begin
   bus_escClick(Sender);
end;
end;

procedure Tfrmescprovmen.busca_provKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key= vk_return then
begin
   bus_provClick(Sender);
end;
end;

procedure Tfrmescprovmen.busca_menKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key= vk_return then
begin
   bus_menuClick(Sender);
end;
end;

end.
