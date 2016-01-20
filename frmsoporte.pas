unit frmsoporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, StdCtrls, Buttons, JimZoomImage, jpeg,
  ExtCtrls;

type
  TForm1 = class(TForm)
    cuadro: TShape;
    Image1: TImage;
    titu: TLabel;
    control: TLabel;
    sal: TLabel;
    SB: TScrollBox;
    SB2: TScrollBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    impr1: TBitBtn;
    impr2: TBitBtn;
    impr3: TBitBtn;
    impr4: TBitBtn;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppImage1: TppImage;
    ppFooterBand1: TppFooterBand;
    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel2: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppImage2: TppImage;
    ppFooterBand2: TppFooterBand;
    ppReport3: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel3: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppImage3: TppImage;
    ppFooterBand3: TppFooterBand;
    ppReport4: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel4: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppImage4: TppImage;
    ppFooterBand4: TppFooterBand;
    SB3: TScrollBox;
    SB4: TScrollBox;
    procedure FormPaint(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure impr1Click(Sender: TObject);
    procedure impr2Click(Sender: TObject);
    procedure impr3Click(Sender: TObject);
    procedure impr4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  
  
    procedure img1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  SX: Integer;
  SY: Integer;
  LX: Integer;
  LY: Integer;

implementation

{$R *.dfm}

procedure GradientForm (frm : TForm; startcolor, endcolor : TColor);
var
  startr : integer;
  startg : integer;
  startb : integer;
  endr   : integer;
  endg   : integer;
  endb   : integer;
  curr   : integer;
  curg   : integer;
  curb   : integer;
  i      : integer;
  r      : TRect;
  nolines: byte;
  curpct : integer;
  bitspix: longint;
begin
  startr := startcolor and  $000000FF;
  startg := (startcolor and $0000FF00) div 256;
  startb := (startcolor and $00FF0000) div 256 div 256;
  endr := endcolor and  $000000FF;
  endg := (endcolor and $0000FF00) div 256;
  endb := (endcolor and $00FF0000) div 256 div 256;

  if frm.Height < 250 then
    nolines:=frm.Height
  else
    nolines:=250;
  bitspix:=GetDeviceCaps(frm.Canvas.Handle, BITSPIXEL);
  if (bitspix = 8) and (nolines > 50) then
    nolines:=50
  else if bitspix < 8 then
    nolines:=4;

  r.Left:=0;
  r.Right:=frm.Width;

  for i:=0 to nolines do
  begin

    curpct:= (i * 100) div nolines;


    if startr > endr then
     curr := startr - (curpct * (startr-endr) div 100)
    else
     curr := startr + (curpct * (endr-startr) div 100);


    if startg > endg then
     curg := startg - (curpct * (startg-endg) div 100)
    else
     curg := startg + (curpct * (endg-startg) div 100);


    if startb > endb then
     curb := startb - (curpct * (startb-endb) div 100)
    else
     curb := startb + (curpct * (endb-startb) div 100);


    frm.Canvas.Brush.Color:=RGB(curr, curg, curb);


    r.Top:=i + (i*(frm.Height div nolines));
    r.Bottom:=r.Top + (frm.Height div nolines)+1;


    frm.Canvas.FillRect(r);
  end;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  GradientForm(Form1,RGB(60,140,210), RGB(1,1,2));

end;

procedure TForm1.Image1Click(Sender: TObject);
begin
close
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

if sb.Visible=true then
begin
 SB.DoubleBuffered:= True;
// Img1.Top := 0;
 //Img1.Left := 0;
 //LX := (Img1.Width - SB.ClientWidth) * -1;
 //LY := (Img1.Height - SB.ClientHeight) * -1;
end;
if SB2.Visible=TRUE then
begin
 SB2.DoubleBuffered:= True;
 //Img2.Top := 0;
 //Img2.Left := 0;
 //LX := (Img2.Width - SB2.ClientWidth) * -1;
 //LY := (Img2.Height - SB2.ClientHeight) * -1;
end;

if sb3.Visible=true then
begin
 SB3.DoubleBuffered:= True;
 //Img3.Top := 0;
 //Img3.Left := 0;
 //LX := (Img3.Width - SB3.ClientWidth) * -1;
 //LY := (Img3.Height - SB3.ClientHeight) * -1;
end;

if sb4.Visible=true then
begin
 SB4.DoubleBuffered:= True;
 //Img4.Top := 0;
 //Img4.Left := 0;
 //LX := (Img4.Width - SB4.ClientWidth) * -1;
 //LY := (Img4.Height - SB4.ClientHeight) * -1;
end;

end;

procedure TForm1.img1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
NX: Integer;
NY: Integer;
begin

if not (ssLeft in Shift) then
  Exit;

//NX := Img1.Left + X - SX;
//NY := Img1.Top + Y - SY;

if (NX < 0) and (NX > LX) then
  //Img1.Left := NX;

if (NY < 0) and (NY > LY) then
  //Img1.Top := NY;
end;

procedure TForm1.img1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
SX := X;
SY := Y;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if sb.Visible=true then
begin
  //img1.ZoomX:=img1.ZoomX+10;
  //img1.ZoomY:=img1.ZoomY+10;
end;
if sb2.Visible=true then
begin
 // img2.ZoomX:=img2.ZoomX+10;
 // img2.ZoomY:=img2.ZoomY+10;
end;
if sb3.Visible=true then
begin
  //img3.ZoomX:=img3.ZoomX+10;
  //img3.ZoomY:=img3.ZoomY+10;
end;
if sb4.Visible=true then
begin
  //img4.ZoomX:=img4.ZoomX+10;
  //img4.ZoomY:=img4.ZoomY+10;
end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if sb.Visible=true then
begin
  //img1.ZoomX:=img1.ZoomX-10;
  //img1.ZoomY:=img1.ZoomY-10;
end;
if sb2.Visible=true then
begin
  //img2.ZoomX:=img2.ZoomX-10;
  //img2.ZoomY:=img2.ZoomY-10;
end;
if sb3.Visible=true then
begin
  //img3.ZoomX:=img3.ZoomX-10;
  //img3.ZoomY:=img3.ZoomY-10;
end;
if sb4.Visible=true then
begin
  //img4.ZoomX:=img4.ZoomX-10;
  //img4.ZoomY:=img4.ZoomY-10;
end;
end;




procedure TForm1.Button3Click(Sender: TObject);
begin
if sb.Visible=true then
begin
 //img1.ZoomX:=30;
 //img1.ZoomY:=30;
end;
if sb2.Visible=true then
begin
 //img2.ZoomX:=30;
 //img2.ZoomY:=30;
end;
if sb3.Visible=true then
begin
 //img3.ZoomX:=30;
 //img3.ZoomY:=30;
end;
if sb4.Visible=true then
begin
 //img4.ZoomX:=30;
 //img4.ZoomY:=30;
end;
end;

procedure TForm1.impr1Click(Sender: TObject);
begin
ppreport1.Print;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
SB.Visible:=true;
SB2.Visible:=false;
SB3.Visible:=false;
SB4.Visible:=false;
impr1.Enabled:=true;
impr2.Enabled:=false;
impr3.Enabled:=false;
impr4.Enabled:=false;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
SB.Visible:=true;
SB2.Visible:=false;
SB3.Visible:=false;
SB4.Visible:=false;
impr1.Enabled:=true;
impr2.Enabled:=false;
impr3.Enabled:=false;
impr4.Enabled:=false;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
SB.Visible:=false;
SB2.Visible:=true;
SB3.Visible:=false;
SB4.Visible:=false;
impr1.Enabled:=false;
impr2.Enabled:=true;
impr3.Enabled:=false;
impr4.Enabled:=false;


end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
SB.Visible:=false;
SB2.Visible:=false;
SB3.Visible:=true;
SB4.Visible:=false;
impr1.Enabled:=false;
impr2.Enabled:=false;
impr3.Enabled:=true;
impr4.Enabled:=false;


end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
SB.Visible:=false;
SB2.Visible:=false;
SB3.Visible:=false;
SB4.Visible:=true;
impr1.Enabled:=false;
impr2.Enabled:=false;
impr3.Enabled:=false;
impr4.Enabled:=true;


end;

procedure TForm1.impr2Click(Sender: TObject);
begin
ppreport2.Print;
end;

procedure TForm1.impr3Click(Sender: TObject);
begin
ppreport3.Print;
end;

procedure TForm1.impr4Click(Sender: TObject);
begin
ppreport4.Print;
end;

procedure TForm1.img2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
NX: Integer;
NY: Integer;
begin

if not (ssLeft in Shift) then
  Exit;

//NX := Img2.Left + X - SX;
//NY := Img2.Top + Y - SY;

if (NX < 0) and (NX > LX) then
  //Img2.Left := NX;

if (NY < 0) and (NY > LY) then
  //Img2.Top := NY;


end;

procedure TForm1.img3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
NX: Integer;
NY: Integer;
begin

if not (ssLeft in Shift) then
  Exit;

//NX := Img3.Left + X - SX;
//NY := Img3.Top + Y - SY;

if (NX < 0) and (NX > LX) then
 // Img3.Left := NX;

if (NY < 0) and (NY > LY) then
 // Img3.Top := NY;


end;

procedure TForm1.img4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
NX: Integer;
NY: Integer;
begin

if not (ssLeft in Shift) then
  Exit;

//NX := Img4.Left + X - SX;
//NY := Img4.Top + Y - SY;

if (NX < 0) and (NX > LX) then
  //Img4.Left := NX;

if (NY < 0) and (NY > LY) then
  //Img4.Top := NY;

end;

procedure TForm1.img2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
SX := X;
SY := Y;
end;

procedure TForm1.img3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
SX := X;
SY := Y;
end;

procedure TForm1.img4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
SX := X;
SY := Y;
end;

end.
