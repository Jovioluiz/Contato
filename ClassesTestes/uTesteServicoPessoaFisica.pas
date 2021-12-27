unit uTesteServicoPessoaFisica;

interface

uses
  DUnitX.TestFramework, uServicoContatoFisica;

type
  [TestFixture]
  TTesteServicoContatoFisica = class
  private
    FServicoContatoFisica: TServicoContatoFisica;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Sample Methods
    // Simple single Test
    // Test with TestCase Attribute to supply parameters.
    [Test]
    procedure ValidaDocumento(const AValue1 : string);
    [Test]
    procedure TipoContato;
  end;

implementation

procedure TTesteServicoContatoFisica.Setup;
begin
  FServicoContatoFisica := TServicoContatoFisica.Create;
end;

procedure TTesteServicoContatoFisica.TearDown;
begin
  FServicoContatoFisica.Free;
end;

procedure TTesteServicoContatoFisica.TipoContato;
var
  tipo: string;
begin
  tipo := FServicoContatoFisica.TipoContato;

  Assert.IsTrue(tipo = 'F', 'contato não é pessoa fisica');
end;

procedure TTesteServicoContatoFisica.ValidaDocumento(const AValue1 : string);
var
  isOk: Boolean;
begin
  isOk := FServicoContatoFisica.ValidaDocumento('12345654515');

  Assert.IsTrue(isOk, 'O documento deve ser diferente de vazio e possuir 11 digitos');
end;

initialization
  TDUnitX.RegisterTestFixture(TTesteServicoContatoFisica);

end.
