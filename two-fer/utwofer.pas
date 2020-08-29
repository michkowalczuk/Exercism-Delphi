unit utwofer;

interface

function twoFer(const str : String='you') : String;

implementation
uses
  SysUtils ;

const
  BASE = 'One for %s, one for me.';

function twoFer(const str : String) : String;
begin
  Result := Format(BASE, [str]);
end;

end.