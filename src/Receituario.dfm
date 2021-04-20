object frmReceituario: TfrmReceituario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Solicita'#231#245'es de receitas'
  ClientHeight = 360
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 717
    Height = 29
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 24
        Width = 711
      end>
    ExplicitLeft = -67
    ExplicitWidth = 635
    object ToolBar1: TToolBar
      Left = 11
      Top = 0
      Width = 702
      Height = 24
      Align = alClient
      AutoSize = True
      ButtonHeight = 21
      ButtonWidth = 54
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowCaptions = True
      TabOrder = 0
      object tbProcessar: TToolButton
        Left = 0
        Top = 0
        Caption = '&Processar'
        ImageIndex = 2
        OnClick = tbProcessarClick
      end
      object tbCancelar: TToolButton
        Left = 54
        Top = 0
        Cursor = crHandPoint
        Caption = '&Cancelar'
        ImageIndex = 0
        OnClick = tbCancelarClick
      end
      object ToolButton3: TToolButton
        Left = 108
        Top = 0
        Width = 213
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbAssinar: TToolButton
        Left = 321
        Top = 0
        Caption = '&Assinar'
        ImageIndex = 1
        OnClick = tbAssinarClick
      end
      object ToolButton1: TToolButton
        Left = 375
        Top = 0
        Width = 266
        Caption = 'ToolButton1'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbFechar: TToolButton
        Left = 641
        Top = 0
        Caption = '&Fechar'
        ImageIndex = 3
        OnClick = tbFecharClick
      end
    end
  end
  object txtReceitas: TStaticText
    Left = 0
    Top = 29
    Width = 717
    Height = 21
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkFlat
    Caption = 'Receitas'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = -5
    ExplicitTop = 217
    ExplicitWidth = 635
  end
  object dbgReceitas: TDBGrid
    Left = 0
    Top = 50
    Width = 717
    Height = 119
    Align = alTop
    DataSource = dsReceitas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PEDIDOID'
        Title.Alignment = taCenter
        Title.Caption = 'Nr. Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CADASTROID'
        Title.Caption = 'CPF'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZAOSOCIAL'
        Title.Caption = 'Cliente'
        Width = 296
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TECNICO'
        Title.Caption = 'T'#233'cnico'
        Width = 220
        Visible = True
      end>
  end
  object txtItens: TStaticText
    Left = 0
    Top = 169
    Width = 717
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
    TabOrder = 3
    ExplicitLeft = -5
    ExplicitTop = 217
    ExplicitWidth = 635
  end
  object dbgItens: TDBGrid
    Left = 0
    Top = 190
    Width = 717
    Height = 167
    Align = alTop
    DataSource = dsItens
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    TabOrder = 4
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
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 534
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Title.Alignment = taCenter
        Title.Caption = 'Quantidade'
        Width = 79
        Visible = True
      end>
  end
  object dsReceitas: TDataSource
    DataSet = cdsReceitas
    Left = 256
    Top = 96
  end
  object cdsReceitas: TClientDataSet
    PersistDataPacket.Data = {
      860000009619E0BD010000001800000004000000000003000000860008504544
      49444F494404000100000000000A434144415354524F49440100490000000100
      0557494454480200020012000B52415A414F534F4349414C0100490000000100
      055749445448020002003200075445434E49434F010049000000010005574944
      54480200020032000000}
    Active = True
    Aggregates = <>
    Params = <>
    BeforeDelete = cdsReceitasBeforeDelete
    Left = 315
    Top = 96
    object cdsReceitasPEDIDOID: TIntegerField
      FieldName = 'PEDIDOID'
    end
    object cdsReceitasCADASTROID: TStringField
      FieldName = 'CADASTROID'
      Size = 18
    end
    object cdsReceitasRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 50
    end
    object cdsReceitasTECNICO: TStringField
      FieldName = 'TECNICO'
      Size = 50
    end
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 248
    Top = 240
  end
  object cdsItens: TClientDataSet
    PersistDataPacket.Data = {
      6E0000009619E0BD0100000018000000040000000000030000006E0008504544
      49444F494404000100000000000950524F4455544F4944040001000000000009
      44455343524943414F01004900000001000557494454480200020032000A5155
      414E54494441444508000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PEDIDOID'
        DataType = ftInteger
      end
      item
        Name = 'PRODUTOID'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
      end>
    IndexDefs = <>
    IndexFieldNames = 'PEDIDOID'
    MasterFields = 'PEDIDOID'
    MasterSource = dsReceitas
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    BeforeDelete = cdsItensBeforeDelete
    Left = 290
    Top = 240
    object cdsItensPEDIDOID: TIntegerField
      FieldName = 'PEDIDOID'
    end
    object cdsItensPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
    end
    object cdsItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsItensQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
  end
end
