unit cItensPedido;

interface

uses
  Biblioteca, Data.DB, System.SysUtils;

type
  TItensPedido = class(TObject)
  private
    { Private declarations }
  PEDIDOID  : Integer;
  PRODUTO_ID: Integer;
  NOME      : String;
  QUANTIDADE: Double;
  VALOR     : Double;
  VLR_TOTAL : Double;
  RECEITA   : String;

  public
    { Public declarations }
    function  GetPEDIDOID: Integer;
    procedure SetPEDIDOID(pValor: Integer);
    function  GetPRODUTO_ID: Integer;
    procedure SetPRODUTO_ID(pValor: Integer);
    function  GetNOME: String;
    procedure SetNOME(pValor: String);
    function  GetQUANTIDADE: Double;
    procedure SetQUANTIDADE(pValor: Double);
    function  GetVALOR: Double;
    procedure SetVALOR(pValor: Double);
    function  GetVLR_TOTAL: Double;
    procedure SetVLR_TOTAL(pValor: Double);
    function  GetRECEITA: String;
    procedure SetRECEITA(pValor: String);
  end;

implementation

{ TItensPedido }

function TItensPedido.GetNOME: String;
begin
  Result := NOME;
end;

function TItensPedido.GetPEDIDOID: Integer;
begin
  Result := PEDIDOID;
end;

function TItensPedido.GetPRODUTO_ID: Integer;
begin
  Result := PRODUTO_ID;
end;

function TItensPedido.GetQUANTIDADE: Double;
begin
  Result := QUANTIDADE;
end;

function TItensPedido.GetRECEITA: String;
begin
  Result := RECEITA;
end;

function TItensPedido.GetVALOR: Double;
begin
  Result := VALOR;
end;

function TItensPedido.GetVLR_TOTAL: Double;
begin
  Result := VLR_TOTAL;
end;

procedure TItensPedido.SetNOME(pValor: String);
begin
  NOME := pValor;
end;

procedure TItensPedido.SetPEDIDOID(pValor: Integer);
begin
  PEDIDOID := pValor;
end;

procedure TItensPedido.SetPRODUTO_ID(pValor: Integer);
begin
  PRODUTO_ID := pValor;
end;

procedure TItensPedido.SetQUANTIDADE(pValor: Double);
begin
  QUANTIDADE := pValor;
end;

procedure TItensPedido.SetRECEITA(pValor: String);
begin
  RECEITA := pValor;
end;

procedure TItensPedido.SetVALOR(pValor: Double);
begin
  VALOR := pValor;
end;

procedure TItensPedido.SetVLR_TOTAL(pValor: Double);
begin
  VLR_TOTAL := pValor;
end;

end.
