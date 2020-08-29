unit uAcronym;

interface
  function abbreviate(const sentence : String) : String ;

implementation
uses
  sysutils ;
  
  function abbreviate(const sentence : String) : String ;
  var
    c : Char;
    newWord : Boolean;
    strBuilder : TStringBuilder;
  begin
    strBuilder := TStringBuilder.Create;
    try
      newWord := True ;
      for c in UpperCase(sentence) do
      begin
        if c = '''' then continue ;
        
        if CharInSet(c, ['A'..'Z']) then begin
          if newWord then begin
            strBuilder.Append(c);
            newWord := False;
          end ; 
        end
        else begin
          newWord := True;
        end;
      end;

      Result := strBuilder.ToString;
    finally
      strBuilder.Free;
    end;
  end;

end.

