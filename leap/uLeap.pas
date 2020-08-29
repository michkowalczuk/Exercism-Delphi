unit uLeap;

interface

type
  TYear = class
  public
    /// <summary>
    /// Checks if a given year is a leap year.
    /// </summary>
    /// <param name="year">
    ///   a given year
    /// </param>
    /// <returns>
    ///   True, if a given year is a leap year
    /// </returns>
    class function IsLeap(const year : Integer) : Boolean ;
  end;

implementation

class function TYear.IsLeap(const year : Integer) : Boolean ;
begin
  Result :=
    ((year mod 4 = 0) and not (year mod 100 = 0)) or
    (year mod 400 = 0) ;
end;

end.
