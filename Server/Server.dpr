program Server;

uses
  Vcl.Forms,
  Main in 'Main.pas' {UMain},
  CMD_Dialect in '..\API\CMD_Dialect.pas',
  Remote_Desktop in 'Remote_Desktop.pas' {URemote_Desktop};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TUMain, UMain);
  Application.CreateForm(TURemote_Desktop, URemote_Desktop);
  Application.Run;
end.
