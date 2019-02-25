unit unitPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, unit2;

type

  { TFormExe1 }

  TFormExe1 = class(TForm)
    btMover: TButton;
    btTeste: TButton;
    EditTeste: TEdit;
    LabelTeste: TLabel;
    procedure btMoverClick(Sender: TObject);
  private

  public

  end;

var
  FormExe1: TFormExe1;

implementation

{$R *.lfm}

{ TFormExe1 }

procedure TFormExe1.btMoverClick(Sender: TObject);
var
  form: TForm2;
begin

  try
    //Criar form
    form:= TForm2.Create(nil);

    //Mover componentes
    btTeste.Parent:= form;
    LabelTeste.Parent:= form;
    EditTeste.Parent:= form;

    //Exibir Form
    form.ShowModal;

  finally
    form.Free;
  end;

end;

end.

