unit uServicoContrato;

interface

type IServicoContrato = interface
  function ValidaDocumento(Documento: string): Boolean;
  procedure ListarDados;
  function TipoContato: string;
end;

implementation

end.
