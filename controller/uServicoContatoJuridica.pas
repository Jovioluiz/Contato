unit uServicoContatoJuridica;

interface

uses
  uServicoContato;

type TServicoContatoJuridica = class(TInterfacedObject, IServicoContato)
  public
    function ValidaDocumento(Documento: string): Boolean;
    function TipoContato: string;
end;

implementation

{ TServicoContatoJuridica }

function TServicoContatoJuridica.TipoContato: string;
begin
  Result := 'J';
end;

function TServicoContatoJuridica.ValidaDocumento(Documento: string): Boolean;
begin
  Result := not (Documento = '') or (Length(Documento) <> 14);
end;

end.
