unit CadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, cCliente, Biblioteca,
  Vcl.Mask, Vcl.ComCtrls, Vcl.ToolWin;

type
  TfrmCadClientes = class(TForm)
    lblCpf: TLabel;
    lblNome: TLabel;
    edtNome: TEdit;
    edtCadastroID: TMaskEdit;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbCancelar: TToolButton;
    tbGravar: TToolButton;
    tbExcluir: TToolButton;
    ToolButton3: TToolButton;
    tbPesquisar: TToolButton;
    ToolButton1: TToolButton;
    tbFechar: TToolButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbPesquisarClick(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure tbExcluirClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure tbFecharClick(Sender: TObject);
    procedure edtCadastroIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    vCliente: TCliente;
    vNovo: Boolean;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

{$R *.dfm}

procedure TfrmCadClientes.edtCadastroIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if vCliente.Consultar(edtCadastroID.Text) then begin
      edtNome.Text := vCliente.GetRAZAO_SOCIAL;
      vNovo        := False;
    end;
  end;
end;

procedure TfrmCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (vCliente <> nil) then
  begin
    vCliente.Free;
  end;
end;

procedure TfrmCadClientes.FormCreate(Sender: TObject);
begin
  ToolBar1.Images := ilNavegadoresGlobal;
  vCliente := TCliente.Create;
  vNovo    := True;
end;

procedure TfrmCadClientes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Perform(40,0,0);
  end;
end;

procedure TfrmCadClientes.LimparCampos;
begin
  edtCadastroID.Clear;
  edtNome.Clear;
  edtCadastroID.SetFocus;
  vNovo := False;
end;

procedure TfrmCadClientes.tbCancelarClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TfrmCadClientes.tbExcluirClick(Sender: TObject);
begin
  if vCliente.Excluir(edtCadastroID.Text) then
  begin
    Atencao('Cliente excluído!');
    LimparCampos;
  end;
end;

procedure TfrmCadClientes.tbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadClientes.tbGravarClick(Sender: TObject);
begin
  if (Trim(edtNome.Text) = '') then
  begin
    Atencao('O Nome do cliente deve ser informado!');
    edtNome.SetFocus;
    Abort;
  end;
  vCliente.SetNOVO(vNovo);
  vCliente.SetCADASTRO_ID(edtCadastroID.Text);
  vCliente.SetRAZAO_SOCIAL(edtNome.Text);
  vCliente.SetTIPO_PESSOA('F');
  vCliente.SetTIPO_CADASTRO('C');
  if vCliente.Gravar then
  begin
    if vNovo then
    begin
      Atencao('Cliente inserido com sucesso!');
    end else
    begin
      Atencao('Cliente editado com sucesso!');
    end;
    LimparCampos;
  end;
end;

procedure TfrmCadClientes.tbPesquisarClick(Sender: TObject);
begin
  if vCliente.Pesquisa then
  begin
    edtCadastroID.Text := vCliente.GetCADASTRO_ID;
    edtNome.Text       := vCliente.GetRAZAO_SOCIAL;
    vNovo              := False;
  end;
end;

end.
