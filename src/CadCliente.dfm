object frmCadClientes: TfrmCadClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de cliente'
  ClientHeight = 93
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblCpfCnpj: TLabel
    Left = 8
    Top = 8
    Width = 48
    Height = 13
    Caption = 'CPF/CNPJ'
  end
  object lblNome: TLabel
    Left = 139
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object edtCadastroID: TEdit
    Left = 8
    Top = 24
    Width = 127
    Height = 21
    MaxLength = 18
    TabOrder = 0
  end
  object edtNome: TEdit
    Left = 139
    Top = 24
    Width = 435
    Height = 21
    MaxLength = 50
    TabOrder = 1
  end
  object btnPesquisar: TButton
    Left = 147
    Top = 59
    Width = 75
    Height = 25
    Caption = '&Pesquisar'
    TabOrder = 2
    OnClick = btnPesquisarClick
  end
  object btnGravar: TButton
    Left = 222
    Top = 59
    Width = 75
    Height = 25
    Caption = '&Gravar'
    TabOrder = 3
    OnClick = btnGravarClick
  end
  object btnExcluir: TButton
    Left = 297
    Top = 59
    Width = 75
    Height = 25
    Caption = '&Excluir'
    TabOrder = 4
    OnClick = btnExcluirClick
  end
  object btnCancelar: TButton
    Left = 371
    Top = 59
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
end
