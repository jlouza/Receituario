unit cProdutoCad;

interface

uses
  Biblioteca, Data.DB, System.SysUtils, cProduto;

type
  TProdutoCad = class(TProduto)
  private
    { Private declarations }
  NOVO: Boolean;

  public
    { Public declarations }
    function  GetNOVO: Boolean;
    procedure SetNOVO(pValor: Boolean);

    function Gravar:Boolean;
    function Consultar(pProdutoID: Integer): Boolean;
    function Excluir(pProdutoID: Integer): Boolean;
    function Pesquisa: Boolean;
  end;

implementation

{ TProdutoCad }

function TProdutoCad.Consultar(pProdutoID: Integer): Boolean;
begin
  Result := False;
  try
    Banco.Consultar('SELECT * FROM PRODUTOS WHERE PRODUTO_ID = :PRODUTO_ID',
                   ['PRODUTO_ID'],
                   [pProdutoID]);
    Result := not Banco.Campos.IsEmpty;
    if Result then
    begin
      SetPRODUTO_ID(pProdutoID);
      SetNOME(Banco.Campos.FieldByName('NOME').AsString);
      SetVALOR(Banco.Campos.FieldByName('VALOR').AsFloat);
      SetCONTROLADO(Banco.Campos.FieldByName('CONTROLADO').AsString);
    end;
  except
    Atencao('Erro ao consultar o produto!');
  end;
end;

function TProdutoCad.Excluir(pProdutoID: Integer): Boolean;
begin
  Result := False;
  try
    Result := Banco.Excluir('PRODUTOS',['PRODUTO_ID'],[pProdutoID]);
  except
    Atencao('Erro ao excluir o produto!');
  end;
end;

function TProdutoCad.GetNOVO: Boolean;
begin
  Result := NOVO;
end;

function TProdutoCad.Gravar: Boolean;
begin
  Result := False;
  try
    if GetNOVO then
    begin
      SetPRODUTO_ID(Banco.NextVal('PRODUTOS','PRODUTO_ID'));
      Result := Banco.Inserir('PRODUTOS',
                             ['PRODUTO_ID',
                              'NOME',
                              'VALOR',
                              'CONTROLADO'],
                             [GetPRODUTO_ID,
                              GetNOME,
                              GetVALOR,
                              GetCONTROLADO]);
    end else
    begin
      Result := Banco.Atualizar('PRODUTOS',
                               ['PRODUTO_ID'],
                               [GetPRODUTO_ID],
                               ['NOME',
                                'VALOR',
                                'CONTROLADO'],
                               [GetNOME,
                                GetVALOR,
                                GetCONTROLADO]);
    end;
  except
    Atencao('Erro ao gravar o Produto!');
  end;
end;

function TProdutoCad.Pesquisa: Boolean;
var
  vRetorno: String;
begin
  Result := False;
  vRetorno := Banco.Pesquisar('PRODUTOS',
                              'PRODUTO_ID',
                              ['PRODUTO_ID',
                               'NOME'],
                              'Pesquisa de produtos');
  if (vRetorno <> '') then begin
    Result := Consultar(StrToInt(vRetorno));
  end;
end;

procedure TProdutoCad.SetNOVO(pValor: Boolean);
begin
  NOVO := pValor;
end;

end.
