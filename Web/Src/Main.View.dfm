object MainView: TMainView
  Width = 1236
  Height = 763
  Caption = 'Stellar DataStore'
  OnCreate = WebFormCreate
  object WebGroupBox1: TWebGroupBox
    Left = 0
    Top = 0
    Width = 1236
    Height = 292
    Align = alTop
    BorderColor = clSilver
    Caption = '  Authentication  '
    DesignSize = (
      1236
      292)
    object lbAccessToken: TWebLabel
      Left = 23
      Top = 48
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Access token'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object lbClientID: TWebLabel
      Left = 23
      Top = 104
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Client ID'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object lbSecret: TWebLabel
      Left = 23
      Top = 129
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Secret'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object lbCallbackURL: TWebLabel
      Left = 23
      Top = 154
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Callback URL'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object WebLabel2: TWebLabel
      Left = 23
      Top = 179
      Width = 38
      Height = 15
      Caption = 'Others'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      HeightPercent = 100.000000000000000000
      ParentFont = False
      WidthPercent = 100.000000000000000000
    end
    object lbProjectID: TWebLabel
      Left = 23
      Top = 202
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Project ID'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object lbTableName: TWebLabel
      Left = 23
      Top = 227
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Table Name'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object rdDirectAccessToken: TWebRadioButton
      Left = 22
      Top = 20
      Width = 155
      Height = 22
      Caption = 'Direct access token'
      Checked = True
      Color = clNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      HeightPercent = 100.000000000000000000
      ParentFont = False
      WidthPercent = 100.000000000000000000
      OnClick = rdDirectAccessTokenClick
    end
    object edtAccessToken: TWebEdit
      Left = 98
      Top = 48
      Width = 1104
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object rdOAuth2: TWebRadioButton
      Left = 22
      Top = 76
      Width = 129
      Height = 22
      Caption = 'OAuth2.0 access'
      Checked = False
      ChildOrder = 3
      Color = clNone
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      HeightPercent = 100.000000000000000000
      ParentFont = False
      WidthPercent = 100.000000000000000000
      OnClick = rdOAuth2Click
    end
    object edtClientID: TWebEdit
      Left = 100
      Top = 101
      Width = 1104
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtSecret: TWebEdit
      Left = 100
      Top = 126
      Width = 1104
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtCallbackURL: TWebEdit
      Left = 100
      Top = 151
      Width = 1104
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtProjectID: TWebEdit
      Left = 100
      Top = 199
      Width = 1104
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtTableName: TWebEdit
      Left = 100
      Top = 224
      Width = 1104
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      Text = 'products'
      WidthPercent = 100.000000000000000000
    end
    object btnConnect: TWebButton
      Left = 99
      Top = 252
      Width = 96
      Height = 25
      Caption = 'Connect'
      ChildOrder = 15
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = btnConnectClick
    end
    object btnDisconnect: TWebButton
      Left = 198
      Top = 252
      Width = 96
      Height = 25
      Caption = 'Disconnect'
      ChildOrder = 15
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = btnDisconnectClick
    end
  end
  object WebPanel1: TWebPanel
    Left = 0
    Top = 737
    Width = 1236
    Height = 26
    Align = alBottom
    ChildOrder = 1
    Padding.Right = 10
    TabOrder = 1
    ExplicitTop = 710
    object WebLabel1: TWebLabel
      Left = 1181
      Top = 0
      Width = 39
      Height = 26
      Align = alRight
      Caption = 'Count: '
      HeightPercent = 100.000000000000000000
      Layout = tlCenter
      WidthPercent = 100.000000000000000000
      ExplicitHeight = 15
    end
    object lbCount: TWebLabel
      Left = 1220
      Top = 0
      Width = 6
      Height = 26
      Align = alRight
      Caption = '0'
      HeightPercent = 100.000000000000000000
      Layout = tlCenter
      WidthPercent = 100.000000000000000000
      ExplicitHeight = 15
    end
  end
  object WebPanel2: TWebPanel
    Left = 0
    Top = 324
    Width = 1236
    Height = 413
    Align = alClient
    ChildOrder = 2
    TabOrder = 2
    ExplicitHeight = 386
    object WebImageControl1: TWebImageControl
      Left = 977
      Top = 179
      Width = 249
      Height = 201
      WidthStyle = ssAuto
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      ChildOrder = 2
    end
    object WebDBGrid1: TWebDBGrid
      Left = 0
      Top = 0
      Width = 968
      Height = 413
      Align = alLeft
      Columns = <
        item
        end
        item
        end
        item
        end
        item
        end>
      DataSource = WebDataSource1
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -12
      FixedFont.Name = 'Segoe UI'
      FixedFont.Style = []
      FixedCols = 1
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
      TabOrder = 0
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      ColWidths = (
        24
        64
        64
        64
        64)
    end
    object WebFileUpload1: TWebFileUpload
      Left = 974
      Top = 3
      Width = 249
      Height = 170
      Caption = 'Choose a file'
      ChildOrder = 3
      DragCaption = 'or drag it here'
      OnDroppedFiles = WebFileUpload1DroppedFiles
      OnGetFileAsArrayBuffer = WebFileUpload1GetFileAsArrayBuffer
    end
    object btnClearImage: TWebButton
      Left = 977
      Top = 385
      Width = 248
      Height = 25
      Caption = 'Clear image'
      ChildOrder = 3
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = btnClearImageClick
    end
  end
  object WebDBNavigator1: TWebDBNavigator
    Left = 0
    Top = 292
    Width = 1236
    Height = 32
    Align = alTop
    DataSource = WebDataSource1
    Hints.Strings = (
      'First'
      'Prior'
      'Next'
      'Last'
      'Edit'
      'Post'
      'Insert'
      'Delete'
      'Cancel')
  end
  object WebStellarDataStoreClientDataset1: TWebStellarDataStoreClientDataset
    TableId = 0
    AfterScroll = WebStellarDataStoreClientDataset1AfterScroll
    Left = 560
    Top = 248
  end
  object WebDataSource1: TWebDataSource
    DataSet = WebStellarDataStoreClientDataset1
    OnStateChange = WebDataSource1StateChange
    Left = 544
    Top = 312
  end
end
