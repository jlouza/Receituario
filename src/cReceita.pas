unit cReceita;

interface

uses
  Biblioteca, Data.DB, System.SysUtils, System.Generics.Collections, cItensPedido;

type
  TReceita = class(TObject)
  private
    { Private declarations }
  PEDIDOID    : Integer;
  CADASTROID  : String;
  RAZAO_SOCIAL: String;
  CPF_TECNICO : String;
  NOME_TECNICO: String;
  STATUS      : String;
  ITENS       : TObjectList<TItensPedido>;
  public
    { Public declarations }
    constructor Create;
    destructor  Destroy; override;
    function  GetPEDIDOID: Integer;
    procedure SetPEDIDOID(pValor: Integer);
    function  GetCADASTROID: String;
    procedure SetCADASTROID(pValor: String);
    function  GetRAZAO_SOCIAL: String;
    procedure SetRAZAO_SOCIAL(pValor: String);
    function  GetCPF_TECNICO: String;
    procedure SetCPF_TECNICO(pValor: String);
    function  GetNOME_TECNICO: String;
    procedure SetNOME_TECNICO(pValor: String);
    function  GetSTATUS: String;
    procedure SetSTATUS(pValor: String);
    function  GetITENS: TObjectList<TItensPedido>;
    procedure SetITENS(pValor: TItensPedido);

    function Gravar: Boolean;
    function AssinarReceita(pPedidoID: Integer): Boolean;
  end;

implementation

{ TReceita }

function TReceita.AssinarReceita(pPedidoID: Integer): Boolean;
begin
  Result := False;
  try
    Banco.Atualizar('RECEITAS',
                   ['PEDIDO_ID'],
                   [pPedidoID],
                   ['STATUS'],
                   ['A']);

    Banco.Atualizar('CAPA_PEDIDO',
                   ['PEDIDO_ID'],
                   [pPedidoID],
                   ['STATUS'],
                   ['C']);
    Result := True;
  except
    Atencao('Erro ao assinar a receita!');
  end;
end;

constructor TReceita.Create;
begin
  ITENS := TObjectList<TItensPedido>.Create;
end;

destructor TReceita.Destroy;
begin
  if (ITENS <> nil) then begin
    ITENS.Free;
  end;
  inherited;
end;

function TReceita.GetCADASTROID: String;
begin
  Result := CADASTROID;
end;

function TReceita.GetCPF_TECNICO: String;
begin
  Result := CPF_TECNICO;
end;

function TReceita.GetITENS: TObjectList<TItensPedido>;
begin
  Result := ITENS;
end;

function TReceita.GetNOME_TECNICO: String;
begin
  Result := NOME_TECNICO;
end;

function TReceita.GetPEDIDOID: Integer;
begin
  Result := PEDIDOID;
end;

function TReceita.GetRAZAO_SOCIAL: String;
begin
  Result := RAZAO_SOCIAL;
end;

function TReceita.GetSTATUS: String;
begin
  Result := STATUS;
end;

function TReceita.Gravar: Boolean;
begin
  Result := False;
  try
    Banco.Inserir('RECEITAS',
                 ['PEDIDO_ID',
                  'CADASTRO_ID',
                  'RAZAO_SOCIAL',
                  'CPF_TECNICO',
                  'TECNICO',
                  'STATUS'],
                 [GetPEDIDOID,
                  GetCADASTROID,
                  GetRAZAO_SOCIAL,
                  GetCPF_TECNICO,
                  GetNOME_TECNICO,
                  GetSTATUS]);
    Result := True;
  except
    Atencao('Erro ao gravar o pedido de receita!');
  end;
end;

procedure TReceita.SetCADASTROID(pValor: String);
begin
  CADASTROID := pValor;
end;

procedure TReceita.SetCPF_TECNICO(pValor: String);
begin
  CPF_TECNICO := pValor;
end;

procedure TReceita.SetITENS(pValor: TItensPedido);
begin
  ITENS.Add(pValor);
end;

procedure TReceita.SetNOME_TECNICO(pValor: String);
begin
  NOME_TECNICO := pValor;
end;

procedure TReceita.SetPEDIDOID(pValor: Integer);
begin
  PEDIDOID := pValor;
end;

procedure TReceita.SetRAZAO_SOCIAL(pValor: String);
begin
  RAZAO_SOCIAL := pValor;
end;

procedure TReceita.SetSTATUS(pValor: String);
begin
  STATUS := pValor;
end;

end.
