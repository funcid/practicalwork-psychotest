unit LoginPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Web;

type
  TForm1 = class(TForm)
    login: TButton;
    lbl1: TLabel;
    procedure loginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.loginClick(Sender: TObject);
begin
  login.Caption := GetRequest('http://localhost:8080/findall');
end;

end.
