unit uMeetup;

interface
type
  /// <summary>
  ///   The part of the week
  /// </summary>
  TWeekDescriptor = (First=1, Second, Third, Fourth, Fifth, Teenth, Last);

  /// <summary>
  ///   The day of the week
  /// </summary>
  TWeekDay = (Monday=1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);

  /// <summary>
  ///   The class for calculating the date of meetup
  /// </summary>
  TMeetup = class
    public
      /// <summary>
      ///   Calculate the date of meetup
      /// </summary>
      /// <param name="year">
      ///   given year
      /// </param>
      /// <param name="month">
      ///   given month
      /// </param>
      /// <param name="weekDescriptor">
      ///   given week descriptor
      /// </param>
      /// <param name="weekDay">
      ///   given day
      /// </param>
      class function Meetup(
        const year: Integer;
        const month: Integer;
        const weekDescriptor: TWeekDescriptor ;
        const weekDay: TWeekDay
      ): String;
    end;

implementation
uses
  System.DateUtils,
  System.SysUtils;

  class function TMeetup.Meetup(
  const year: Integer;
  const month: Integer;
  const weekDescriptor: TWeekDescriptor;
  const weekDay: TWeekDay
): String;
var
  d, d_first: TDateTime;
  delta: Integer;
begin
  case weekDescriptor of
    TWeekDescriptor.Teenth:
      begin
        d := EncodeDate(year, month, 13);
        delta := Ord(weekDay) - DayOfTheWeek(d) ;
        if delta < 0 then
          Inc( delta, 7);
        d := IncDay(d, delta);
      end;
    TWeekDescriptor.Last:
      begin
        d := EndOfAMonth( year, month);
        delta := Ord(weekDay) - DayOfTheWeek(d);
        if delta > 0 then
          Dec(delta, 7);
        d := IncDay(d, delta);
      end;
    else
      begin
        d_first := EncodeDate(year, month, 1);
        d := EncodeDateMonthWeek(year, month, Ord(weekDescriptor), Ord(weekDay));

        // specific operation of the EncodeDateMonthWeek function
        if DayOfTheWeek(d_first) >= 5 then
          d := IncDay(d, -7);

        if DayOfTheWeek(d_first) > Ord(weekDay) then
          d := IncDay(d, 7);
      end;
    end;
  DateTimeToString(Result, 'yyyy-mm-dd', d);
end;
end.
