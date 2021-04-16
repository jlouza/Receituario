unit cCadastro;

interface

type
  TCadastro = class abstract
  private
    { Private declarations }
  CADASTRO_ID   : String;
  RAZAO_SOCIAL  : String;
  TIPO_PESSOA   : String;
  TIPO_CADASTRO : String;
  public
    { Public declarations }
    function  GetCADASTRO_ID: String;
    procedure SetCADASTRO_ID(pValor: String);
    function  GetRAZAO_SOCIAL: String;
    procedure SetRAZAO_SOCIAL(pValor: String);
    function  GetTIPO_PESSOA: String;
    procedure SetTIPO_PESSOA(pValor: String);
    function  GetTIPO_CADASTRO: String;
    procedure SetTIPO_CADASTRO(pValor: String);
  protected
    function Gravar:Boolean; virtual; abstract;
    function Consultar(pCadastroID: String): Boolean; virtual; abstract;
    function Excluir(pCadastroID: String): Boolean; virtual; abstract;
  end;

implementation

{ TCadastro }

function TCadastro.GetCADASTRO_ID: String;
begin
  Result := CADASTRO_ID;
end;

function TCadastro.GetRAZAO_SOCIAL: String;
begin
  Result := RAZAO_SOCIAL;
end;

function TCadastro.GetTIPO_CADASTRO: String;
begin
  Result := TIPO_CADASTRO;
end;

function TCadastro.GetTIPO_PESSOA: String;
begin
  Result := TIPO_PESSOA;
end;

procedure TCadastro.SetCADASTRO_ID(pValor: String);
begin
  CADASTRO_ID := pValor;
end;

procedure TCadastro.SetRAZAO_SOCIAL(pValor: String);
begin
  RAZAO_SOCIAL := pValor;
end;

procedure TCadastro.SetTIPO_CADASTRO(pValor: String);
begin
  TIPO_CADASTRO := pValor;
end;

procedure TCadastro.SetTIPO_PESSOA(pValor: String);
begin
  TIPO_PESSOA := pValor;
end;

end.
