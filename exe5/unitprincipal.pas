unit unitprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

  { TForm2 }

  TForm2 = class(TForm)
  private

  public

  end;

var
  Form1: TForm1;
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2:= TForm2.Create(Application);
  Form2.Show;

end;

end.

