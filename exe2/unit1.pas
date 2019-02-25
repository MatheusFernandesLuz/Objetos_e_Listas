unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    btMover: TButton;
    ButtonTeste: TButton;
    EditTeste: TEdit;
    LabelTeste: TLabel;
    procedure btMoverClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btMoverClick(Sender: TObject);
var
  form: TForm2;
begin

  try
    form:= TForm2.Create(nil);

    form.EditTeste2.Parent:= Self;
    form.ButtonTeste2.Parent:= Self;
    form.LabelTeste2.Parent:= Self;

    EditTeste.Parent:= form;
    ButtonTeste.Parent:= form;
    LabelTeste.Parent:= form;

    form.ShowModal;
  finally
    form.Free;
  end;

end;

end.

