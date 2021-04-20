unit Biblioteca;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Dados;

var
  Banco : TDados;
  ilNavegadoresGlobal : TImageList;
procedure Atencao(pMensagem: String);
function  BooleanToChar(ck:TCheckBox):char;

implementation

procedure Atencao(pMensagem: String);
begin
  Application.MessageBox(Pchar(pMensagem),'Atenção',MB_OK);
end;

function BooleanToChar(ck:TCheckBox):char;
begin
  Result := 'N';
  if ck.Checked then
  begin
    Result := 'S';
  end;
end;

end.
