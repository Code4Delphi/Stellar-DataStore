object MainView: TMainView
  Width = 1236
  Height = 763
  Caption = 'Stellar DataStore'
  OnCreate = WebFormCreate
  object WebGroupBox1: TWebGroupBox
    Left = 0
    Top = 0
    Width = 1236
    Height = 369
    Align = alTop
    BorderColor = clSilver
    Caption = '  Authentication  '
    DesignSize = (
      1236
      369)
    object lbAccessToken: TWebLabel
      Left = 48
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
      Left = 48
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
      Left = 382
      Top = 104
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Secret'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object lbCallbackURL: TWebLabel
      Left = 709
      Top = 104
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Callback URL'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object WebLabel2: TWebLabel
      Left = 44
      Top = 131
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
      Left = 48
      Top = 155
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Project ID'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object WebLabel3: TWebLabel
      Left = 50
      Top = 182
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Table ID'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object lbTableName: TWebLabel
      Left = 382
      Top = 182
      Width = 69
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Table Name'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object rdDirectAccessToken: TWebRadioButton
      Left = 43
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
      Left = 134
      Top = 46
      Width = 1079
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object rdOAuth2: TWebRadioButton
      Left = 43
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
      Left = 134
      Top = 101
      Width = 250
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtSecret: TWebEdit
      Left = 455
      Top = 101
      Width = 250
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtCallbackURL: TWebEdit
      Left = 782
      Top = 101
      Width = 431
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtProjectID: TWebEdit
      Left = 134
      Top = 151
      Width = 1079
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtTableID: TWebEdit
      Left = 134
      Top = 178
      Width = 250
      Height = 22
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      Text = '345'
      WidthPercent = 100.000000000000000000
    end
    object edtTableName: TWebEdit
      Left = 455
      Top = 178
      Width = 758
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object btnConnect: TWebButton
      Left = 50
      Top = 315
      Width = 96
      Height = 25
      Caption = 'Connect'
      ChildOrder = 15
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = btnConnectClick
    end
    object btnDisconnect: TWebButton
      Left = 152
      Top = 315
      Width = 96
      Height = 25
      Caption = 'Disconnect'
      ChildOrder = 15
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = btnDisconnectClick
    end
    object edtTableSelectQuery: TWebEdit
      Left = 50
      Top = 229
      Width = 250
      Height = 22
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      Text = 'id;name'
      WidthPercent = 100.000000000000000000
    end
    object ckTableSelectQuery: TWebCheckBox
      Left = 50
      Top = 209
      Width = 113
      Height = 20
      Caption = 'TableSelectQuery'
      ChildOrder = 21
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object gBoxTableWhereQuery: TWebGroupBox
      Left = 306
      Top = 217
      Width = 362
      Height = 123
      BorderColor = clSilver
      Caption = '                                      '
      ChildOrder = 23
      object WebLabel4: TWebLabel
        Left = 13
        Top = 27
        Width = 25
        Height = 15
        Caption = 'Field'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object WebLabel5: TWebLabel
        Left = 96
        Top = 26
        Width = 53
        Height = 15
        Caption = 'Condition'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object WebLabel6: TWebLabel
        Left = 166
        Top = 26
        Width = 28
        Height = 15
        Caption = 'Value'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object WebLabel7: TWebLabel
        Left = 13
        Top = 67
        Width = 100
        Height = 15
        Caption = 'Complete filtration'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object ckTableWhereQuery: TWebCheckBox
        Left = 7
        Top = 2
        Width = 115
        Height = 22
        Caption = 'TableWhereQuery'
        ChildOrder = 21
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object cBoxTableWhereQueryCondition: TWebComboBox
        Left = 96
        Top = 42
        Width = 70
        Height = 23
        HeightPercent = 100.000000000000000000
        Text = 'like'
        WidthPercent = 100.000000000000000000
        ItemIndex = 6
        Items.Strings = (
          '>'
          '>&equals;'
          '<'
          '<&equals;'
          '&equals;'
          '!&equals;'
          'like'
          'in')
      end
      object edtTableWhereQueryValue: TWebEdit
        Left = 168
        Top = 42
        Width = 135
        Height = 22
        ChildOrder = 2
        HeightPercent = 100.000000000000000000
        Text = '%Test%'
        WidthPercent = 100.000000000000000000
      end
      object btnTableWhereQueryAdd: TWebButton
        Left = 309
        Top = 40
        Width = 42
        Height = 25
        Caption = 'Add'
        ChildOrder = 7
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnTableWhereQueryAddClick
      end
      object edtTableWhereQueryComplete: TWebEdit
        Left = 13
        Top = 84
        Width = 335
        Height = 22
        ChildOrder = 2
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object cBoxTableWhereQueryField: TWebComboBox
        Left = 13
        Top = 43
        Width = 81
        Height = 23
        HeightPercent = 100.000000000000000000
        Style = csDropDown
        Text = 'Name'
        WidthPercent = 100.000000000000000000
        ItemIndex = 1
        Items.Strings = (
          'Id'
          'Name'
          'Price'
          'Date')
      end
    end
    object WebGroupBox2: TWebGroupBox
      Left = 674
      Top = 217
      Width = 319
      Height = 123
      BorderColor = clSilver
      Caption = ' SortOrder '
      ChildOrder = 22
      object WebLabel8: TWebLabel
        Left = 16
        Top = 16
        Width = 51
        Height = 15
        Caption = 'SortOrder'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object WebLabel12: TWebLabel
        Left = 16
        Top = 59
        Width = 74
        Height = 15
        Caption = 'SortOrder ALL'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object cBoxSortOrder: TWebComboBox
        Left = 16
        Top = 32
        Width = 104
        Height = 23
        HeightPercent = 100.000000000000000000
        Style = csDropDown
        Text = 'Id'
        WidthPercent = 100.000000000000000000
        ItemIndex = 0
        Items.Strings = (
          'Id'
          'Name'
          'Price'
          'Date')
      end
      object cBoxSortOrderAscOuDesc: TWebComboBox
        Left = 122
        Top = 32
        Width = 66
        Height = 23
        HeightPercent = 100.000000000000000000
        Text = 'asc'
        WidthPercent = 100.000000000000000000
        ItemIndex = 0
        Items.Strings = (
          'asc'
          'desc')
      end
      object btnSortOrderAdd: TWebButton
        Left = 191
        Top = 32
        Width = 42
        Height = 25
        Caption = 'Add'
        ChildOrder = 7
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnSortOrderAddClick
      end
      object edtSortOrderAll: TWebEdit
        Left = 16
        Top = 74
        Width = 217
        Height = 22
        ChildOrder = 14
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
    end
    object edtTableJoinQuery: TWebEdit
      Left = 50
      Top = 275
      Width = 250
      Height = 22
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      Text = 'products;id_group=groups;id'
      WidthPercent = 100.000000000000000000
    end
    object ckTableJoinQuery: TWebCheckBox
      Left = 50
      Top = 255
      Width = 113
      Height = 20
      Caption = 'TableJoinQuery'
      ChildOrder = 21
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
  end
  object WebPanel1: TWebPanel
    Left = 0
    Top = 736
    Width = 1236
    Height = 27
    Align = alBottom
    ChildOrder = 1
    Padding.Right = 10
    TabOrder = 1
    object WebLabel1: TWebLabel
      Left = 1181
      Top = 0
      Width = 39
      Height = 27
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
      Height = 27
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
    Top = 401
    Width = 1236
    Height = 335
    Align = alClient
    ChildOrder = 2
    TabOrder = 2
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
      Height = 335
      Align = alLeft
      Columns = <>
      DataSource = WebDataSource1
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -12
      FixedFont.Name = 'Segoe UI'
      FixedFont.Style = []
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goFixedRowDefAlign]
      TabOrder = 0
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      ExplicitTop = -6
      ColWidths = (
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
    Top = 369
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
    App.Key = '18f702b7-e8ad-4e9d-d2ad-08dd90ebbada'
    TableName = 'products'
    TableId = 0
    AfterScroll = WebStellarDataStoreClientDataset1AfterScroll
    Left = 480
    Top = 360
  end
  object WebDataSource1: TWebDataSource
    DataSet = WebStellarDataStoreClientDataset1
    OnStateChange = WebDataSource1StateChange
    Left = 480
    Top = 416
  end
end
