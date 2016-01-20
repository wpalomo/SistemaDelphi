unit frmregistroempleadopp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Mask, RxCalc, Buttons, ZAbstractTable,
  dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner, jpeg;

type
  Tfrmreempleadoplanpriv = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    dataempleado: TDataSource;
    bt_aceptar: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    calculadora: TRxCalculator;
    tb_empp: TZTable;
    Button1: TButton;
    cde: TLabel;
    nd: TLabel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    CED: TDBEdit;
    rgedad: TGroupBox;
    EDAD: TDBEdit;
    NAC: TDBRadioGroup;
    GroupBox3: TGroupBox;
    APE: TDBEdit;
    GroupBox4: TGroupBox;
    NOM: TDBEdit;
    TITULO_DOC: TDBRadioGroup;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Den: TDBEdit;
    CD: TDBEdit;
    FOR_ACA: TDBRadioGroup;
    HORA: TGroupBox;
    HOR: TDBEdit;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ANNO: TDBEdit;
    NOM_CAR: TDBEdit;
    griddep: TdxDBGrid;
    con_depp: TZQuery;
    datadpp: TDataSource;
    griddepCOD: TdxDBGridMaskColumn;
    griddepNOMBRE: TdxDBGridMaskColumn;
    TIPO_DOC: TDBRadioGroup;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    con_ced: TZQuery;
    data_ced: TDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure bt_aceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure griddepDblClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure CEDExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmreempleadoplanpriv: Tfrmreempleadoplanpriv;

implementation

uses frmacces, frmempleadosplapriv;

{$R *.dfm}

procedure Tfrmreempleadoplanpriv.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmreempleadoplanpriv.bt_aceptarClick(Sender: TObject);
begin

   if ced.GetTextLen =0 then
begin
   messagebox(0,'POR FAVOR INGRESE CEDULA DEL PROFESOR!','Mensaje al Usuario',16);
   ced.SetFocus;
end
   else
  begin

      if edad.GetTextLen =0 then
      begin
      messagebox(0,'POR FAVOR INGRESE  EDAD DEL PROFESOR!','Mensaje al Usuario',16);
      edad.SetFocus;
      end
    else
      begin
        if ape.GetTextLen =0 then
        begin
        messagebox(0,'POR FAVOR INGRESE APELLIDOS DEL PROFESOR!','Mensaje al Usuario',16);
        ape.SetFocus;
        end
     else
          begin
             if nom.GetTextLen =0 then
             begin
             messagebox(0,'POR FAVOR INGRESE NOMBRE DEL PROFESOR!','Mensaje al Usuario',16);
             nom.SetFocus;
             end
         else
               begin
                if den.GetTextLen =0 then
                begin
                messagebox(0,'POR FAVOR INGRESE DENOMINACIÓN!','Mensaje al Usuario',16);
                den.SetFocus;
                end
            else
                    begin
                      if cd.GetTextLen =0 then
                      begin
                      messagebox(0,'POR FAVOR INGRESE CODIGO DE DISTRITO!','Mensaje al Usuario',16);
                      cd.SetFocus;
                    end
             else
                   begin
                    if tipo_doc.GetTextLen =0 then
                      begin
                       messagebox(0,'POR FAVOR INGRESE TIPO_DOCENTE!','Mensaje al Usuario',16);
                       tipo_doc.SetFocus;
                    end
              else
               begin
               if nom_car.GetTextLen =0 then
                      begin
                       messagebox(0,'POR FAVOR INGRESE NOMBRE DEL CARGO!','Mensaje al Usuario',16);
                       nom_car.SetFocus;
                      end
               else
               begin
               if anno.GetTextLen =0 then
                        begin
                         messagebox(0,'POR FAVOR INGRESE ANNO!','Mensaje al Usuario',16);
                         anno.SetFocus;
                        end
               else
               begin
               if hor.GetTextLen =0 then
                        begin
                        messagebox(0,'POR FAVOR INGRESE!','Mensaje al Usuario',16);
                        hor.SetFocus;
                        end
               else

               begin
                        tb_empp.Edit;
                        tb_empp.fieldbyname('cod_plantel').AsInteger:=strtoint(cde.Caption);
                        tb_empp.post;
                        frm_nompp.con_empp.Close;
                        frm_nompp.con_empp.Open;
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


Procedure Tfrmreempleadoplanpriv.FormShow(Sender: TObject);
begin
   nac.ItemIndex:= 0;
   titulo_doc.ItemIndex := 0;
   for_aca.ItemIndex :=1;
   tipo_doc.ItemIndex := 0;

   griddep.Visible := false;
   panel2.Visible := false;
   bt_aceptar.Enabled:= false;
   nd.caption  := '';
   cde.caption := '';

end;

Procedure Tfrmreempleadoplanpriv.Button1Click(Sender: TObject);
Begin
   panel2.Visible := false;
   bt_aceptar.Enabled:= false;
   nd.caption  := '';
   cde.caption := '';

   con_depp.Close;
   con_depp.Open;
   griddep.visible := true;
   griddep.SetFocus;
   end;

Procedure Tfrmreempleadoplanpriv.griddepDblClick(Sender: TObject);
Begin
   cde.Caption:= con_depp.fieldByname ('Cod').AsString;
   nd.Caption := con_depp.fieldByname ('Nombre').AsString;
   griddep.Visible := false;
   panel2.Visible  := True;
   bt_aceptar.Enabled:= true;

end;

procedure Tfrmreempleadoplanpriv.BitBtn6Click(Sender: TObject);
begin
      calculadora.Title:='CALCULADORA ZEB';
      calculadora.Execute;
end;

procedure Tfrmreempleadoplanpriv.CEDExit(Sender: TObject);
begin
If ced.Text <> '' then
Begin
  con_ced.Close;
  con_ced.Params[0].AsInteger:=strtoint(ced.text);
  con_ced.open;

  IF not con_ced.IsEmpty then
   Begin
    messagebox(0,'La cedula ingresada ya existe!','Mensaje al Usuario',16);
    ced.Text:= '';
    ced.SetFocus;
    end
  else
    Begin
      edad.SetFocus;
    end;
 end;
end;
procedure Tfrmreempleadoplanpriv.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

end.
