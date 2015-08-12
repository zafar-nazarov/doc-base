object Form_Add: TForm_Add
  Left = 387
  Top = 161
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100
  ClientHeight = 321
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object sBevel1: TsBevel
    Left = 325
    Top = 6
    Width = 215
    Height = 302
    Shape = bsFrame
  end
  object Image1: TImage
    Left = 327
    Top = 8
    Width = 210
    Height = 297
  end
  object sButton_OK: TsButton
    Left = 56
    Top = 288
    Width = 89
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = sButton_OKClick
    SkinData.SkinSection = 'BUTTON'
  end
  object sButton_Cancel: TsButton
    Left = 168
    Top = 288
    Width = 89
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = sButton_CancelClick
    SkinData.SkinSection = 'BUTTON'
  end
  object OleContainer1: TOleContainer
    Left = 327
    Top = 8
    Width = 210
    Height = 297
    AllowInPlace = False
    AllowActiveDoc = False
    BorderStyle = bsNone
    Caption = 'OleContainer1'
    SizeMode = smStretch
    TabOrder = 2
  end
  object sGroupBox1: TsGroupBox
    Left = 10
    Top = 0
    Width = 305
    Height = 273
    TabOrder = 3
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel4: TsLabel
      Left = 36
      Top = 130
      Width = 57
      Height = 15
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
    end
    object sLabel3: TsLabel
      Left = 25
      Top = 98
      Width = 84
      Height = 15
      Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 29
      Top = 66
      Width = 63
      Height = 15
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
    end
    object sLabel1: TsLabel
      Left = 36
      Top = 26
      Width = 56
      Height = 15
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
    end
    object sMemo1: TsMemo
      Left = 106
      Top = 128
      Width = 177
      Height = 89
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
    end
    object sEdit_Title: TsEdit
      Left = 106
      Top = 24
      Width = 177
      Height = 23
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = #1053#1072#1079#1074#1072#1085#1080#1077
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sEdit_Conag: TsEdit
      Left = 106
      Top = 64
      Width = 177
      Height = 23
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sDateEdit1: TsDateEdit
      Left = 128
      Top = 96
      Width = 155
      Height = 21
      AutoSize = False
      EditMask = '!99/99/9999;1; '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      Text = '  .  .    '
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object sButton_Load: TsButton
      Left = 208
      Top = 232
      Width = 75
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      TabOrder = 4
      OnClick = sButton_LoadClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sOpenDialog1: TsOpenDialog
    Filter = 
      #1042#1089#1077' '#1087#1086#1076#1076#1077#1088#1078#1080#1074#1072#1077#1084#1099#1077' '#1092#1072#1081#1083#1099'|*.jpg; *.jpeg; *.bmp; *.pdf; *.doc; *.d' +
      'ocx|'#1056#1080#1089#1091#1085#1082#1080' (*.jpg, *.jpeg, *.bmp)|*.jpg; *.jpeg; *.bmp;|PDF '#1092#1072#1081 +
      #1083#1099'|*.pdf;|'#1044#1086#1082#1091#1084#1077#1085#1090#1099' Word|*.doc; *.docx;'
    Left = 528
    Top = 16
  end
end
