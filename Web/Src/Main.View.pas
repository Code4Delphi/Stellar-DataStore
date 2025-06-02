unit Main.View;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, Vcl.StdCtrls, WEBLib.StdCtrls, WEBLib.ExtCtrls, WEBLib.Grids, Vcl.Grids,
  WEBLib.DBCtrls, Data.DB, WEBLib.DB, WEBLib.StellarDataStoreCDS, WEBLib.REST, WEBLib.StellarDataStore, WEBLib.WebCtrls;

type
  TMainView = class(TWebForm)
    WebGroupBox1: TWebGroupBox;
    WebPanel1: TWebPanel;
    WebPanel2: TWebPanel;
    WebLabel1: TWebLabel;
    lbCount: TWebLabel;
    WebDBNavigator1: TWebDBNavigator;
    WebDBGrid1: TWebDBGrid;
    rdDirectAccessToken: TWebRadioButton;
    lbAccessToken: TWebLabel;
    edtAccessToken: TWebEdit;
    rdOAuth2: TWebRadioButton;
    lbClientID: TWebLabel;
    edtClientID: TWebEdit;
    lbSecret: TWebLabel;
    edtSecret: TWebEdit;
    lbCallbackURL: TWebLabel;
    edtCallbackURL: TWebEdit;
    WebLabel2: TWebLabel;
    lbProjectID: TWebLabel;
    edtProjectID: TWebEdit;
    WebStellarDataStoreClientDataset1: TWebStellarDataStoreClientDataset;
    WebDataSource1: TWebDataSource;
    WebFileUpload1: TWebFileUpload;
    WebImageControl1: TWebImageControl;
    btnClearImage: TWebButton;
    WebLabel3: TWebLabel;
    edtTableID: TWebEdit;
    lbTableName: TWebLabel;
    edtTableName: TWebEdit;
    btnConnect: TWebButton;
    btnDisconnect: TWebButton;
    edtTableSelectQuery: TWebEdit;
    ckTableSelectQuery: TWebCheckBox;
    gBoxTableWhereQuery: TWebGroupBox;
    ckTableWhereQuery: TWebCheckBox;
    cBoxTableWhereQueryCondition: TWebComboBox;
    WebLabel4: TWebLabel;
    WebLabel5: TWebLabel;
    edtTableWhereQueryValue: TWebEdit;
    WebLabel6: TWebLabel;
    btnTableWhereQueryAdd: TWebButton;
    edtTableWhereQueryComplete: TWebEdit;
    WebLabel7: TWebLabel;
    cBoxTableWhereQueryField: TWebComboBox;
    procedure WebFormCreate(Sender: TObject);
    [Async]
    procedure btnConnectClick(Sender: TObject);
    procedure rdDirectAccessTokenClick(Sender: TObject);
    procedure rdOAuth2Click(Sender: TObject);
    procedure WebDataSource1StateChange(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure WebFileUpload1DroppedFiles(Sender: TObject; AFileList: TStringList);
    procedure WebFileUpload1GetFileAsArrayBuffer(Sender: TObject; AFileIndex: Integer; ABuffer: TJSArrayBufferRecord);
    [Async]
    procedure WebStellarDataStoreClientDataset1AfterScroll(DataSet: TDataSet);
    procedure btnClearImageClick(Sender: TObject);
    procedure btnTableWhereQueryAddClick(Sender: TObject);
  private
    procedure ConfigScreen;
    procedure ClearConfigConnection;
  public
  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

procedure TMainView.WebFormCreate(Sender: TObject);
begin
  Self.ConfigScreen;

  edtAccessToken.Text := 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJhY2Nlc3MtdG9rZW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllci10b2tlbiI6ImI3YzhjNGFhLTFjN2QtNDExNC0zYzEwLTA4ZGQ5ZWMzMzZmZiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyLXByb2plY3QiOiIxOGY3MDJiNy1lOGFkLTRlOWQtZDJhZC0wOGRkOTBlYmJhZGEiLCJleHAiOjE3NDk4Mjg0MDIsImlzcyI6Imh0dHBzOi8vc3RlbGxhcmRzLmlvIiwiYXVkIjoiaHR0cHM6Ly9hcGkuc3RlbGxhcmRzLmlvIn0.yCWGdZEi9hW4tkqoXz0m2VhJtwtEEnKDM3-Jcjn_qdw';
  edtProjectID.Text := '18f702b7-e8ad-4e9d-d2ad-08dd90ebbada';
  //edtTableId.Text := '345';
end;

procedure TMainView.ConfigScreen;
begin
  btnDisconnect.Enabled := WebStellarDataStoreClientDataset1.Active;
  btnConnect.Enabled := not btnDisconnect.Enabled;

  edtAccessToken.Enabled := rdDirectAccessToken.Checked;
  edtClientID.Enabled := rdOAuth2.Checked;
  edtSecret.Enabled := rdOAuth2.Checked;
  edtCallbackURL.Enabled := rdOAuth2.Checked;
end;

procedure TMainView.rdDirectAccessTokenClick(Sender: TObject);
begin
  Self.ConfigScreen;
end;

procedure TMainView.rdOAuth2Click(Sender: TObject);
begin
  Self.ConfigScreen;
end;

procedure TMainView.WebDataSource1StateChange(Sender: TObject);
begin
  lbCount.Caption := WebStellarDataStoreClientDataset1.RecordCount.ToString;
end;

procedure TMainView.ClearConfigConnection;
begin
  WebStellarDataStoreClientDataset1.Active := False;
  WebStellarDataStoreClientDataset1.AccessToken := '';
end;

procedure TMainView.btnConnectClick(Sender: TObject);
begin
  Self.ClearConfigConnection;
  WebStellarDataStoreClientDataset1.AccessToken := edtAccessToken.Text;
  WebStellarDataStoreClientDataset1.ProjectID := edtProjectID.Text;
  WebStellarDataStoreClientDataset1.TableName := edtTableName.Text;
  WebStellarDataStoreClientDataset1.TableId := StrToInt64Def(edtTableID.Text, 0);

  //**         ckTableSelectQuer
  //JOIN
  //WebStellarDataStoreClientDataset1.TableJoinQuery := 'products%3Bid_group%3Dgroups%3Bid';
  //WebStellarDataStoreClientDataset1.TableJoinQuery := '{products;id_group;groups;id}';
  //**

  //**
  WebStellarDataStoreClientDataset1.TableSelectQuery := '';
  if ckTableSelectQuery.Checked then
    WebStellarDataStoreClientDataset1.TableSelectQuery := edtTableSelectQuery.Text;
  //**

  //TableWhereQuery
  WebStellarDataStoreClientDataset1.TableWhereQuery := '';
  if ckTableWhereQuery.Checked then
    WebStellarDataStoreClientDataset1.TableWhereQuery := edtTableWhereQueryComplete.Text;
  //

  await(WebStellarDataStoreClientDataset1.OpenAsync);

  if not WebStellarDataStoreClientDataset1.Active then
    ShowMessage('Not connected. Check the information provided.');

  Self.ConfigScreen;
end;

procedure TMainView.btnDisconnectClick(Sender: TObject);
begin
  WebStellarDataStoreClientDataset1.Active := False;
  Self.ConfigScreen;
end;

procedure TMainView.WebFileUpload1DroppedFiles(Sender: TObject; AFileList: TStringList);
begin
  WebFileUpload1.Files[0].GetFileAsArrayBuffer;
end;

procedure TMainView.WebFileUpload1GetFileAsArrayBuffer(Sender: TObject; AFileIndex: Integer;
  ABuffer: TJSArrayBufferRecord);
begin
  WebImageControl1.LoadFromArrayBuffer(ABuffer.jsarraybuffer);
  WebStellarDataStoreClientDataset1.WriteBlob('Image', ABuffer.jsarraybuffer);
end;

procedure TMainView.WebStellarDataStoreClientDataset1AfterScroll(DataSet: TDataSet);
var
  LArrayBuffer: TJSArrayBuffer;
begin
  WebImageControl1.URL := '';

  if WebStellarDataStoreClientDataset1.State in [dsEdit, dsInsert] then
    Exit;

  LArrayBuffer := await(TJSArrayBuffer, WebStellarDataStoreClientDataset1.ReadBlobAsArrayBuffer('Image'));
  if LArrayBuffer.byteLength > 0 then
    WebImageControl1.LoadFromArrayBuffer(LArrayBuffer);
end;

procedure TMainView.btnClearImageClick(Sender: TObject);
begin
  WebImageControl1.URL := '';
  WebStellarDataStoreClientDataset1.WriteBlob('Image', '');
end;

procedure TMainView.btnTableWhereQueryAddClick(Sender: TObject);
var
  LCondicao: string;
begin
  LCondicao := format('%s;%s;%s', [cBoxTableWhereQueryField.Text,
    Trim(cBoxTableWhereQueryCondition.Text).Replace('&equals;', '=', []), edtTableWhereQueryValue.Text]);

  edtTableWhereQueryComplete.Text := Trim(edtTableWhereQueryComplete.Text);
  if edtTableWhereQueryComplete.Text <> '' then
    LCondicao := edtTableWhereQueryComplete.Text + '&' + LCondicao;

  edtTableWhereQueryComplete.Text := LCondicao;
end;

end.