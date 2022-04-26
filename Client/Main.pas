unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TUMain = class(TForm)
    Edt_Host: TEdit;
    Label1: TLabel;
    Mem_Client: TMemo;
    Btn_Start: TBitBtn;
    Btn_Stop: TBitBtn;
    Btn_Send: TBitBtn;
    Edt_Mes: TEdit;
    Edt_Port: TEdit;
    Label2: TLabel;
    Client_Sock: TClientSocket;
    procedure Btn_StartClick(Sender: TObject);
    procedure Btn_StopClick(Sender: TObject);
    procedure Client_SockConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Client_SockDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Btn_SendClick(Sender: TObject);
    procedure Client_SockRead(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UMain: TUMain;

implementation

uses
  CMD_Dialect;

{$R *.dfm}

procedure TUMain.Btn_SendClick(Sender: TObject);
begin
  Client_Sock.Socket.SendText(Edt_Mes.Text);
  Edt_Mes.Clear;
  Edt_Mes.SetFocus;
end;

procedure TUMain.Btn_StartClick(Sender: TObject);
begin
  Client_Sock.Port :=   StrToInt(Edt_Port.Text);
  Client_Sock.Host :=   Edt_Host.Text;
  Client_Sock.Active := True;
//======
  Btn_Start.Enabled := False;
  Btn_Stop.Enabled := True;
  Btn_Send.Enabled := True;
end;

procedure TUMain.Btn_StopClick(Sender: TObject);
begin
  Client_Sock.Active := False;
//======
  Btn_Start.Enabled := True;
  Btn_Stop.Enabled := False;
  Btn_Send.Enabled := False;
end;

procedure TUMain.Client_SockConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  Mem_Client.Lines.Add('Client Start');
  Mem_Client.Lines.Add(Socket.RemoteHost + ' : ' + Socket.RemoteAddress + ' Port ' + ' : ' + IntToStr(Socket.RemotePort));
end;

procedure TUMain.Client_SockDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Mem_Client.Lines.Add('Client Stop');
  Mem_Client.Lines.Add(Socket.RemoteAddress + ' : ' + IntToStr(Socket.RemotePort));
//======
  Btn_Start.Enabled := True;
  Btn_Stop.Enabled := False;
  Btn_Send.Enabled := False;
end;

procedure TUMain.Client_SockRead(Sender: TObject; Socket: TCustomWinSocket);
var  StrCommand : string;
begin
  StrCommand := Socket.ReceiveText;
//=======
  if Pos(CMD_CLOSE, StrCommand) > 0 then
  begin
   // Client_Sock.Active := False;
    ShowMessage('00');
  end;
end;

end.
