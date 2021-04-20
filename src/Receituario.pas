unit Receituario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Data.DB, cReceita,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Datasnap.DBClient, cReceituario, cItensPedido,
  System.Generics.Collections, Biblioteca;

type
  TfrmReceituario = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbProcessar: TToolButton;
    tbCancelar: TToolButton;
    tbAssinar: TToolButton;
    ToolButton3: TToolButton;
    tbFechar: TToolButton;
    txtReceitas: TStaticText;
    dbgReceitas: TDBGrid;
    txtItens: TStaticText;
    dbgItens: TDBGrid;
    dsReceitas: TDataSource;
    cdsReceitas: TClientDataSet;
    dsItens: TDataSource;
    cdsItens: TClientDataSet;
    cdsReceitasPEDIDOID: TIntegerField;
    cdsReceitasTECNICO: TStringField;
    cdsReceitasCADASTROID: TStringField;
    cdsReceitasRAZAOSOCIAL: TStringField;
    ToolButton1: TToolButton;
    cdsItensPRODUTOID: TIntegerField;
    cdsItensDESCRICAO: TStringField;
    cdsItensQUANTIDADE: TFloatField;
    cdsItensPEDIDOID: TIntegerField;
    procedure FormDestroy(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure cdsReceitasBeforeDelete(DataSet: TDataSet);
    procedure cdsItensBeforeDelete(DataSet: TDataSet);
    procedure tbProcessarClick(Sender: TObject);
    procedure tbFecharClick(Sender: TObject);
    procedure tbAssinarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vListaReceitas: TReceituario;
  public
    { Public declarations }
  end;

var
  frmReceituario: TfrmReceituario;

implementation

{$R *.dfm}

procedure TfrmReceituario.cdsItensBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TfrmReceituario.cdsReceitasBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TfrmReceituario.FormCreate(Sender: TObject);
begin
  ToolBar1.Images := ilNavegadoresGlobal;
end;

procedure TfrmReceituario.FormDestroy(Sender: TObject);
begin
  if (vListaReceitas <> nil) then
  begin
    vListaReceitas.Destroy;
  end;
end;

procedure TfrmReceituario.tbAssinarClick(Sender: TObject);
var
  vReceita   : TReceita;
begin
  vReceita := TReceita.Create;
  if vReceita.AssinarReceita(cdsReceitasPEDIDOID.AsInteger) then
  begin
    Atencao('Receita assinada com sucesso!');
    tbProcessar.Click;
  end;
end;

procedure TfrmReceituario.tbCancelarClick(Sender: TObject);
begin
  cdsReceitas.EmptyDataSet;
  cdsItens.EmptyDataSet;
  FreeAndNil(vListaReceitas);
  tbAssinar.Enabled := False;
end;

procedure TfrmReceituario.tbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReceituario.tbProcessarClick(Sender: TObject);
var
  vLista     : TObjectList<TReceita>;
  vListaItens: TObjectList<TItensPedido>;
  vReceita   : TReceita;
  vItens     : TItensPedido;
begin
  cdsReceitas.EmptyDataSet;
  cdsItens.EmptyDataSet;
  vListaReceitas := TReceituario.Create;
  if vListaReceitas.ListarReceitasPendentes then
  begin
    vLista := vListaReceitas.GetRECEITUARIO;
    for vReceita in vLista do
    begin
      cdsReceitas.Append;
      cdsReceitasPEDIDOID.AsInteger   := vReceita.GetPEDIDOID;
      cdsReceitasCADASTROID.AsString  := vReceita.GetCADASTROID;
      cdsReceitasRAZAOSOCIAL.AsString := vReceita.GetRAZAO_SOCIAL;
      cdsReceitasTECNICO.AsString     := vReceita.GetNOME_TECNICO;
      vListaItens := vReceita.GetITENS;
      for vItens in vListaItens do
      begin
        cdsItens.Append;
        cdsItensPEDIDOID.AsInteger  := vReceita.GetPEDIDOID;
        cdsItensPRODUTOID.AsInteger := vItens.GetPRODUTO_ID;
        cdsItensDESCRICAO.AsString  := vItens.GetNOME;
        cdsItensQUANTIDADE.AsFloat  := vItens.GetQUANTIDADE;
        cdsItens.Post;
      end;
      cdsReceitas.Post;
    end;
    cdsReceitas.First;
    tbAssinar.Enabled := not cdsReceitas.IsEmpty;
  end else
  begin
    Atencao('Nenhuma receita pendente!');
  end;
end;

end.
