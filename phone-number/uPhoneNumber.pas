unit uPhoneNumber;

interface
type
  /// <summary>
  ///   Abstraction layer for a class that cleans up differently formatted 
  ///   NANP (The North American Numbering Plan) telephone numbers by removing 
  ///   punctuation and the country code (1), if present.
  /// </summary>
  IPhoneNumber = interface
    /// <returns>
    ///   cleaned telephone number
    /// </returns>
    function Clean: String;

    /// <returns>
    ///   area code
    /// </returns>
    function Area: String;

    /// <returns>
    ///   exchange code
    /// </returns>
    function Exchange: String;

    /// <returns>
    ///   telephone number formatted as below
    ///   "(area_code) exchange_code-subscriber_code" 
    /// </returns>
    function ToString: String;
  end;

/// <summary>
///   Function that returns an instance of IPhoneNumber.  
/// </summary>
function NewPhoneNumber(const phone_number: String): IPhoneNumber;

implementation
uses
  System.Character,
  System.SysUtils;

{$REGION 'TPhoneNumber'}
type
  TPhoneNumber = class(TInterfacedObject, IPhoneNumber)
    private
      FClean: String;
      FArea: String;
      FExchange: String;
      FToString: String;
      FSubscriber: String;
    public
      constructor Create(const phone_number: String);
      function Clean: String;
      function Area: String;
      function Exchange: String;
      function ToString: String; override;
  end;

constructor TPhoneNumber.Create(const phone_number: String);
var
  c: Char;
  builder: TStringBuilder;
  len: Integer;
begin
  builder := TStringBuilder.Create;
  try
    for c in phone_number do
      if c.IsDigit then
        builder.Append(c);
        
    len := builder.Length;
    if (len < 10) or (len > 11) then begin
      builder.Clear;
      Exit;
    end
    // removing the country code (1) if present.
    else if (len = 11) then begin
      if (builder.Chars[0] = '1') then
        builder.Remove(0, 1)
      else begin
        builder.Clear;
        Exit;
      end;
    end;

    // The format is usually represented as
    // (NXX)-NXX-XXXX
    // where N is any digit from 2 through 9 and X is any digit from 0 through 9.
    if (builder.Chars[0] <= '1') or (builder.Chars[3] <= '1') then
      builder.Clear;
  finally
    FClean := builder.ToString;
    if FClean <> '' then begin
      // first 3 digits
      FArea := builder.Chars[0] + builder.Chars[1] + builder.Chars[2];

      // 3 digits in the middle
      FExchange := builder.Chars[3] + builder.Chars[4] + builder.Chars[5];

      // last 4 digits
      FSubscriber := builder.Chars[6] + builder.Chars[7] + builder.Chars[8] + builder.Chars[9];
      
      FToString := Format('(%s) %s-%s',[FArea, FExchange, FSubscriber]);
    end;
    builder.Free;
  end;
end;

function TPhoneNumber.Clean: String;
begin
  Result := FClean;
end;

function TPhoneNumber.Area: String;
begin
  Result := FArea;
end;

function TPhoneNumber.Exchange: String;
begin
  Result := FExchange;
end;

function TPhoneNumber.ToString: String;
begin
  Result := FToString;
end;
{$ENDREGION}

function NewPhoneNumber(const phone_number: String): IPhoneNumber;
begin
  Result := TPhoneNumber.Create(phone_number);
end;
end.
