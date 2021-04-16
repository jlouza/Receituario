unit cCadastro;

interface

uses
  Biblioteca, Data.DB, System.SysUtils;

type
  TCadastro = class abstract
  private
    { Private declarations }
  CADASTRO_ID   : String;
  RAZAO_SOCIAL  : String;
  TIPO_PESSOA   : String;
  TIPO_CADASTRO : String;
  function ValidaCPF(pValor: String): Boolean;
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
  if ValidaCPF(pValor) then
  begin
    CADASTRO_ID := pValor;
  end else begin
    Atencao('CPF inválido');
    Abort;
  end;
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

function TCadastro.ValidaCPF(pValor: String): Boolean;
var
  Digito1,Digito2,vNumeros: String;
  S,Cont,Soma,I: Integer;
begin
  vNumeros := '';
  for I := 1 to Length(pValor) do
  begin
    if CharInSet(pValor[i],['0'..'9']) then
    begin
      vNumeros := (vNumeros + pValor[I]);
    end;
  end;
  if (Length(vNumeros) = 11) then
  begin
    {Primeiro Dígito }
    Cont:=1;
    Soma:=0;
    for S:=9 Downto 1 do
    begin
      Inc(Cont);
      Soma := Soma + (StrToInt(vNumeros[S]) * Cont);
    end;
    Soma := (Soma * 10);
    Digito1 := IntToStr(Soma Mod 11);
    if (StrToInt(Digito1) >= 10) then
      Digito1 := '0';
    {Segundo Dígito}
    Cont:=1;
    Soma:=0;
    for S:=10 Downto 1 do
    begin
      Inc(Cont);
      Soma := Soma + (StrToInt(vNumeros[S]) * Cont);
    end;
    Soma    := (Soma * 10);
    Digito2 := IntToStr(Soma Mod 11);
    if (StrToInt(Digito2) >= 10) then
      Digito2 := '0';
  end else
  begin
    Result := False;
    Exit;
  end;
  Result := (Copy(vNumeros,Length(vNumeros)-1,2) = (Digito1+Digito2));
end;

end.
