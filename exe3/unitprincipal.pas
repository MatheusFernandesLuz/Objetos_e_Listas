unit unitprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btTrocar: TButton;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure btTrocarClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btTrocarClick(Sender: TObject);
begin
  Label1.Parent:= Panel2;
  Edit1.Parent:= Panel2;
  Button1.Parent:= Panel2;

  Label2.Parent:= Panel1;
  Edit2.Parent:= Panel1;
  Button2.Parent:= Panel1;
end;

end.

