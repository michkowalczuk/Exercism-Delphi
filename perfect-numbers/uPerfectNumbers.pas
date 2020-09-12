unit uPerfectNumbers;

interface
uses
  System.Sysutils;

  type
  TCategory = (Deficient, Perfect, Abundant);
  /// <summary>
  ///   Class for performing classification of numbers based on Nicomachus'\
  ///   (60 - 120 CE) classification scheme for natural numbers.
  /// </summary>
  PerfectNumber = class
    public
      /// <summary>
      ///   Determine if a number is perfect, abundant, or deficient.
      /// </summary>
      /// <param name="number">
      ///   given natural number
      /// </param>
      /// <returns>
      ///   category of the number
      /// </returns>
      class function Classify(const number : Integer) : TCategory;
  end;

  ENotNaturalNumber = class( Exception ) ;

implementation

uses
  System.Math;

class function PerfectNumber.Classify(const number : Integer) : TCategory;
var
  i : Integer ;
  aliquot_sum : Integer ;
begin
  aliquot_sum := 0 ;

  if number <= 0 then
    raise ENotNaturalNumber.Create(
      'Classification is only possible for natural numbers.');

  if number <= 2 then
    Exit(Deficient) ;

  for i := 1 to (number div 2) do
    if number mod i = 0 then
      Inc(aliquot_sum, i);

  if aliquot_sum < number then
    Result := Deficient
  else if aliquot_sum = number then
    Result := Perfect
  else
    Result := Abundant;
end;

end.
