unit uPangram;

interface

function isPangram(const sentence : String) : Boolean ;

implementation

uses
  System.Generics.Collections,
  SysUtils ;

function isPangram(const sentence : String) : Boolean;
var
  c : Char;
  dct : TDictionary<Char, Boolean>;
begin
  dct := TDictionary<Char, Boolean>.Create;
  try
    for c in sentence do begin
      if CharInSet(c, ['a'..'z']) then
        dct.AddOrSetValue( Char(Ord(c)-32), True ) // to upper case
      else if CharInSet(c, ['A'..'Z']) then
        dct.AddOrSetValue( c, True );
    end;

    // if dictionary count equals number of alphabet letters,
    // the sentence is a Pangram
    if ( dct.Count = Ord('Z') - Ord('A') + 1 ) then
      Result := True
    else
      Result := False ;
  finally
    dct.Free;
  end;
end;

end.
