unit cCliente;

interface

uses
  cCadastro, Biblioteca, Data.DB;

type
  TCliente = class(TCadastro)
  private
    { Private declarations }
  NOVO: Boolean;

  public
    { Public declarations }
    function  GetNOVO: Boolean;
    procedure SetNOVO(pValor: Boolean);

    function Gravar:Boolean; override;
    function Consultar(pCadastroID: String): Boolean; override;
    function Excluir(pCadastroID: String): Boolean; override;
    function Pesquisa: Boolean;
  end;

implementation

{ TCliente }

function TCliente.Consultar(pCadastroID: String): Boolean;
begin
  Result := False;
  try
    Banco.Consultar('SELECT * FROM CADASTROS WHERE CADASTRO_ID = :CADASTRO_ID',
                   ['CADASTRO_ID'],
                   [pCadastroID]);
    Result := not Banco.Campos.IsEmpty;
    if Result then begin
      SetCADASTRO_ID(pCadastroID);
      SetRAZAO_SOCIAL(Banco.Campos.FieldByName('RAZAO_SOCIAL').AsString);
      SetTIPO_PESSOA(Banco.Campos.FieldByName('TIPO_PESSOA').AsString);
      SetTIPO_CADASTRO(Banco.Campos.FieldByName('TIPO_CADASTRO').AsString);
    end;
  except
    Atencao('Erro ao consultar o cliente!');
  end;
end;

function TCliente.Excluir(pCadastroID: String): Boolean;
begin
  Result := False;
  try
    Result := Banco.Excluir('CADASTROS',['CADASTRO_ID'],[pCadastroID]);
  except
    Atencao('Erro ao excluir o cliente!');
  end;
end;

function TCliente.GetNOVO: Boolean;
begin
  Result := NOVO;
end;

function TCliente.Gravar: Boolean;
begin
  Result := False;
  try
    if GetNOVO then
    begin
      Result := Banco.Inserir('CADASTROS',
                             ['CADASTRO_ID',
                              'RAZAO_SOCIAL',
                              'TIPO_PESSOA',
                              'TIPO_CADASTRO'],
                             [GetCADASTRO_ID,
                              GetRAZAO_SOCIAL,
                              GetTIPO_PESSOA,
                              GetTIPO_CADASTRO]);
    end else
    begin
      Result := Banco.Atualizar('CADASTROS',
                               ['CADASTRO_ID'],
                               [GetCADASTRO_ID],
                               ['RAZAO_SOCIAL'],
                               [GetRAZAO_SOCIAL]);
    end;
  except
    Atencao('Erro ao gravar o cliente!');
  end;
end;

function TCliente.Pesquisa: Boolean;
var
  vRetorno: String;
begin
  Result := False;
  vRetorno := Banco.Pesquisar('CADASTROS',
                              'CADASTRO_ID',
                              ['CADASTRO_ID',
                               'RAZAO_SOCIAL'],
                              'Pesquisa de clientes');
  if (vRetorno <> '') then begin
    Result := Consultar(vRetorno);
  end;
end;

procedure TCliente.SetNOVO(pValor: Boolean);
begin
  NOVO := pValor;
end;

end.
