unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TUMain = class(TForm)
    Edt_IP: TEdit;
    Label1: TLabel;
    Mem_Client: TMemo;
    Btn_Start: TBitBtn;
    Btn_Stop: TBitBtn;
    Btn_Send: TBitBtn;
    Edt_Mes: TEdit;
    Edit1: TEdit;
    Label2: TLabel;
    Client_Sock: TClientSocket;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UMain: TUMain;

implementation

{$R *.dfm}

end.
