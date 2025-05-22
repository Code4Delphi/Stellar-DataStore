object MainView: TMainView
  Left = 0
  Top = 0
  Caption = 'Stellar DataStore - VCL'
  ClientHeight = 656
  ClientWidth = 965
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel2: TPanel
    Left = 0
    Top = 331
    Width = 965
    Height = 245
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 963
      Height = 243
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 965
    Height = 297
    Align = alTop
    Caption = ' Authentication '
    TabOrder = 1
    DesignSize = (
      965
      297)
    object Label1: TLabel
      Left = 24
      Top = 100
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Client ID'
    end
    object Label2: TLabel
      Left = 24
      Top = 126
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Secret'
    end
    object Label3: TLabel
      Left = 24
      Top = 153
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Callback URL'
    end
    object Label4: TLabel
      Left = 24
      Top = 204
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Project ID'
    end
    object Label7: TLabel
      Left = 24
      Top = 43
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Access token'
    end
    object Label8: TLabel
      Left = 24
      Top = 184
      Width = 38
      Height = 15
      Caption = 'Others'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 24
      Top = 231
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Table name'
    end
    object edtAccessToken: TEdit
      Left = 99
      Top = 39
      Width = 840
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object edtClientID: TEdit
      Left = 99
      Top = 96
      Width = 840
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edtSecret: TEdit
      Left = 99
      Top = 123
      Width = 840
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object edtCallbackURL: TEdit
      Left = 99
      Top = 150
      Width = 840
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object edtProjectID: TEdit
      Left = 99
      Top = 201
      Width = 840
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
    end
    object btnConnect: TButton
      Left = 99
      Top = 257
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Connect'
      TabOrder = 5
      OnClick = btnConnectClick
    end
    object btnDisconnect: TButton
      Left = 180
      Top = 257
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Disconnect'
      TabOrder = 6
      OnClick = btnDisconnectClick
    end
    object TMSFNCCloudStellarDataStoreConnection1: TTMSFNCCloudStellarDataStoreConnection
      Left = 592
      Top = 36
      Width = 26
      Height = 26
      Visible = True
      Authentication.CallBackURL = 'http://127.0.0.1:8888'
    end
    object edtTableName: TEdit
      Left = 99
      Top = 228
      Width = 840
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
    end
    object rdDirectAccessToken: TRadioButton
      Left = 23
      Top = 21
      Width = 133
      Height = 17
      Caption = 'Direct access token'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      TabStop = True
      OnClick = rdDirectAccessTokenClick
    end
    object rdOAuth2: TRadioButton
      Left = 23
      Top = 76
      Width = 118
      Height = 17
      Caption = 'OAuth2.0 access'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = rdOAuth2Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 297
    Width = 965
    Height = 34
    Align = alTop
    TabOrder = 3
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 780
      Height = 32
      Cursor = crHandPoint
      DataSource = DataSource1
      Align = alLeft
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 576
    Width = 965
    Height = 80
    Align = alBottom
    Padding.Right = 10
    TabOrder = 4
    object lbCount: TLabel
      Left = 948
      Top = 1
      Width = 6
      Height = 78
      Align = alRight
      Caption = '0'
      Layout = tlCenter
      ExplicitHeight = 15
    end
    object Label10: TLabel
      Left = 909
      Top = 1
      Width = 39
      Height = 78
      Align = alRight
      Caption = 'Count: '
      Layout = tlCenter
      ExplicitHeight = 15
    end
    object Label5: TLabel
      Left = 13
      Top = 16
      Width = 51
      Height = 15
      Caption = 'SortOrder'
    end
    object Label6: TLabel
      Left = 197
      Top = 16
      Width = 26
      Height = 15
      Caption = 'Filter'
    end
    object Label11: TLabel
      Left = 345
      Top = 16
      Width = 112
      Height = 15
      Caption = 'ComparisonOperator'
    end
    object Label12: TLabel
      Left = 491
      Top = 16
      Width = 62
      Height = 15
      Caption = 'Text to filter'
    end
    object Shape1: TShape
      Left = 172
      Top = 6
      Width = 2
      Height = 65
      Pen.Color = clGray
    end
    object cBoxSortOrder: TComboBox
      Left = 11
      Top = 32
      Width = 145
      Height = 23
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Id'
      Items.Strings = (
        'Id'
        'Name'
        'Price'
        'Date')
    end
    object btnRefresh: TBitBtn
      Left = 682
      Top = 30
      Width = 183
      Height = 25
      Caption = 'Refresh with Sort and filter'
      TabOrder = 1
      OnClick = btnRefreshClick
    end
    object cBoxFilter: TComboBox
      Left = 195
      Top = 32
      Width = 145
      Height = 23
      Style = csDropDownList
      ItemIndex = 1
      TabOrder = 2
      Text = 'Name'
      Items.Strings = (
        'Id'
        'Name'
        'Price'
        'Date')
    end
    object edtFilter: TEdit
      Left = 491
      Top = 32
      Width = 185
      Height = 23
      TabOrder = 3
    end
    object cBoxComparisonOperator: TComboBox
      Left = 343
      Top = 32
      Width = 145
      Height = 23
      Style = csDropDownList
      DropDownCount = 15
      TabOrder = 4
    end
  end
  object TMSFNCCloudStellarDataStoreDataSetVCL1: TTMSFNCCloudStellarDataStoreDataSetVCL
    Connection = TMSFNCCloudStellarDataStoreConnection1
    TableID = 345
    ProjectID = '18f702b7-e8ad-4e9d-d2ad-08dd90ebbada'
    SortOrder = <>
    Filter = <
      item
        FieldValue = '0'
      end>
    FieldDefs = <>
    Authentication.Key = 
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWN' +
      'yb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJhY2N' +
      'lc3MtdG9rZW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA' +
      '1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllci10b2tlbiI6IjU5MjQzOWY' +
      '2LThjYjYtNDhiZS0xMzM4LTA4ZGQ5MGZjZGQ4NCIsImh0dHA6Ly9zY2hlbWFzLnh' +
      'tbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGl' +
      'maWVyLXByb2plY3QiOiIxOGY3MDJiNy1lOGFkLTRlOWQtZDJhZC0wOGRkOTBlYmJ' +
      'hZGEiLCJleHAiOjI2OTM3MDE3ODcsImlzcyI6Imh0dHBzOi8vc3RlbGxhcmRzLml' +
      'vIiwiYXVkIjoiaHR0cHM6Ly9hcGkuc3RlbGxhcmRzLmlvIn0.9PLh0iN2ScNckRc' +
      'Bs3axgDxik4Spu5g94xxXzc7WklQ'
    PersistTokens.Key = 'C:\Users\Cesar\Documents\TTMSFNCCloudStellarDataStore.ini'
    PersistTokens.SaveClientID = True
    PersistTokens.SaveSecret = True
    PersistTokens.SaveKey = True
    PersistTokens.SaveCallBack = True
    Left = 592
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = TMSFNCCloudStellarDataStoreDataSetVCL1
    OnStateChange = DataSource1StateChange
    Left = 592
    Top = 150
  end
end
