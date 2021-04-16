unit cProduto;

interface

uses
  Biblioteca, Data.DB, System.SysUtils;

type
  TProduto = class(TObject)
  private
    { Private declarations }
  PRODUTO_ID: Integer;
  NOME      : String;
  VALOR     : Double;
  CONTROLADO: String;
  NOVO      : Boolean;

  public
    { Public declarations }
    function  GetPRODUTO_ID: Integer;
    procedure SetPRODUTO_ID(pValor: Integer);
    function  GetNOME: String;
    procedure SetNOME(pValor: String);
    function  GetVALOR: Double;
    procedure SetVALOR(pValor: Double);
    function  GetCONTROLADO: String;
    procedure SetCONTROLADO(pValor: String);
    function  GetNOVO: Boolean;
    procedure SetNOVO(pValor: Boolean);

    function Gravar:Boolean;
    function Consultar(pProdutoID: Integer): Boolean;
    function Excluir(pProdutoID: Integer): Boolean;
    function Pesquisa: Boolean;
  end;

implementation

{ TProduto }

function TProduto.Consultar(pProdutoID: Integer): Boolean;
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

function TProduto.Excluir(pProdutoID: Integer): Boolean;
begin
  Result := False;
  try
    Result := Banco.Excluir('PRODUTOS',['PRODUTO_ID'],[pProdutoID]);
  except
    Atencao('Erro ao excluir o produto!');
  end;
end;

function TProduto.GetCONTROLADO: String;
begin
  Result := CONTROLADO;
end;

function TProduto.GetNOME: String;
begin
  Result := NOME;
end;

function TProduto.GetNOVO: Boolean;
begin
  Result := NOVO;
end;

function TProduto.GetPRODUTO_ID: Integer;
begin
  Result := PRODUTO_ID;
end;

function TProduto.GetVALOR: Double;
begin
  Result := VALOR;
end;

function TProduto.Gravar: Boolean;
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

function TProduto.Pesquisa: Boolean;
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

procedure TProduto.SetCONTROLADO(pValor: String);
begin
  CONTROLADO := pValor;
end;

procedure TProduto.SetNOME(pValor: String);
begin
  NOME := pValor;
end;

procedure TProduto.SetNOVO(pValor: Boolean);
begin
  NOVO := pValor;
end;

procedure TProduto.SetPRODUTO_ID(pValor: Integer);
begin
  if (pValor > 0) then
  begin
    PRODUTO_ID := pValor;
  end else
  begin
    Atencao('Erro ao buscar o novo código do Produto!');
    Abort;
  end;
end;

procedure TProduto.SetVALOR(pValor: Double);
begin
  VALOR := pValor;
end;

end.
