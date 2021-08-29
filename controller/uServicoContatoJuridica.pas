unit uServicoContatoJuridica;

interface

uses
  uServicoContrato;

type TServicoContatoJuridica = class(TInterfacedObject, IServicoContrato)
  public
    function ValidaDocumento(Documento: string): Boolean;
    procedure ListarDados;
    function TipoContato: string;
end;

implementation

{ TServicoContatoJuridica }

procedure TServicoContatoJuridica.ListarDados;
begin

end;

function TServicoContatoJuridica.TipoContato: string;
begin
  Result := 'J';
end;

function TServicoContatoJuridica.ValidaDocumento(Documento: string): Boolean;
begin
  Result := not (Documento = '') or (Length(Documento) <> 14);
end;

end.
