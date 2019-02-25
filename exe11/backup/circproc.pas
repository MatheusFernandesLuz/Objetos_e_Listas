unit CircProc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, windows, circulo;


public

procedure GeraRegiao(circulo: TCirculo; painel: TPanel);
procedure pintaCirculo(circulo: TCirculo; painel: TPanel);

implementation

procedure GeraRegiao(circulo: TCirculo; painel: TPanel);
var
  x1, y1, x2, y2: Integer;
begin

  x1:= trunc(Random*painel.Width-200);
  y1:= trunc(Random*painel.Height-200);
  x2:= x1 + 50;
  y2:= y1 + 50;

  circulo.x1:=x1;
  circulo.y1:=y1;
  circulo.x2:=x2;
  circulo.y2:=y2;
  circulo.size:= TRect.Create(x1,y1,x2,y2);
  circulo.region:= CreateRectRgnIndirect(circulo.size);

end;

procedure pintaCirculo(circulo: TCirculo; painel: TPanel);
begin
  circulo.colorR:= trunc(Random*255);
  circulo.colorG:= trunc(Random*255);
  circulo.colorB:= trunc(Random*255);

  painel.Canvas.Brush.Color:=RGB(circulo.colorR, circulo.colorG, circulo.colorB);
  painel.Canvas.Pen.Style:=psClear;
  painel.Canvas.Ellipse(circulo.size);

  painel.Font.Color:=clBlack;
  painel.Font.Name:='Arial';
  painel.Font.Size:=30;
  painel.Canvas.TextOut(trunc(circulo.size.Width/2), circulo.y1, circulo.letra);
end;

end.

