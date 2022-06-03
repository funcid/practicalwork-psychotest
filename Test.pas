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
    'Не чувствую в себе уверенности.',
    'Часто из-за пустяков краснею.',
    'Мой сон беспокоен.',
    'Легко впадаю в уныние.',
    'Беспокоюсь о только воображаемых еще неприятностях.',
    'Меня пугают трудности.',
    'Люблю копаться в своих недостатках.',
    'Меня легко убедить.',
    'Я мнительный.',
    'Я с трудом переношу время ожидания.',

    'Нередко мне кажутся безвыходными положения, из которых все-таки можно найти выход.',
    'Неприятности меня сильно расстраивают, я падаю духом.',
    'При больших неприятностях я склонен без достаточных оснований винить себя.',
    'Несчастья и неудачи ничему меня не учат.',
    'Я часто отказываюсь от борьбы, считая ее бесплодной.',
    'Я нередко чувствую себя беззащитным.',
    'Иногда у меня бывает состояние отчаяния.',
    'Я чувствую растерянность перед трудностями.',
    'В трудные минуты жизни иногда веду себя по-детски, хочу, чтобы пожалели.',
    'Считаю недостатки своего характера неисправимыми.',
    'Оставляю за собой последнее слово.',

    'Нередко в разговоре перебиваю собеседника.',
    'Меня легко рассердить.',
    'Люблю делать замечания другим.',
    'Хочу быть авторитетом для других.',
    'Не довольствуюсь малым, хочу наибольшего.',
    'Когда разгневаюсь, плохо себя сдерживаю.',
    'Предпочитаю лучше руководить, чем подчиняться.',
    'У меня резкая, грубоватая жестикуляция.',
    'Я мстителен.',
    'Мне трудно менять привычки.',

    'Нелегко переключать внимание.',
    'Очень настороженно отношусь ко всему новому.',
    'Меня трудно переубедить.',
    'Нередко у меня не выходит из головы мысль, от которой следовало бы освободиться.',
    'Нелегко сближаюсь с людьми.',
    'Меня расстраивают даже незначительные нарушения плана.',
    'Нередко я проявляю упрямство.',
    'Неохотно иду на риск.',
    'Резко переживаю отклонения от принятого мною режима дня.'
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
    Form2.lbl1.Caption := 'Итог';
    Form2.lbl2.Caption := 'Загрузка данных обработку...';
  end else begin
  Form2.lbl1.Caption := Concat('Вопрос номер ', IntToStr(Pointer));
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
    btn2.Caption := 'Бывает';
    btn1.Visible := True;
    btn3.Visible := True;
    Form2.lbl1.Caption := 'Вопрос номер 1';
    Form2.lbl2.Caption := Questions[Pointer];
  end;
end;

procedure TForm2.btn3Click(Sender: TObject);
begin
  Accept(2);
end;

end.
