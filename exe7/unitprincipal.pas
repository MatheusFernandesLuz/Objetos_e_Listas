unit unitprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

function EntraTextoDlg(titulo,rotulo: String; var textRef: String): Boolean;
var
  form: TForm;
  label_rotulo: TLabel;
  btnOk, btnCancel: TButton;
  editor: TEdit;
begin

  //Criando form
  form:= TForm.Create(nil);
  form.Name:= titulo;
  form.Position:= poScreenCenter;

  //Carregando componentes
  label_rotulo:= TLabel.Create(nil);
  label_rotulo.Parent:= form;
  label_rotulo.Caption:= rotulo;
  label_rotulo.SetBounds(30,20,200,15);

  editor:= TEdit.Create(nil);
  editor.Parent:= form;
  editor.SetBounds(30,label_rotulo.Top+20,form.Width-60,20);
  editor.text:=textRef;
  editor.Visible:=true;

  btnOk:= TButton.Create(nil);
  btnOk.Parent:= form;
  btnOk.SetBounds(form.Width-90, form.Height-55, 60, 25);
  btnOk.Caption:='OK';
  btnOk.Visible:=true;

  btnCancel:= TButton.Create(nil);
  btnCancel.Parent:= form;
  btnCancel.SetBounds(btnOk.Left-75, btnOk.Top, 60, 25);
  btnCancel.Caption:='Cancelar';
  btnCancel.Visible:=true;

  //Aplicando eventos aos botões
  btnOk.ModalResult:= mrOK;
  btnCancel.ModalResult:= mrCancel;

  //Valor padrão para a function
  result:= false;


  try

    if form.ShowModal = mrOK then
     begin
      textRef:=editor.Text;
      Result:= True;
     end;

  finally
    form.Free;
  end;


end;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  ref: String;
  result: Boolean;
begin
  ref:= Edit3.Text;
  result:= EntraTextoDlg(Edit1.Text, Edit2.Text, ref);

  if result = true then
   begin
    ShowMessage('true = ' + ref);
   end
  else
   ShowMessage('false = ' + ref);


end;

end.

