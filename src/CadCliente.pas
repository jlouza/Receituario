unit CadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, cCliente, Biblioteca;

type
  TfrmCadClientes = class(TForm)
    lblCpfCnpj: TLabel;
    edtCadastroID: TEdit;
    lblNome: TLabel;
    edtNome: TEdit;
    btnPesquisar: TButton;
    btnGravar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
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

procedure TfrmCadClientes.btnCancelarClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TfrmCadClientes.btnExcluirClick(Sender: TObject);
begin
  if vCliente.Excluir(edtCadastroID.Text) then begin
    Atencao('Cliente excluído!');
    LimparCampos;
  end;
end;

procedure TfrmCadClientes.btnGravarClick(Sender: TObject);
begin
  //Fazer validações
  vCliente.SetNOVO(vNovo);
  vCliente.SetCADASTRO_ID(edtCadastroID.Text);
  vCliente.SetRAZAO_SOCIAL(edtNome.Text);
  vCliente.SetTIPO_PESSOA('F');
  vCliente.SetTIPO_CADASTRO('C');
  if vCliente.Gravar then begin
    if vNovo then begin
      Atencao('Cliente inserida com sucesso!');
    end else begin
      Atencao('Cliente editado com sucesso!');
    end;
    LimparCampos;
  end;
end;

procedure TfrmCadClientes.btnPesquisarClick(Sender: TObject);
begin
  if vCliente.Pesquisa then begin
    edtCadastroID.Text := vCliente.GetCADASTRO_ID;
    edtNome.Text       := vCliente.GetRAZAO_SOCIAL;
    vNovo              := False;
  end;
end;

procedure TfrmCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (vCliente <> nil) then begin
    vCliente.Free;
  end;
end;

procedure TfrmCadClientes.FormCreate(Sender: TObject);
begin
  vCliente := TCliente.Create;
  vNovo    := False;
end;

procedure TfrmCadClientes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then begin
    Perform(40,0,0);
  end;
end;

procedure TfrmCadClientes.LimparCampos;
begin
  edtCadastroID.Clear;
  edtNome.Clear;
  edtCadastroID.SetFocus;
end;

end.
