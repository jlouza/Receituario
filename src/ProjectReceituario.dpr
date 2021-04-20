program ProjectReceituario;

uses
  Vcl.Forms,
  IniFiles,
  System.SysUtils,
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
  PedidoVenda in 'PedidoVenda.pas' {frmPedidoVenda},
  cReceita in 'cReceita.pas',
  Receita in 'Receita.pas' {frmReceita},
  cTecnico in 'cTecnico.pas',
  cReceituario in 'cReceituario.pas',
  Receituario in 'Receituario.pas' {frmReceituario};

{$R *.res}

var
  vServer,
  vDataBase,
  vUserName,
  vPassword: String;
  vConfig  : TIniFile;

begin
  if FileExists(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Configuracao.ini') then
  begin
    vConfig   := TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Configuracao.ini');
    vServer   := vConfig.ReadString('FIREBIRD','Server','');
    vUserName := vConfig.ReadString('FIREBIRD','User','');
    vPassword := vConfig.ReadString('FIREBIRD','Password','');
    vDataBase := vConfig.ReadString('FIREBIRD','Database','');
  end else begin
    Atencao('Arquivo Configuracao.ini não localizado!');
    Application.Terminate;
  end;
  Banco := TDados.Create(vServer,vDataBase,vUserName,vPassword);
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
