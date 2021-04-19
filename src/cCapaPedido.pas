unit cCapaPedido;

interface

uses
  Biblioteca, Data.DB, System.SysUtils, System.Generics.Collections, cItensPedido;

type
  TCapaPedido = class(TObject)
  private
    { Private declarations }
  PEDIDOID    : Integer;
  CADASTROID  : String;
  RAZAO_SOCIAL: String;
  DATA_PEDIDO : TDate;
  VLR_PEDIDO  : Double;
  STATUS      : String;
  NOVO        : Boolean;
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
    function  GetDATA_PEDIDO: TDate;
    procedure SetDATA_PEDIDO(pValor: TDate);
    function  GetVLR_PEDIDO: Double;
    procedure SetVLR_PEDIDO(pValor: Double);
    function  GetSTATUS: String;
    procedure SetSTATUS(pValor: String);
    function  GetNOVO: Boolean;
    procedure SetNOVO(pValor: Boolean);
    function  GetITENS: TObjectList<TItensPedido>;
    procedure SetITENS(pValor: TItensPedido);

    procedure AlterarStatus(pPedidoID: Integer; pStatus: String);
    function Gravar:Boolean;
    function Consultar(pPedidoID: Integer): Boolean;
    function Excluir(pPedidoID: Integer): Boolean;
    function Pesquisa: Boolean;
  end;

implementation

{ TCapaPedido }

procedure TCapaPedido.AlterarStatus(pPedidoID: Integer; pStatus: String);
begin
  Banco.Atualizar('CAPA_PEDIDO',['PEDIDO_ID'],[pPedidoID],['STATUS'],[pStatus]);
end;

function TCapaPedido.Consultar(pPedidoID: Integer): Boolean;
var
  vItens: TItensPedido;
begin
  Result := False;
  try
    Banco.Consultar('SELECT * FROM CAPA_PEDIDO WHERE PEDIDO_ID = :PEDIDO_ID',['PEDIDO_ID'],[pPedidoID]);
    Result := not Banco.Campos.IsEmpty;
    if Result then begin
      SetPEDIDOID(Banco.Campos.FieldByName('PEDIDO_ID').AsInteger);
      SetCADASTROID(Banco.Campos.FieldByName('CADASTRO_ID').AsString);
      SetRAZAO_SOCIAL(Banco.Campos.FieldByName('RAZAO_SOCIAL').AsString);
      SetDATA_PEDIDO(Banco.Campos.FieldByName('DATA').AsDateTime);
      SetVLR_PEDIDO(Banco.Campos.FieldByName('TOTAL').AsFloat);
      SetSTATUS(Banco.Campos.FieldByName('STATUS').AsString);
      //Preencher itens
      Banco.Consultar('SELECT * FROM ITENS_PEDIDO WHERE PEDIDO_ID = :PEDIDO_ID',['PEDIDO_ID'],[pPedidoID]);
      Banco.Campos.First;
      while not Banco.Campos.Eof do begin
        vItens := TItensPedido.Create;
        vItens.SetPEDIDOID(Banco.Campos.FieldByName('PEDIDO_ID').AsInteger);
        vItens.SetPRODUTO_ID(Banco.Campos.FieldByName('PRODUTO_ID').AsInteger);
        vItens.SetNOME(Banco.Campos.FieldByName('NOME').AsString);
        vItens.SetQUANTIDADE(Banco.Campos.FieldByName('QUANTIDADE').AsFloat);
        vItens.SetVALOR(Banco.Campos.FieldByName('VALOR').AsFloat);
        vItens.SetVLR_TOTAL(Banco.Campos.FieldByName('VLR_TOTAL').AsFloat);
        vItens.SetCONTROLADO(Banco.Campos.FieldByName('RECEITA').AsString);
        SetITENS(vItens);
        Banco.Campos.Next;
      end;
    end;
  except
    Atencao('Erro ao consultar a venda!');
  end;
end;

constructor TCapaPedido.Create;
begin
  ITENS := TObjectList<TItensPedido>.Create;
end;

destructor TCapaPedido.Destroy;
begin
  if (ITENS <> nil) then begin
    ITENS.Free;
  end;
  inherited;
end;

function TCapaPedido.Excluir(pPedidoID: Integer): Boolean;
begin
  Result := False;
  try
    Result := Banco.Excluir('ITENS_PEDIDO',['PEDIDO_ID'],[pPedidoID]);
    if Result then begin
      Banco.Excluir('CAPA_PEDIDO',['PEDIDO_ID'],[pPedidoID]);
    end;
  except
    Atencao('Erro ao excluir a venda!');
  end;
end;

function TCapaPedido.GetCADASTROID: String;
begin
  Result := CADASTROID;
end;

function TCapaPedido.GetDATA_PEDIDO: TDate;
begin
  Result := DATA_PEDIDO;
end;

function TCapaPedido.GetITENS: TObjectList<TItensPedido>;
begin
  Result := ITENS;
end;

function TCapaPedido.GetNOVO: Boolean;
begin
  Result := NOVO;
end;

function TCapaPedido.GetPEDIDOID: Integer;
begin
  Result := PEDIDOID;
end;

function TCapaPedido.GetRAZAO_SOCIAL: String;
begin
  Result := RAZAO_SOCIAL;
end;

function TCapaPedido.GetSTATUS: String;
begin
  Result := STATUS;
end;

function TCapaPedido.GetVLR_PEDIDO: Double;
begin
  Result := VLR_PEDIDO;
end;

function TCapaPedido.Gravar: Boolean;
var
  vListaItens: TObjectList<TItensPedido>;
  vItens: TItensPedido;
begin
  Result := False;
  try
    if GetNOVO then
    begin
      SetPEDIDOID(Banco.NextVal('CAPA_PEDIDO','PEDIDO_ID'));
      Banco.Inserir('CAPA_PEDIDO',
                   ['PEDIDO_ID',
                    'CADASTRO_ID',
                    'RAZAO_SOCIAL',
                    'DATA',
                    'TOTAL',
                    'STATUS'],
                   [GetPEDIDOID,
                    GetCADASTROID,
                    GetRAZAO_SOCIAL,
                    GetDATA_PEDIDO,
                    GetVLR_PEDIDO,
                    GetSTATUS]);
      vListaItens := GetITENS;
      for vItens in vListaItens do
      begin
        Banco.Inserir('ITENS_PEDIDO',
                     ['PEDIDO_ID',
                      'PRODUTO_ID',
                      'NOME',
                      'QUANTIDADE',
                      'VALOR',
                      'VLR_TOTAL',
                      'RECEITA'],
                     [GetPEDIDOID,
                      vItens.GetPRODUTO_ID,
                      vItens.GetNOME,
                      vItens.GetQUANTIDADE,
                      vItens.GetVALOR,
                      vItens.GetVLR_TOTAL,
                      vItens.GetCONTROLADO]);
      end;
    end else
    begin
      Banco.Atualizar('CAPA_PEDIDO',
                     ['PEDIDO_ID'],
                     [GetPEDIDOID],
                     ['CADASTRO_ID',
                      'RAZAO_SOCIAL',
                      'DATA',
                      'TOTAL',
                      'STATUS'],
                     [GetCADASTROID,
                      GetRAZAO_SOCIAL,
                      GetDATA_PEDIDO,
                      GetVLR_PEDIDO,
                      GetSTATUS]);
      vListaItens := GetITENS;
      for vItens in vListaItens do
      begin
        Banco.Atualizar('ITENS_PEDIDO',
                       ['PEDIDO_ID',
                        'PRODUTO_ID'],
                       [vItens.GetPEDIDOID,
                        vItens.GetPRODUTO_ID],
                       ['NOME',
                        'QUANTIDADE',
                        'VALOR',
                        'VLR_TOTAL',
                        'RECEITA'],
                       [vItens.GetNOME,
                        vItens.GetQUANTIDADE,
                        vItens.GetVALOR,
                        vItens.GetVLR_TOTAL,
                        vItens.GetCONTROLADO]);
      end;
    end;
    Result := True;
  except
    Atencao('Erro ao gravar a venda!');
  end;
end;

function TCapaPedido.Pesquisa: Boolean;
var
  vRetorno: String;
begin
  Result := False;
  vRetorno := Banco.Pesquisar('CAPA_PEDIDO',
                              'PEDIDO_ID',
                              ['PEDIDO_ID',
                               'CADASTRO_ID',
                               'RAZAO_SOCIAL'],
                              'Pesquisa de pedidos de venda');
  if (vRetorno <> '') then begin
    Result := Consultar(StrToInt(vRetorno));
  end;
end;

procedure TCapaPedido.SetCADASTROID(pValor: String);
begin
  CADASTROID := pValor;
end;

procedure TCapaPedido.SetDATA_PEDIDO(pValor: TDate);
begin
  DATA_PEDIDO := pValor;
end;

procedure TCapaPedido.SetITENS(pValor: TItensPedido);
begin
  ITENS.Add(pValor);
end;

procedure TCapaPedido.SetNOVO(pValor: Boolean);
begin
  NOVO := pValor;
end;

procedure TCapaPedido.SetPEDIDOID(pValor: Integer);
begin
  if (pValor > 0) then
  begin
    PEDIDOID := pValor;
  end else
  begin
    Atencao('Número do pedido inválido!');
    Abort;
  end;
end;

procedure TCapaPedido.SetRAZAO_SOCIAL(pValor: String);
begin
  RAZAO_SOCIAL := pValor;
end;

procedure TCapaPedido.SetSTATUS(pValor: String);
begin
  STATUS := pValor;
end;

procedure TCapaPedido.SetVLR_PEDIDO(pValor: Double);
begin
  VLR_PEDIDO := pValor;
end;

end.
