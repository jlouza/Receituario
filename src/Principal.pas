unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Comp.UI, FireDAC.Phys.FBDef, FireDAC.Phys,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    mmPrincipal: TMainMenu;
    miCadastros: TMenuItem;
    miCliente: TMenuItem;
    miProduto: TMenuItem;
    miVendas: TMenuItem;
    miPedido: TMenuItem;
    miReceita: TMenuItem;
    miPendente: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

end.
