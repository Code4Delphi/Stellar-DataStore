unit Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.TypInfo,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Buttons,
  Vcl.DBCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  IniFiles,
  VCL.TMSFNCCloudStellarDataStoreDataSet,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCCloudDataStore;

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
    cBoxSortOrder: TComboBox;
    Label5: TLabel;
    btnRefresh: TBitBtn;
    cBoxFilter: TComboBox;
    Label6: TLabel;
    edtFilter: TEdit;
    cBoxComparisonOperator: TComboBox;
    Label11: TLabel;
    Label12: TLabel;
    Shape1: TShape;
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure rdDirectAccessTokenClick(Sender: TObject);
    procedure rdOAuth2Click(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    procedure SaveSettingsIni;
    procedure LoadSettingsIni;
    procedure ConfigScreen;
    procedure ProcessOrder;
    procedure ProcessFilters;
    procedure FillcBoxComparisonOperator;
  public

  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

procedure TMainView.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  Self.LoadSettingsIni;
  Self.ConfigScreen;

  Self.FillcBoxComparisonOperator;
end;

procedure TMainView.FillcBoxComparisonOperator;
var
  i: Integer;
begin
  cBoxComparisonOperator.Items.Clear;
  for i := Ord(Low(TTMSFNCCloudComparisonOperator)) to Ord(High(TTMSFNCCloudComparisonOperator)) do
    cBoxComparisonOperator.Items.Add(GetEnumName(TypeInfo(TTMSFNCCloudComparisonOperator), i));

  cBoxComparisonOperator.ItemIndex := Integer(coLike);
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

procedure TMainView.ProcessOrder;
var
  LSort: TTMSFNCCloudDataStoreSortOrderItem;
begin
  TMSFNCCloudStellarDataStoreDataSetVCL1.SortOrder.Clear;
  LSort := TMSFNCCloudStellarDataStoreDataSetVCL1.SortOrder.Add;
  LSort.FieldName := cBoxSortOrder.Text;
  LSort.SortOrder := soAscending;
end;

procedure TMainView.ProcessFilters;
var
  LFilter: TTMSFNCCloudDataStoreFilter;
begin
  TMSFNCCloudStellarDataStoreDataSetVCL1.Filter.Clear;
  LFilter := TMSFNCCloudStellarDataStoreDataSetVCL1.Filter.Add;

  LFilter.FieldName := cBoxFilter.Text;
  LFilter.ComparisonOperator := TTMSFNCCloudComparisonOperator(cBoxComparisonOperator.ItemIndex);

  LFilter.FieldValue := edtFilter.Text;
  if LFilter.ComparisonOperator = coLike then
    LFilter.FieldValue := '%' + LFilter.FieldValue + '%';

  LFilter.LogicalOperator := loOr;
end;

procedure TMainView.btnRefreshClick(Sender: TObject);
begin
  TMSFNCCloudStellarDataStoreDataSetVCL1.Active := False;
  Self.ProcessOrder;
  Self.ProcessFilters;
  TMSFNCCloudStellarDataStoreDataSetVCL1.Active := True;
end;

end.
