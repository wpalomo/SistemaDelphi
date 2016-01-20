unit frmtitu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ComCtrls,
  StdCtrls, Buttons, dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib,
  ExtCtrls, Mask, DBCtrls, jpeg, dxTL, dxDBCtrl, dxDBGrid, ToolEdit,
  CurrEdit;

type
  Tfrmtit = class(TForm)
    Label13: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    Label46: TLabel;
    Image1: TImage;
    Panel4: TPanel;
    Label3: TLabel;
    Panel5: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Panel6: TPanel;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    Panel10: TPanel;
    Panel11: TPanel;
    Label14: TLabel;
    Panel17: TPanel;
    Panel18: TPanel;
    Label22: TLabel;
    Panel19: TPanel;
    Label23: TLabel;
    Panel20: TPanel;
    Label24: TLabel;
    Panel21: TPanel;
    Label26: TLabel;
    Panel22: TPanel;
    Label27: TLabel;
    Panel23: TPanel;
    Label28: TLabel;
    Panel24: TPanel;
    Label29: TLabel;
    Panel27: TPanel;
    Label32: TLabel;
    Panel28: TPanel;
    Label33: TLabel;
    Panel36: TPanel;
    Label47: TLabel;
    Panel37: TPanel;
    Label48: TLabel;
    Panel38: TPanel;
    Label49: TLabel;
    Panel39: TPanel;
    Label50: TLabel;
    Panel40: TPanel;
    Label51: TLabel;
    Panel42: TPanel;
    Label53: TLabel;
    BitBtn2: TBitBtn;
    sin: TRadioButton;
    str: TRadioButton;
    Panel7: TPanel;
    Label10: TLabel;
    Panel9: TPanel;
    Label12: TLabel;
    smh: TRadioButton;
    seg: TRadioButton;
    sti: TRadioButton;
    slc: TRadioButton;
    Panel12: TPanel;
    Label15: TLabel;
    Panel46: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    datamov: TDataSource;
    con_emp: TZQuery;
    Panel50: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Panel2: TPanel;
    Label21: TLabel;
    Panel3: TPanel;
    Label16: TLabel;
    Panel8: TPanel;
    Panel30: TPanel;
    Label38: TLabel;
    Panel13: TPanel;
    Label17: TLabel;
    Panel14: TPanel;
    Label1: TLabel;
    fri: TDateTimePicker;
    grid_mun: TdxDBGrid;
    grid_munCOD: TdxDBGridMaskColumn;
    grid_munNOMBRE: TdxDBGridMaskColumn;
    con_mun: TZQuery;
    datamun: TDataSource;
    datadep: TDataSource;
    con_dep: TZQuery;
    grid_dep: TdxDBGrid;
    grid_depcod: TdxDBGridMaskColumn;
    grid_depnombre: TdxDBGridMaskColumn;
    grid_cargo: TdxDBGrid;
    grid_cargopd: TdxDBGridMaskColumn;
    grid_cargodes: TdxDBGridMaskColumn;
    grid_jer: TdxDBGrid;
    grid_jersd: TdxDBGridMaskColumn;
    grid_jerdes: TdxDBGridMaskColumn;
    grid_mod: TdxDBGrid;
    grid_modtd: TdxDBGridMaskColumn;
    grid_moddes: TdxDBGridMaskColumn;
    grid_cat: TdxDBGrid;
    grid_catcd: TdxDBGridMaskColumn;
    grid_catdes: TdxDBGridMaskColumn;
    grid_turno: TdxDBGrid;
    grid_turnoqd: TdxDBGridMaskColumn;
    grid_turnodes: TdxDBGridMaskColumn;
    grid_ded: TdxDBGrid;
    grid_dedsexd: TdxDBGridMaskColumn;
    grid_deddes: TdxDBGridMaskColumn;
    con_cargo: TZQuery;
    con_mod: TZQuery;
    con_tur: TZQuery;
    con_jer: TZQuery;
    datajer: TDataSource;
    datacat: TDataSource;
    con_cat: TZQuery;
    dataded: TDataSource;
    con_ded: TZQuery;
    datacargo: TDataSource;
    datamod: TDataSource;
    datatur: TDataSource;
    con_movr: TZQuery;
    Datamovr: TDataSource;
    ced: TEdit;
    con_movcs: TZQuery;
    dataceds: TDataSource;
    ces: TEdit;
    fac: TDateTimePicker;
    Edit1: TEdit;
    efe: TEdit;
    fin: TDateTimePicker;
    s1: TEdit;
    s2: TEdit;
    s3: TEdit;
    cdcp: TEdit;
    ccap: TEdit;
    ndcp: TEdit;
    nccp: TEdit;
    ude: TEdit;
    asig: TEdit;
    Panel15: TPanel;
    nom: TEdit;
    cd1: TEdit;
    cd2: TEdit;
    cd3: TEdit;
    nd1: TEdit;
    nd2: TEdit;
    nd3: TEdit;
    cc1: TEdit;
    cc2: TEdit;
    cc3: TEdit;
    dc1: TEdit;
    dc2: TEdit;
    dc3: TEdit;
    ch1: TEdit;
    ch2: TEdit;
    ch3: TEdit;
    nfs: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    hdoc: TRxCalcEdit;
    act_tit: TZQuery;
    datatit: TDataSource;
    usu: TEdit;
    fij: TCheckBox;
    Label19: TLabel;
    porcen: TRxCalcEdit;
    loc: TEdit;
    Label30: TLabel;
    grid_titu: TdxDBGrid;
    grid_tituCOD_DEP: TdxDBGridMaskColumn;
    grid_tituNOM_DEP: TdxDBGridMaskColumn;
    grid_titutipomov_t: TdxDBGridMaskColumn;
    obstipo: TPageControl;
    TabSheet1: TTabSheet;
    obs: TMemo;
    TabSheet2: TTabSheet;
    obs2: TMemo;
    procedure grid_munDblClick(Sender: TObject);
    procedure grid_depDblClick(Sender: TObject);
    procedure grid_jerDblClick(Sender: TObject);
    procedure grid_modDblClick(Sender: TObject);
    procedure grid_catDblClick(Sender: TObject);
    procedure grid_turnoDblClick(Sender: TObject);
    procedure grid_dedDblClick(Sender: TObject);
    procedure cdcpDblClick(Sender: TObject);
    procedure ccapDblClick(Sender: TObject);
    procedure cesKeyPress(Sender: TObject; var Key: Char);
    procedure cedExit(Sender: TObject);
    procedure cedKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cesExit(Sender: TObject);
    procedure grid_cargoDblClick(Sender: TObject);
    procedure limpiar();
    procedure cedEnter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ch1KeyPress(Sender: TObject; var Key: Char);
    procedure hdocKeyPress(Sender: TObject; var Key: Char);
    procedure porcenKeyPress(Sender: TObject; var Key: Char);
    procedure grid_tituDblClick(Sender: TObject);
    procedure grid_tituExit(Sender: TObject);
    procedure cd1Enter(Sender: TObject);
    procedure cd2Enter(Sender: TObject);
    procedure cd3Enter(Sender: TObject);
    procedure cdcpEnter(Sender: TObject);
    procedure cc1Enter(Sender: TObject);
    procedure cc2Enter(Sender: TObject);
    procedure cc3Enter(Sender: TObject);
    procedure ccapEnter(Sender: TObject);
  private
    { Private declarations }
    opc:byte;
    auxcc:string;

  public
    { Public declarations }
  end;

var
  frmtit: Tfrmtit;
  codigo_cargo,nombre_cargo:string;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmtit.limpiar();
begin
   ced.Clear;
   nom.Clear;
   cd1.Clear;
   cd2.Clear;
   cd3.Clear;
   nd1.Clear;
   nd2.Clear;
   nd3.Clear;
   cc1.Clear;
   cc2.Clear;
   cc3.Clear;
   dc1.Clear;
   dc2.Clear;
   dc3.Clear;
   ch1.Clear;
   ch2.Clear;
   ch3.Clear;
   s1.Clear;
   s2.Clear;
   s3.Clear;
   cdcp.Clear;
   ndcp.Clear;
   hdoc.Clear;
   fij.Checked:=true;
   fij.Enabled:=false;
   ccap.Clear;
   nccp.Clear;
   ude.Clear;
   asig.Clear;
   grid_cat.Visible:=false;
   grid_mod.Visible:=false;
   grid_jer.Visible:=false;
   grid_turno.Visible:=false;
   grid_ded.Visible:=false;
   grid_cargo.Visible:=false;
   obs.Text:='Ingresa a la Carrera de Docente como Titular con fundamento en la Resolución Nro.003 y 004 del 14 de Enero de 2009, Gaceta Oficial de la República  Bolivariana  de Venezuela Nro. 38.098 de la misma fecha.';
   fac.Date:=date;
   fin.Date:=date;
   porcen.Clear;
   loc.Clear;
   obstipo.ActivePageIndex:=1;

end;

procedure Tfrmtit.grid_munDblClick(Sender: TObject);
begin
   con_dep.Close;
   con_dep.Params[0].AsInteger:=con_mun.fieldbyname('cod').AsInteger;
   con_dep.Open;
  if opc=4 then
  begin
   ude.Text:=con_mun.fieldbyname('nombre').Asstring;
  end;  
   grid_dep.visible:=true;
   grid_dep.SetFocus;

end;

procedure Tfrmtit.grid_depDblClick(Sender: TObject);
begin
     grid_dep.visible:=false;
     grid_mun.Visible:=false;
     if opc=1 then
     begin
        cd1.Clear;
        cd1.Text:=con_dep.fieldbyname('cod').asstring;
        nd1.Text:=con_dep.fieldbyname('nombre').asstring;
        cd1.setfocus;
     end;
          if opc=2 then
     begin
        cd2.Clear;
        cd2.Text:=con_dep.fieldbyname('cod').asstring;
        nd2.Text:=con_dep.fieldbyname('nombre').asstring;
        cd2.setfocus;
     end;

          if opc=3 then
     begin
        cd3.Clear;
        cd3.Text:=con_dep.fieldbyname('cod').asstring;
        nd3.Text:=con_dep.fieldbyname('nombre').asstring;
        cd3.setfocus;
     end;

          if opc=4 then
     begin
        cdcp.Clear;
        cdcp.Text:=con_dep.fieldbyname('cod').asstring;
        ndcp.Text:=con_dep.fieldbyname('nombre').asstring;
        cdcp.setfocus;
     end;


end;

procedure Tfrmtit.grid_jerDblClick(Sender: TObject);
begin
   codigo_cargo:=codigo_cargo+con_jer.FieldByName('sd').AsString;

   grid_jer.visible:=false;
   con_mod.close;
   con_mod.Open;
   grid_mod.Visible:=true;
   grid_mod.SetFocus;
end;

procedure Tfrmtit.grid_modDblClick(Sender: TObject);
begin
   codigo_cargo:=codigo_cargo+con_mod.FieldByName('td').AsString;
   grid_mod.visible:=false;
   con_cat.close;
   con_cat.Open;
   grid_cat.Visible:=true;
   grid_cat.SetFocus;
end;

procedure Tfrmtit.grid_catDblClick(Sender: TObject);
begin
   codigo_cargo:=codigo_cargo+con_cat.FieldByName('cd').AsString;
   if (not((auxcc='5') or (auxcc='6'))) then
   begin
   nombre_cargo:=con_cat.FieldByName('des').AsString;
   end;
   grid_cat.visible:=false;
   con_tur.close;
   con_tur.Open;
   grid_turno.Visible:=true;
   grid_turno.SetFocus;
end;

procedure Tfrmtit.grid_turnoDblClick(Sender: TObject);
begin
 codigo_cargo:=codigo_cargo+con_tur.FieldByName('qd').AsString;
   grid_turno.visible:=false;
   con_ded.close;
   con_ded.Open;
   grid_ded.Visible:=true;
   grid_ded.SetFocus;
end;

procedure Tfrmtit.grid_dedDblClick(Sender: TObject);
begin
   codigo_cargo:=codigo_cargo+con_ded.FieldByName('sexd').AsString;
   grid_ded.visible:=false;

   if opc=5 then
   begin
     cc1.Clear;
     cc1.Text:=codigo_cargo;
     dc1.Text:=nombre_cargo;
     cc1.setfocus;
   end;
    if opc=6 then
   begin
     cc2.Clear;
     cc2.Text:=codigo_cargo;
     dc2.Text:=nombre_cargo;
     cc2.setfocus;
   end;
    if opc=7 then
   begin
     cc3.Clear;
     cc3.Text:=codigo_cargo;
     dc3.Text:=nombre_cargo;
     cc3.setfocus;
   end;

   if opc=8 then
   begin
     ccap.Clear;
     ccap.Text:=codigo_cargo;
     nccp.Text:=nombre_cargo;
     ccap.setfocus;
   end;


end;

procedure Tfrmtit.cdcpDblClick(Sender: TObject);
begin
   con_mun.Close;
   con_mun.Open;
   grid_mun.Visible:=true;
   grid_mun.SetFocus;

end;

procedure Tfrmtit.ccapDblClick(Sender: TObject);
begin
   ccap.Clear;
   codigo_cargo:='';
   con_cargo.Close;
   con_cargo.Open;
   grid_cargo.Visible:=true;
   grid_cargo.SetFocus;

end;

procedure Tfrmtit.cesKeyPress(Sender: TObject; var Key: Char);
begin
if ((key>=#48) and (key<=#57)) or ((key>=#96) and (key<=#105)) or (key=#8) then
else
  key:=#0;
end;

procedure Tfrmtit.cedExit(Sender: TObject);
begin
if ced.Text<>'' then
begin
 if (not sin.Checked) and (not str.Checked) and (not slc.Checked) and (not smh.Checked) and (not seg.Checked) and (not sti.Checked) then
 begin
          application.MessageBox('Debe Elegir el TIPO DE MOVIMIENTO...!','Mensaje al Usuario',16);
          sin.SetFocus;
 end
 else
 begin
       if ced.Text <> '' then
       begin
         con_movr.Close;
         con_movr.Params[0].AsInteger:=strtoint(ced.Text);
         con_movr.SQL.Text:='select * from empleados where cedula=:ced and tipo_trabajador="T"';
         con_movr.ExecSQL;
         con_movr.Open;
         if not con_movr.IsEmpty then
         begin
           if con_movr.RecordCount=1 then
           begin
           grid_titu.Visible:=false;
              if (con_movr.FieldByName('tmp').AsString='S') then
              begin
                application.MessageBox('El Empleado trabaja como Madre Procesadora...!','Mensaje al Usuario',16);
                limpiar();
                ced.SetFocus;
              end
              else
              begin
                if  MessageDlg('El Empleado Ya es Titular...! ¿Desea Modificarlo?',
                    mtConfirmation,[mbYes, mbNo],0)=mrNo then
                begin
                    ced.SetFocus;
                end
                else
                begin

                 nom.Text:=con_movr.FieldByName('nombre').AsString;

                 ch1.text:=con_movr.FieldByName('hor_p').AsString;
                 ch2.Text:=con_movr.FieldByName('hor_p2').AsString;
                 ch3.Text:=con_movr.FieldByName('hor_p3').AsString;

                 cdcp.Text:=con_movr.FieldByName('cod_dep_t').AsString;
                 ndcp.Text:=con_movr.FieldByName('nom_dep_t').AsString;
                 ccap.Text:=con_movr.FieldByName('cod_carg_t').AsString;
                 nccp.Text:=con_movr.FieldByName('nom_carg_t').AsString;

                 cd1.Text:=con_movr.FieldByName('cod_dep_p').AsString;
                 cd2.Text:=con_movr.FieldByName('cod_dep_p2').AsString;
                 cd3.Text:=con_movr.FieldByName('cod_dep_p3').AsString;


                 nd1.Text:=con_movr.FieldByName('nom_dep_p').AsString;
                 nd2.Text:=con_movr.FieldByName('nom_dep_p2').AsString;
                 nd3.Text:=con_movr.FieldByName('nom_dep_p3').AsString;

                 cc1.Text:=con_movr.FieldByName('cod_car_p').AsString;
                 cc2.Text:=con_movr.FieldByName('cod_car_p2').AsString;
                 cc3.Text:=con_movr.FieldByName('cod_car_p3').AsString;


                 dc1.Text:=con_movr.FieldByName('nom_car_p').AsString;
                 dc2.Text:=con_movr.FieldByName('nom_car_p2').AsString;
                 dc3.Text:=con_movr.FieldByName('nom_car_p3').AsString;

                 hdoc.Value:=con_movr.FieldByName('horas_t').AsFloat;

                 fac.Date:=con_movr.FieldByName('fec_elamov_t').AsDateTime;
                 fin.Date:=con_movr.FieldByName('fecha_ing_t').AsDateTime;
                 fri.Date:=con_movr.FieldByName('fecha_act_t').AsDateTime;

                 porcen.Value:=con_movr.FieldByName('porcentaje').AsFloat;
                 loc.Text:=con_movr.FieldByName('locali').Asstring;
                 asig.Text:=con_movr.FieldByName('asig_t').AsString;
                 ude.Text:=con_movr.FieldByName('ub_dep_t').AsString;
                 
                  if con_movr.FieldByName('obs_c').AsString='2' then
                 begin
                  obstipo.ActivePageIndex:=1;
                  obs2.Text:=con_movr.FieldByName('obs_t').AsString;
                 end;
                 if con_movr.FieldByName('obs_c').AsString='1' then
                 begin
                  obstipo.ActivePageIndex:=0;
                  obs.Text:=con_movr.FieldByName('obs_t').AsString;

                 end;

                end;
           end;
          end
          else
          begin
             if con_movr.RecordCount>1 then
             begin
             ///***
              grid_titu.Visible:=true;
              grid_titu.SetFocus;
             //*****
             end;
          end;


        end
        else
        begin
           con_movr.Close;
           con_movr.Params[0].AsInteger:=strtoint(ced.Text);
           con_movr.SQL.Text:='select * from empleados where cedula=:ced';
           con_movr.ExecSQL;
           con_movr.Open;
           if not con_movr.IsEmpty then
           begin
                 con_movr.Last;
                 nom.Text:=con_movr.FieldByName('nombre').AsString;

                 cd1.Text:=con_movr.FieldByName('cod_dep_p').AsString;
                 cd2.Text:=con_movr.FieldByName('cod_dep_p2').AsString;
                 cd3.Text:=con_movr.FieldByName('cod_dep_p3').AsString;


                 nd1.Text:=con_movr.FieldByName('nom_dep_p').AsString;
                 nd2.Text:=con_movr.FieldByName('nom_dep_p2').AsString;
                 nd3.Text:=con_movr.FieldByName('nom_dep_p3').AsString;

                 cc1.Text:=con_movr.FieldByName('cod_car_p').AsString;
                 cc2.Text:=con_movr.FieldByName('cod_car_p2').AsString;
                 cc3.Text:=con_movr.FieldByName('cod_car_p3').AsString;


                 dc1.Text:=con_movr.FieldByName('nom_car_p').AsString;
                 dc2.Text:=con_movr.FieldByName('nom_car_p2').AsString;
                 dc3.Text:=con_movr.FieldByName('nom_car_p3').AsString;


                 ch1.Text:=con_movr.FieldByName('hor_p').AsString;
                 ch2.Text:=con_movr.FieldByName('hor_p2').AsString;
                 ch3.Text:=con_movr.FieldByName('hor_p3').AsString;
          end
          else
          begin
              application.MessageBox('El Empleado no Existe...!','Mensaje al Usuario',16);
              limpiar();
              ced.SetFocus;
          end;
       end;
     end;
    end;
 end;
end;

procedure Tfrmtit.cedKeyPress(Sender: TObject; var Key: Char);
begin
if ((key>=#48) and (key<=#57)) or ((key>=#96) and (key<=#105)) or (key=#8) then
else
  key:=#0;
end;

procedure Tfrmtit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 13 then
   begin
       Key := 0;
       Perform(WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure Tfrmtit.FormShow(Sender: TObject);
begin
limpiar();
codigo_cargo:='';
usu.Text:=frmacceso.con_usu.fieldbyname('nombre').AsString;
fac.Date:=date;
fin.Date:=date;
sti.SetFocus;
end;

procedure Tfrmtit.BitBtn1Click(Sender: TObject);
begin
con_emp.Cancel;
con_emp.Close;
close;
end;

procedure Tfrmtit.cesExit(Sender: TObject);
begin
 if ces.Text <> '' then
  begin
       con_movcs.Close;
       con_movcs.Params[0].AsInteger:=strtoint(ces.Text);
       con_movcs.Open;
       if not con_movcs.IsEmpty then
       begin
          application.MessageBox('Recurso ya Utilizado...!','Mensaje al Usuario',32);
          ces.SetFocus;
       end;
  end;
end;

procedure Tfrmtit.grid_cargoDblClick(Sender: TObject);
begin
   auxcc:='';
   codigo_cargo:=codigo_cargo+con_cargo.FieldByName('pd').AsString;
   auxcc:=codigo_cargo;
   if ((codigo_cargo='5') or (codigo_cargo='6')) then
   begin
      nombre_cargo:=con_cargo.FieldByName('des').AsString;
   end;
    grid_cargo.Visible:=false;
   con_jer.close;
   con_jer.Open;
   grid_jer.Visible:=true;
   grid_jer.SetFocus;
end;

procedure Tfrmtit.cedEnter(Sender: TObject);
begin
limpiar();
end;

procedure Tfrmtit.BitBtn2Click(Sender: TObject);
begin
    if ced.Text='' then
    begin
         application.MessageBox('Debe ingresar una Cédula...!','Mensaje al Usuario',16);
         ced.SetFocus;
    end
    else
    begin
      if cdcp.Text='' then
      begin
         application.MessageBox('Debe ingresar Código de Dependencia..!','Mensaje al Usuario',16);
         cdcp.SetFocus;
      end
      else
      begin
        if ccap.Text='' then
        begin
         application.MessageBox('Debe ingresar Código de Cargo..!','Mensaje al Usuario',16);
         ccap.SetFocus;
        end
        else
        begin
         if hdoc.Value=0 then
         begin
           application.MessageBox('Debe ingresar las Horas de trabajo asignadas..!','Mensaje al Usuario',16);
           hdoc.SetFocus;
         end
         else
         begin
          if ude.Text='' then
          begin
           application.MessageBox('Debe ingresar ubicación de la dependencia..!','Mensaje al Usuario',16);
           ude.SetFocus;
          end
          else
          begin
            if asig.Text='' then
            begin
              application.MessageBox('Debe ingresar la Asignatura...!','Mensaje al Usuario',16);
              asig.SetFocus;
            end
            else
            begin

             if porcen.Value=0 then
            begin
              application.MessageBox('Debe ingresar el porcentaje de evaluación...!','Mensaje al Usuario',16);
              porcen.SetFocus;
            end
            else
            begin
             if loc.Text='' then
            begin
              application.MessageBox('Debe ingresar la localidad...!','Mensaje al Usuario',16);
              loc.SetFocus;
            end
            else
            begin
              act_tit.Close;
              act_tit.Params[0].AsString:=cdcp.Text;
              act_tit.Params[1].AsString:=ndcp.Text;
              act_tit.Params[2].AsString:=ccap.Text;
              act_tit.Params[3].AsString:=nccp.Text;


              act_tit.Params[4].AsString:=ude.Text;
              act_tit.Params[5].AsString:=asig.Text;
              if hdoc.Text='' then hdoc.text:='0';
              act_tit.Params[6].Asfloat:=hdoc.Value;

              act_tit.Params[7].AsString:=cd1.Text;
              act_tit.Params[8].AsString:=nd1.Text;
              act_tit.Params[9].AsString:=cc1.Text;
              act_tit.Params[10].AsString:=dc1.Text;

              if ch1.Text='' then ch1.text:='0';
              act_tit.Params[11].AsFloat:=strtofloat(ch1.Text);

              if obstipo.ActivePageIndex=0 then
              begin
                 act_tit.Params[12].AsString:=obs.Text;
                 act_tit.Params[13].AsString:='1';
              end
              else
              begin
                  if obstipo.ActivePageIndex=1 then
                 act_tit.Params[12].AsString:=obs2.Text;
                 act_tit.Params[13].AsString:='2';
              end;

              act_tit.Params[14].AsString:=usu.Text;
              act_tit.Params[15].AsDate:=fin.date;
              act_tit.Params[16].Asdate:=fri.Date;
              act_tit.Params[17].AsDate:=Date;
              if porcen.Text='' then porcen.text:='0';
              act_tit.Params[18].Asfloat:=porcen.value;


              act_tit.Params[19].AsString:=cd2.Text;
              act_tit.Params[20].AsString:=nd2.Text;
              act_tit.Params[21].AsString:=cc2.Text;
              act_tit.Params[22].AsString:=dc2.Text;
              if ch2.Text='' then ch2.text:='0';
              act_tit.Params[23].Asfloat:=strtofloat(ch2.Text);

              act_tit.Params[24].AsString:=cd3.Text;
              act_tit.Params[25].AsString:=nd3.Text;
              act_tit.Params[26].AsString:=cc3.Text;
              act_tit.Params[27].AsString:=dc3.Text;

              if ch3.Text='' then ch3.text:='0';
              act_tit.Params[28].Asfloat:=strtofloat(ch3.Text);
              act_tit.Params[29].AsString:=loc.Text;

              act_tit.Params[30].AsInteger:=strtoint(ced.Text);
              act_tit.Params[31].Asinteger:=con_movr.fieldbyname('id').asinteger;




              act_tit.ExecSQL;
              application.MessageBox('Actualizado con Exito...!','Mensaje al Usuario',64);
              limpiar();
              ced.SetFocus;
              end;
            end;
          end;
         end;
       end;
     end;
   end;
  end;
end;

procedure Tfrmtit.ch1KeyPress(Sender: TObject; var Key: Char);
begin
if (key='.') then
   key:=',';

if ((key>=#48) and (key<=#57)) or ((key>=#96) and (key<=#105))  or (key=#8) then
  else
  begin
    if (key<>#13) and (key<>',') then
    key:=#0;
  end;

end;

procedure Tfrmtit.hdocKeyPress(Sender: TObject; var Key: Char);
begin
if (key='.') then
   key:=',';

if ((key>=#48) and (key<=#57)) or ((key>=#96) and (key<=#105))  or (key=#8) then
  else
  begin
    if (key<>#13) and (key<>',') then
    key:=#0;
  end;
end;

procedure Tfrmtit.porcenKeyPress(Sender: TObject; var Key: Char);
begin
 if (key='.') then
   key:=',';

if ((key>=#48) and (key<=#57)) or ((key>=#96) and (key<=#105))  or (key=#8) then
  else
  begin
    if (key<>#13) and (key<>',') then
    key:=#0;
  end;
end;

procedure Tfrmtit.grid_tituDblClick(Sender: TObject);
begin
             if (con_movr.FieldByName('tmp').AsString='S') then
              begin
                application.MessageBox('El Empleado trabaja como Madre Procesadora...!','Mensaje al Usuario',16);
                limpiar();
                ced.SetFocus;
              end
              else
              begin
                if  MessageDlg('¿Desea Modificarlo?',
                    mtConfirmation,[mbYes, mbNo],0)=mrNo then
                begin
                    ced.SetFocus;
                end
                else
                begin

                 nom.Text:=con_movr.FieldByName('nombre').AsString;

                 ch1.text:=con_movr.FieldByName('hor_p').AsString;
                 ch2.Text:=con_movr.FieldByName('hor_p2').AsString;
                 ch3.Text:=con_movr.FieldByName('hor_p3').AsString;

                 cdcp.Text:=con_movr.FieldByName('cod_dep_t').AsString;
                 ndcp.Text:=con_movr.FieldByName('nom_dep_t').AsString;
                 ccap.Text:=con_movr.FieldByName('cod_carg_t').AsString;
                 nccp.Text:=con_movr.FieldByName('nom_carg_t').AsString;

                 cd1.Text:=con_movr.FieldByName('cod_dep_p').AsString;
                 cd2.Text:=con_movr.FieldByName('cod_dep_p2').AsString;
                 cd3.Text:=con_movr.FieldByName('cod_dep_p3').AsString;


                 nd1.Text:=con_movr.FieldByName('nom_dep_p').AsString;
                 nd2.Text:=con_movr.FieldByName('nom_dep_p2').AsString;
                 nd3.Text:=con_movr.FieldByName('nom_dep_p3').AsString;

                 cc1.Text:=con_movr.FieldByName('cod_car_p').AsString;
                 cc2.Text:=con_movr.FieldByName('cod_car_p2').AsString;
                 cc3.Text:=con_movr.FieldByName('cod_car_p3').AsString;


                 dc1.Text:=con_movr.FieldByName('nom_car_p').AsString;
                 dc2.Text:=con_movr.FieldByName('nom_car_p2').AsString;
                 dc3.Text:=con_movr.FieldByName('nom_car_p3').AsString;

                 hdoc.Value:=con_movr.FieldByName('horas_t').AsFloat;

                 fac.Date:=con_movr.FieldByName('fec_elamov_t').AsDateTime;
                 fin.Date:=con_movr.FieldByName('fecha_ing_t').AsDateTime;
                 fri.Date:=con_movr.FieldByName('fecha_act_t').AsDateTime;

                 porcen.Value:=con_movr.FieldByName('porcentaje').AsFloat;
                 loc.Text:=con_movr.FieldByName('locali').Asstring;
                 asig.Text:=con_movr.FieldByName('asig_t').AsString;
                 ude.Text:=con_movr.FieldByName('ub_dep_t').AsString;

                 if con_movr.FieldByName('obs_c').AsString='2' then
                 begin
                  obstipo.ActivePageIndex:=1;
                  obs2.Text:=con_movr.FieldByName('obs_t').AsString;
                 end;
                 if con_movr.FieldByName('obs_c').AsString='1' then
                 begin
                  obstipo.ActivePageIndex:=0;
                  obs.Text:=con_movr.FieldByName('obs_t').AsString;

                 end;

                end;
               end;
              grid_titu.Visible:=false;

end;

procedure Tfrmtit.grid_tituExit(Sender: TObject);
begin
  grid_titu.Visible:=false;
end;

procedure Tfrmtit.cd1Enter(Sender: TObject);
begin
  opc:=1;
end;

procedure Tfrmtit.cd2Enter(Sender: TObject);
begin
opc:=2;
end;

procedure Tfrmtit.cd3Enter(Sender: TObject);
begin
opc:=3;
end;

procedure Tfrmtit.cdcpEnter(Sender: TObject);
begin
  opc:=4;
end;

procedure Tfrmtit.cc1Enter(Sender: TObject);
begin
 opc:=5;
end;

procedure Tfrmtit.cc2Enter(Sender: TObject);
begin
opc:=6;
end;

procedure Tfrmtit.cc3Enter(Sender: TObject);
begin
opc:=7;
end;

procedure Tfrmtit.ccapEnter(Sender: TObject);
begin
opc:=8;
end;

end.
