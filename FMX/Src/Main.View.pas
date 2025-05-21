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
  FMX.TMSFNCCustomComponent,
  FMX.Layouts,
  FMX.ListBox,
  System.Messaging,
  FMX.Objects,
  FMX.TabControl,
  FMX.DateTimeCtrls;

type
  TMainView = class(TForm)
    TMSFNCCloudStellarDataStoreConnection1: TTMSFNCCloudStellarDataStoreConnection;
    TMSFNCCloudStellarDataStoreDataSetFMX1: TTMSFNCCloudStellarDataStoreDataSetFMX;
    DataSource1: TDataSource;
    pnHeader: TPanel;
    ImageLogo: TImage;
    Label2: TLabel;
    Edit1: TEdit;
    TabControl1: TTabControl;
    tabAuthentication: TTabItem;
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
    tabProducts: TTabItem;
    TabControlProducts: TTabControl;
    tabList: TTabItem;
    gBoxProducts: TGroupBox;
    ListBox1: TListBox;
    btnFooter: TPanel;
    Label1: TLabel;
    lbCount: TLabel;
    btnRefresh: TButton;
    imgProduct: TImage;
    tabRegister: TTabItem;
    Panel2: TPanel;
    Panel3: TPanel;
    btnSave: TButton;
    btnCancel: TButton;
    Label3: TLabel;
    edtPrice: TEdit;
    Label4: TLabel;
    edtName: TEdit;
    Label5: TLabel;
    edtDate: TDateEdit;
    pnStatus: TPanel;
    lbStatus: TLabel;
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure ListBox1ItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
  private
    procedure ConfigScreen;
    procedure FillListBox;
    procedure LoadImageToImage;
    procedure RefreshProducts;
  public

  end;

var
  MainView: TMainView;

implementation

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}

procedure TMainView.FormCreate(Sender: TObject);
begin
  ListBox1.Clear;
  lbStatus.Text := '';
  TabControlProducts.ActiveTab := tabList;
  TabControl1.ActiveTab := tabAuthentication;
  Self.ConfigScreen;

  edtAccessToken.Text := 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJhY2Nlc3MtdG9rZW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllci10b2tlbiI6IjU5MjQzOWY2LThjYjYtNDhiZS0xMzM4LTA4ZGQ5MGZjZGQ4NCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyLXByb2plY3QiOiIxOGY3MDJiNy1lOGFkLTRlOWQtZDJhZC0wOGRkOTBlYmJhZGEiLCJleHAiOjE3NDgxMTY1NDAsImlzcyI6Imh0dHBzOi8vc3RlbGxhcmRzLmlvIiwiYXVkIjoiaHR0cHM6Ly9hcGkuc3RlbGxhcmRzLmlvIn0.YDWuGl-Y7Cp3ThHRj0NtZxdpQikreNtDe7s0oOtJHHA';
  edtProjectID.Text := '18f702b7-e8ad-4e9d-d2ad-08dd90ebbada';
  edtTableName.Text := 'products';
end;

procedure TMainView.ConfigScreen;
begin
  btnDisconnect.Enabled := TMSFNCCloudStellarDataStoreDataSetFMX1.Active;
  btnConnect.Enabled := not btnDisconnect.Enabled;

  if not TMSFNCCloudStellarDataStoreDataSetFMX1.Active then
    lbCount.Text := '0';
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
  TabControl1.ActiveTab := tabProducts;
  Self.FillListBox;
end;

procedure TMainView.btnDisconnectClick(Sender: TObject);
begin
  ListBox1.Items.Clear;
  TMSFNCCloudStellarDataStoreDataSetFMX1.Active := False;
  Self.ConfigScreen;
end;

procedure TMainView.btnRefreshClick(Sender: TObject);
begin
  Self.RefreshProducts;
end;

procedure TMainView.RefreshProducts;
begin
  TMSFNCCloudStellarDataStoreDataSetFMX1.Refresh;
  Self.FillListBox;
end;

procedure TMainView.FillListBox;
var
  LListBoxItem: TListBoxItem;
  LName: string;
  LPrice: Double;
begin
  ListBox1.Clear;

  if not TMSFNCCloudStellarDataStoreDataSetFMX1.Active then
    Exit;

  TMSFNCCloudStellarDataStoreDataSetFMX1.First;
  while not TMSFNCCloudStellarDataStoreDataSetFMX1.Eof do
  begin
    LName := TMSFNCCloudStellarDataStoreDataSetFMX1.FieldByName('Name').AsString;
    LPrice := TMSFNCCloudStellarDataStoreDataSetFMX1.FieldByName('Price').AsFloat;

    LListBoxItem := TListBoxItem.Create(ListBox1);
    LListBoxItem.Text := Format('%s | R$ %.2f', [LName, LPrice]);
    LListBoxItem.Tag := TMSFNCCloudStellarDataStoreDataSetFMX1.FieldByName('Id').Asinteger;
    ListBox1.AddObject(LListBoxItem);

    TMSFNCCloudStellarDataStoreDataSetFMX1.Next;
  end;
end;

procedure TMainView.ListBox1ItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  lbStatus.Text := 'Item id ' + Item.Tag.ToString;
  TMSFNCCloudStellarDataStoreDataSetFMX1.Locate('id', Item.Tag, [loCaseInsensitive]);
  Self.LoadImageToImage;
end;

procedure TMainView.LoadImageToImage;
var
  LStream: TStream;
begin
  if not TMSFNCCloudStellarDataStoreDataSetFMX1.Active then
    Exit;

  lbStatus.Text := 'Item id ' + TMSFNCCloudStellarDataStoreDataSetFMX1.FieldByName('Id').AsString + ' - Img: ' + TMSFNCCloudStellarDataStoreDataSetFMX1.FieldByName('Image').AsString;
  if TMSFNCCloudStellarDataStoreDataSetFMX1.FieldByName('Image').IsNull then
  begin
    imgProduct.Bitmap := nil;
    Exit;
  end;

  LStream := TMSFNCCloudStellarDataStoreDataSetFMX1.CreateBlobStream(
    TMSFNCCloudStellarDataStoreDataSetFMX1.FieldByName('Image'), bmRead);
  try
    if LStream.Size > 0 then
    begin
      LStream.Position := 0;
      imgProduct.Bitmap.LoadFromStream(LStream);
    end
    else
      imgProduct.Bitmap := nil;
  finally
    LStream.Free;
  end;
end;

procedure TMainView.btnSaveClick(Sender: TObject);
var
  LMemoryStream: TMemoryStream;
  LBlobStream: TStream;
begin
  if not TMSFNCCloudStellarDataStoreDataSetFMX1.Active then
  begin
    ShowMessage('Dataset is not open');
    Exit;
  end;

  if Trim(edtName.Text).IsEmpty then
  begin
    edtName.SetFocus;
    ShowMessage('Enter the name field');
    Exit;
  end;

  TMSFNCCloudStellarDataStoreDataSetFMX1.Append;
  TMSFNCCloudStellarDataStoreDataSetFMX1.FieldByName('Name').AsString := edtName.Text;
  TMSFNCCloudStellarDataStoreDataSetFMX1.FieldByName('Price').AsFloat := StrToFloatDef(edtPrice.Text, 0);

  if ImageLogo.Bitmap.IsEmpty then
  begin
    TMSFNCCloudStellarDataStoreDataSetFMX1.Post;
    Exit;
  end;

  //RECORD IMAGE
  LMemoryStream := TMemoryStream.Create;
  try
    ImageLogo.Bitmap.SaveToStream(LMemoryStream);
    LMemoryStream.Position := 0;

    LBlobStream := TMSFNCCloudStellarDataStoreDataSetFMX1.CreateBlobStream(
      TMSFNCCloudStellarDataStoreDataSetFMX1.FieldByName('Image'), bmWrite);
    try
      LBlobStream.CopyFrom(LMemoryStream, LMemoryStream.Size);
    finally
      LBlobStream.Free;
    end;

    TMSFNCCloudStellarDataStoreDataSetFMX1.Post;
  finally
    LMemoryStream.Free;
  end;

  TabControlProducts.ActiveTab := tabList;
  Self.RefreshProducts;
end;

procedure TMainView.btnCancelClick(Sender: TObject);
begin
  //
end;

end.
