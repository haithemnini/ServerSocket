program Socket_Connect;

uses
  Vcl.Forms,
  Main in 'Server\Main.pas' {UMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TUMain, UMain);
  Application.Run;
end.
