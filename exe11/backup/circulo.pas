unit circulo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, windows;

type

    { TCirculo }

    TCirculo = class
    private
      FcolorB: Integer;
      FcolorG: Integer;
      FcolorR: Integer;
      Fletra: char;
      Fregion: HRGN;
      Fsize: TRect;
      Fx1: Integer;
      Fx2: Integer;
      Fy1: Integer;
      Fy2: Integer;
      procedure SetcolorB(AValue: Integer);
      procedure SetcolorG(AValue: Integer);
      procedure SetcolorR(AValue: Integer);
      procedure Setletra(AValue: char);
      procedure Setregion(AValue: HRGN);
      procedure Setsize(AValue: TRect);
      procedure Setx1(AValue: Integer);
      procedure Setx2(AValue: Integer);
      procedure Sety1(AValue: Integer);
      procedure Sety2(AValue: Integer);
      public

        property colorR: Integer read FcolorR write SetcolorR;
        property colorG: Integer read FcolorG write SetcolorG;
        property colorB: Integer read FcolorB write SetcolorB;
        property size: TRect read Fsize write Setsize;
        property region: HRGN read Fregion write Setregion;
        property x1: Integer read Fx1 write Setx1;
        property y1: Integer read Fy1 write Sety1;
        property x2: Integer read Fx2 write Setx2;
        property y2: Integer read Fy2 write Sety2;
        property letra: char read Fletra write Setletra;

        procedure geraRegiao(form: TForm);
        procedure geraCores();
        procedure geraLetra();
        procedure PintaCirculo(form: TForm);
        procedure AtualizaCirculo();
        procedure DestruirCirculo(form: TForm);

    end;

implementation

{ TCirculo }

procedure TCirculo.SetcolorB(AValue: Integer);
begin
  if FcolorB=AValue then Exit;
  FcolorB:=AValue;
end;

procedure TCirculo.SetcolorG(AValue: Integer);
begin
  if FcolorG=AValue then
   Exit;
  FcolorG:=AValue;
end;

procedure TCirculo.SetcolorR(AValue: Integer);
begin
  if FcolorR=AValue then Exit;
  FcolorR:=AValue;
end;

procedure TCirculo.Setletra(AValue: char);
begin
  if Fletra=AValue then Exit;
  Fletra:=AValue;
end;

procedure TCirculo.Setregion(AValue: HRGN);
begin
  if Fregion=AValue then Exit;
  Fregion:=AValue;
end;

procedure TCirculo.Setsize(AValue: TRect);
begin
  if Fsize=AValue then Exit;
  Fsize:=AValue;
end;

procedure TCirculo.Setx1(AValue: Integer);
begin
  if Fx1=AValue then Exit;
  Fx1:=AValue;
end;

procedure TCirculo.Setx2(AValue: Integer);
begin
  if Fx2=AValue then Exit;
  Fx2:=AValue;
end;

procedure TCirculo.Sety1(AValue: Integer);
begin
  if Fy1=AValue then Exit;
  Fy1:=AValue;
end;

procedure TCirculo.Sety2(AValue: Integer);
begin
  if Fy2=AValue then Exit;
  Fy2:=AValue;
end;

procedure TCirculo.geraCores();
begin
  colorR:= Random(255);
  colorG:= Random(255);
  colorB:= Random(255);
end;

procedure TCirculo.geraLetra();
var
  texto: String;
begin
  texto:= 'ABCDEFGHIJKLMNOPQRSTUVXWYZ';
  letra:= texto[Random(Length(texto))+1];
end;

procedure TCirculo.geraRegiao(form: TForm);
begin
  x1:= 50+trunc(Random(form.Width-200));
  y1:= 0;
  x2:= x1 + 50;
  y2:= y1 + 50;

  size:= TRect.Create(x1, y1, x2, y2);
  region:= CreateEllipticRgnIndirect(size);
end;

procedure TCirculo.PintaCirculo(form: TForm);
begin
  form.Canvas.Brush.Color:=RGB(colorR, colorG, colorB);
  form.Canvas.Pen.Style:=psSolid;
  form.Canvas.Pen.Color:=clDefault;
  form.Canvas.Pen.Width:=1;
  form.Canvas.Ellipse(size);

  form.Font.Color:=clBlack;
  form.Font.Name:='Arial';
  form.Font.Style:=[fsBold];
  form.Font.Size:=15;
  SetTextAlign( form.Canvas.Handle, TA_CENTER );
  form.Canvas.TextOut(x2-trunc(size.Width/2), y2-trunc(size.Height/2)-8, letra);
end;

procedure TCirculo.AtualizaCirculo();
begin
  DeleteObject(region);
  y1:= y1+1;
  y2:= y2+1;
  size:= TRect.Create(x1, y1, x2, y2);
  region:= CreateEllipticRgnIndirect(size);
end;

procedure TCirculo.DestruirCirculo(form: TForm);
begin
  form.Canvas.Brush.Color:=clDefault;
  form.Canvas.Pen.Color:=clForm;
  form.Canvas.Ellipse(size);
  DeleteObject(region);
  self.Free;
end;

end.

