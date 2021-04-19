object frmPedidoVenda: TfrmPedidoVenda
  Left = 0
  Top = 0
  Caption = 'Pedido de venda'
  ClientHeight = 431
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 448
    Top = 410
    Width = 59
    Height = 13
    Caption = 'Total pedido'
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 635
    Height = 29
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 24
        Width = 629
      end>
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 591
    object ToolBar1: TToolBar
      Left = 11
      Top = 0
      Width = 620
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
      end
      object tbCancelar: TToolButton
        Left = 53
        Top = 0
        Cursor = crHandPoint
        Caption = '&Cancelar'
        ImageIndex = 0
      end
      object tbGravar: TToolButton
        Left = 106
        Top = 0
        Caption = '&Gravar'
        ImageIndex = 1
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
      end
      object ToolButton1: TToolButton
        Left = 329
        Top = 0
        Width = 232
        Caption = 'ToolButton1'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbFechar: TToolButton
        Left = 561
        Top = 0
        Caption = '&Fechar'
        ImageIndex = 3
        OnClick = tbFecharClick
      end
    end
  end
  object grpCapa: TGroupBox
    Left = 0
    Top = 29
    Width = 635
    Height = 188
    Align = alTop
    TabOrder = 1
    object lblPedido: TLabel
      Left = 16
      Top = 5
      Width = 32
      Height = 13
      Caption = 'Pedido'
    end
    object lblNome: TLabel
      Left = 167
      Top = 51
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object lblCodigo: TLabel
      Left = 16
      Top = 100
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblDescricao: TLabel
      Left = 131
      Top = 100
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lblQuantidade: TLabel
      Left = 16
      Top = 143
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object lblValor: TLabel
      Left = 120
      Top = 143
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object lblTotal: TLabel
      Left = 222
      Top = 143
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object lblCpf: TLabel
      Left = 16
      Top = 51
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object sbPesqClientes: TSpeedButton
      Left = 143
      Top = 66
      Width = 23
      Height = 22
    end
    object Label1: TLabel
      Left = 240
      Top = 5
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object sbIncluir: TSpeedButton
      Left = 314
      Top = 159
      Width = 23
      Height = 22
    end
    object sbCancelar: TSpeedButton
      Left = 336
      Top = 159
      Width = 23
      Height = 22
    end
    object sbPesqProdutos: TSpeedButton
      Left = 108
      Top = 116
      Width = 23
      Height = 22
    end
    object edtPedido: TEdit
      Left = 16
      Top = 22
      Width = 91
      Height = 21
      Alignment = taRightJustify
      MaxLength = 10
      NumbersOnly = True
      TabOrder = 0
    end
    object edtCliente: TEdit
      Left = 167
      Top = 67
      Width = 450
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 1
    end
    object edtCodProduto: TEdit
      Left = 16
      Top = 117
      Width = 91
      Height = 21
      Alignment = taRightJustify
      MaxLength = 10
      NumbersOnly = True
      TabOrder = 2
    end
    object edtNomeProduto: TEdit
      Left = 131
      Top = 117
      Width = 486
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 3
    end
    object edtQuantidade: TEdit
      Left = 16
      Top = 160
      Width = 91
      Height = 21
      Alignment = taRightJustify
      MaxLength = 10
      NumbersOnly = True
      TabOrder = 4
    end
    object edtValor: TEdit
      Left = 120
      Top = 160
      Width = 91
      Height = 21
      Alignment = taRightJustify
      MaxLength = 10
      NumbersOnly = True
      TabOrder = 5
    end
    object edtTotal: TEdit
      Left = 222
      Top = 160
      Width = 91
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      MaxLength = 10
      NumbersOnly = True
      TabOrder = 6
    end
    object edtCadastroID: TMaskEdit
      Left = 16
      Top = 67
      Width = 127
      Height = 21
      AutoSize = False
      EditMask = '!999.999.999/99;1;_'
      MaxLength = 14
      TabOrder = 7
      Text = '   .   .   /  '
    end
    object edtData: TEdit
      Left = 240
      Top = 22
      Width = 81
      Height = 21
      Alignment = taCenter
      ReadOnly = True
      TabOrder = 8
    end
    object StaticText1: TStaticText
      Left = 528
      Top = 20
      Width = 56
      Height = 23
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
  end
  object txtItens: TStaticText
    Left = 0
    Top = 217
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
    ExplicitTop = 153
  end
  object dbgItens: TDBGrid
    Left = 0
    Top = 238
    Width = 635
    Height = 163
    Align = alTop
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
        FieldName = 'CODPRODUTO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome produto'
        Width = 316
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Title.Alignment = taCenter
        Title.Caption = 'Quantidade'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taCenter
        Title.Caption = 'Valor'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'Total'
        Width = 65
        Visible = True
      end>
  end
  object edtVlrTotal: TDBEdit
    Left = 513
    Top = 407
    Width = 104
    Height = 21
    TabStop = False
    DataField = 'VRL_TOTAL'
    DataSource = dsItens
    TabOrder = 4
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 424
    Top = 288
  end
  object cdsItens: TClientDataSet
    PersistDataPacket.Data = {
      750000009619E0BD01000000180000000500000000000300000075000A434F44
      50524F4455544F0800040000000000044E4F4D45010049000000010005574944
      54480200020032000A5155414E54494441444508000400000000000556414C4F
      52080004000000000005544F54414C08000400000000000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 472
    Top = 288
    object cdsItensCODPRODUTO: TFloatField
      FieldName = 'CODPRODUTO'
    end
    object cdsItensNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsItensQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#,##0.00'
    end
    object cdsItensVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object cdsItensTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object cdsItensVRL_TOTAL: TAggregateField
      Alignment = taRightJustify
      FieldName = 'VRL_TOTAL'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,##0.00'
      Expression = 'SUM(TOTAL)'
    end
  end
end
