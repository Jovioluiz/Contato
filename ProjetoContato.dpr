program ProjetoContato;

uses
  Vcl.Forms,
  fPrincipal in 'view\fPrincipal.pas' {frmPrincipal},
  uServicoContrato in 'controller\uServicoContrato.pas',
  uServicoContatoFisica in 'controller\uServicoContatoFisica.pas',
  uServicoContatoJuridica in 'controller\uServicoContatoJuridica.pas',
  uManipuladorServicoContato in 'model\uManipuladorServicoContato.pas',
  fCadContato in 'view\fCadContato.pas' {cCadContato},
  uclContato in 'model\uclContato.pas',
  dtmConexao in 'model\dtmConexao.pas' {dmConexao: TDataModule},
  dtmDados in 'model\dtmDados.pas' {dmDados: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TcCadContato, cCadContato);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmDados, dmDados);
  Application.Run;
end.
