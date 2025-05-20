unit Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Data.DB,
  VCL.TMSFNCCloudStellarDataStoreDataSet,
  VCL.TMSFNCCustomComponent,
  Vcl.Buttons,
  Vcl.DBCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  IniFiles;

type
  TMainView = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    edtAccessToken: TEdit;
    edtClientID: TEdit;
    edtSecret: TEdit;
    edtCallbackURL: TEdit;
    Label8: TLabel;
    edtProjectID: TEdit;
    btnConnect: TButton;
    btnDisconnect: TButton;
    TMSFNCCloudStellarDataStoreConnection1: TTMSFNCCloudStellarDataStoreConnection;
    TMSFNCCloudStellarDataStoreDataSetVCL1: TTMSFNCCloudStellarDataStoreDataSetVCL;
    Label9: TLabel;
    edtTableName: TEdit;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    lbCount: TLabel;
    Label10: TLabel;
    rdDirectAccessToken: TRadioButton;
    rdOAuth2: TRadioButton;
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure rdDirectAccessTokenClick(Sender: TObject);
    procedure rdOAuth2Click(Sender: TObject);
  private
    procedure SaveSettingsIni;
    procedure LoadSettingsIni;
    procedure ConfigScreen;
  public

  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

procedure TMainView.FormCreate(Sender: TObject);
begin
  Self.LoadSettingsIni;
  Self.ConfigScreen;

  edtAccessToken.Text := 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJhY2Nlc3MtdG9rZW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllci10b2tlbiI6IjU5MjQzOWY2LThjYjYtNDhiZS0xMzM4LTA4ZGQ5MGZjZGQ4NCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyLXByb2plY3QiOiIxOGY3MDJiNy1lOGFkLTRlOWQtZDJhZC0wOGRkOTBlYmJhZGEiLCJleHAiOjE3NDgxMTY1NDAsImlzcyI6Imh0dHBzOi8vc3RlbGxhcmRzLmlvIiwiYXVkIjoiaHR0cHM6Ly9hcGkuc3RlbGxhcmRzLmlvIn0.YDWuGl-Y7Cp3ThHRj0NtZxdpQikreNtDe7s0oOtJHHA';
  edtProjectID.Text := '18f702b7-e8ad-4e9d-d2ad-08dd90ebbada';
  edtTableName.Text := 'products';
end;

procedure TMainView.SaveSettingsIni;
var
  LIni: TIniFile;
begin
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'settings.ini');
  try
    LIni.WriteString('Config', 'AccessToken', edtAccessToken.Text);
    LIni.WriteString('Config', 'ClientID', edtClientID.Text);
    LIni.WriteString('Config', 'Secret', edtSecret.Text);
    LIni.WriteString('Config', 'CallbackURL', edtCallbackURL.Text);
    LIni.WriteString('Config', 'ProjectID', edtProjectID.Text);
    LIni.WriteString('Config', 'TableName', edtTableName.Text);
  finally
    LIni.Free;
  end;
end;

procedure TMainView.LoadSettingsIni;
var
  LIni: TIniFile;
begin
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'settings.ini');
  try
    edtAccessToken.Text := LIni.ReadString('Config', 'AccessToken', '');
    edtClientID.Text := LIni.ReadString('Config', 'ClientID', '');
    edtSecret.Text := LIni.ReadString('Config', 'Secret', '');
    edtCallbackURL.Text := LIni.ReadString('Config', 'CallbackURL', '');
    edtProjectID.Text := LIni.ReadString('Config', 'ProjectID', '');
    edtTableName.Text := LIni.ReadString('Config', 'TableName', '');
  finally
    LIni.Free;
  end;
end;

procedure TMainView.btnConnectClick(Sender: TObject);
begin
  //Direct access token
  TMSFNCCloudStellarDataStoreConnection1.Authentication.Key := edtAccessToken.Text;

  //OAuth2.0 access
  TMSFNCCloudStellarDataStoreConnection1.Authentication.ClientID := edtClientID.Text;
  TMSFNCCloudStellarDataStoreConnection1.Authentication.Secret := edtSecret.Text;
  TMSFNCCloudStellarDataStoreConnection1.Authentication.CallBackURL := edtCallbackURL.Text;

  //Others
  TMSFNCCloudStellarDataStoreDataSetVCL1.ProjectID := edtProjectID.Text;
  TMSFNCCloudStellarDataStoreDataSetVCL1.Table := edtTableName.Text;

  TMSFNCCloudStellarDataStoreDataSetVCL1.Active := True;

  if not TMSFNCCloudStellarDataStoreDataSetVCL1.Active then
    raise Exception.Create('Not connected. Check the information provided.');

  Self.SaveSettingsIni;
  Self.ConfigScreen;
end;

procedure TMainView.rdDirectAccessTokenClick(Sender: TObject);
begin
  Self.ConfigScreen;
end;

procedure TMainView.rdOAuth2Click(Sender: TObject);
begin
  Self.ConfigScreen;
end;

procedure TMainView.ConfigScreen;
begin
  btnDisconnect.Enabled := TMSFNCCloudStellarDataStoreDataSetVCL1.Active;
  btnConnect.Enabled := not btnDisconnect.Enabled;

  edtAccessToken.Enabled := rdDirectAccessToken.Checked;
  edtClientID.Enabled := rdOAuth2.Checked;
  edtSecret.Enabled := rdOAuth2.Checked;
  edtCallbackURL.Enabled := rdOAuth2.Checked;
end;

procedure TMainView.DataSource1StateChange(Sender: TObject);
begin
  lbCount.Caption := TMSFNCCloudStellarDataStoreDataSetVCL1.RecordCount.ToString;
end;

procedure TMainView.btnDisconnectClick(Sender: TObject);
begin
  TMSFNCCloudStellarDataStoreDataSetVCL1.Active := False;
  Self.ConfigScreen;
end;

end.
