unit uIsogram;

interface

function isIsogram(const word : String) : Boolean;

implementation

uses
  System.Generics.Collections,
  SysUtils;

function isIsogram(const word : String) : Boolean;
var
  c : Char ;
  dct : TDictionary<Char, Boolean>;
begin
  Result := False ;
  dct := TDictionary<Char, Boolean>.Create;
  try
    for c in LowerCase(word) do
      if CharInSet(c, ['a'..'z']) then begin
        if dct.ContainsKey(c) then exit;
        dct.Add(c, True);
      end;
    Result := True;
  finally
    dct.Free;
  end;
end;

end.
