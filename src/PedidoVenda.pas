unit PedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Data.DB, Vcl.DBCtrls, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids;

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
    edtData: TEdit;
    StaticText1: TStaticText;
    sbIncluir: TSpeedButton;
    sbCancelar: TSpeedButton;
    sbPesqProdutos: TSpeedButton;
    txtItens: TStaticText;
    dbgItens: TDBGrid;
    dsItens: TDataSource;
    cdsItens: TClientDataSet;
    cdsItensCODPRODUTO: TFloatField;
    cdsItensNOME: TStringField;
    cdsItensQUANTIDADE: TFloatField;
    cdsItensVALOR: TFloatField;
    cdsItensTOTAL: TFloatField;
    cdsItensVRL_TOTAL: TAggregateField;
    edtVlrTotal: TDBEdit;
    Label2: TLabel;
    procedure tbFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoVenda: TfrmPedidoVenda;

implementation

{$R *.dfm}

procedure TfrmPedidoVenda.tbFecharClick(Sender: TObject);
begin
  Close;
end;

end.
