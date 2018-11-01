unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

var

  tc, etc, beatnum: longint;
  bpm: array[1..60] of real;
  avrg: real;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  e: longint;
begin
  etc := tc;
  tc := gettickcount;
  inc( beatnum );
  bpm[ ( beatnum mod 60 ) + 1 ] := ( tc - etc ) / 1000;
  avrg := 0.00001;
  for e := 1 to ( beatnum mod 60 ) + 1 do
    avrg := avrg + bpm[ e ];
  avrg := avrg / ( ( beatnum mod 60 ) + 1 );

  label1.Caption := floattostr( 60 / avrg );
  label2.Caption := floattostr( ( beatnum mod 60 ) + 1 );
  if ( beatnum mod 60 ) = 59 then form1.caption := inttostr( round( 60 / avrg ) );
end;
{
  listbox1.items.add( floattostr( 0 ) );
}

procedure TForm1.Button2Click(Sender: TObject);
begin
  fillchar( bpm, sizeof( bpm ), 0 );
  beatnum := 50;
  etc := gettickcount;
  tc := gettickcount;
  avrg := 0;
end;

end.
