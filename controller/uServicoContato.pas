unit uServicoContato;

interface

type IServicoContato = interface
  function ValidaDocumento(Documento: string): Boolean;
  function TipoContato: string;
end;

implementation

end.
