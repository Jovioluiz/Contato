unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, uManipuladorServicoContato, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    btnListar: TButton;
    dbGridContatos: TDBGrid;
    btnAdicionar: TButton;
    ppMenu: TPopupMenu;
    ppMenu1: TMenuItem;
    Editar1: TMenuItem;
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppMenu1Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
  private
    FManipulador: TManipuladorServicoContato;
    { Private declarations }
    procedure ListarContatos;
    procedure SetManipulador(const Value: TManipuladorServicoContato);
    procedure Excluir(ID: Integer);
  public
    { Public declarations }
    property Manipulador: TManipuladorServicoContato read FManipulador write SetManipulador;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  fCadContato;

{$R *.dfm}

procedure TfrmPrincipal.btnAdicionarClick(Sender: TObject);
var
  cadContato: TcCadContato;
begin
  cadContato := TcCadContato.Create(Self);

  try
    cadContato.ShowModal;
  finally
    cadContato.Free;
  end;
end;

procedure TfrmPrincipal.btnListarClick(Sender: TObject);
begin
  ListarContatos;
end;

procedure TfrmPrincipal.Editar1Click(Sender: TObject);
begin
  FManipulador.EditarContato(FManipulador.Dados.cdsDados.FieldByName('id').AsInteger);
end;

procedure TfrmPrincipal.Excluir(ID: Integer);
begin
  try
    FManipulador.ExcluirContato(ID);
    ListarContatos;
  except
    on E: exception do
      raise Exception.Create('Ocorreu o seguinte erro ao excluir o contato' + E.Message);
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FManipulador := TManipuladorServicoContato.Create;
  dbGridContatos.DataSource := FManipulador.Dados.dsDados;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FManipulador.Free;
end;

procedure TfrmPrincipal.ListarContatos;
begin
  FManipulador.ListarContatos;
end;

procedure TfrmPrincipal.ppMenu1Click(Sender: TObject);
begin
  Excluir(FManipulador.Dados.cdsDados.FieldByName('id').AsInteger);
end;

procedure TfrmPrincipal.SetManipulador(const Value: TManipuladorServicoContato);
begin
  FManipulador := Value;
end;

end.
