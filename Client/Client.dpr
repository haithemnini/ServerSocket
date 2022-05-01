program Client;

uses
  Vcl.Forms,
  Main in 'Main.pas' {UMain},
  CMD_Dialect in '..\API\CMD_Dialect.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TUMain, UMain);
  Application.Run;
end.
