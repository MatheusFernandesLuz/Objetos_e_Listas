unit unitPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure mostrarMensagem(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  edit: TEdit;
  button: TButton;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.mostrarMensagem(Sender: TObject);
begin
  ShowMessage(edit.Text);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  //Criar Edit
  edit:= TEdit.Create(nil);
  edit.Parent:= Self;
  edit.Top:= 50;
  edit.Left:= 20;
  edit.Width:=200;
  edit.Visible:=true;

  //Criar Button
  button:= TButton.Create(nil);
  button.Parent:= Self;
  button.Top:= edit.Top;
  button.Left:= edit.Width+50;
  button.Width:=100;
  button.Caption:= 'Exibir Texto';
  button.Visible:=true;

  button.OnClick:= @mostrarMensagem;


end;


end.

