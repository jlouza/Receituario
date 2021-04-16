object frmCadProdutos: TfrmCadProdutos
  Left = 0
  Top = 0
  Caption = 'Cadastro de produto'
  ClientHeight = 141
  ClientWidth = 591
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
  object lblCodigo: TLabel
    Left = 24
    Top = 39
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblNome: TLabel
    Left = 122
    Top = 39
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object lblValor: TLabel
    Left = 24
    Top = 88
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 591
    Height = 29
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 24
        Width = 585
      end>
    object ToolBar1: TToolBar
      Left = 11
      Top = 0
      Width = 576
      Height = 24
      Align = alClient
      AutoSize = True
      ButtonHeight = 21
      ButtonWidth = 53
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowCaptions = True
      TabOrder = 0
      object tbExcluir: TToolButton
        Left = 0
        Top = 0
        Caption = '&Excluir'
        ImageIndex = 2
        OnClick = tbExcluirClick
      end
      object tbCancelar: TToolButton
        Left = 53
        Top = 0
        Cursor = crHandPoint
        Caption = '&Cancelar'
        ImageIndex = 0
        OnClick = tbCancelarClick
      end
      object tbGravar: TToolButton
        Left = 106
        Top = 0
        Caption = '&Gravar'
        ImageIndex = 1
        OnClick = tbGravarClick
      end
      object ToolButton3: TToolButton
        Left = 159
        Top = 0
        Width = 117
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbPesquisar: TToolButton
        Left = 276
        Top = 0
        Caption = '&Pesquisar'
        ImageIndex = 2
        OnClick = tbPesquisarClick
      end
      object ToolButton1: TToolButton
        Left = 329
        Top = 0
        Width = 191
        Caption = 'ToolButton1'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbFechar: TToolButton
        Left = 520
        Top = 0
        Caption = '&Fechar'
        ImageIndex = 3
        OnClick = tbFecharClick
      end
    end
  end
  object edtCodigo: TEdit
    Left = 24
    Top = 56
    Width = 81
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    OnKeyDown = edtCodigoKeyDown
  end
  object edtNome: TEdit
    Left = 122
    Top = 56
    Width = 411
    Height = 21
    TabOrder = 2
  end
  object edtValor: TEdit
    Left = 24
    Top = 105
    Width = 99
    Height = 21
    Alignment = taRightJustify
    MaxLength = 10
    TabOrder = 3
    Text = '0,00'
    OnKeyPress = edtValorKeyPress
  end
  object chkControleEspecial: TCheckBox
    Left = 172
    Top = 107
    Width = 131
    Height = 17
    Caption = 'Exige controle especial'
    TabOrder = 4
  end
end
