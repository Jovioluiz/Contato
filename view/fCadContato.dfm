object cCadContato: TcCadContato
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro Contato'
  ClientHeight = 238
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 52
    Top = 48
    Width = 15
    Height = 13
    Caption = 'ID:'
  end
  object Label2: TLabel
    Left = 36
    Top = 75
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object lblCpfCnpj: TLabel
    Left = 48
    Top = 102
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label4: TLabel
    Left = 18
    Top = 129
    Width = 49
    Height = 13
    Caption = 'Endere'#231'o:'
  end
  object Label5: TLabel
    Left = 30
    Top = 156
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object lblData: TLabel
    Left = 36
    Top = 183
    Width = 27
    Height = 13
    Caption = 'Data:'
  end
  object edtId: TEdit
    Left = 88
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    OnExit = edtIdExit
  end
  object edtNome: TEdit
    Left = 88
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtEndereco: TEdit
    Left = 88
    Top = 121
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtCidade: TEdit
    Left = 88
    Top = 148
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtData: TDateTimePicker
    Left = 88
    Top = 175
    Width = 121
    Height = 21
    Date = 44437.000000000000000000
    Time = 0.490283449071284800
    TabOrder = 4
  end
  object edtCpfCnpj: TMaskEdit
    Left = 88
    Top = 94
    Width = 121
    Height = 21
    TabOrder = 5
    Text = ''
  end
  object rbTipo: TRadioGroup
    Left = 232
    Top = 40
    Width = 185
    Height = 105
    Caption = 'Tipo Contato'
    Items.Strings = (
      'Fisica'
      'Juridica')
    TabOrder = 6
    OnClick = rbTipoClick
  end
  object btnSalvar: TButton
    Left = 232
    Top = 178
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 7
    OnClick = btnSalvarClick
  end
end
