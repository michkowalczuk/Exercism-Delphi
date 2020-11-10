unit uGigasecond;

interface
type

  /// <summary>
  ///   The class for adding a gigasecond to a moment.
  /// </summary>
  TGigasecond = class

    /// <summary>
    ///   Given a moment, determine the moment that would be after a gigasecond
    ///   has passed.
    /// </summary>
    /// <param name="moment">
    ///   given a moment as a string
    /// </param>
    /// <returns>
    ///   the moment that would be after a gigasecond as a string
    /// </returns>
    /// <remarks>
    ///   A gigasecond is 10^9 (1,000,000,000) seconds.
    /// </remarks>
    class function Add(const moment : String) : String;

  end;

implementation
uses
  System.DateUtils,
  System.SysUtils;

class function TGigasecond.Add(const moment : String) : String;
const
  GIGASECOND = 1000000000;
var
  datetime : TDateTime ;
begin
  datetime := ISO8601ToDate(moment) ;
  Result := DateToISO8601(IncSecond(datetime, GIGASECOND)).Split(['.'])[0];
end;

end.

