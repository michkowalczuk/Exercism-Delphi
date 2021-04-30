unit uScrabbleScore;

interface
type
  TScrabble = class
    public
      class function Score(const word: String): Integer;
  end;

implementation

const
  SCORE_1  = ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'];
  SCORE_2  = ['D', 'G'];
  SCORE_3  = ['B', 'C', 'M', 'P'];
  SCORE_4  = ['F', 'H', 'V', 'W', 'Y'];
  SCORE_5  = ['K'];
  SCORE_8  = ['J', 'X'];
  SCORE_10 = ['Q', 'Z'];

class function TScrabble.Score(const word: String): Integer;
var
  c: char;
begin
  Result := 0;
  for c in word do
    if (c in SCORE_1) or (Chr(Ord(c)-32) in SCORE_1) then
      Inc(Result, 1) 
    else if (c in SCORE_2) or (Chr(Ord(c)-32) in SCORE_2) then
      Inc(Result, 2) 
    else if (c in SCORE_3) or (Chr(Ord(c)-32) in SCORE_3) then
      Inc(Result, 3) 
    else if (c in SCORE_4) or (Chr(Ord(c)-32) in SCORE_4) then
      Inc(Result, 4) 
    else if (c in SCORE_5) or (Chr(Ord(c)-32) in SCORE_5) then
      Inc(Result, 5) 
    else if (c in SCORE_8) or (Chr(Ord(c)-32) in SCORE_8) then
      Inc(Result, 8) 
    else if (c in SCORE_10) or (Chr(Ord(c)-32) in SCORE_10) then
      Inc(Result, 10) ;
end;

end.
