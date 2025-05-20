unit Main.View;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Edit,
  Data.DB,
  FMX.TMSFNCCloudStellarDataStoreDataSet,
  FMX.TMSFNCCustomComponent, FMX.Layouts, FMX.ListBox;

type
  TMainView = class(TForm)
    gBoxAuthentication: TGroupBox;
    lbAccessToken: TLabel;
    edtAccessToken: TEdit;
    lbProjectID: TLabel;
    edtProjectID: TEdit;
    lbTableName: TLabel;
    edtTableName: TEdit;
    Panel1: TPanel;
    btnConnect: TButton;
    btnDisconnect: TButton;
    TMSFNCCloudStellarDataStoreConnection1: TTMSFNCCloudStellarDataStoreConnection;
    TMSFNCCloudStellarDataStoreDataSetFMX1: TTMSFNCCloudStellarDataStoreDataSetFMX;
    DataSource1: TDataSource;
    btnFooter: TPanel;
    Label1: TLabel;
    lbCount: TLabel;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
  private
    procedure ConfigScreen;
    procedure PreencherListBox;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainView: TMainView;

implementation

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}

procedure TMainView.FormCreate(Sender: TObject);
begin
  ListBox1.Clear;
  Self.ConfigScreen;

  edtAccessToken.Text := 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJhY2Nlc3MtdG9rZW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllci10b2tlbiI6IjU5MjQzOWY2LThjYjYtNDhiZS0xMzM4LTA4ZGQ5MGZjZGQ4NCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyLXByb2plY3QiOiIxOGY3MDJiNy1lOGFkLTRlOWQtZDJhZC0wOGRkOTBlYmJhZGEiLCJleHAiOjE3NDgxMTY1NDAsImlzcyI6Imh0dHBzOi8vc3RlbGxhcmRzLmlvIiwiYXVkIjoiaHR0cHM6Ly9hcGkuc3RlbGxhcmRzLmlvIn0.YDWuGl-Y7Cp3ThHRj0NtZxdpQikreNtDe7s0oOtJHHA';
  edtProjectID.Text := '18f702b7-e8ad-4e9d-d2ad-08dd90ebbada';
  edtTableName.Text := 'products';
end;

procedure TMainView.ConfigScreen;
begin
  btnDisconnect.Enabled := TMSFNCCloudStellarDataStoreDataSetFMX1.Active;
  btnConnect.Enabled := not btnDisconnect.Enabled;
end;

procedure TMainView.DataSource1StateChange(Sender: TObject);
begin
  lbCount.Text := TMSFNCCloudStellarDataStoreDataSetFMX1.RecordCount.ToString;
end;

procedure TMainView.btnConnectClick(Sender: TObject);
begin
  //Direct access token
  TMSFNCCloudStellarDataStoreConnection1.Authentication.Key := edtAccessToken.Text;

  //Others
  TMSFNCCloudStellarDataStoreDataSetFMX1.ProjectID := edtProjectID.Text;
  TMSFNCCloudStellarDataStoreDataSetFMX1.Table := edtTableName.Text;

  TMSFNCCloudStellarDataStoreDataSetFMX1.Active := True;

  if not TMSFNCCloudStellarDataStoreDataSetFMX1.Active then
    raise Exception.Create('Not connected. Check the information provided.');

  Self.ConfigScreen;

  Self.PreencherListBox;
end;

procedure TMainView.PreencherListBox;
var
  ListItem: TListBoxItem;
  Nome: string;
  Preco: Double;
begin
  ListBox1.Clear;

  // Garantir que o DataSet esteja aberto
  if not TMSFNCCloudStellarDataStoreDataSetFMX1.Active then
    TMSFNCCloudStellarDataStoreDataSetFMX1.Open;

  TMSFNCCloudStellarDataStoreDataSetFMX1.First;
  while not TMSFNCCloudStellarDataStoreDataSetFMX1.Eof do
  begin
    Nome := TMSFNCCloudStellarDataStoreDataSetFMX1.FieldByName('Name').AsString;
    Preco := TMSFNCCloudStellarDataStoreDataSetFMX1.FieldByName('Price').AsFloat;

    ListItem := TListBoxItem.Create(ListBox1);
    ListItem.Text := Format('%s - R$ %.2f', [Nome, Preco]);
    ListBox1.AddObject(ListItem);

    TMSFNCCloudStellarDataStoreDataSetFMX1.Next;
  end;
end;

end.
