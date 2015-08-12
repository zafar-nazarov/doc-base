object Form_Login: TForm_Login
  Left = 465
  Top = 289
  Width = 408
  Height = 232
  Caption = 'Form_Login'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object sPanel_Activation: TsPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 198
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object sLabel3: TsLabel
      Left = 60
      Top = 27
      Width = 148
      Height = 28
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1085#1077' '#1072#1082#1090#1080#1074#1080#1088#1086#1074#1072#1085#1072#13#10#1042#1074#1077#1076#1080#1090#1077' '#1082#1086#1076' '#1072#1082#1090#1080#1074#1072#1094#1080#1080
    end
    object sLabel4: TsLabel
      Left = 56
      Top = 74
      Width = 76
      Height = 14
      Caption = #1050#1086#1076' '#1072#1082#1090#1080#1074#1072#1094#1080#1080
    end
    object sEdit_key: TsEdit
      Left = 140
      Top = 72
      Width = 120
      Height = 22
      TabOrder = 0
      OnKeyPress = sEdit_keyKeyPress
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
    object sButton_active: TsButton
      Left = 104
      Top = 136
      Width = 89
      Height = 25
      Caption = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 1
      OnClick = sButton_activeClick
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton2: TsButton
      Left = 208
      Top = 136
      Width = 80
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 2
      OnClick = sButton2Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sPanel_Login: TsPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 198
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sLabel1: TsLabel
      Left = 60
      Top = 43
      Width = 73
      Height = 14
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    end
    object sLabel2: TsLabel
      Left = 96
      Top = 74
      Width = 37
      Height = 14
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object sEdit_Login: TsEdit
      Left = 140
      Top = 40
      Width = 120
      Height = 22
      TabOrder = 0
      OnKeyPress = sEdit_LoginKeyPress
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
    object sEdit_Pass: TsEdit
      Left = 140
      Top = 72
      Width = 120
      Height = 22
      PasswordChar = '*'
      TabOrder = 1
      OnKeyPress = sEdit_PassKeyPress
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
    object sButton_Login: TsButton
      Left = 96
      Top = 136
      Width = 80
      Height = 25
      Caption = #1042#1086#1081#1090#1080
      TabOrder = 2
      OnClick = sButton_LoginClick
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton1: TsButton
      Left = 200
      Top = 136
      Width = 80
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 3
      OnClick = sButton1Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
