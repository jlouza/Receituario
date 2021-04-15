unit cCliente;

interface

uses
  cCadastro;

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
    function Consultar(pCodigo: Integer): Boolean; override;
    function Excluir(pCodigo: Integer): Boolean; override;
  end;

implementation

{ TCliente }

function TCliente.Consultar(pCodigo: Integer): Boolean;
begin
  //
end;

function TCliente.Excluir(pCodigo: Integer): Boolean;
begin
  //
end;

function TCliente.GetNOVO: Boolean;
begin
  Result := NOVO;
end;

function TCliente.Gravar: Boolean;
begin
  //
end;

procedure TCliente.SetNOVO(pValor: Boolean);
begin
  NOVO := pValor;
end;

end.
