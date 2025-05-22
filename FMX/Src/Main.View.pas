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
  FMX.DateTimeCtrls,
  FMX.TMSFNCCloudBase,
  FMX.TMSFNCCloudOAuth,
  FMX.TMSFNCCloudDataStore,
  FMX.TMSFNCCloudStellarDataStore,
  FMX.DialogService;

type
  TMainView = class(TForm)
    TMSFNCCloudStellarDataStoreConnection1: TTMSFNCCloudStellarDataStoreConnection;
    TMSFNCCloudStellarDataStoreDataSetFMX1: TTMSFNCCloudStellarDataStoreDataSetFMX;
    DataSource1: TDataSource;
    pnHeader: TPanel;
    ImageLogo: TImage;
    lbCaption: TLabel;
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
    btnRefresh: TButton;
    imgProduct: TImage;
    tabRegister: TTabItem;
    pnRegisterBack: TPanel;
    pnButtonsRegister: TPanel;
    btnSave: TButton;
    btnCancel: TButton;
    Label3: TLabel;
    edtPrice: TEdit;
    Label4: TLabel;
    edtName: TEdit;
    Label5: TLabel;
    edtDate: TDateEdit;
    TMSFNCCloudStellarDataStoreDataSetFMX1id: TIntegerField;
    TMSFNCCloudStellarDataStoreDataSetFMX1Name: TStringField;
    TMSFNCCloudStellarDataStoreDataSetFMX1Price: TFloatField;
    TMSFNCCloudStellarDataStoreDataSetFMX1Date: TDateTimeField;
    TMSFNCCloudStellarDataStoreDataSetFMX1Image: TBlobField;
    btnLoadImg: TButton;
    edtEdit: TButton;
    btnDelete: TButton;
    pnCount: TPanel;
    lbCount: TLabel;
    btnAdd: TButton;
    ckAddImage: TCheckBox;
    lbStatus: TLabel;
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure ListBox1ItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure TMSFNCCloudStellarDataStoreDataSetFMX1GetBlobData(Sender: TObject; const AField, ARecordID: string;
      var AAllow: Boolean);
    procedure btnLoadImgClick(Sender: TObject);
    procedure edtEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    FIdAlter: Integer;
    procedure ConfigScreen;
    procedure FillListBox;
    procedure RefreshProducts;
    procedure LoadImageFromDataset;
    procedure ClearOnCreate;
    procedure ClearFieldsRegister;
  public

  end;

var
  MainView: TMainView;

implementation

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}

procedure TMainView.FormCreate(Sender: TObject);
begin
  Self.ClearOnCreate;
  TabControlProducts.ActiveTab := tabList;
  TabControl1.ActiveTab := tabAuthentication;
  Self.ConfigScreen;

  edtAccessToken.Text := 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJhY2Nlc3MtdG9rZW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllci10b2tlbiI6IjU5MjQzOWY2LThjYjYtNDhiZS0xMzM4LTA4ZGQ5MGZjZGQ4NCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyLXByb2plY3QiOiIxOGY3MDJiNy1lOGFkLTRlOWQtZDJhZC0wOGRkOTBlYmJhZGEiLCJleHAiOjE3NDgxMTY1NDAsImlzcyI6Imh0dHBzOi8vc3RlbGxhcmRzLmlvIiwiYXVkIjoiaHR0cHM6Ly9hcGkuc3RlbGxhcmRzLmlvIn0.YDWuGl-Y7Cp3ThHRj0NtZxdpQikreNtDe7s0oOtJHHA';
  edtProjectID.Text := '18f702b7-e8ad-4e9d-d2ad-08dd90ebbada';
  edtTableName.Text := 'products';
end;

procedure TMainView.ClearOnCreate;
begin
  ListBox1.Clear;
  lbStatus.Text := '';
  Self.ClearFieldsRegister;
end;

procedure TMainView.ClearFieldsRegister;
begin
  FIdAlter := 0;
  edtName.Text := '';
  edtPrice.Text := '';
  edtDate.Date := Now;
end;

procedure TMainView.ConfigScreen;
begin
  btnDisconnect.Enabled := TMSFNCCloudStellarDataStoreDataSetFMX1.Active;
  btnConnect.Enabled := not btnDisconnect.Enabled;

  if not TMSFNCCloudStellarDataStoreDataSetFMX1.Active then
    lbCount.Text := 'Count: 0';
end;

procedure TMainView.DataSource1StateChange(Sender: TObject);
begin
  lbCount.Text := 'Count: ' + TMSFNCCloudStellarDataStoreDataSetFMX1.RecordCount.ToString;
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
  if not TMSFNCCloudStellarDataStoreDataSetFMX1.Active then
  begin
    ShowMessage('Select a record to continue');
    Exit;
  end;

  Self.RefreshProducts;
end;

procedure TMainView.RefreshProducts;
begin
  TMSFNCCloudStellarDataStoreDataSetFMX1.Refresh;
  lbCount.Text := 'Count: ' + TMSFNCCloudStellarDataStoreDataSetFMX1.RecordCount.ToString;
  Self.FillListBox;
  imgProduct.Bitmap := nil;
end;

procedure TMainView.FillListBox;
var
  LListBoxItem: TListBoxItem;
  LName: string;
  LPrice: Double;
  LDate: string;
begin
  ListBox1.Clear;

  if not TMSFNCCloudStellarDataStoreDataSetFMX1.Active then
    Exit;

  TMSFNCCloudStellarDataStoreDataSetFMX1.First;
  while not TMSFNCCloudStellarDataStoreDataSetFMX1.Eof do
  begin
    LName := TMSFNCCloudStellarDataStoreDataSetFMX1Name.AsString;
    LPrice := TMSFNCCloudStellarDataStoreDataSetFMX1Price.AsFloat;
    LDate := TMSFNCCloudStellarDataStoreDataSetFMX1Date.AsString;

    LListBoxItem := TListBoxItem.Create(ListBox1);
    LListBoxItem.Text := Format('%s | %.2f | %s', [LName, LPrice, LDate]);
    LListBoxItem.Tag := TMSFNCCloudStellarDataStoreDataSetFMX1Id.Asinteger;
    ListBox1.AddObject(LListBoxItem);

    TMSFNCCloudStellarDataStoreDataSetFMX1.Next;
  end;
end;

procedure TMainView.ListBox1ItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  lbStatus.Text := 'Item id: ' + Item.Tag.ToString;
  TMSFNCCloudStellarDataStoreDataSetFMX1.Locate('id', Item.Tag, [loCaseInsensitive]);
  Self.LoadImageFromDataset;
end;

procedure TMainView.btnLoadImgClick(Sender: TObject);
begin
  Self.LoadImageFromDataset;
end;

procedure TMainView.LoadImageFromDataset;
var
  LBlobField: TBlobField;
  LStream: TStream;
begin
  imgProduct.Bitmap := nil;

  if not TMSFNCCloudStellarDataStoreDataSetFMX1.Active then
    Exit;

  if not (TMSFNCCloudStellarDataStoreDataSetFMX1Image is TBlobField) then
    Exit;

  LBlobField := TMSFNCCloudStellarDataStoreDataSetFMX1Image as TBlobField;
  if LBlobField.IsNull then
    Exit;

  LStream := TMSFNCCloudStellarDataStoreDataSetFMX1.CreateBlobStream(LBlobField, bmRead);
  try
    if LStream.Size > 0 then
    begin
      LStream.Position := 0;
      imgProduct.Bitmap.LoadFromStream(LStream);
    end;
  finally
    LStream.Free;
  end;
end;

procedure TMainView.btnSaveClick(Sender: TObject);
var
  LMemoryStream: TMemoryStream;
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

  if FIdAlter > 0 then
  begin
    if not TMSFNCCloudStellarDataStoreDataSetFMX1.Locate('id', FIdAlter, [loCaseInsensitive]) then
    begin
      ShowMessage('Item not found for editing');
      Exit
    end;

    TMSFNCCloudStellarDataStoreDataSetFMX1.Edit;
  end
  else
    TMSFNCCloudStellarDataStoreDataSetFMX1.Append;

  TMSFNCCloudStellarDataStoreDataSetFMX1Name.AsString := edtName.Text;
  TMSFNCCloudStellarDataStoreDataSetFMX1Price.AsFloat := StrToFloatDef(edtPrice.Text, 0);
  TMSFNCCloudStellarDataStoreDataSetFMX1Date.AsDateTime := edtDate.Date;

  if ImageLogo.Bitmap.IsEmpty or (not ckAddImage.IsChecked) then
  begin
    TMSFNCCloudStellarDataStoreDataSetFMX1.Post;
  end
  else
  begin
    //RECORD IMAGE
    LMemoryStream := TMemoryStream.Create;
    try
      ImageLogo.Bitmap.SaveToStream(LMemoryStream);
      LMemoryStream.Position := 0;

      (TMSFNCCloudStellarDataStoreDataSetFMX1Image as TBlobField).LoadFromStream(LMemoryStream);
      TMSFNCCloudStellarDataStoreDataSetFMX1.Post;
    finally
      LMemoryStream.Free;
    end;
  end;

  TabControlProducts.ActiveTab := tabList;
  Self.ClearFieldsRegister;
  Self.RefreshProducts;

  ListBox1.SetFocus;
end;

procedure TMainView.btnAddClick(Sender: TObject);
begin
  TabControlProducts.ActiveTab := tabRegister;
  edtName.SetFocus;
end;

procedure TMainView.btnCancelClick(Sender: TObject);
begin
  Self.ClearFieldsRegister;
  TabControlProducts.ActiveTab := tabList;
end;

procedure TMainView.TMSFNCCloudStellarDataStoreDataSetFMX1GetBlobData(Sender: TObject; const AField, ARecordID: string;
  var AAllow: Boolean);
begin
  AAllow := False;
end;

procedure TMainView.edtEditClick(Sender: TObject);
begin
  if not TMSFNCCloudStellarDataStoreDataSetFMX1.Active then
  begin
    ShowMessage('Select a record to continue');
    Exit;
  end;

  FIdAlter := TMSFNCCloudStellarDataStoreDataSetFMX1id.AsInteger;
  edtName.Text := TMSFNCCloudStellarDataStoreDataSetFMX1Name.AsString;
  edtPrice.Text := TMSFNCCloudStellarDataStoreDataSetFMX1Price.AsString;
  edtDate.Date := TMSFNCCloudStellarDataStoreDataSetFMX1Date.AsDateTime;
  TabControlProducts.ActiveTab := tabRegister;
  edtName.SetFocus;
end;

procedure TMainView.btnDeleteClick(Sender: TObject);
begin
  if not TMSFNCCloudStellarDataStoreDataSetFMX1.Active then
  begin
    ShowMessage('Select a record to continue');
    Exit;
  end;

  TDialogService.MessageDialog('Confirm deletion?', TMsgDlgType.mtConfirmation,  [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbNo,  0,
    procedure(const AResult: TModalResult)
    begin
      if AResult = mrYes then
      begin
        TMSFNCCloudStellarDataStoreDataSetFMX1.Delete;
        Self.RefreshProducts;
      end;
    end
  );
end;

end.
