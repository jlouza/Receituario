unit cProduto;

interface

uses
  Biblioteca, Data.DB, System.SysUtils;

type
  TProduto = class abstract
  private
    { Private declarations }
  PRODUTO_ID: Integer;
  NOME      : String;
  VALOR     : Double;
  CONTROLADO: String;

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
  end;

implementation

{ TProduto }

function TProduto.GetCONTROLADO: String;
begin
  Result := CONTROLADO;
end;

function TProduto.GetNOME: String;
begin
  Result := NOME;
end;

function TProduto.GetPRODUTO_ID: Integer;
begin
  Result := PRODUTO_ID;
end;

function TProduto.GetVALOR: Double;
begin
  Result := VALOR;
end;

procedure TProduto.SetCONTROLADO(pValor: String);
begin
  CONTROLADO := pValor;
end;

procedure TProduto.SetNOME(pValor: String);
begin
  NOME := pValor;
end;

procedure TProduto.SetPRODUTO_ID(pValor: Integer);
begin
  if (pValor > 0) then
  begin
    PRODUTO_ID := pValor;
  end else
  begin
    Atencao('Código do produto inválido!');
    Abort;
  end;
end;

procedure TProduto.SetVALOR(pValor: Double);
begin
  VALOR := pValor;
end;

end.
