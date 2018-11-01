uses kol, windows;

var

  form1, button1, button2, label1, label2: pControl;
  tc, etc, beatnum: longint;
  bpm: array[1..60] of real;
  avrg: real;

procedure Button1Click(Dummy: pointer; Sender: pControl);
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

  label1.Caption := double2Str( 60 / avrg );
  label2.Caption := double2Str( ( beatnum mod 60 ) + 1 );
  if ( beatnum mod 60 ) = 59 then form1.caption := double2Str( round( 60 / avrg ) );
end;

procedure keypress1(dummy: pointer; Sender: PControl; var Key: Longint; Shift: DWORD );
begin
  button1click( dummy, sender );
end;

procedure Button2Click(Dummy: pointer; Sender: pControl);
begin
  fillchar( bpm, sizeof( bpm ), 0 );
  beatnum := 50;
  etc := gettickcount;
  tc := gettickcount;
  avrg := 0;
end;

begin
  applet := newApplet( 'BPM Counter' );

  Form1 := NewForm( Applet, '' );
  With Form1^ Do
  Begin
    Left := 587;
    Top := 109;
    Width := 192;
    Height := 112;
    Caption := 'BPM Counter';
    Color := clBtnFace;
    Font.FontCharset := 1;
    Font.Color := clWindowText;
    Font.FontHeight := -11;
    Font.FontName := 'MS Sans Serif';
    Font.FontStyle := [];
  Label1 := NewLabel( Form1, '' );
  With Label1^ Do
  Begin
    Left := 12;
    Top := 40;
    Width := 60;
    Height := 18;
    Caption := 'Label1';
    Font.FontCharset := 1;
    Font.Color := clWindowText;
    Font.FontHeight := -16;
    Font.FontName := 'Courier New';
    Font.FontStyle := [fsBold];
  end;
  Label2 := NewLabel( Form1, '' );
  With Label2^ Do
  Begin
    Left := 12;
    Top := 60;
    Width := 60;
    Height := 18;
    Caption := 'Label2';
    Font.FontCharset := 1;
    Font.Color := clWindowText;
    Font.FontHeight := -16;
    Font.FontName := 'Courier New';
    Font.FontStyle := [fsBold];
  end;
  Button1 := NewButton( Form1, '' );
  With Button1^ Do
  Begin
    Left := 4;
    Top := 8;
    Width := 73;
    Height := 25;
    Caption := '&Beat';
    TabOrder := 0;
    OnClick := TOnEvent( MakeMethod( nil, @Button1Click ) );
    OnKeyDown := TOnKey( MakeMethod( nil, @keypress1 ) );
  end;
  Button2 := NewButton( Form1, '' );
  With Button2^ Do
  Begin
    Left := 104;
    Top := 8;
    Width := 75;
    Height := 25;
    Caption := '&New';
    TabOrder := 1;
    OnClick := TOnEvent( MakeMethod( nil, @Button2Click ) );
  end;
  end;

  run( applet );

end.
