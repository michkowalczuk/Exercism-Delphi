unit uCollatzconjecture;

interface
uses
  System.Sysutils ;

type
  EIllegalNumber = class( Exception ) ;

/// <summary>
///   Given a positive number n, return the number of steps required to reach 1
///   in the Collatz Conjecture problem.
/// </summary>
/// <param name="n">
///   given number
/// </param>
/// <returns>
///   collatz steps
/// </returns>
function collatzSteps(n: Integer): Integer ;

implementation

function collatzSteps(n: Integer): Integer ;
const
  ERR_MSG = 'error: Only positive numbers are allowed';
begin
  if n = 0 then
    raise EIllegalNumber.Create(ERR_MSG)
  else if n < 0 then
    raise EIllegalNumber.Create(ERR_MSG);

  Result := 0;
  while n <> 1 do begin
    Inc(Result);
    if (n mod 2 = 0) then
      n := n div 2
    else
      n := 3 * n + 1;
  end;
end;

end.
