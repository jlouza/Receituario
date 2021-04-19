unit cTecnico;

interface

uses
  Biblioteca, Data.DB;

type
  TTecnico = class(TObject)
  private
    { Private declarations }
  CPF     : String;
  NOME    : String;
  REGISTRO: String;

  public
    { Public declarations }
    function  GetCPF: String;
    procedure SetCPF(pValor: String);
    function  GetNOME: String;
    procedure SetNOME(pValor: String);
    function  GetREGISTRO: String;
    procedure SetREGISTRO(pValor: String);

    function Pesquisa: Boolean;
    function Consultar(pCPF: String): Boolean;
  end;

implementation

{ TTecnico }

function TTecnico.Consultar(pCPF: String): Boolean;
begin
  Result := False;
  try
    Banco.Consultar('SELECT * FROM TECNICO_AGRICOLA WHERE CPF = :CPF',
                   ['CPF'],
                   [pCPF]);
    Result := not Banco.Campos.IsEmpty;
    if Result then begin
      SetCPF(pCPF);
      SetNOME(Banco.Campos.FieldByName('NOME').AsString);
      SetREGISTRO(Banco.Campos.FieldByName('NR_REGISTRO').AsString);
    end;
  except
    Atencao('Erro ao consultar o técnico!');
  end;
end;

function TTecnico.GetCPF: String;
begin
  Result := CPF;
end;

function TTecnico.GetNOME: String;
begin
  Result := NOME;
end;

function TTecnico.GetREGISTRO: String;
begin
  Result := REGISTRO;
end;

function TTecnico.Pesquisa: Boolean;
var
  vRetorno: String;
begin
  Result := False;
  vRetorno := Banco.Pesquisar('TECNICO_AGRICOLA',
                              'CPF',
                              ['CPF',
                               'NOME'],
                              'Pesquisa de técnico');
  if (vRetorno <> '') then begin
    Result := Consultar(vRetorno);
  end;
end;

procedure TTecnico.SetCPF(pValor: String);
begin
  CPF := pValor;
end;

procedure TTecnico.SetNOME(pValor: String);
begin
  NOME := pValor;
end;

procedure TTecnico.SetREGISTRO(pValor: String);
begin
  REGISTRO := pValor;
end;

end.
