unit retangulo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, windows;

type

  Tconjunto = record
   x1, y1, x2, y2: Integer;
  end;

  { Tretangulo }

  Tretangulo = class
  private
    FcolorB: Integer;
    FcolorG: Integer;
    FcolorR: Integer;
    Frect: TRect;
    FRegion: HRGN;
    Fx1: Integer;
    Fx2: Integer;
    Fy1: Integer;
    Fy2: Integer;
    procedure SetcolorB(AValue: Integer);
    procedure SetcolorG(AValue: Integer);
    procedure SetcolorR(AValue: Integer);
    procedure Setrect(AValue: TRect);
    procedure SetRegion(AValue: HRGN);
    procedure Setx1(AValue: Integer);
    procedure Setx2(AValue: Integer);
    procedure Sety1(AValue: Integer);
    procedure Sety2(AValue: Integer);
    public

      property colorR: Integer read FcolorR write SetcolorR;
      property colorG: Integer read FcolorG write SetcolorG;
      property colorB: Integer read FcolorB write SetcolorB;
      property x1: Integer read Fx1 write Setx1;
      property y1: Integer read Fy1 write Sety1;
      property x2: Integer read Fx2 write Setx2;
      property y2: Integer read Fy2 write Sety2;
      property Region: HRGN read FRegion write SetRegion;
      property rect: TRect read Frect write Setrect;


  end;


implementation


{ Tretangulo }

procedure Tretangulo.SetcolorB(AValue: Integer);
begin
  if FcolorB=AValue then Exit;
  FcolorB:=AValue;
end;

procedure Tretangulo.SetcolorG(AValue: Integer);
begin
  if FcolorG=AValue then Exit;
  FcolorG:=AValue;
end;

procedure Tretangulo.SetcolorR(AValue: Integer);
begin
  if FcolorR=AValue then Exit;
  FcolorR:=AValue;
end;

procedure Tretangulo.Setrect(AValue: TRect);
begin
  if Frect=AValue then Exit;
  Frect:=AValue;
end;

procedure Tretangulo.SetRegion(AValue: HRGN);
begin
  if FRegion=AValue then Exit;
  FRegion:=AValue;
end;

procedure Tretangulo.Setx1(AValue: Integer);
begin
  if Fx1=AValue then Exit;
  Fx1:=AValue;
end;

procedure Tretangulo.Setx2(AValue: Integer);
begin
  if Fx2=AValue then Exit;
  Fx2:=AValue;
end;

procedure Tretangulo.Sety1(AValue: Integer);
begin
  if Fy1=AValue then Exit;
  Fy1:=AValue;
end;

procedure Tretangulo.Sety2(AValue: Integer);
begin
  if Fy2=AValue then Exit;
  Fy2:=AValue;
end;

end.

