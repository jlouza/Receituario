unit CadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Biblioteca, cProdutoCad;

type
  TfrmCadProdutos = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbExcluir: TToolButton;
    tbCancelar: TToolButton;
    tbGravar: TToolButton;
    ToolButton3: TToolButton;
    tbPesquisar: TToolButton;
    ToolButton1: TToolButton;
    tbFechar: TToolButton;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblNome: TLabel;
    edtNome: TEdit;
    lblValor: TLabel;
    edtValor: TEdit;
    chkControleEspecial: TCheckBox;
    procedure tbCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbExcluirClick(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure tbPesquisarClick(Sender: TObject);
    procedure tbFecharClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    vProduto: TProdutoCad;
    vNovo: Boolean;
    procedure Modo(pEditando: Boolean);
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.dfm}

{ TfrmCadProdutos }

procedure TfrmCadProdutos.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then begin
    if (Trim(edtCodigo.Text) <> '') then
    begin
      if vProduto.Consultar(StrToInt(edtCodigo.Text)) then
      begin
        edtNome.Text  := vProduto.GetNOME;
        edtValor.Text := FloatToStr(vProduto.GetVALOR);
        chkControleEspecial.Checked := (vProduto.GetCONTROLADO = 'S');
        vNovo := False;
        Modo(True);
      end else begin
        Atencao('Produto não cadastrado!');
        edtCodigo.SetFocus;
        Abort;
      end;
    end else
    begin
      vNovo := True;
      Modo(True);
    end;
  end;
end;

procedure TfrmCadProdutos.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key,['0'..'9',',','.',#13, #27, #8]) then
  begin
    Key := #0;
  end;
end;

procedure TfrmCadProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (vProduto <> nil) then
  begin
    vProduto.Free;
  end;
end;

procedure TfrmCadProdutos.FormCreate(Sender: TObject);
begin
  ToolBar1.Images := ilNavegadoresGlobal;
  vProduto := TProdutoCad.Create;
  vNovo    := True;
  Modo(False);
end;

procedure TfrmCadProdutos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Perform(40,0,0);
  end;
end;

procedure TfrmCadProdutos.Modo(pEditando: Boolean);
begin
  tbExcluir.Enabled   := pEditando and not vNovo;
  tbCancelar.Enabled  := pEditando;
  tbGravar.Enabled    := pEditando;
  tbPesquisar.Enabled := not pEditando;
  if not pEditando then
  begin
    edtCodigo.Clear;
    edtNome.Clear;
    edtValor.Clear;
    edtValor.Text := '0,00';
    chkControleEspecial.Checked := False;
    vNovo := False;
  end;
end;

procedure TfrmCadProdutos.tbCancelarClick(Sender: TObject);
begin
  Modo(False);
  if edtCodigo.Enabled then
  begin
    edtCodigo.SetFocus;
  end;
end;

procedure TfrmCadProdutos.tbExcluirClick(Sender: TObject);
begin
  if vProduto.Excluir(StrToInt(edtCodigo.Text)) then
  begin
    Atencao('Produto excluído!');
    Modo(False);
    if edtCodigo.Enabled then
    begin
      edtCodigo.SetFocus;
    end;
  end;
end;

procedure TfrmCadProdutos.tbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadProdutos.tbGravarClick(Sender: TObject);
begin
  if (Trim(edtNome.Text) = '') then
  begin
    Atencao('O Nome do produto deve ser informado!');
    edtNome.SetFocus;
    Abort;
  end;
  if (Trim(edtValor.Text) = '') then
  begin
    Atencao('O Valor do produto deve ser informado!');
    edtValor.SetFocus;
    Abort;
  end;
  vProduto.SetNOVO(vNovo);
  vProduto.SetNOME(edtNome.Text);
  vProduto.SetVALOR(StrToFloat(edtValor.Text));
  vProduto.SetCONTROLADO(BooleanToChar(chkControleEspecial));
  if vProduto.Gravar then
  begin
    if vNovo then
    begin
      Atencao('Produto '+IntToStr(vProduto.GetPRODUTO_ID)+' inserido com sucesso!');
    end else
    begin
      Atencao('Produto '+IntToStr(vProduto.GetPRODUTO_ID)+' editado com sucesso!');
    end;
    Modo(False);
    if edtCodigo.Enabled then
    begin
      edtCodigo.SetFocus;
    end;
  end;
end;

procedure TfrmCadProdutos.tbPesquisarClick(Sender: TObject);
begin
  if vProduto.Pesquisa then
  begin
    edtCodigo.Text := IntToStr(vProduto.GetPRODUTO_ID);
    edtNome.Text   := vProduto.GetNOME;
    edtValor.Text  := FloatToStr(vProduto.GetVALOR);
    chkControleEspecial.Checked := (vProduto.GetCONTROLADO = 'S');
    vNovo          := False;
    Modo(True);
  end;
end;

end.
