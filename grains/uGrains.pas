unit uGrains;

interface
type

  /// <summary>
  ///   The class that calculates the number of grains of wheat on a chessboard
  ///   given that the number on each square doubles.
  /// </summary>
  Grains = class

    // <summary>
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
  System.SysUtils;

class function Grains.Square(const n : Integer) : UInt64;
begin
  if (n > 0) and (n <= 64) then
    Result := Uint64(1) shl (n-1)
  else
    raise ERangeError.Create('ERangeError');
end;

class function Grains.Total : UInt64;
begin
  Result := 2 * Grains.Square(64) - 1;
end;

end.

