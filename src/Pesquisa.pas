unit Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPesquisa = class(TForm)
    DBGrid1: TDBGrid;
    dsPesquisa: TDataSource;
    qryPesPadrao: TFDQuery;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure qryPesPadraoBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

procedure TfrmPesquisa.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPesquisa.qryPesPadraoBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

end.
