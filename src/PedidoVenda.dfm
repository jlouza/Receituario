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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
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
      OnClick = sbPesqClientesClick
    end
    object Label1: TLabel
      Left = 240
      Top = 5
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object sbIncluir: TSpeedButton
      Left = 317
      Top = 159
      Width = 23
      Height = 22
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00E4E4E400DDDDDD00D1D9D600D7DEDC00E9E9E900EFEF
        EF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00E6E6E600B4C3BE00289C77009AC2B600CACACA00CCCC
        CC00D3D3D300DDDDDD00E6E6E600FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00E5F3EE002FA17D002CCCA0002AA88100B3DCCF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E9F5F10032A27F0029CB9E0020D2A60028D0A4002DA07C00E7F3
        EF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00EDF6F30034A3800029D0A50020D2A600FFFFFF001FD1A60026BD94004FB0
        9100FEFEFE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F0F8
        F60038A6820029D0A50020D2A6002EDAB00029AA83002EDAB00021D2A7002AAD
        850099D1BF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F4FAF80036A4
        800029D0A6001FD1A60042E1BB002EAB83007BCAB2002CA981002EDAB00022CF
        A4002BA27D00DAEEE700FF00FF00FF00FF00FF00FF00FF00FF0032A582002EDA
        B00021D0A5007CF2D60030B28700CDECE200FF00FF00B2E2D2002CAB82002EDA
        B00020C499003EAC8800F9FCFB00FF00FF00FF00FF00FF00FF00D1EBE30032A5
        82008DF8E00033B58C00C5EBDF00FF00FF00FF00FF00FF00FF00BCE6D8002DAD
        83001FCB9F0029B78F0080CAB200FF00FF00FF00FF00FF00FF00FF00FF00D1EB
        E30032A58200CEEEE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C4E8
        DC002FB086001FC89C002DAD8600C8E8DD00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00CEECE20031B2870020C1950037B18900F2F9F700FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D5EFE60034B58A0025B68A0069C5A600FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00DCF1EA0037B58B0025AC7F00B3E1D200FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00E2F4EE0037B58C002DAF8400FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00E7F6F1003DB78F00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00ECF8F400}
      OnClick = sbIncluirClick
    end
    object sbCancelar: TSpeedButton
      Left = 341
      Top = 159
      Width = 23
      Height = 22
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FEFEFE00BEC5EB008A98D9007686D6007987D8008F9B
        DB00C4CAEE00FEFEFE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FEFEFE00BDC5E9005264CF005A65E600636AEE00676EEE006B72EE006F77
        F0006E77EB006977D900C7CBED00FF00FF00FF00FF00FF00FF00FF00FF00FEFE
        FE009EAADF005460E0005D65EB005765DA007E8CD600A0AAE100A6B0E3008793
        DB006874DF007B83F2007780E900AFB6E900FF00FF00FF00FF00FF00FF00BCC5
        E800535FE0005D65EA005A67E100D0D5EE00FF00FF00FF00FF00FF00FF00FF00
        FF00F3F4FB00818CD900808AEF007E88EB00CBCFF000FF00FF00FEFEFE004F62
        CE005D64EB005965E000666DED005B6CD400E7E9F800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00858EDB008B95F4007A83E000FF00FF00B9C1EA005964
        E7005564D900D6DAF2005B6BD4006E77F100606FD600E8EAF900FF00FF00FF00
        FF00FF00FF00FF00FF00F7F8FD007C87E5009099F200CACDF1008594D7006168
        ED007E8DD600FF00FF00E7EAF800606ED600777EF1006774D900E9EBF900FF00
        FF00FF00FF00FF00FF00FEFEFE00979EE30098A2F600A5A8E7007081D500646C
        EE00A5B0E200FF00FF00FF00FF00E8EAF9006774D8007F88F3006D7ADB00EAEC
        F900FF00FF00FF00FF00FEFEFE00B3B8EB009CA6F700989DE7007182D500676F
        EF00A7B1E200FF00FF00FF00FF00FF00FF00E9EBF9006C7ADB008891F500747E
        DE00ECEDFA00FF00FF00FF00FF00B7BAEC009FA8F7009A9EE8008A98D9006D74
        F0008491D900FF00FF00FF00FF00FF00FF00FF00FF00EAECF900737EDD00909A
        F6007A82E000EDEEFB00FEFEFE009B9FE600A2ADF800A8ABE900C0C6EC006A76
        EA006471DE00F2F3FB00FF00FF00FF00FF00FF00FF00FF00FF00EBEDFA007982
        E00098A3F8008289E300DEE0F7008C93E9009FAAF500D0D1F400FEFEFE006171
        D4007880F1007D8AD600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00EDED
        FB008189E3009DA8F700939CF000A3AEF7008C90E700FF00FF00FF00FF00C6CC
        ED00727CE7007C85EE00818CD800F3F4FB00FEFEFE00FEFEFE00FEFEFE00FEFE
        FE00DDDEF600949DEF00A3ADF8009AA3F100D3D4F400FF00FF00FF00FF00FF00
        FF00ADB4E6007984E9008892F4007A84E500929AE100B2B7EA00B1B4EA00989D
        E4008B93EA00A2ADF7009AA3F100BEBFF000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CACEEF007680DE008B94F100959FF70099A3F6009DA7F700A2AD
        F9009EA6F4008E91E700D3D3F400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00CCCFF200A3A7E600989EE6009B9EE600A8AB
        E800D2D4F400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = sbCancelarClick
    end
    object sbPesqProdutos: TSpeedButton
      Left = 108
      Top = 116
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
      OnClick = sbPesqProdutosClick
    end
    object stStatus: TLabel
      Left = 455
      Top = 19
      Width = 52
      Height = 19
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
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
      OnKeyDown = edtPedidoKeyDown
    end
    object edtCliente: TEdit
      Left = 167
      Top = 67
      Width = 450
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      MaxLength = 50
      ReadOnly = True
      TabOrder = 3
    end
    object edtCodProduto: TEdit
      Left = 16
      Top = 117
      Width = 91
      Height = 21
      Alignment = taRightJustify
      MaxLength = 10
      NumbersOnly = True
      TabOrder = 4
      OnKeyDown = edtCodProdutoKeyDown
    end
    object edtNomeProduto: TEdit
      Left = 131
      Top = 117
      Width = 486
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      MaxLength = 50
      ReadOnly = True
      TabOrder = 5
    end
    object edtQuantidade: TEdit
      Left = 16
      Top = 160
      Width = 91
      Height = 21
      Alignment = taRightJustify
      MaxLength = 10
      NumbersOnly = True
      TabOrder = 6
    end
    object edtValor: TEdit
      Left = 120
      Top = 160
      Width = 91
      Height = 21
      Alignment = taRightJustify
      MaxLength = 10
      NumbersOnly = True
      TabOrder = 7
      Text = '0,00'
      OnKeyDown = edtValorKeyDown
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
      ReadOnly = True
      TabOrder = 8
      Text = '0,00'
    end
    object edtCadastroID: TMaskEdit
      Left = 16
      Top = 67
      Width = 127
      Height = 21
      AutoSize = False
      EditMask = '!999.999.999/99;1;_'
      MaxLength = 14
      TabOrder = 2
      Text = '   .   .   /  '
      OnKeyDown = edtCadastroIDKeyDown
    end
    object edtData: TMaskEdit
      Tag = 1
      Left = 240
      Top = 22
      Width = 89
      Height = 21
      TabStop = False
      EditMask = '00/00/9999;1;_'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 1
      Text = '  /  /    '
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
  end
  object dbgItens: TDBGrid
    Left = 0
    Top = 238
    Width = 635
    Height = 163
    Align = alTop
    DataSource = dsItens
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgItensDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PRODUTOID'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Descri'#231#227'o'
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
      840000009619E0BD01000000180000000600000000000300000084000950524F
      4455544F49440400010000000000044E4F4D4501004900000001000557494454
      480200020032000A5155414E54494441444508000400000000000556414C4F52
      080004000000000005544F54414C080004000000000007524543454954410200
      0300000000000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'PRODUTOID'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'TOTAL'
        DataType = ftFloat
      end
      item
        Name = 'RECEITA'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 472
    Top = 288
    object cdsItensPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
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
    object cdsItensRECEITA: TBooleanField
      FieldName = 'RECEITA'
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
