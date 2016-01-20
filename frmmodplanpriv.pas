unit frmmodplanpriv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxCalc, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ToolEdit, RXDBCtrl, DBCtrls, Mask, dxExEdtr,
  dxCntner, dxTL, dxDBCtrl, dxDBGrid;

type
  TFrmmodpp = class(TForm)
    GroupBox3: TGroupBox;
    nom: TDBEdit;
    GroupBox2: TGroupBox;
    COD: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    DIR: TDBEdit;
    GroupBox5: TGroupBox;
    LOCALIDAD: TDBEdit;
    GroupBox6: TGroupBox;
    ANNO: TDBEdit;
    GroupBox7: TGroupBox;
    TEL: TDBEdit;
    GroupBox8: TGroupBox;
    FEELA: TDBDateEdit;
    GroupBox9: TGroupBox;
    CORREO: TDBEdit;
    GroupBox10: TGroupBox;
    MAT: TDBEdit;
    GroupBox11: TGroupBox;
    MAT_PRO: TDBEdit;
    GroupBox12: TGroupBox;
    DISTRITO_NUM: TDBEdit;
    con_mun: TZQuery;
    data_mun: TDataSource;
    data_conpp: TDataSource;
    con_pp: TZQuery;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    calculadora: TRxCalculator;
    gmun: TdxDBGrid;
    cmun: TDBEdit;
    nmun: TDBEdit;
    gmunCOD: TdxDBGridMaskColumn;
    gmunNOMBRE: TdxDBGridMaskColumn;
    cc_mun: TZQuery;
    datacc_mun: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmunDblClick(Sender: TObject);
    procedure gmunDblClick(Sender: TObject);
    procedure cmunKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmmodpp: TFrmmodpp;

implementation

uses frmplanprivados;

{$R *.dfm}

procedure TFrmmodpp.BitBtn6Click(Sender: TObject);
begin
   calculadora.Title:='CALCULADORA ZEB';
   calculadora.Execute;
end;

procedure TFrmmodpp.BitBtn1Click(Sender: TObject);
begin
    if cod.GetTextLen =0 then
begin
   messagebox(0,'Debe ingresar CODIGO...!','Mensaje al Usuario',16);
   cod.SetFocus;
end
   else
  begin

      if nom.GetTextLen =0 then
      begin
      messagebox(0,'Debe ingresar NOMBRE...!','Mensaje al Usuario',16);
      nom.SetFocus;
      end
    else
      begin
        if dir.GetTextLen =0 then
        begin
        messagebox(0,'Debe ingresar DIRECCIÓN...!','Mensaje al Usuario',16);
        dir.SetFocus;
        end
     else
          begin
             if localidad.GetTextLen =0 then
             begin
             messagebox(0,'Debe ingresar LOCALIDAD...!','Mensaje al Usuario',16);
             localidad.SetFocus;
             end
         else
               begin
                if anno.GetTextLen =0 then
                begin
                messagebox(0,'Debe ingresar ANNO...!','Mensaje al Usuario',16);
                anno.SetFocus;
                end
            else
                    begin
                      if tel.GetTextLen =0 then
                      begin
                      messagebox(0,'Debe ingresar TELEFONO...!','Mensaje al Usuario',16);
                      tel.SetFocus;
                    end
             else
                   begin
                    if correo.GetTextLen =0 then
                      begin
                       messagebox(0,'Debe ingresar CORREO...!','Mensaje al Usuario',16);
                        correo.SetFocus;
                    end
              else
                   begin
                     if mat.GetTextLen =0 then
                      begin
                       messagebox(0,'Debe ingresar MATRICULA...!','Mensaje al Usuario',16);
                       mat.SetFocus;
                   end
              else
                      begin
                        if mat_pro.GetTextLen =0 then
                        begin
                         messagebox(0,'Debe ingresar MAT_PRO...!','Mensaje al Usuario',16);
                         cod.SetFocus;
                        end
               else
                        begin
                              if distrito_num.GetTextLen =0 then
                              begin
                              messagebox(0,'Debe ingresar DISTRITO_NUM...!','Mensaje al Usuario',16);
                              distrito_num.SetFocus;
                        end
                 else

                        begin
                            frmplan_priv.con_pp.edit;
                            frmplan_priv.con_pp.FieldByName('cod_mun').AsInteger:=strtoint( cmun.text);
                            cc_mun.close;
                            cc_mun.params[0].AsInteger:= strtoint(cmun.text);
                            cc_mun.open;
                          If not cc_mun.IsEmpty then
                            nmun.Text:= cc_mun.fieldbyname('nombre').AsString;
                            frmplan_priv.con_pp.post;
                            frmplan_priv.con_pp.Close;
                            frmplan_priv.con_pp.Open;
                            close;
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
end;


procedure TFrmmodpp.BitBtn2Click(Sender: TObject);

begin
 close;
end;

procedure TFrmmodpp.FormShow(Sender: TObject);
begin
    cmun.Text:= frmplan_priv.con_pp.fieldbyname('cod_mun').AsString;
    cc_mun.close;
    cc_mun.params[0].AsInteger:= strtoint(cmun.text);
    cc_mun.open;
      If not cc_mun.IsEmpty then
      nmun.Text:= cc_mun.fieldbyname('nombre').AsString;

end;

procedure TFrmmodpp.cmunDblClick(Sender: TObject);
begin
 con_mun.Close;
 con_mun.open;
 gmun.visible:= true;
end;

procedure TFrmmodpp.gmunDblClick(Sender: TObject);
begin
  cmun.Text:=  con_mun.fieldbyname( 'cod').asstring;
  nmun.text:=  con_mun.fieldbyname( 'nombre').asstring;
  gmun.Visible:= false;
  end;

procedure TFrmmodpp.cmunKeyPress(Sender: TObject; var Key: Char);
begin
 if key<>#13 then
   key:=#0;
end;

end.
