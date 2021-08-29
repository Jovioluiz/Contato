object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 532
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnListar: TButton
    Left = 8
    Top = 104
    Width = 97
    Height = 25
    Caption = 'Listar Contatos'
    TabOrder = 0
    OnClick = btnListarClick
  end
  object dbGridContatos: TDBGrid
    Left = 0
    Top = 204
    Width = 825
    Height = 328
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = ppMenu
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnAdicionar: TButton
    Left = 8
    Top = 73
    Width = 97
    Height = 25
    Caption = 'Adicionar Contatos'
    TabOrder = 2
    OnClick = btnAdicionarClick
  end
  object ppMenu: TPopupMenu
    Left = 432
    Top = 216
    object ppMenu1: TMenuItem
      Caption = 'Excluir'
      OnClick = ppMenu1Click
    end
    object Editar1: TMenuItem
      Caption = 'Editar'
      OnClick = Editar1Click
    end
  end
end
