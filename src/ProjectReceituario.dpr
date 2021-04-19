program ProjectReceituario;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  Dados in 'Dados.pas',
  Biblioteca in 'Biblioteca.pas',
  Pesquisa in 'Pesquisa.pas' {frmPesquisa},
  cCadastro in 'cCadastro.pas',
  cCliente in 'cCliente.pas',
  CadCliente in 'CadCliente.pas' {frmCadClientes},
  cProduto in 'cProduto.pas',
  CadProduto in 'CadProduto.pas' {frmCadProdutos},
  cItensPedido in 'cItensPedido.pas',
  cProdutoCad in 'cProdutoCad.pas',
  cCapaPedido in 'cCapaPedido.pas',
  PedidoVenda in 'PedidoVenda.pas' {frmPedidoVenda};

{$R *.res}

begin
  Banco := TDados.Create;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  Application.CreateForm(TfrmCadClientes, frmCadClientes);
  Application.CreateForm(TfrmCadProdutos, frmCadProdutos);
  Application.CreateForm(TfrmPedidoVenda, frmPedidoVenda);
  Application.Run;
end.
