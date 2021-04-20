unit PedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Biblioteca,
  Vcl.Buttons, Vcl.Mask, Data.DB, Vcl.DBCtrls, Datasnap.DBClient, Vcl.Grids, cCapaPedido, cItensPedido,
  Vcl.DBGrids, cCliente, cProdutoCad, System.Generics.Collections, Receita, cReceita;

type
  TfrmPedidoVenda = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbExcluir: TToolButton;
    tbCancelar: TToolButton;
    tbGravar: TToolButton;
    ToolButton3: TToolButton;
    tbPesquisar: TToolButton;
    ToolButton1: TToolButton;
    tbFechar: TToolButton;
    grpCapa: TGroupBox;
    lblPedido: TLabel;
    lblNome: TLabel;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblQuantidade: TLabel;
    lblValor: TLabel;
    lblTotal: TLabel;
    edtPedido: TEdit;
    edtCliente: TEdit;
    edtCodProduto: TEdit;
    edtNomeProduto: TEdit;
    edtQuantidade: TEdit;
    edtValor: TEdit;
    edtTotal: TEdit;
    lblCpf: TLabel;
    edtCadastroID: TMaskEdit;
    sbPesqClientes: TSpeedButton;
    Label1: TLabel;
    sbIncluir: TSpeedButton;
    sbCancelar: TSpeedButton;
    sbPesqProdutos: TSpeedButton;
    txtItens: TStaticText;
    dbgItens: TDBGrid;
    dsItens: TDataSource;
    cdsItens: TClientDataSet;
    cdsItensNOME: TStringField;
    cdsItensQUANTIDADE: TFloatField;
    cdsItensVALOR: TFloatField;
    cdsItensTOTAL: TFloatField;
    cdsItensVRL_TOTAL: TAggregateField;
    edtVlrTotal: TDBEdit;
    Label2: TLabel;
    edtData: TMaskEdit;
    cdsItensPRODUTOID: TIntegerField;
    cdsItensRECEITA: TBooleanField;
    stStatus: TLabel;
    procedure tbFecharClick(Sender: TObject);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbCancelarClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure sbIncluirClick(Sender: TObject);
    procedure dbgItensDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbPesqClientesClick(Sender: TObject);
    procedure sbPesqProdutosClick(Sender: TObject);
    procedure edtCadastroIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtPedidoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbPesquisarClick(Sender: TObject);
    procedure tbExcluirClick(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
  private
    { Private declarations }
    vNovo,
    vEditando: Boolean;
    vCapa: TCapaPedido;
    vCliente: TCliente;
    vProduto: TProdutoCad;
    procedure LimparCamposProduto;
    procedure LimparTela;
    procedure PreencherTela;
    function RetornaStatus(pStatus: String): String;
  public
    { Public declarations }
  end;

var
  frmPedidoVenda: TfrmPedidoVenda;

implementation

{$R *.dfm}

procedure TfrmPedidoVenda.dbgItensDblClick(Sender: TObject);
begin
  if not cdsItens.IsEmpty then
  begin
    edtCodProduto.Text  := cdsItensPRODUTOID.AsString;
    edtNomeProduto.Text := cdsItensNOME.AsString;
    edtQuantidade.Text  := cdsItensQUANTIDADE.AsString;
    edtValor.Text       := cdsItensVALOR.AsString;
    edtTotal.Text       := cdsItensTOTAL.AsString;
    vEditando           := True;
  end;
end;

procedure TfrmPedidoVenda.edtCadastroIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if vCliente.Consultar(edtCadastroID.Text) then begin
      edtCliente.Text := vCliente.GetRAZAO_SOCIAL;
      vNovo           := False;
    end else
    begin
      sbPesqClientes.Click;
    end;
  end;
end;

procedure TfrmPedidoVenda.edtCodProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if (edtCodProduto.Text <> '') then
    begin
      if vProduto.Consultar(StrToInt(edtCodProduto.Text)) then
      begin
        edtNomeProduto.Text := vProduto.GetNOME;
        edtValor.Text       := FloatToStr(vProduto.GetVALOR);
        edtQuantidade.SetFocus;
      end else begin
        Atencao('Produto não cadastrado!');
        edtCodProduto.SetFocus;
        Abort;
      end;
    end else
    begin
      sbPesqProdutos.Click;
    end;
  end;
end;

procedure TfrmPedidoVenda.edtPedidoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if (vCapa = nil) then
    begin
      vCapa := TCapaPedido.Create;
    end;
    if (edtPedido.Text <> '') then
    begin
      if vCapa.Consultar(StrToInt(edtPedido.Text)) then
      begin
        PreencherTela;
      end else
      begin
        Atencao('Pedido não cadastrado!');
        edtPedido.SetFocus;
        Abort;
      end;
    end else
    begin
      edtData.Text := DateToStr(date);
      edtCadastroID.SetFocus;
      vNovo := True;
    end;
  end;
end;

procedure TfrmPedidoVenda.edtValorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    edtTotal.Text := FloatToStr(StrToFloat(edtQuantidade.Text) * StrToFloat(edtValor.Text));
    sbIncluir.Click;
  end;
end;

procedure TfrmPedidoVenda.FormCreate(Sender: TObject);
begin
  vNovo     := True;
  vCapa     := TCapaPedido.Create;
  vCliente  := TCliente.Create;
  vProduto  := TProdutoCad.Create;
  vEditando := False;
end;

procedure TfrmPedidoVenda.FormDestroy(Sender: TObject);
begin
  if (vCapa <> nil) then begin
    vCapa.Destroy;
  end;
  if (vCliente <> nil) then begin
    vCliente.Destroy;
  end;
  if (vProduto <> nil) then begin
    vProduto.Destroy;
  end;
end;

procedure TfrmPedidoVenda.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then begin
    Perform(40,0,0);
  end;
end;

procedure TfrmPedidoVenda.LimparCamposProduto;
begin
  edtCodProduto.Clear;
  edtNomeProduto.Clear;
  edtQuantidade.Clear;
  edtValor.Text := '0,00';
  edtTotal.Text := '0,00';
end;

procedure TfrmPedidoVenda.LimparTela;
begin
  edtPedido.Clear;
  edtData.Clear;
  edtCadastroID.Clear;
  edtCliente.Clear;
  stStatus.Visible := False;
  vNovo            := True;
  vEditando        := False;
  LimparCamposProduto;
  cdsItens.EmptyDataSet;
  if (vCapa <> nil) then begin
    FreeAndNil(vCapa);
  end;
  edtPedido.SetFocus;
end;

procedure TfrmPedidoVenda.PreencherTela;
var
  vItens: TItensPedido;
  vListaItens: TObjectList<TItensPedido>;
begin
  edtPedido.Text     := IntToStr(vCapa.GetPEDIDOID);
  stStatus.Caption   := RetornaStatus(vCapa.GetSTATUS);
  edtData.Text       := DateToStr(vCapa.GetDATA_PEDIDO);
  edtCadastroID.Text := vCapa.GetCADASTROID;
  edtCliente.Text    := vCapa.GetRAZAO_SOCIAL;
  vListaItens        := vCapa.GetITENS;
  for vItens in vListaItens do
  begin
    cdsItens.Append;
    cdsItensPRODUTOID.AsInteger := vItens.GetPRODUTO_ID;
    cdsItensNOME.AsString       := vItens.GetNOME;
    cdsItensQUANTIDADE.AsFloat  := vItens.GetQUANTIDADE;
    cdsItensVALOR.AsFloat       := vItens.GetVALOR;
    cdsItensTOTAL.AsFloat       := vItens.GetVLR_TOTAL;
    cdsItensRECEITA.AsBoolean   := (vItens.GetCONTROLADO = 'S');
    cdsItens.Post;
  end;
  cdsItens.First;
  stStatus.Visible := True;
  vNovo            := False;
end;

function TfrmPedidoVenda.RetornaStatus(pStatus: String): String;
begin
  if (pStatus = 'A') then
  begin
    Result := 'Aguardando Receita';
    stStatus.Font.Color := clRed;
  end else
  begin
    Result := 'Concluído';
    stStatus.Font.Color := clBlue;
  end;
end;

procedure TfrmPedidoVenda.sbCancelarClick(Sender: TObject);
begin
  LimparCamposProduto;
end;

procedure TfrmPedidoVenda.sbIncluirClick(Sender: TObject);
begin
  if (edtCodProduto.Text = '') then
  begin
    Atencao('O código do produto não foi informado!');
    Abort;
  end;
  if cdsItens.Locate('PRODUTOID',edtCodProduto.Text,[]) or vEditando then
  begin
    cdsItens.Edit;
  end else
  begin
    cdsItens.Append;
  end;

  cdsItensPRODUTOID.AsString := edtCodProduto.Text;
  cdsItensNOME.AsString      := edtNomeProduto.Text;
  cdsItensQUANTIDADE.AsFloat := StrToFloat(edtQuantidade.Text);
  cdsItensVALOR.AsFloat      := StrToFloat(edtValor.Text);
  cdsItensTOTAL.AsFloat      := StrToFloat(edtTotal.Text);
  cdsItensRECEITA.AsBoolean  := (vProduto.GetCONTROLADO = 'S');
  cdsItens.Post;
  LimparCamposProduto;
  edtCodProduto.SetFocus;
end;

procedure TfrmPedidoVenda.sbPesqClientesClick(Sender: TObject);
begin
  if vCliente.Pesquisa then
  begin
    edtCadastroID.Text := vCliente.GetCADASTRO_ID;
    edtCliente.Text    := vCliente.GetRAZAO_SOCIAL;
  end;
end;

procedure TfrmPedidoVenda.sbPesqProdutosClick(Sender: TObject);
begin
  if vProduto.Pesquisa then
  begin
    edtCodProduto.Text  := IntToStr(vProduto.GetPRODUTO_ID);
    edtNomeProduto.Text := vProduto.GetNOME;
    edtValor.Text       := FloatToStr(vProduto.GetVALOR);
    edtQuantidade.SetFocus;
  end;
end;

procedure TfrmPedidoVenda.tbCancelarClick(Sender: TObject);
begin
  LimparTela;
end;

procedure TfrmPedidoVenda.tbExcluirClick(Sender: TObject);
begin
  if vCapa.Excluir(StrToInt(edtPedido.Text)) then begin
    Atencao('Venda excluída com sucesso!');
    LimparTela;
  end;
end;

procedure TfrmPedidoVenda.tbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedidoVenda.tbGravarClick(Sender: TObject);
var
  vItens: TItensPedido;
  vReceita: TReceita;
  vEmitirReceita: Boolean;
begin
  vCapa := TCapaPedido.Create;
  Banco.AbrirTransacao;
  vReceita := TReceita.Create;
  vEmitirReceita := False;
  if (edtCliente.Text = '') then
  begin
    Atencao('O cliente não foi informado!');
    edtCadastroID.SetFocus;
    Abort;
  end;
  if cdsItens.IsEmpty then
  begin
    Atencao('Nenhum item foi informado!');
    Abort;
  end;
  vCapa.SetNOVO(vNovo);
  vCapa.SetDATA_PEDIDO(StrToDate(edtData.Text));
  vCapa.SetCADASTROID(edtCadastroID.Text);
  vCapa.SetRAZAO_SOCIAL(edtCliente.Text);
  vCapa.SetVLR_PEDIDO(StrToFloat(edtVlrTotal.Text));
  cdsItens.First;
  while not cdsItens.Eof do
  begin
    vItens := TItensPedido.Create;
    vItens.SetPRODUTO_ID(cdsItensPRODUTOID.AsInteger);
    vItens.SetNOME(cdsItensNOME.AsString);
    vItens.SetQUANTIDADE(cdsItensQUANTIDADE.AsFloat);
    vItens.SetVALOR(cdsItensVALOR.AsFloat);
    vItens.SetVLR_TOTAL(cdsItensTOTAL.AsFloat);
    if cdsItensRECEITA.AsBoolean then
    begin
      vItens.SetCONTROLADO('S');
      vReceita.SetITENS(vItens);
      vEmitirReceita := True;
    end else
    begin
      vItens.SetCONTROLADO('N');
    end;
    vCapa.SetITENS(vItens);
    cdsItens.Next;
  end;
  if vCapa.Gravar then
  begin
    //Solicitação de receita
    if vEmitirReceita then
    begin
      vReceita.SetPEDIDOID(vCapa.GetPEDIDOID);
      vReceita.SetCADASTROID(vCapa.GetCADASTROID);
      vReceita.SetRAZAO_SOCIAL(vCapa.GetRAZAO_SOCIAL);
      vReceita.SetSTATUS('P');
      if SolicitaReceita(vReceita) then
      begin
        vReceita.Gravar;
        vCapa.AlterarStatus(vCapa.GetPEDIDOID,'A');
      end else
      begin
        Atencao('Solicitação de receita não cadastrada!');
        Banco.VoltarTransacao;
        Abort;
      end;
    end;
    if vNovo then
    begin
      Atencao('Pedido '+IntToStr(vCapa.GetPEDIDOID)+' inserido com sucesso!');
    end else
    begin
      Atencao('Pedido '+IntToStr(vCapa.GetPEDIDOID)+' editado com sucesso!');
    end;
    Banco.FecharTransacao;
  end;
  LimparTela;
end;

procedure TfrmPedidoVenda.tbPesquisarClick(Sender: TObject);
begin
  if (vCapa = nil) then
  begin
    vCapa := TCapaPedido.Create;
  end;
  if vCapa.Pesquisa then
  begin
    PreencherTela;
  end;
end;

end.
