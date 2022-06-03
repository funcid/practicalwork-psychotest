unit Test;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Web;

type
  TForm2 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Pointer: Integer = 1;
  Answers : array[1..40] of Integer;

const
  Questions : array[1..40] of string = (
    '�� �������� � ���� �����������.',
    '����� ��-�� �������� �������.',
    '��� ��� ���������.',
    '����� ������ � ������.',
    '���������� � ������ ������������ ��� �������������.',
    '���� ������ ���������.',
    '����� �������� � ����� �����������.',
    '���� ����� �������.',
    '� ����������.',
    '� � ������ �������� ����� ��������.',

    '������� ��� ������� ������������ ���������, �� ������� ���-���� ����� ����� �����.',
    '������������ ���� ������ ������������, � ����� �����.',
    '��� ������� ������������� � ������� ��� ����������� ��������� ������ ����.',
    '��������� � ������� ������ ���� �� ����.',
    '� ����� ����������� �� ������, ������ �� ����������.',
    '� ������� �������� ���� �����������.',
    '������ � ���� ������ ��������� ��������.',
    '� �������� ������������� ����� �����������.',
    '� ������� ������ ����� ������ ���� ���� ��-������, ����, ����� ��������.',
    '������ ���������� ������ ��������� �������������.',
    '�������� �� ����� ��������� �����.',

    '������� � ��������� ��������� �����������.',
    '���� ����� ����������.',
    '����� ������ ��������� ������.',
    '���� ���� ����������� ��� ������.',
    '�� ������������� �����, ���� �����������.',
    '����� �����������, ����� ���� ���������.',
    '����������� ����� ����������, ��� �����������.',
    '� ���� ������, ���������� ������������.',
    '� ���������.',
    '��� ������ ������ ��������.',

    '������� ����������� ��������.',
    '����� ������������ �������� �� ����� ������.',
    '���� ������ �����������.',
    '������� � ���� �� ������� �� ������ �����, �� ������� ��������� �� ������������.',
    '������� ��������� � ������.',
    '���� ������������ ���� �������������� ��������� �����.',
    '������� � �������� ���������.',
    '�������� ��� �� ����.',
    '����� ��������� ���������� �� ��������� ���� ������ ���.'
  );

implementation

{$R *.dfm}

procedure Accept(Code: Integer);
begin
  Answers[Pointer] := Code;
  Inc(Pointer);
  if Pointer = Length(Answers) + 1 then
  begin
    Form2.btn1.Visible := False;
    Form2.btn2.Visible := False;
    Form2.btn3.Visible := False;
    Form2.lbl1.Caption := '����';
    Form2.lbl2.Caption := '�������� ������ ���������...';
  end else begin
  Form2.lbl1.Caption := Concat('������ ����� ', IntToStr(Pointer));
  Form2.lbl2.Caption := Questions[Pointer];
  end
end;

procedure TForm2.btn1Click(Sender: TObject);
begin
  Accept(0);
end;

procedure TForm2.btn2Click(Sender: TObject);
begin
  if btn1.Visible then begin
    Accept(1);
  end
  else begin
    btn2.Caption := '������';
    btn1.Visible := True;
    btn3.Visible := True;
    Form2.lbl1.Caption := '������ ����� 1';
    Form2.lbl2.Caption := Questions[Pointer];
  end;
end;

procedure TForm2.btn3Click(Sender: TObject);
begin
  Accept(2);
end;

end.
