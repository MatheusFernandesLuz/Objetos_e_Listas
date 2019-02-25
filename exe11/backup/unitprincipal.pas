unit unitprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, windows, circulo;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private

  public

  end;

var
  FormPrincipal: TFormPrincipal;
  L: TList;
  acertos: Integer;

implementation

{$R *.lfm}

{ TFormPrincipal }

procedure perdeuVida();
var
  i: Integer;
begin
  for i:=0 to (L.Count-1) do
  begin
   if TCirculo(L[i]).y2 >= FormPrincipal.Height-20 then
    begin
      TCirculo(L[i]).DestruirCirculo(FormPrincipal);
      L.Remove(L[i]);
      Break;
    end;
  end;
end;

function VerificaColisao(circulo: TCirculo): Boolean;
var
  i: Integer;
begin

  VerificaColisao:= true;

  while (VerificaColisao = true) and (L.Count > 1) do
  begin
   for i:=0 to (L.Count-1) do
   begin
    if RectInRegion(TCirculo(L[i]).region, circulo.size) then
    begin
     DeleteObject(circulo.region);
     circulo.geraRegiao(FormPrincipal);
     break;
    end
    else if (i = L.Count-1) then
     VerificaColisao:= false;
   end;
  end;

  VerificaColisao:=false;

end;

procedure CriarCirculo();
var
  circulo: TCirculo;
begin
  circulo:= TCirculo.Create;

  circulo.geraRegiao(FormPrincipal);
  circulo.geraCores();
  circulo.geraLetra();

  if VerificaColisao(circulo) = false then
  begin
   circulo.PintaCirculo(FormPrincipal);
   L.Add(circulo);
  end;

end;

procedure RepintaCirculos(form: TForm);
var
  i: Integer;
begin
  form.Canvas.Brush.Color:=clDefault;
  form.Canvas.FillRect(0,0,form.Width, form.Height-20);

  for i:=0 to (L.Count-1) do
  begin
    form.Canvas.Brush.Style:=bsClear;
    form.Canvas.Ellipse(TCirculo(L[i]).size);
    TCirculo(L[i]).AtualizaCirculo();
    TCirculo(L[i]).PintaCirculo(form);
  end;

end;

procedure verificaTecla(tecla: char);
var
  i: Integer;
begin

  for i:=0 to L.Count-1 do
  begin
   if (TCirculo(L[i]).letra = UpperCase(tecla)) then
   begin
    TCirculo(L[i]).DestruirCirculo(FormPrincipal);
    L.Remove(L[i]);
    inc(acertos,1);
    Break;
   end;
  end;

end;

procedure TFormPrincipal.FormPaint(Sender: TObject);
begin
   Canvas.Brush.Color:=clBlack;
   Canvas.FillRect(0,FormPrincipal.Height, FormPrincipal.Width, FormPrincipal.Height-20);
end;

procedure TFormPrincipal.Timer1Timer(Sender: TObject);
begin
  CriarCirculo();
end;

procedure TFormPrincipal.Timer2Timer(Sender: TObject);
begin
  RepintaCirculos(FormPrincipal);
  perdeuVida();

  if acertos >= 10 then
  begin
   Dec(Integer(Timer1.Interval),50);
   acertos:=0;
  end;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  if L = nil then L:= TList.Create;
end;

procedure TFormPrincipal.FormKeyPress(Sender: TObject; var Key: char);
begin
  if L.Count >= 1 then verificaTecla(key);
end;


end.


















































