unit fCadContato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ExtCtrls, uclContato, StrUtils;

type
  TcCadContato = class(TForm)
    edtId: TEdit;
    edtNome: TEdit;
    edtEndereco: TEdit;
    edtCidade: TEdit;
    edtData: TDateTimePicker;
    edtCpfCnpj: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblCpfCnpj: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblData: TLabel;
    rbTipo: TRadioGroup;
    btnSalvar: TButton;
    procedure rbTipoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtIdChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FContato: TContato;
    procedure AlteraLabels;
    procedure Salvar;
    procedure LimparCampos;
    procedure PreencheDadosEdicaoContato;
  public
    { Public declarations }
    property Contato: TContato read FContato write FContato;
  end;

var
  cCadContato: TcCadContato;

implementation

uses
  uManipuladorServicoContato, uServicoContatoFisica, uServicoContatoJuridica;

{$R *.dfm}

procedure TcCadContato.AlteraLabels;
begin
  if rbTipo.ItemIndex = 0 then
  begin
    lblCpfCnpj.Caption := 'CPF';
    lblData.Caption := 'Data Nasc.';
  end
  else
  begin
    lblCpfCnpj.Caption := 'CNPJ';
    lblData.Caption := 'Data Fund.';
  end;
end;

procedure TcCadContato.btnSalvarClick(Sender: TObject);
begin
  Salvar;
  LimparCampos;
end;

procedure TcCadContato.edtIdChange(Sender: TObject);
var
  manipuladorContato: TManipuladorServicoContato;
begin
  if edtId.Text <> '' then
    Exit;

  manipuladorContato := TManipuladorServicoContato.Create;

  try
    edtId.Text := manipuladorContato.GeraIDContato.ToString;
  finally
    manipuladorContato.Free;
  end;
end;

procedure TcCadContato.FormShow(Sender: TObject);
begin
  PreencheDadosEdicaoContato;
end;

procedure TcCadContato.LimparCampos;
begin
  edtId.Clear;
  edtNome.Clear;
  edtEndereco.Clear;
  edtCidade.Clear;
  edtData.Date := Now;
  rbTipo.ItemIndex := 0;
end;

procedure TcCadContato.PreencheDadosEdicaoContato;
begin
  edtId.Text := FContato.ID.ToString;
  edtNome.Text := FContato.Nome;
  edtEndereco.Text := FContato.Endereco;
  edtCpfCnpj.Text := FContato.CPF_CNPJ;
  edtCidade.Text := FContato.Cidade;
  edtData.Date := FContato.Data;

  case AnsiIndexStr(FContato.TipoContato, ['F', 'J'])  of
    0: rbTipo.ItemIndex := 0;
    1: rbTipo.ItemIndex := 1;
  end;
end;

procedure TcCadContato.rbTipoClick(Sender: TObject);
begin
  AlteraLabels;
end;

procedure TcCadContato.Salvar;
var
  manipuladorContato: TManipuladorServicoContato;
  dados: TContato;
begin
  manipuladorContato := nil;

  case rbTipo.ItemIndex of
    0: manipuladorContato := TManipuladorServicoContato.Create(TServicoContatoFisica.Create);
    1: manipuladorContato := TManipuladorServicoContato.Create(TServicoContatoJuridica.Create);
  end;

  dados := TContato.Create;

  try
    dados.ID := StrToInt(edtId.Text);
    dados.Nome := edtNome.Text;
    dados.CPF_CNPJ := edtCpfCnpj.Text;
    dados.Endereco := edtEndereco.Text;
    dados.Cidade := edtCidade.Text;
    dados.Data := edtData.Date;
    dados.TipoContato := manipuladorContato.FServico.TipoContato;

    manipuladorContato.SalvarContato(dados);
  finally
    manipuladorContato.Free;
    dados.Free;
  end;
end;

end.
