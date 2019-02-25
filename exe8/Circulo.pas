unit Circulo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { Tcirculo }

  Tcirculo = class
    private
      FB: Integer;
      FG: Integer;
      FR: Integer;
      Fretangulo: TRect;
      Fsize: Integer;
      procedure SetB(AValue: Integer);
      procedure SetG(AValue: Integer);
      procedure SetR(AValue: Integer);
      procedure Setretangulo(AValue: TRect);
      procedure Setsize(AValue: Integer);

    protected

    public

      property retangulo: TRect read Fretangulo write Setretangulo;
      property size: Integer read Fsize write Setsize;
      property R: Integer read FR write SetR;
      property G: Integer read FG write SetG;
      property B: Integer read FB write SetB;

    published
  end;

implementation

{ Tcirculo }

procedure Tcirculo.SetB(AValue: Integer);
begin
  if FB=AValue then Exit;
  FB:=AValue;
end;

procedure Tcirculo.SetG(AValue: Integer);
begin
  if FG=AValue then Exit;
  FG:=AValue;
end;

procedure Tcirculo.SetR(AValue: Integer);
begin
  if FR=AValue then Exit;
  FR:=AValue;
end;

procedure Tcirculo.Setretangulo(AValue: TRect);
begin
  if Fretangulo=AValue then Exit;
  Fretangulo:=AValue;
end;

procedure Tcirculo.Setsize(AValue: Integer);
begin
  if Fsize=AValue then Exit;
  Fsize:=AValue;
end;

end.

