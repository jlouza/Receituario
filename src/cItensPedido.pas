unit cItensPedido;

interface

uses
  Biblioteca, Data.DB, System.SysUtils, cProduto;

type
  TItensPedido = class(TProduto)
  private
    { Private declarations }
  PEDIDOID  : Integer;
  QUANTIDADE: Double;
  VLR_TOTAL : Double;

  public
    { Public declarations }
    function  GetPEDIDOID: Integer;
    procedure SetPEDIDOID(pValor: Integer);
    function  GetQUANTIDADE: Double;
    procedure SetQUANTIDADE(pValor: Double);
    function  GetVLR_TOTAL: Double;
    procedure SetVLR_TOTAL(pValor: Double);
  end;

implementation

{ TItensPedido }

function TItensPedido.GetPEDIDOID: Integer;
begin
  Result := PEDIDOID;
end;

function TItensPedido.GetQUANTIDADE: Double;
begin
  Result := QUANTIDADE;
end;

function TItensPedido.GetVLR_TOTAL: Double;
begin
  Result := VLR_TOTAL;
end;

procedure TItensPedido.SetPEDIDOID(pValor: Integer);
begin
  PEDIDOID := pValor;
end;

procedure TItensPedido.SetQUANTIDADE(pValor: Double);
begin
  QUANTIDADE := pValor;
end;

procedure TItensPedido.SetVLR_TOTAL(pValor: Double);
begin
  VLR_TOTAL := pValor;
end;

end.
