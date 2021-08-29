unit uServicoContatoFisica;

interface

uses
  uServicoContrato;

type TServicoContatoFisica = class(TInterfacedObject, IServicoContrato)
  public
    function ValidaDocumento(Documento: string): Boolean;
    procedure ListarDados;
    function TipoContato: string;
end;

implementation

{ TServicoContatoFisica }

procedure TServicoContatoFisica.ListarDados;
begin

end;

function TServicoContatoFisica.TipoContato: string;
begin
  Result := 'F';
end;

function TServicoContatoFisica.ValidaDocumento(Documento: string): Boolean;
begin
  Result := not (Documento = '') or (Length(Documento) <> 11);
end;

end.
