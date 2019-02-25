unit unitregistro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

var
  rect: TRect;
  R, G, B: Integer;
  size: Integer;

implementation

procedure setRect(x1, y1, x2, y2: Integer);
begin
  rect:= TRect.Create(x1, y1, x2, y2);
end;

function getRect(): TRect;
begin
  Result:= rect;
end;

end.

