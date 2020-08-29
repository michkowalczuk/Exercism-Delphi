unit uGrains;

interface
type

  /// <summary>
  ///   The class that calculates the number of grains of wheat on a chessboard
  ///   given that the number on each square doubles.
  /// </summary>
  Grains = class
    const GRAINS_64 : UInt64 = 9223372036854775808;
    const GRAINS_TOTAL : UInt64 = 18446744073709551615;

    /// <summary>
    ///   Calculates how many grains were on a given square.
    /// </summary>
    /// <param name="n">
    ///   given square number
    /// </param>
    /// <returns>
    ///   the number of grains of wheat
    /// </returns>
    class function Square(const n : Integer) : UInt64;

    /// <summary>
    ///   Calculates the total number of grains on the chessboard.
    /// </summary>
    /// <returns>
    ///   the total number of grains
    /// </returns>
    class function Total : UInt64;
  end;

implementation
uses
  System.Math,
  System.SysUtils;

class function Grains.Square(const n : Integer) : UInt64;
begin
  if (n > 0) and (n < 63) then
    Result := Round(IntPower(2, n-1))
  else if (n = 64) then
    Result := GRAINS_64
  else
    raise ERangeError.Create('ERangeError');
end;

class function Grains.Total : UInt64;
begin
  Result := GRAINS_TOTAL ;
end;

end.

