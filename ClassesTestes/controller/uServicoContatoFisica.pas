unit uServicoContatoFisica;

interface

uses
  uServicoContato;

type TServicoContatoFisica = class(TInterfacedObject, IServicoContato)
  public
    function ValidaDocumento(Documento: string): Boolean;
    function TipoContato: string;
end;

implementation

{ TServicoContatoFisica }

function TServicoContatoFisica.TipoContato: string;
begin
  Result := 'F';
end;

function TServicoContatoFisica.ValidaDocumento(Documento: string): Boolean;
begin
  Result := not (Documento = '') or (Length(Documento) <> 11);
end;

end.
