unit frmunmodtitumr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons;

type
  Tfrmmodtitumr = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ced: TDBEdit;
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
    Label14: TLabel;
    mun: TComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmodtitumr: Tfrmmodtitumr;

implementation

uses frmtitulosmribas;

{$R *.dfm}

procedure Tfrmmodtitumr.BitBtn2Click(Sender: TObject);
begin
   
  close;
end;

procedure Tfrmmodtitumr.BitBtn1Click(Sender: TObject);
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

                                     frmtitulosmr.con_titulomr.Edit;
                                     frmtitulosmr.con_titulomr.FieldByName('tiponac').Asstring:=nac.Text;
                                     frmtitulosmr.con_titulomr.FieldByName('cedula').Asinteger:=strtoint(ced.Text);
                                     frmtitulosmr.con_titulomr.FieldByName('nombres').Asstring:=nom.Text;
                                     frmtitulosmr.con_titulomr.FieldByName('lugarnac').Asstring:=lna.Text;
                                     frmtitulosmr.con_titulomr.FieldByName('fecnac').Asstring:=fna.Text;
                                     frmtitulosmr.con_titulomr.FieldByName('tipotitulo').Asstring:=tit.Text;
                                     frmtitulosmr.con_titulomr.FieldByName('codplanes').Asstring:=cpe.Text;
                                     frmtitulosmr.con_titulomr.FieldByName('fecegre').Asstring:=feg.Text;
                                     frmtitulosmr.con_titulomr.FieldByName('lugexp').Asstring:=lex.Text;
                                     frmtitulosmr.con_titulomr.FieldByName('fecexp').Asstring:=fex.Text;
                                     frmtitulosmr.con_titulomr.FieldByName('plantel').Asstring:=pla.Text;
                                     frmtitulosmr.con_titulomr.FieldByName('codplantel').Asstring:=cpl.Text;
                                     frmtitulosmr.con_titulomr.FieldByName('serialtitu').Asstring:=sti.Text;
                                     frmtitulosmr.con_titulomr.FieldByName('municipio').Asstring:=mun.Text;
                                     frmtitulosmr.con_titulomr.Post;

                                     frmtitulosmr.con_titulomr.Close;
                                     frmtitulosmr.con_titulomr.SQL.Text:='select * from titulosmr  where cedula like :c order by cedula';
                                     frmtitulosmr.con_titulomr.Params[0].Asstring:='%';
                                     frmtitulosmr.con_titulomr.open;
                                     frmtitulosmr.grid_titulomr.ResetFullRefresh;
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

procedure Tfrmmodtitumr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
 begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tfrmmodtitumr.FormShow(Sender: TObject);
begin
mun.Text:=frmtitulosmr.con_titulomr.FieldByName('municipio').Asstring;
end;

end.
