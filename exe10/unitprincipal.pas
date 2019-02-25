unit unitprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, windows, LCLIntf, retangulo;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    Timer: TTimer;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerTimer(Sender: TObject);
  private

  public

  end;

var
  FormPrincipal: TFormPrincipal;
  L: TList;

implementation

procedure GerarTamanho(ret: Tretangulo);
var
  x1, y1, x2, y2: Integer;
begin

  x1:= trunc(Random*FormPrincipal.Width);
  y1:= trunc(Random*FormPrincipal.Height);

  x2:= x1 + trunc(10+Random(200));
  y2:= y1 + trunc(10+Random(200));

  ret.x1:= x1;
  ret.y1:= y1;
  ret.x2:= x2;
  ret.y2:= y2;

  ret.Region:= CreateRectRgn(ret.x1, ret.y1, ret.x2, ret.y2);
  ret.rect:= TRect.Create(ret.x1, ret.y1, ret.x2, ret.y2);

end;

procedure excluirRetangulo(i: Integer);
begin
  FormPrincipal.Canvas.Brush.Color:=clDefault;
  FormPrincipal.Canvas.Rectangle(Tretangulo(L[i]).rect);
  L.Delete(i);
end;

{$R *.lfm}

{ TFormPrincipal }


procedure TFormPrincipal.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i: Integer;
begin

  for i:=0 to (L.Count-1) do
  begin
    if PtInRegion(Tretangulo(L[i]).Region, x, y) then
    begin
     excluirRetangulo(i);
     break;
    end;
  end;

end;

procedure TFormPrincipal.TimerTimer(Sender: TObject);
var
  R: Tretangulo;
  i: Integer;
  verifica: Boolean;
begin


  //Cria a lista
  if L = nil then
   L:= TList.Create;


  //Conta a quantidade de retangulos
  if (L.Count) = 20 then
  begin
   excluirRetangulo(0);
  end;

  //Cria e define o retangulo
  R:= Tretangulo.Create;

  R.colorR:= trunc(Random*255);
  R.colorG:= trunc(Random*255);
  R.colorB:= trunc(Random*255);
  GerarTamanho(R);

  //VERIFICAÇÃO

  verifica:= true;

  while (verifica = true) and (L.Count > 1) do
  begin
    for i:=0 to (L.Count-1) do
    begin
      if RectInRegion(R.Region, Tretangulo(L[i]).rect) then
      begin
       DeleteObject(R.Region);
       GerarTamanho(R);
       break;
      end
      else if (i = L.Count - 1) then
       verifica:= false;
    end;
  end;

   Canvas.Pen.Style:= psClear;
   Canvas.Brush.Color:= RGB(R.colorR, R.colorG, R.colorB);
   Canvas.Rectangle(R.x1, R.y1, R.x2, R.y2);
   L.Add(R);

end;



end.

