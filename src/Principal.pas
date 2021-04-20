unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, CadCliente, CadProduto,
  FireDAC.Stan.Intf, FireDAC.Comp.UI, FireDAC.Phys.FBDef, FireDAC.Phys, PedidoVenda, Receituario,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, Vcl.Menus, FireDAC.Stan.Option, Biblioteca,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, Data.DB, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList;

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
    ilNavegadores: TImageList;
    miSair: TMenuItem;
    procedure miClienteClick(Sender: TObject);
    procedure miProdutoClick(Sender: TObject);
    procedure miPedidoClick(Sender: TObject);
    procedure miPendenteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ilNavegadoresGlobal := ilNavegadores;
end;

procedure TfrmPrincipal.miClienteClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadClientes,frmCadClientes);
  frmCadClientes.ShowModal;
end;

procedure TfrmPrincipal.miPedidoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPedidoVenda,frmPedidoVenda);
  frmPedidoVenda.ShowModal;
end;

procedure TfrmPrincipal.miPendenteClick(Sender: TObject);
begin
  Application.CreateForm(TfrmReceituario,frmReceituario);
  frmReceituario.ShowModal;
end;

procedure TfrmPrincipal.miProdutoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadProdutos,frmCadProdutos);
  frmCadProdutos.ShowModal;
end;

procedure TfrmPrincipal.miSairClick(Sender: TObject);
begin
  Close;
end;

end.
