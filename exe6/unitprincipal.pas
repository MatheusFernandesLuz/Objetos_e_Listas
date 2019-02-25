unit unitprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    EditText: TEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function Confirma(text: String): Boolean;
var
  btnSim, btnNao: TButton;
  lbl: TLabel;
  form: TForm;
begin

  try
   form:= TForm.Create(nil);
   form.Width:=300;
   form.Height:=100;
   form.Position:=poScreenCenter;
   form.Caption:='Confirmação';

   lbl:= TLabel.Create(nil);
   lbl.Parent:= form;
   lbl.Caption:= text + '?';
   lbl.Left:=20;
   lbl.Top:=20;

   btnSim:= TButton.Create(nil);
   btnSim.Parent:= form;
   btnSim.Left:=20;
   btnSim.top:= lbl.Height+40;
   btnSim.Caption:= 'Sim';
   btnSim.Visible:=true;

   btnNao:= TButton.Create(nil);
   btnNao.Parent:= form;
   btnNao.Left:= btnSim.Width + 80;
   btnNao.Top:= lbl.Height+40;
   btnNao.Caption:='Não';
   btnNao.Visible:=true;

   btnSim.ModalResult:= mrOK;
   btnNao.ModalResult:= mrCancel;

   Result:= False;

   if form.ShowModal = mrOK then
    Result:= true;

  finally
   form.Free;
  end;


end;

procedure TForm1.Button1Click(Sender: TObject);
var
  result: Boolean;
begin
  result:= Confirma(EditText.Text);

  if result = true then
   ShowMessage('True')
   else
     ShowMessage('False');

end;

end.

