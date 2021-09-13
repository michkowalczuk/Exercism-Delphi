unit uResistorColor;

interface

type
  /// <summary>
  ///   Helper class for simple encoding color maps to a single number
  /// </summary>
  TResistor = class
    public
      /// <summary>
      ///   Convert color band to a number.
      /// </summary>
      /// <param name="colorName">
      ///   color band name
      /// </param>
      /// <returns>
      ///   value of the band
      /// </returns>
      class function colorCode(const colorName: String): Integer;

      /// <summary>
      ///   List all band colors.
      /// </summary>
      /// <returns>
      ///   array of all band color names
      /// </returns>
      class function colors : TArray<String>;
  end;

implementation

uses
  System.StrUtils;

const
  RESISTOR_COLORS : TArray<String> = [
    'black', 'brown', 'red', 'orange', 'yellow',
    'green', 'blue', 'violet', 'grey', 'white'
  ];

class function TResistor.colorCode(const colorName: String  ): Integer;
begin
  Result := IndexText(colorName, RESISTOR_COLORS);
end;

class function TResistor.colors : TArray<String>;
begin
  Result := RESISTOR_COLORS;
end;

end.
