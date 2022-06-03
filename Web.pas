unit Web;

interface

uses IdHTTP;

function GetRequest(const url: string): string;

implementation

function Registrate(
  const firstName: string;
  const lastName: string;
  const email: string;
  const bornDate: string;
  const password: string
): string;
begin
  Result := GetRequest(Concat(
    'http://localhost:8080/registration?firstName=', firstName,
    '&lastName=', lastName,
    '&email=', email,
    '&bornDate=', bornDate,
    '&password=', password
  ));
end;  

function GetRequest(const url: string): string;
var
  request: TIdHTTP;
begin
  request := TIdHTTP.Create(nil);
  try
    Result := UTF8Decode(request.Get(UTF8Encode(url)));
  finally
     request.Free;
  end;
end;

end.
