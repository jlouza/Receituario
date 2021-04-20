object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Receitu'#225'rio'
  ClientHeight = 468
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmPrincipal
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 688
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 584
    Top = 16
  end
  object mmPrincipal: TMainMenu
    Left = 96
    Top = 48
    object miCadastros: TMenuItem
      Caption = '&Cadastros'
      object miCliente: TMenuItem
        Caption = 'Cliente'
        OnClick = miClienteClick
      end
      object miProduto: TMenuItem
        Caption = 'Produto'
        OnClick = miProdutoClick
      end
    end
    object miVendas: TMenuItem
      Caption = '&Vendas'
      object miPedido: TMenuItem
        Caption = 'Pedido'
        OnClick = miPedidoClick
      end
    end
    object miReceita: TMenuItem
      Caption = '&Receitas'
      object miPendente: TMenuItem
        Caption = 'Pendentes'
        OnClick = miPendenteClick
      end
    end
  end
end
