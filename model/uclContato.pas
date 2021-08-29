unit uclContato;

interface

type TContato = class
  private
    FCPF_CNPJ: string;
    FID: Integer;
    FNome: String;
    FCidade: string;
    FEndereco: string;
    FData: TDate;
    FTipoContato: string;
    procedure SetCidade(const Value: string);
    procedure SetCPF_CNPJ(const Value: string);
    procedure SetData(const Value: TDate);
    procedure SetEndereco(const Value: string);
    procedure SetID(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetTipoContato(const Value: string);

  public

    property ID: Integer read FID write SetID;
    property Nome: String read FNome write SetNome;
    property CPF_CNPJ: string read FCPF_CNPJ write SetCPF_CNPJ;
    property Endereco: string read FEndereco write SetEndereco;
    property Cidade: string read FCidade write SetCidade;
    property Data: TDate read FData write SetData;
    property TipoContato: string read FTipoContato write SetTipoContato;
end;

implementation

{ TContato }

procedure TContato.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TContato.SetCPF_CNPJ(const Value: string);
begin
  FCPF_CNPJ := Value;
end;

procedure TContato.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TContato.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TContato.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TContato.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TContato.SetTipoContato(const Value: string);
begin
  FTipoContato := Value;
end;

end.
