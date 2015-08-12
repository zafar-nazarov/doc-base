object Form_Pic: TForm_Pic
  Left = 541
  Top = 129
  Width = 469
  Height = 706
  Caption = 'Form_Pic'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object sBevel1: TsBevel
    Left = 21
    Top = 22
    Width = 427
    Height = 600
    Shape = bsFrame
  end
  object Image1: TImage
    Left = 24
    Top = 24
    Width = 420
    Height = 594
    Stretch = True
  end
  object sPanel_Bottom: TsPanel
    Left = 0
    Top = 630
    Width = 461
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      461
      44)
    object sSpeedButton_Print: TsSpeedButton
      Left = 16
      Top = 4
      Width = 89
      Height = 33
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      OnClick = sSpeedButton_PrintClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object sButton_Close: TsButton
      Left = 369
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = sButton_CloseClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 8
    Top = 64
  end
end
