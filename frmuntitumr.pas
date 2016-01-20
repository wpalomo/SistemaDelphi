unit frmuntitumr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZDataset, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  Tfrmuntitmr = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tb_titmr: TZTable;
    ced: TDBEdit;
    datatbtitmr: TDataSource;
    nom: TDBEdit;
    nac: TDBEdit;
    lna: TDBEdit;
    fna: TDBEdit;
    tit: TDBEdit;
    cpe: TDBEdit;
    feg: TDBEdit;
    lex: TDBEdit;
    fex: TDBEdit;
    pla: TDBEdit;
    cpl: TDBEdit;
    sti: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    con_titmr: TZQuery;
    datatitmr: TDataSource;
    Label14: TLabel;
    mun: TComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cedExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure munKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmuntitmr: Tfrmuntitmr;

implementation

uses frmacces, frmtitulosmribas;

{$R *.dfm}

procedure Tfrmuntitmr.BitBtn2Click(Sender: TObject);
begin
tb_titmr.Cancel;
tb_titmr.Close;
close;
end;

procedure Tfrmuntitmr.BitBtn1Click(Sender: TObject);
begin

if ced.GetTextLen =0 then
begin
   messagebox(0,'Debe ingresar CÉDULA...!','Mensaje al Usuario',16);
   ced.SetFocus;
end
else
begin
     if nac.GetTextLen =0 then
     begin
        messagebox(0,'Debe ingresar NACIONALIDAD...!','Mensaje al Usuario',16);
        nac.SetFocus;
     end
     else
     begin
       if nom.GetTextLen =0 then
       begin
          messagebox(0,'Debe ingresar NOMBRES...!','Mensaje al Usuario',16);
          nom.SetFocus;
       end
       else
       begin
            if lna.GetTextLen =0 then
            begin
              messagebox(0,'Debe ingresar LUGAR DE NACIMIENTO...!','Mensaje al Usuario',16);
              lna.SetFocus;
            end
            else
            begin
               if fna.GetTextLen =0 then
               begin
                 messagebox(0,'Debe ingresar FECHA DE NACIMIENTO...!','Mensaje al Usuario',16);
                 fna.SetFocus;
               end
               else
               begin
                 if tit.GetTextLen =0 then
                 begin
                   messagebox(0,'Debe ingresar TIPO DE TÍTULO...!','Mensaje al Usuario',16);
                   tit.SetFocus;
                 end
                 else
                 begin
                    if cpe.GetTextLen =0 then
                    begin
                      messagebox(0,'Debe ingresar CÓDIGO DE PLAN DE ESTUDIOS...!','Mensaje al Usuario',16);
                      cpe.SetFocus;
                    end
                    else
                    begin
                       if feg.GetTextLen =0 then
                       begin
                         messagebox(0,'Debe ingresar FECHA DE EGRESO...!','Mensaje al Usuario',16);
                         feg.SetFocus;
                       end
                       else
                       begin
                         if lex.GetTextLen =0 then
                         begin
                           messagebox(0,'Debe ingresar LUGAR DE EXPEDICIÓN...!','Mensaje al Usuario',16);
                           lex.SetFocus;
                         end
                         else
                         begin
                           if fex.GetTextLen =0 then
                           begin
                             messagebox(0,'Debe ingresar FECHA DE EXPEDICIÓN...!','Mensaje al Usuario',16);
                             fex.SetFocus;
                           end
                           else
                           begin
                             if pla.GetTextLen =0 then
                             begin
                               messagebox(0,'Debe ingresar PLANTEL...!','Mensaje al Usuario',16);
                               pla.SetFocus;
                             end
                             else
                             begin
                               if cpl.GetTextLen =0 then
                               begin
                                 messagebox(0,'Debe ingresar CÓDIGO DEL PLANTEL...!','Mensaje al Usuario',16);
                                 cpl.SetFocus;
                               end
                               else
                               begin
                                 if sti.GetTextLen =0 then
                                 begin
                                   messagebox(0,'Debe ingresar SERIAL DE TÍTULO...!','Mensaje al Usuario',16);
                                   sti.SetFocus;
                                 end
                                 else
                                 begin

                                 //****************************


                                     tb_titmr.FieldByName('tiponac').Asstring:=nac.Text;
                                     tb_titmr.FieldByName('cedula').Asinteger:=strtoint(ced.Text);
                                     tb_titmr.FieldByName('nombres').Asstring:=nom.Text;
                                     tb_titmr.FieldByName('lugarnac').Asstring:=lna.Text;
                                     tb_titmr.FieldByName('fecnac').Asstring:=fna.Text;
                                     tb_titmr.FieldByName('tipotitulo').Asstring:=tit.Text;
                                     tb_titmr.FieldByName('codplanes').Asstring:=cpe.Text;
                                     tb_titmr.FieldByName('fecegre').Asstring:=feg.Text;
                                     tb_titmr.FieldByName('lugexp').Asstring:=lex.Text;
                                     tb_titmr.FieldByName('fecexp').Asstring:=fex.Text;
                                     tb_titmr.FieldByName('plantel').Asstring:=pla.Text;
                                     tb_titmr.FieldByName('codplantel').Asstring:=cpl.Text;
                                     tb_titmr.FieldByName('serialtitu').Asstring:=sti.Text;
                                     tb_titmr.FieldByName('municipio').Asstring:=mun.Text;
                                     tb_titmr.Post;
                                     tb_titmr.Close;
                                     close;




                                 //****************************
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
       end;
    end;
end;

procedure Tfrmuntitmr.cedExit(Sender: TObject);
begin
if ced.Text<>'' then
begin
   con_titmr.Close;
   con_titmr.Params[0].AsInteger:=strtoint(ced.Text);
   con_titmr.Open;
   if NOT con_titmr.IsEmpty then
   begin
     messagebox(0,'TÍTULO ya Registrado...!','Mensaje al Usuario',16);
     ced.Clear;
     ced.SetFocus;
   end;
end;
end;

procedure Tfrmuntitmr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tfrmuntitmr.FormShow(Sender: TObject);
begin
 tb_titmr.FieldByName('tiponac').Asstring:='V';
 tb_titmr.FieldByName('tipotitulo').Asstring:='BACHILLER INTEGRAL';
 tb_titmr.FieldByName('codplanes').Asstring:='31050';
 tb_titmr.FieldByName('fecegre').Asstring:='2008';
 tb_titmr.FieldByName('lugexp').Asstring:='CIUDAD BOLIVAR';
 tb_titmr.FieldByName('fecexp').Asstring:='15 DE OCTUBRE DE 2010';
 tb_titmr.FieldByName('plantel').Asstring:='ZONA EDUCATIVA DEL ESTADO BOLIVAR';
 tb_titmr.FieldByName('codplantel').Asstring:='Z07A';

end;

procedure Tfrmuntitmr.munKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key <> 13 then
 begin
      Key := 0;
 end
 else
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

end.
