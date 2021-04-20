unit cReceituario;

interface

uses
  Biblioteca, Data.DB, System.SysUtils, System.Generics.Collections, cReceita, cItensPedido;

type
  TReceituario = class(TObject)
  private
    { Private declarations }
  RECEITUARIO: TObjectList<TReceita>;

  public
    { Public declarations }
    constructor Create;
    destructor  Destroy; override;
    function  GetRECEITUARIO: TObjectList<TReceita>;
    procedure SetRECEITUARIO(pReceita: TReceita);

    function ListarReceitasPendentes: Boolean;
  end;

implementation

{ TReceituario }

constructor TReceituario.Create;
begin
  RECEITUARIO := TObjectList<TReceita>.Create;
end;

destructor TReceituario.Destroy;
begin
  if (RECEITUARIO <> nil) then begin
    RECEITUARIO.Free;
  end;
  inherited;
end;

function TReceituario.GetRECEITUARIO: TObjectList<TReceita>;
begin
  Result := RECEITUARIO;
end;

function TReceituario.ListarReceitasPendentes: Boolean;
var
  vReceita: TReceita;
  vItens  : TItensPedido;
begin
  Result := False;
  try
    Banco.Consultar('SELECT * FROM RECEITAS WHERE STATUS = :STATUS',['STATUS'],['P']);
    Result := not Banco.Campos.IsEmpty;
    if Result then
    begin
      Banco.Campos.First;
      while not Banco.Campos.Eof do
      begin
        vReceita := TReceita.Create;
        vReceita.SetPEDIDOID(Banco.Campos.FieldByName('PEDIDO_ID').AsInteger);
        vReceita.SetCADASTROID(Banco.Campos.FieldByName('CADASTRO_ID').AsString);
        vReceita.SetRAZAO_SOCIAL(Banco.Campos.FieldByName('RAZAO_SOCIAL').AsString);
        vReceita.SetCPF_TECNICO(Banco.Campos.FieldByName('CPF_TECNICO').AsString);
        vReceita.SetNOME_TECNICO(Banco.Campos.FieldByName('TECNICO').AsString);
        Banco.ConsultarAux('SELECT * FROM ITENS_PEDIDO WHERE PEDIDO_ID = :PEDIDO_ID'+
                           '  AND RECEITA = ''S'' ',
                          ['PEDIDO_ID'],
                          [Banco.Campos.FieldByName('PEDIDO_ID').AsInteger]);
        Banco.CamposAux.First;
        while not Banco.CamposAux.Eof do
        begin
          vItens := TItensPedido.Create;
          vItens.SetPEDIDOID(Banco.CamposAux.FieldByName('PEDIDO_ID').AsInteger);
          vItens.SetPRODUTO_ID(Banco.CamposAux.FieldByName('PRODUTO_ID').AsInteger);
          vItens.SetNOME(Banco.CamposAux.FieldByName('NOME').AsString);
          vItens.SetQUANTIDADE(Banco.CamposAux.FieldByName('QUANTIDADE').AsFloat);
          vReceita.SetITENS(vItens);
          Banco.CamposAux.Next;
        end;
        SetRECEITUARIO(vReceita);
        Banco.Campos.Next;
      end;
    end;
  except
    Atencao('Erro ao pesquisar as receitas!');
  end;
end;

procedure TReceituario.SetRECEITUARIO(pReceita: TReceita);
begin
  RECEITUARIO.Add(pReceita);
end;

end.
