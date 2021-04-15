unit Biblioteca;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Dados;

var
  Banco : TDados;

procedure Atencao(pMensagem: String);

implementation

procedure Atencao(pMensagem: String);
begin
  Application.MessageBox(Pchar(pMensagem),'Atenção',MB_OK);
end;

end.
