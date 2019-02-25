unit unitprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

  { TCliente }

  TCliente = class
    private
      Fsenha: String;
      Fusuario: String;
      procedure Setsenha(AValue: String);
      procedure Setusuario(AValue: String);

    protected

    public
      property usuario: String read Fusuario write Setusuario;
      property senha: String read Fsenha write Setsenha;
    published
  end;

  Tretorno = record
    verificacao: Boolean;
    cliente: TCliente;
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.lfm}

{ TCliente }

function Executa(): Tretorno;
var
  editPass, editUser: TEdit;
  lblUser, lblPass: TLabel;
  btnOk, btnCancel: TButton;
  form: TForm;
  bmp: TBitmap;
  imagem: TImage;
  open: TOpenDialog;
  cliente: TCliente;
begin

  //Criando form
  form:= TForm.Create(nil);
  form.Position:=poScreenCenter;
  form.Height:=300;

  //Seleciona Imagem
  imagem:= TImage.Create(nil);
  imagem.Parent:=form;
  imagem.Picture.LoadFromFile('img\login.bmp');
  imagem.SetBounds(30,50,50,50);
  imagem.Visible:=true;

  //carregando componentes
  lblUser:= TLabel.Create(nil);
  lblUser.Parent:= form;
  lblUser.SetBounds(30,100, 200, 15);
  lblUser.Caption:='Usuário:';
  lblUser.Visible:=true;

  editUser:= TEdit.Create(nil);
  editUser.Parent:= form;
  editUser.SetBounds(30, 120, form.Width-60, 20);
  editUser.Visible:=true;

  lblPass:= TLabel.Create(nil);
  lblPass.Parent:= form;
  lblPass.SetBounds(30,150, 200, 15);
  lblPass.Caption:='Senha:';
  lblPass.Visible:=true;

  editPass:= TEdit.Create(nil);
  editPass.Parent:= form;
  editPass.SetBounds(30, 170, form.Width-60, 20);
  editPass.Visible:=true;

  btnOk:= TButton.Create(nil);
  btnOk.Parent:= form;
  btnOk.SetBounds(form.Width-130, form.Height-55, 100, 25);
  btnOk.Caption:='OK';
  btnOk.Visible:=true;

  btnCancel:= TButton.Create(nil);
  btnCancel.Parent:= form;
  btnCancel.SetBounds(btnOk.Left-110, btnOk.Top, 100, 25);
  btnCancel.Caption:='Cancelar';
  btnCancel.Visible:=true;

  //Atribuindo eventos aos botões
  btnOk.ModalResult:=mrOK;
  btnCancel.ModalResult:=mrCancel;


  //Estanciando cliente
  cliente:= TCliente.Create;

  //verificação
  try
    if form.ShowModal = mrOK then
    begin
     cliente.Setusuario(editUser.Text);
     cliente.Setsenha(editPass.Text);
     Result.verificacao:=true;
     Result.cliente:=cliente;
    end
    else
    begin
     Result.verificacao:=false;
    end;
  finally
    form.Free;
  end;

end;

procedure TCliente.Setsenha(AValue: String);
begin
  if Fsenha=AValue then Exit;
  Fsenha:=AValue;
end;

procedure TCliente.Setusuario(AValue: String);
begin
  if Fusuario=AValue then Exit;
  Fusuario:=AValue;
end;

{ TFormPrincipal }

procedure TFormPrincipal.Button1Click(Sender: TObject);
var
  retorno: Tretorno;
begin

  retorno:= Executa();

   if retorno.verificacao = true then
    ShowMessage('True' + #13 + 'Usuário: ' + retorno.cliente.Fusuario
    + #13 + 'Senha: ' + retorno.cliente.senha)
   else
    ShowMessage('false');

end;


end.

