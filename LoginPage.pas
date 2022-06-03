unit LoginPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Web, ComCtrls, StrUtils;

type
  TForm1 = class(TForm)
    login: TButton;
    lbl1: TLabel;
    edt1: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    dtp1: TDateTimePicker;
    lbl6: TLabel;
    start: TButton;
    lbl7: TLabel;
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

const UnixStartDate: TDateTime = 25569.0;

function DateTimeToUnix(ConvDate: TDateTime): Longint;
begin
  Result := Round((ConvDate - UnixStartDate) * 86400);
end;

procedure TForm1.loginClick(Sender: TObject);
var response: String;
begin
  lbl7.Caption := 'Отпралвляем запрос...';
  response :=
    GetRequest(Concat(
    'http://localhost:8080/registration?firstName=', edt1.Text,
    '&lastName=', edt2.Text,
    '&email=', edt3.Text,
    '&bornDate=', IntToStr(DateTimeToUnix(dtp1.Date)),
    '&password=', edt4.Text
  ));
  lbl7.Caption := response;
  if AnsiContainsStr(response, 'Успешно')
  then start.Visible := True;

end;

end.
