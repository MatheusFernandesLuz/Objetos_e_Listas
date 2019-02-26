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
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private

  public

  end;

var
  FormPrincipal: TFormPrincipal;
  L: TList;
  acertos: Integer;
  erros: Integer;

implementation

{$R *.lfm}

{ TFormPrincipal }

procedure perdeuVida();
var
  i: Integer;
begin
  for i:=0 to (L.Count-1) do
  begin
   if TCirculo(L[i]).y2 >= FormPrincipal.Height then
    begin
      TCirculo(L[i]).DestruirCirculo(FormPrincipal);
      L.Remove(L[i]);
      Inc(erros, 1);
      Break;
    end;
  end;
end;

function VerificaColisao(circulo: TCirculo): Boolean;
var
  i: Integer;
begin

  VerificaColisao:= true;

  while (VerificaColisao = true) and (L.Count > 0) do
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

  for i:=0 to (L.Count-1) do
  begin
    form.Canvas.Brush.Color:=clform;
    form.Canvas.Pen.Color:=clForm;
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

procedure TFormPrincipal.Timer1Timer(Sender: TObject);
begin
  CriarCirculo();

  if (acertos >= 10) and (Timer1.Interval >= 100) then
  begin
   Timer1.Interval:= Timer1.Interval-50;
   Timer2.Interval:= Timer2.Interval-10;
   acertos:= 0;
  end;

  if erros >= 5 then
  begin
   Timer1.Enabled:=false;
   Timer2.Enabled:=false;
   ShowMessage('GAME OVER');
  end;
end;

procedure TFormPrincipal.Timer2Timer(Sender: TObject);
begin
  RepintaCirculos(FormPrincipal);
  perdeuVida();
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


















































