unit Receita;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Mask, Vcl.StdCtrls, cItensPedido,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, cTecnico, Biblioteca, cReceita;

type
  TfrmReceita = class(TForm)
    grbPedido: TGroupBox;
    lblPedido: TLabel;
    edtPedido: TEdit;
    lblCpf: TLabel;
    edtCadastroID: TMaskEdit;
    lblNome: TLabel;
    edtCliente: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edtCpfTecnico: TMaskEdit;
    Label2: TLabel;
    edtNomeTecnico: TEdit;
    sbPesqTecnico: TSpeedButton;
    txtItens: TStaticText;
    DBGrid1: TDBGrid;
    btnOK: TButton;
    btnCancelar: TButton;
    dsItens: TDataSource;
    cdsItens: TClientDataSet;
    cdsItensPRODUTOID: TIntegerField;
    cdsItensNOME: TStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure cdsItensBeforeDelete(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPesqTecnicoClick(Sender: TObject);
    procedure edtCpfTecnicoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    vTecnico: TTecnico;
  public
    { Public declarations }
  end;

  function SolicitaReceita(var pReceita: TReceita): Boolean;

var
  frmReceita: TfrmReceita;

implementation

{$R *.dfm}

procedure TfrmReceita.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReceita.btnOKClick(Sender: TObject);
begin
  if (edtNomeTecnico.Text = '') then begin
    Atencao('Técnico não informado!');
    edtCpfTecnico.SetFocus;
    Abort;
  end;
end;

procedure TfrmReceita.cdsItensBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TfrmReceita.edtCpfTecnicoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if (edtCpfTecnico.Text <> '   .   .   /  ') then
    begin
      if vTecnico.Consultar(edtCpfTecnico.Text) then
      begin
        edtNomeTecnico.Text := vTecnico.GetNOME;
      end else
      begin
        Atencao('Técnico não cadastrado!');
        edtCpfTecnico.SetFocus;
        Abort;
      end;
    end else
    begin
      sbPesqTecnico.Click;
    end;
  end;
end;

procedure TfrmReceita.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (vTecnico <> nil) then
  begin
    vTecnico.Free;
  end;
end;

procedure TfrmReceita.FormCreate(Sender: TObject);
begin
  vTecnico := TTecnico.Create;
end;

procedure TfrmReceita.sbPesqTecnicoClick(Sender: TObject);
begin
  if vTecnico.Pesquisa then
  begin
    edtCpfTecnico.Text  := vTecnico.GetCPF;
    edtNomeTecnico.Text := vTecnico.GetNOME;
  end;
end;

function SolicitaReceita(var pReceita: TReceita): Boolean;
var
  vListaItens: TObjectList<TItensPedido>;
  vItens: TItensPedido;
begin
  Application.CreateForm(TfrmReceita,frmReceita);
  with frmReceita do
  begin
    try
      edtPedido.Text     := IntToStr(pReceita.GetPEDIDOID);
      edtCadastroID.Text := pReceita.GetCADASTROID;
      edtCliente.Text    := pReceita.GetRAZAO_SOCIAL;
      vListaItens        := pReceita.GetITENS;
      for vItens in vListaItens do
      begin
        cdsItens.Append;
        cdsItensPRODUTOID.AsInteger := vItens.GetPRODUTO_ID;
        cdsItensNOME.AsString       := vItens.GetNOME;
        cdsItens.Post;
      end;
      cdsItens.First;
      Result := (ShowModal = mrOk);
      if Result then
      begin
        pReceita.SetCPF_TECNICO(edtCpfTecnico.Text);
        pReceita.SetNOME_TECNICO(edtNomeTecnico.Text);
      end;
    finally
      Free;
    end;
  end;
end;

end.
