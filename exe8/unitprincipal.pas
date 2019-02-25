unit unitprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, Circulo;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    L: TList;
    C: Tcirculo;
  public

  end;


var
  Form1: TForm1;
  L: TList;
  i: Integer;


implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

   if L = nil then
   begin
     L:= TList.Create;
   end;

   if L.Count = 20 then
   begin

     Canvas.Brush.Color:=clDefault;
     Canvas.Pen.Color:= Brush.Color;
     Canvas.Ellipse(Tcirculo(L[0]).retangulo);
     L.Delete(0);

     for i:=0 to 18 do
     begin
      Canvas.Brush.Color:= RGBToColor(Tcirculo(L[i]).R, Tcirculo(L[i]).G, Tcirculo(L[i]).B);
      Canvas.Pen.Color:=clDefault;
      Canvas.Ellipse(Tcirculo(L[i]).retangulo);
     end;

   end;

   C:= Tcirculo.Create;


   C.R:= trunc(Random*255);
   C.G:= trunc(Random*255);
   C.B:= trunc(Random*255);

   C.size:= trunc(10+Random(30));

   C.retangulo:= Trect.Create(x-C.size, y-C.size, x+C.size, y+C.size);

   L.Add(C);

   Canvas.Brush.Color:= RGBToColor(C.R, C.G, C.B);
   Canvas.Ellipse(C.retangulo);

end;

end.

