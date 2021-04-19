unit Dados;

interface

uses
  System.SysUtils, Vcl.Controls, FireDAC.Stan.Intf, FireDAC.Stan.Option,Vcl.Forms,Winapi.Windows, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Pesquisa;

type
  TDados = class(TObject)
  private
    { Private declarations }
    conexao: TFDConnection;
    qryExec: TFDQuery;
    qryPesquisa: TFDQuery;

    procedure IniciarBanco;
  public
    { Public declarations }
    constructor Create;
    function Inserir(pTabela: String; pCampos: array of String; pValor: array of Variant):Boolean;
    function Atualizar(pTabela: String; pFiltros: array of String; pVlrFiltros: array of Variant; pCampos: array of String; pValor: array of Variant): Boolean;
    function Excluir(pTabela: String; pFiltros: array of String; pVlrFiltros: array of Variant):Boolean;
    function Campos: TFDQuery;
    function Pesquisar(pTabela: String; pChave: String; pCampos: array of string; pTitulo: String): String;
    function NextVal(pTabela: String; pChave: String): Integer;
    procedure Consultar(pInstrucao: string; pCampos: array of String; pValor: array of Variant);
    procedure AbrirTransacao;
    procedure FecharTransacao;
    procedure VoltarTransacao;
  end;

implementation

{ TDadosFire }

procedure TDados.AbrirTransacao;
begin
  conexao.StartTransaction;
end;

function TDados.Atualizar(pTabela: String; pFiltros: array of String; pVlrFiltros: array of Variant; pCampos: array of String; pValor: array of Variant): Boolean;
var
  I: Integer;
  vPrimeiro: Boolean;
  vListaCampos,
  vListaFiltros: String;
begin
  if High(pCampos) <> High(pValor) then begin
    Application.MessageBox('Quantidade de parâmetos diferentes!','Atenção',MB_OK);
    Abort;
  end;
  if High(pFiltros) <> High(pVlrFiltros) then begin
    Application.MessageBox('Quantidade de filtros diferentes!','Atenção',MB_OK);
    Abort;
  end;
  Result := False;
  try
    with qryExec do begin
      Active := False;
      SQL.Clear;
      SQL.Add('Update '+pTabela+' set ');
      vPrimeiro    := True;
      vListaCampos := '';
      for I := Low(pCampos) to High(pCampos) do begin
        if vPrimeiro then begin
          vListaCampos := pCampos[I]+' = :'+pCampos[I];
          vPrimeiro    := False;
        end else begin
          vListaCampos := vListaCampos +','+ pCampos[I]+' = :'+pCampos[I];
        end;
      end;
      SQL.Add(vListaCampos);
      vPrimeiro     := True;
      vListaFiltros := '';
      for I := Low(pFiltros) to High(pFiltros) do begin
        if vPrimeiro then begin
          vListaFiltros := 'Where '+ pFiltros[I]+' = :X'+pFiltros[I];
          vPrimeiro     := False;
        end else begin
          vListaFiltros := vListaFiltros +' and '+ pFiltros[I]+' = :X'+pFiltros[I];
        end;
      end;
      SQL.Add(vListaFiltros);
      Unprepare;
      Prepare;
      for I := Low(pCampos) to High(pCampos) do begin
        ParamByName(pCampos[I]).Value := pValor[I];
      end;
      for I := Low(pFiltros) to High(pFiltros) do begin
        ParamByName('X'+pFiltros[I]).Value := pVlrFiltros[I];
      end;
      ExecSQL;
      Active := False;
      SQL.Clear;
      Result := True;
    end;
  except
    Application.MessageBox('Erro ao atualizar a tabela!','Atenção',MB_OK);
  end;
end;

function TDados.Campos: TFDQuery;
begin
  Result := qryPesquisa;
end;

procedure TDados.Consultar(pInstrucao: string; pCampos: array of String; pValor: array of Variant);
var
  I: Integer;
begin
  if High(pCampos) <> High(pValor) then begin
    Application.MessageBox('Quantidade de parâmetos diferentes!','Atenção',MB_OK);
    Abort;
  end;
  try
    with qryPesquisa do begin
      Active := False;
      SQL.Clear;
      SQL.Add(pInstrucao);
      Unprepare;
      Prepare;
      for I := Low(pCampos) to High(pCampos) do begin
        ParamByName(pCampos[I]).Value := pValor[I];
      end;
      Active := True;
    end;
  except
    Application.MessageBox('Erro ao consultar a tabela!','Atenção',MB_OK);
  end;
end;

constructor TDados.Create;
begin
  IniciarBanco;
end;

function TDados.Excluir(pTabela: String; pFiltros: array of String; pVlrFiltros: array of Variant): Boolean;
var
  I: Integer;
  vPrimeiro: Boolean;
  vListaFiltros: String;
begin
  if High(pFiltros) <> High(pVlrFiltros) then begin
    Application.MessageBox('Quantidade de filtros diferentes!','Atenção',MB_OK);
    Abort;
  end;
  Result := False;
  try
    with qryExec do begin
      Active := False;
      SQL.Clear;
      SQL.Add('Delete from '+pTabela);
      vPrimeiro     := True;
      vListaFiltros := '';
      for I := Low(pFiltros) to High(pFiltros) do begin
        if vPrimeiro then begin
          vListaFiltros := 'Where '+ pFiltros[I]+' = :'+pFiltros[I];
          vPrimeiro     := False;
        end else begin
          vListaFiltros := vListaFiltros +' and '+ pFiltros[I]+' = :'+pFiltros[I];
        end;
      end;
      SQL.Add(vListaFiltros);
      Unprepare;
      Prepare;
      for I := Low(pFiltros) to High(pFiltros) do begin
        ParamByName(pFiltros[I]).Value := pVlrFiltros[I];
      end;
      ExecSQL;
      Active := False;
      SQL.Clear;
      Result := True;
    end;
  except
    Application.MessageBox('Erro ao excluir a tabela!','Atenção',MB_OK);
  end;
end;

procedure TDados.FecharTransacao;
begin
  conexao.Commit;
end;

procedure TDados.IniciarBanco;
begin
  try
    conexao := TFDConnection.Create(nil);
    conexao.Connected       := False;
    conexao.DriverName      := 'FB';
    conexao.Params.Database := 'C:\Projetos\data\BANCODADOS.FDB';
    conexao.Params.UserName := 'SYSDBA';
    conexao.Params.Password := 'masterkey';
    conexao.LoginPrompt     := False;
    conexao.Connected       := True;
    qryExec     := TFDQuery.Create(nil);
    qryExec.Connection     := conexao;
    qryPesquisa := TFDQuery.Create(nil);
    qryPesquisa.Connection := conexao;
    {if conexao.Connected then begin
      Application.MessageBox('Banco firibird iniciado com sucesso!','Atenção',MB_OK);
    end;}
  except
    Application.MessageBox('Banco não iniciado!','Atenção',MB_OK);
  end;
end;

function TDados.Inserir(pTabela: String; pCampos: array of String; pValor: array of Variant): Boolean;
var
  I: Integer;
  vPrimeiro: Boolean;
  vListaCampos,
  vListaParam: String;
begin
  Result := False;
  try
    if High(pCampos) <> High(pValor) then begin
      Application.MessageBox('Quantidade de parâmetos diferentes!','Atenção',MB_OK);
      Abort;
    end;
    with qryExec do begin
      Active := False;
      SQL.Clear;
      SQL.Add('Insert into '+pTabela+'(');
      vPrimeiro    := True;
      vListaCampos := '';
      vListaParam  := '';
      for I := Low(pCampos) to High(pCampos) do begin
        if vPrimeiro then begin
          vListaCampos := pCampos[I];
          vListaParam  := ':'+pCampos[I];
          vPrimeiro    := False;
        end else begin
          vListaCampos := vListaCampos +','+ pCampos[I];
          vListaParam  := vListaParam  +',:'+pCampos[I];
        end;
      end;
      SQL.Add(vListaCampos+') Values('+vListaParam+')');
      Unprepare;
      Prepare;
      for I := Low(pCampos) to High(pCampos) do begin
        ParamByName(pCampos[I]).Value := pValor[I];
      end;
      ExecSQL;
      Active := False;
      SQL.Clear;
      Result := True;
    end;
  except
    Application.MessageBox('Erro ao inserir na tabela!','Atenção',MB_OK);
  end;
end;

function TDados.NextVal(pTabela, pChave: String): Integer;
begin
  Result := 0;
  try
    with qryPesquisa do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT COALESCE(MAX('+pChave+') + 1,1) AS VALOR FROM '+pTabela);
      Active := True;
      Result := qryPesquisa.FieldByName('VALOR').AsInteger;
    end;
  except
    Application.MessageBox('Erro ao consultar a tabela!','Atenção',MB_OK);
  end;
end;

function TDados.Pesquisar(pTabela, pChave: String; pCampos: array of string; pTitulo: String): String;
var
  I: Integer;
  vListaCampos: String;
  vPrimeiro: Boolean;
begin
  Result       := '';
  vListaCampos := '';
  vPrimeiro    := True;
  for I := Low(pCampos) to High(pCampos) do begin
    if vPrimeiro then begin
      vListaCampos := pCampos[I];
      vPrimeiro    := False;
    end else begin
      vListaCampos := vListaCampos + ',' +pCampos[I];
    end;
  end;
  try
    Application.CreateForm(TfrmPesquisa,frmPesquisa);
    with frmPesquisa do begin
      Caption := pTitulo;
      qryPesPadrao.Connection := conexao;
      qryPesPadrao.Active     := False;
      qryPesPadrao.SQL.Clear;
      qryPesPadrao.SQL.Add('SELECT '+vListaCampos+' FROM '+pTabela);
      qryPesPadrao.Active := True;
      if (ShowModal = mrOK) then begin
        Result := qryPesPadrao.FieldByName(pChave).AsString;
      end;
    end;
  finally
    frmPesquisa.Free;
  end;
end;

procedure TDados.VoltarTransacao;
begin
  conexao.Rollback;
end;

end.
