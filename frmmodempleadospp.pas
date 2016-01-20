unit frmmodempleadospp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDataset, DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, StdCtrls, ExtCtrls, DBCtrls, Mask, RxCalc, Buttons,
  dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner;

type
  Tfrm_modemplepp = class(TForm)
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
    TIPO_DOC: TDBRadioGroup;
    con_depp: TZQuery;
    datadpp: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    bt_aceptar: TBitBtn;
    bt_salir: TBitBtn;
    bt_calculadora: TBitBtn;
    calculadora: TRxCalculator;
    Button1: TButton;
    griddep: TdxDBGrid;
    griddepNOMBRE: TdxDBGridMaskColumn;
    griddepCOD: TdxDBGridMaskColumn;
    cde: TLabel;
    nd: TLabel;
    con_p: TZQuery;
    dataconp: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure bt_aceptarClick(Sender: TObject);
    procedure griddepDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_salirClick(Sender: TObject);
    procedure bt_calculadoraClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_modemplepp: Tfrm_modemplepp;

implementation

uses frmacces, frmempleadosplapriv;

{$R *.dfm}


procedure Tfrm_modemplepp.bt_aceptarClick(Sender: TObject);
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
                        messagebox(0,'POR FAVOR INGRESE CANTIDAD DE HORAS!','Mensaje al Usuario',16);
                        hor.SetFocus;
                        end
               else

               begin
                        frm_nompp.con_empp.Edit;
                        frm_nompp.con_empp.fieldbyname('cod_plantel').AsInteger:=strtoint(cde.Caption);
                        frm_nompp.con_empp.Post;
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


procedure Tfrm_modemplepp.Button1Click(Sender: TObject);//Botón de selecionar Dependencia//
begin
 
    nd.caption  := '';
    cde.caption := '';
    con_depp.Close;
    con_depp.Open;
    griddep.visible := true;
    griddep.SetFocus;
end;


procedure Tfrm_modemplepp.griddepDblClick(Sender: TObject); //Selecciona La Dependencia//
begin
      cde.Caption:= con_depp.fieldByname ('Cod').AsString;
      nd.Caption := con_depp.fieldByname ('Nombre').AsString;
      griddep.Visible := false;
      panel2.Visible := True;
      bt_aceptar.Enabled:= true;
end;

procedure Tfrm_modemplepp.FormShow(Sender: TObject);
begin

     panel2.Visible := TRUE;
     cde.caption := frm_nompp.con_empp.FieldByName('cod_plantel').AsString;
     con_p.Close;
     con_p.Params[0].asinteger:=frm_nompp.con_empp.FieldByName('cod_plantel').AsInteger;
     con_p.Open;
     nd.caption  := con_p.fieldbyname('nombre').AsString;


end;


procedure Tfrm_modemplepp.bt_salirClick(Sender: TObject);
begin
   close;
end;

procedure Tfrm_modemplepp.bt_calculadoraClick(Sender: TObject);
begin
      calculadora.Title:='CALCULADORA ZEB';
      calculadora.Execute;
end;

procedure Tfrm_modemplepp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

end.
