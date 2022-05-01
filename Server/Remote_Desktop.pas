unit Remote_Desktop;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TURemote_Desktop = class(TForm)
    StatusBar_APP: TStatusBar;
    Pnl_Bottom: TPanel;
    Radio_Remote: TRadioGroup;
    Btn_OK: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Btn_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  URemote_Desktop: TURemote_Desktop;

implementation

uses
  Main, System.Win.ScktComp;

{$R *.dfm}

procedure TURemote_Desktop.Btn_OKClick(Sender: TObject);
 var send_text : string; client_Send: TCustomWinSocket; I : Integer;
begin
{$REGION ' Radio_Remote.ItemIndex....'}
  case Radio_Remote.ItemIndex of
    0  : send_text := '0'  ;
    1  : send_text := '1'  ;
    2  : send_text := '2'  ;
    3  : send_text := '3'  ;
    4  : send_text := '4'  ;
    5  : send_text := '5'  ;
    6  : send_text := '6'  ;
    7  : send_text := '7'  ;
    8  : send_text := '8'  ;
    9  : send_text := '9'  ;
    10 : send_text := '10' ;
    11 : send_text := '11' ;
  end;
{$ENDREGION}

 for I := 0 to UMain.Serv_Sock.Socket.ActiveConnections-1 do
  begin
   client_Send := UMain.Serv_Sock.Socket.Connections[i];
   if client_Send.RemoteAddress = UMain.LV_Clients.Selected.SubItems[1] then
    begin
     client_Send.SendText(send_text);
     break;
    end;
  end;
end;

procedure TURemote_Desktop.FormShow(Sender: TObject);
begin
 if UMain.Serv_Sock.Active then
  StatusBar_APP.Panels.Items[1].Text := 'Server is Activated , Port :  ' + intToStr(UMain.Serv_Sock.Port) + '   IP : ' + UMain.LV_Clients.Selected.SubItems[1]
 else
  StatusBar_APP.Panels.Items[1].Text := 'Server is Stopped';

  Radio_Remote.ItemIndex := -1 ;
end;

end.
