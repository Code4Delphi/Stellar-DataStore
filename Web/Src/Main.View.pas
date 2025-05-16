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
    lbTableName: TWebLabel;
    edtTableName: TWebEdit;
    btnConnect: TWebButton;
    btnDisconnect: TWebButton;
    WebStellarDataStoreClientDataset1: TWebStellarDataStoreClientDataset;
    WebDataSource1: TWebDataSource;
    WebFileUpload1: TWebFileUpload;
    WebImageControl1: TWebImageControl;
    btnClearImage: TWebButton;
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

end.