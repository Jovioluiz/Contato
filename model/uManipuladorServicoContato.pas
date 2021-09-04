unit uManipuladorServicoContato;

interface

uses
  uServicoContato, uclContato, Firedac.Comp.Client, Firedac.stan.Param,
  Data.DB, Firedac.DApt, dtmDados;

type TManipuladorServicoContato = class

  private
    FFServico: IServicoContato;
    FDados: TdmDados;
    procedure SetFServico(const Value: IServicoContato);
    function Pesquisar(ID: Integer): Boolean;
    procedure CarregaContatoEdicao(ID: Integer);
    procedure SetDados(const Value: TdmDados);

  public
    constructor Create(Contato: IServicoContato); overload;
    constructor Create; overload;
    procedure SalvarContato(DadosContato: TContato);
    procedure ListarContatos;
    procedure ExcluirContato(ID: Integer);
    function GeraIDContato: Integer;
    procedure EditarContato(ID: Integer); overload;
    procedure EditarCOntato(Contato: TContato); overload;
    destructor Destroy; override;

    property FServico: IServicoContato read FFServico write SetFServico;
    property Dados: TdmDados read FDados write SetDados;
end;

implementation

uses
  uServicoContatoFisica, System.SysUtils, dtmConexao, fCadContato;

{ TManipuladorServicoContato }

constructor TManipuladorServicoContato.Create(Contato: IServicoContato);
begin
  FFServico := Contato;
end;

procedure TManipuladorServicoContato.CarregaContatoEdicao(ID: Integer);
const
  SQL = ' SELECT' +
        ' 	id,' +
        ' 	nome,' +
        ' 	tp_pessoa,' +
        ' 	cpf_cnpf,' +
        ' 	endereco,' +
        ' 	cidade,' +
        ' 	data_nasc' +
        ' FROM' +
        ' 	contatos' +
        ' WHERE id = :id ';
var
  query: TFDquery;
  contato: TContato;
begin
  query := TFDquery.Create(nil);
  query.Connection := dmConexao.conexao;

  contato := TContato.Create;

  try
    query.Open(SQL, [ID]);

    if not query.IsEmpty then
    begin
      contato.ID := query.FieldByName('id').AsInteger;
      contato.Nome := query.FieldByName('nome').AsString;
      contato.TipoContato := query.FieldByName('tp_pessoa').AsString;
      contato.CPF_CNPJ := query.FieldByName('cpf_cnpf').AsString;
      contato.Endereco := query.FieldByName('endereco').AsString;
      contato.Cidade := query.FieldByName('cidade').AsString;
      contato.Data := query.FieldByName('data_nasc').AsDateTime;
    end;

    EditarContato(contato);

  finally
    query.Free;
    contato.Free;
  end;
end;

constructor TManipuladorServicoContato.Create;
begin
  Dados := TdmDados.Create(nil);
end;

destructor TManipuladorServicoContato.Destroy;
begin
  Dados.Free;
  inherited;
end;

procedure TManipuladorServicoContato.EditarContato(ID: Integer);
begin
  CarregaContatoEdicao(ID);
end;

procedure TManipuladorServicoContato.EditarContato(Contato: TContato);
var
  edicaoContato: TcCadContato;
begin
  edicaoContato := TcCadContato.Create(nil);

  try
    edicaoContato.Contato := Contato;
    edicaoContato.Visible := False;
    edicaoContato.ShowModal;
  finally
    edicaoContato.Free;
  end;
end;

procedure TManipuladorServicoContato.ExcluirContato(ID: Integer);
const
  SQL = 'DELETE FROM contatos WHERE id = :id';
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dmConexao.conexao;

  try
    query.SQL.Add(SQL);
    query.ParamByName('id').AsInteger := ID;
    query.ExecSQL;
  finally
    query.Free;
  end;
end;

function TManipuladorServicoContato.GeraIDContato: Integer;
const
  SQL = 'SELECT nextval(''contato_seq'') as id';
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dmConexao.conexao;

  try
    query.Open(SQL);
    Result := query.FieldByName('id').AsInteger;
  finally
    query.Free;
  end;
end;

procedure TManipuladorServicoContato.ListarContatos;
const
  SQL = ' SELECT' +
        ' 	id,' +
        ' 	nome,' +
        ' 	tp_pessoa,' +
        ' 	cpf_cnpf,' +
        ' 	endereco,' +
        ' 	cidade,' +
        ' 	data_nasc' +
        ' FROM' +
        ' 	contatos';
var
  query: TFDquery;
begin
  query := TFDquery.Create(nil);
  query.Connection := dmConexao.conexao;

  Dados.cdsDados.EmptyDataSet;

  try
    query.Open(SQL);

    query.First;
    while not query.Eof do
    begin
      Dados.cdsDados.Append;
      Dados.cdsDados.FieldByName('id').AsInteger := query.FieldByName('id').AsInteger;
      Dados.cdsDados.FieldByName('nome').AsString := query.FieldByName('nome').AsString;
      Dados.cdsDados.FieldByName('tipo_contato').AsString := query.FieldByName('tp_pessoa').AsString;
      Dados.cdsDados.FieldByName('cpf_cnpj').AsString := query.FieldByName('cpf_cnpf').AsString;
      Dados.cdsDados.FieldByName('endereco').AsString := query.FieldByName('endereco').AsString;
      Dados.cdsDados.FieldByName('cidade').AsString := query.FieldByName('cidade').AsString;
      Dados.cdsDados.FieldByName('data').AsDateTime := query.FieldByName('data_nasc').AsDateTime;
      Dados.cdsDados.Post;
      query.Next;
    end;
  finally
    query.Free;
  end;
end;

function TManipuladorServicoContato.Pesquisar(ID: Integer): Boolean;
const
  SQL = ' SELECT' +
        ' 	id,' +
        ' 	nome,' +
        ' 	tp_pessoa,' +
        ' 	cpf_cnpf,' +
        ' 	endereco,' +
        ' 	cidade,' +
        ' 	data_nasc' +
        ' FROM' +
        ' 	contatos' +
        ' WHERE id = :id ';
var
  query: TFDquery;
begin
  query := TFDquery.Create(nil);
  query.Connection := dmConexao.conexao;

  try
    query.Open(SQL, [ID]);

    Result := not query.IsEmpty;

  finally
    query.Free;
  end;
end;

procedure TManipuladorServicoContato.SalvarContato(DadosContato: TContato);
const
  SQL_INSERT =  ' INSERT' +
                ' 	INTO' +
                ' 	contatos (id,' +
                ' 	nome,' +
                ' 	tp_pessoa,' +
                ' 	cpf_cnpf,' +
                ' 	endereco,' +
                ' 	cidade,' +
                ' 	data_nasc)' +
                ' VALUES (:id,' +
                ' :nome,' +
                ' :tp_pessoa,' +
                ' :cpf_cnpf,' +
                ' :endereco,' +
                ' :cidade,' +
                ' :data_nasc)';

  SQL_UPDATE =  ' UPDATE' +
                ' 	contatos' +
                ' SET' +
                ' 	nome = :nome,' +
                ' 	tp_pessoa = :tp_pessoa,' +
                ' 	cpf_cnpf = :cpf_cnpf,' +
                ' 	endereco = :endereco,' +
                ' 	cidade = :cidade,' +
                ' 	data_nasc = :data_nasc' +
                ' WHERE' +
                ' 	id = :id';

var
  query: TFDquery;
  novo: Boolean;
begin
  if not FFServico.ValidaDocumento(DadosContato.CPF_CNPJ) then
    raise Exception.Create('Documento Inválido');

  query := TFDquery.Create(nil);
  query.Connection := dmConexao.conexao;

  try

    novo := not Pesquisar(DadosContato.ID);

    if novo then
      query.SQL.Add(SQL_INSERT)
    else
      query.SQL.Add(SQL_UPDATE);

    query.ParamByName('id').AsInteger := DadosContato.ID;
    query.ParamByName('nome').AsString := DadosContato.Nome;
    query.ParamByName('tp_pessoa').AsString := DadosContato.TipoContato;
    query.ParamByName('cpf_cnpf').AsString := DadosContato.CPF_CNPJ;
    query.ParamByName('endereco').AsString := DadosContato.Endereco;
    query.ParamByName('cidade').AsString := DadosContato.Cidade;
    query.ParamByName('data_nasc').AsDate := DadosContato.Data;

    query.ExecSQL;

  finally
    query.Free;
  end;
end;

procedure TManipuladorServicoContato.SetDados(const Value: TdmDados);
begin
  FDados := Value;
end;

procedure TManipuladorServicoContato.SetFServico(const Value: IServicoContato);
begin
  FFServico := Value;
end;

end.
