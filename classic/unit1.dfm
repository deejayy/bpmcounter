object Form1: TForm1
  Left = 587
  Top = 109
  Width = 192
  Height = 112
  Caption = 'BPM Counter'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 40
    Width = 60
    Height = 18
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 12
    Top = 60
    Width = 60
    Height = 18
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 4
    Top = 8
    Width = 73
    Height = 25
    Caption = '&Beat'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 8
    Width = 75
    Height = 25
    Caption = '&New'
    TabOrder = 1
    OnClick = Button2Click
  end
end
