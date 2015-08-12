object Frame_Search: TFrame_Search
  Left = 0
  Top = 0
  Width = 173
  Height = 275
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  OnMouseMove = FrameMouseMove
  object sLabel3: TsLabel
    Left = 37
    Top = 110
    Width = 26
    Height = 14
    Caption = #1044#1072#1090#1072
    ParentFont = False
    Visible = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object sLabel2: TsLabel
    Left = 4
    Top = 110
    Width = 59
    Height = 14
    Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    ParentFont = False
    Visible = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object sLabel1: TsLabel
    Left = 14
    Top = 110
    Width = 49
    Height = 14
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object sWebLabel1: TsWebLabel
    Left = 48
    Top = 176
    Width = 117
    Height = 15
    Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1099#1081' '#1087#1086#1080#1089#1082
    ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsUnderline]
    HoverFont.Charset = RUSSIAN_CHARSET
    HoverFont.Color = clBlue
    HoverFont.Height = -12
    HoverFont.Name = 'Arial'
    HoverFont.Style = []
  end
  object sGroupBox1: TsGroupBox
    Left = 6
    Top = 18
    Width = 162
    Height = 81
    Caption = #1041#1099#1089#1090#1088#1099#1081' '#1087#1086#1080#1089#1082' '#1087#1086
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object sCheckBox1: TsCheckBox
      Left = 12
      Top = 19
      Width = 69
      Height = 20
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = sCheckBox1Click
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object sCheckBox2: TsCheckBox
      Left = 12
      Top = 37
      Width = 79
      Height = 20
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      TabOrder = 1
      OnClick = sCheckBox2Click
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object sCheckBox3: TsCheckBox
      Left = 12
      Top = 55
      Width = 46
      Height = 20
      Caption = #1044#1072#1090#1072
      TabOrder = 2
      OnClick = sCheckBox3Click
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object Edit_Title: TsEdit
    Left = 67
    Top = 110
    Width = 101
    Height = 22
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = Edit_TitleChange
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
  object Edit_Conag: TsEdit
    Left = 67
    Top = 110
    Width = 101
    Height = 22
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    OnChange = Edit_ConagChange
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
  object DateEdit1: TsDateEdit
    Left = 67
    Top = 110
    Width = 101
    Height = 22
    AutoSize = False
    Color = clWhite
    EditMask = '!99/99/9999;1; '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 3
    Text = '  .  .    '
    Visible = False
    OnChange = DateEdit1Change
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
  object sButton1: TsButton
    Left = 95
    Top = 145
    Width = 71
    Height = 20
    Caption = #1053#1072#1081#1090#1080
    Enabled = False
    TabOrder = 4
    OnClick = sButton1Click
    SkinData.SkinSection = 'BUTTON'
  end
  object sBitBtn_ViewBase: TsBitBtn
    Left = 10
    Top = 145
    Width = 75
    Height = 20
    Caption = #1054#1073#1079#1086#1088' '#1073#1072#1079#1099
    TabOrder = 5
    OnClick = sBitBtn_ViewBaseClick
    SkinData.SkinSection = 'BUTTON'
  end
end
