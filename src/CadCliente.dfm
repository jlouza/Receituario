object frmCadClientes: TfrmCadClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de cliente'
  ClientHeight = 83
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
  object lblCpf: TLabel
    Left = 8
    Top = 34
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object lblNome: TLabel
    Left = 139
    Top = 34
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object edtNome: TEdit
    Left = 139
    Top = 50
    Width = 435
    Height = 21
    MaxLength = 50
    TabOrder = 1
  end
  object edtCadastroID: TMaskEdit
    Left = 8
    Top = 50
    Width = 127
    Height = 21
    AutoSize = False
    EditMask = '!999.999.999/99;1;_'
    MaxLength = 14
    TabOrder = 0
    Text = '   .   .   /  '
    OnKeyDown = edtCadastroIDKeyDown
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 597
    Height = 29
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 24
        Width = 591
      end>
    object ToolBar1: TToolBar
      Left = 11
      Top = 0
      Width = 582
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
end
