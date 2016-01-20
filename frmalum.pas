unit frmalum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  Tfrmalu = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Edit4: TEdit;
    Edit5: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit6: TEdit;
    GroupBox5: TGroupBox;
    RadioButton3: TRadioButton;
    GroupBox7: TGroupBox;
    eep: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    lb_na: TLabel;
    lb_nd: TLabel;
    lb_nc: TLabel;
    lb_ne: TLabel;
    lb_nf: TLabel;
    lb_nb: TLabel;
    Label12: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    GroupBox8: TGroupBox;
    rc2: TRadioButton;
    rc1: TRadioButton;
    rc3: TRadioButton;
    rd2: TRadioButton;
    rd1: TRadioButton;
    re3: TRadioButton;
    re2: TRadioButton;
    re1: TRadioButton;
    rf1: TRadioButton;
    ra: TRadioButton;
    rb: TRadioButton;
    ra1: TRadioButton;
    ra2: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    rb5: TRadioButton;
    rb6: TRadioButton;
    GroupBox9: TGroupBox;
    e1: TEdit;
    eb2: TRadioButton;
    ee: TRadioButton;
    ei: TRadioButton;
    eb1: TRadioButton;
    eb3: TRadioButton;
    em: TRadioButton;
    Label7: TLabel;
    GroupBox6: TGroupBox;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    GroupBox10: TGroupBox;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    GroupBox11: TGroupBox;
    Edit7: TEdit;
    GroupBox12: TGroupBox;
    Edit8: TEdit;
    GroupBox13: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    GroupBox14: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmalu: Tfrmalu;

implementation

uses frmacces;

{$R *.dfm}

procedure Tfrmalu.BitBtn2Click(Sender: TObject);
begin
close;
end;

end.
