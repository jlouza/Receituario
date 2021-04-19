object frmReceita: TfrmReceita
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Solicita'#231#227'o de receita'
  ClientHeight = 411
  ClientWidth = 635
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
  PixelsPerInch = 96
  TextHeight = 13
  object grbPedido: TGroupBox
    Left = 0
    Top = 0
    Width = 635
    Height = 101
    Align = alTop
    TabOrder = 0
    object lblPedido: TLabel
      Left = 16
      Top = 7
      Width = 32
      Height = 13
      Caption = 'Pedido'
    end
    object lblCpf: TLabel
      Left = 16
      Top = 53
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object lblNome: TLabel
      Left = 146
      Top = 53
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object edtPedido: TEdit
      Left = 16
      Top = 24
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      MaxLength = 10
      NumbersOnly = True
      TabOrder = 0
    end
    object edtCadastroID: TMaskEdit
      Left = 16
      Top = 69
      Width = 127
      Height = 21
      AutoSize = False
      Enabled = False
      EditMask = '!999.999.999/99;1;_'
      MaxLength = 14
      TabOrder = 1
      Text = '   .   .   /  '
    end
    object edtCliente: TEdit
      Left = 146
      Top = 69
      Width = 481
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Enabled = False
      MaxLength = 50
      ReadOnly = True
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 101
    Width = 635
    Height = 66
    Align = alTop
    Caption = 'T'#233'cnico'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 18
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Label2: TLabel
      Left = 167
      Top = 18
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object sbPesqTecnico: TSpeedButton
      Left = 143
      Top = 33
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F8F3333333333333000333333333333F888333333333333
        000333333333333F888333333333333000333333333333F88833333333333300
        033333333FFF3F888333333000003B803333333F8883F88833333308888800B3
        33333388333888833333308FFFFF8033333338F3333338F3333308FFFFFFF803
        333338333333383F333308FFFFFFF80333338F333333338F333308FFFFFFF803
        33338F333333338F333308FFFFFFF803333383F333333383333308FFFFFFF803
        333338F3333338F33333308FFFFF80333333383FF333F8333333330888880333
        333333883FF88333333333300000333333333333888333333333}
      NumGlyphs = 2
      OnClick = sbPesqTecnicoClick
    end
    object edtCpfTecnico: TMaskEdit
      Left = 16
      Top = 34
      Width = 127
      Height = 21
      AutoSize = False
      EditMask = '!999.999.999/99;1;_'
      MaxLength = 14
      TabOrder = 0
      Text = '   .   .   /  '
      OnKeyDown = edtCpfTecnicoKeyDown
    end
    object edtNomeTecnico: TEdit
      Left = 167
      Top = 34
      Width = 460
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      MaxLength = 50
      ReadOnly = True
      TabOrder = 1
    end
  end
  object txtItens: TStaticText
    Left = 0
    Top = 167
    Width = 635
    Height = 21
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkFlat
    Caption = 'Itens'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 188
    Width = 635
    Height = 190
    Align = alTop
    DataSource = dsItens
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PRODUTOID'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Descri'#231#227'o'
        Width = 529
        Visible = True
      end>
  end
  object btnOK: TButton
    Left = 249
    Top = 383
    Width = 75
    Height = 25
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 4
    OnClick = btnOKClick
  end
  object btnCancelar: TButton
    Left = 324
    Top = 383
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 272
    Top = 248
  end
  object cdsItens: TClientDataSet
    PersistDataPacket.Data = {
      450000009619E0BD01000000180000000200000000000300000045000950524F
      4455544F49440400010000000000044E4F4D4501004900000001000557494454
      480200020032000000}
    Active = True
    Aggregates = <>
    Params = <>
    BeforeDelete = cdsItensBeforeDelete
    Left = 316
    Top = 248
    object cdsItensPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
    end
    object cdsItensNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
end
