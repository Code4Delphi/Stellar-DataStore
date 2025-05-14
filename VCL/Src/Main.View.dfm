object MainView: TMainView
  Left = 0
  Top = 0
  Caption = 'MainView'
  ClientHeight = 656
  ClientWidth = 782
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
    Top = 339
    Width = 782
    Height = 291
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 780
      Height = 289
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
    Width = 782
    Height = 305
    Align = alTop
    Caption = ' Authentication '
    TabOrder = 1
    DesignSize = (
      782
      305)
    object Label1: TLabel
      Left = 24
      Top = 104
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Client ID'
    end
    object Label2: TLabel
      Left = 24
      Top = 130
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Secret'
    end
    object Label3: TLabel
      Left = 24
      Top = 157
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Callback URL'
    end
    object Label4: TLabel
      Left = 24
      Top = 213
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Project ID'
    end
    object Label5: TLabel
      Left = 24
      Top = 80
      Width = 91
      Height = 15
      Caption = 'OAuth2.0 access'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 24
      Top = 21
      Width = 109
      Height = 15
      Caption = 'Direct access token'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
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
      Top = 193
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
      Top = 240
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Table name'
    end
    object edtAccessToken: TEdit
      Left = 99
      Top = 39
      Width = 657
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object edtClientID: TEdit
      Left = 99
      Top = 100
      Width = 657
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edtSecret: TEdit
      Left = 99
      Top = 127
      Width = 657
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object edtCallbackURL: TEdit
      Left = 99
      Top = 154
      Width = 657
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object edtProjectID: TEdit
      Left = 99
      Top = 210
      Width = 657
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
    end
    object btnConnect: TButton
      Left = 99
      Top = 266
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Connect'
      TabOrder = 5
      OnClick = btnConnectClick
    end
    object btnDisconnect: TButton
      Left = 180
      Top = 266
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
      Top = 237
      Width = 657
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 305
    Width = 782
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
    Top = 630
    Width = 782
    Height = 26
    Align = alBottom
    Padding.Right = 10
    TabOrder = 4
    ExplicitTop = 635
    object lbCount: TLabel
      Left = 765
      Top = 1
      Width = 6
      Height = 24
      Align = alRight
      Caption = '0'
      Layout = tlCenter
      ExplicitLeft = 769
      ExplicitHeight = 15
    end
    object Label10: TLabel
      Left = 726
      Top = 1
      Width = 39
      Height = 24
      Align = alRight
      Caption = 'Count: '
      Layout = tlCenter
      ExplicitLeft = 380
      ExplicitTop = -15
    end
  end
  object TMSFNCCloudStellarDataStoreDataSetVCL1: TTMSFNCCloudStellarDataStoreDataSetVCL
    Connection = TMSFNCCloudStellarDataStoreConnection1
    TableID = -1
    SortOrder = <>
    Filter = <>
    FieldDefs = <>
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
