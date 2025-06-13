object MainView: TMainView
  Width = 1231
  Height = 745
  Caption = 'Stellar DataStore'
  OnCreate = WebFormCreate
  object WebGroupBox1: TWebGroupBox
    Left = 0
    Top = 0
    Width = 1231
    Height = 373
    Align = alTop
    BorderColor = clSilver
    Caption = '  Authentication  '
    DesignSize = (
      1231
      373)
    object lbAccessToken: TWebLabel
      Left = 32
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
      Left = 32
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
      Left = 377
      Top = 104
      Width = 55
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Secret'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object lbCallbackURL: TWebLabel
      Left = 693
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
      Left = 28
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
      Left = 32
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
      Left = 34
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
      Left = 367
      Top = 182
      Width = 65
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Table Name'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object btnConnect: TWebButton
      Left = 27
      Top = 329
      Width = 96
      Height = 25
      Caption = 'Connect'
      ChildOrder = 15
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = btnConnectClick
    end
    object btnDisconnect: TWebButton
      Left = 129
      Top = 329
      Width = 96
      Height = 25
      Caption = 'Disconnect'
      ChildOrder = 15
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = btnDisconnectClick
    end
    object rdDirectAccessToken: TWebRadioButton
      Left = 27
      Top = 20
      Width = 155
      Height = 22
      Caption = 'Direct access token'
      Checked = True
      ChildOrder = 10
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
      Left = 118
      Top = 46
      Width = 1086
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object rdOAuth2: TWebRadioButton
      Left = 27
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
      Left = 118
      Top = 101
      Width = 244
      Height = 22
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtSecret: TWebEdit
      Left = 437
      Top = 101
      Width = 250
      Height = 22
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtCallbackURL: TWebEdit
      Left = 766
      Top = 101
      Width = 438
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtProjectID: TWebEdit
      Left = 118
      Top = 151
      Width = 1086
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtTableID: TWebEdit
      Left = 118
      Top = 178
      Width = 244
      Height = 22
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtTableName: TWebEdit
      Left = 439
      Top = 178
      Width = 765
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object WebGroupBox2: TWebGroupBox
      Left = 28
      Top = 203
      Width = 247
      Height = 120
      BorderColor = clSilver
      Caption = ' SortOrder '
      ChildOrder = 22
      object WebLabel8: TWebLabel
        Left = 16
        Top = 27
        Width = 51
        Height = 15
        Caption = 'SortOrder'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object WebLabel12: TWebLabel
        Left = 16
        Top = 67
        Width = 74
        Height = 15
        Caption = 'SortOrder ALL'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object cBoxSortOrder: TWebComboBox
        Left = 16
        Top = 43
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
        Top = 43
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
        Left = 194
        Top = 43
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
        Top = 84
        Width = 217
        Height = 22
        ChildOrder = 14
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
    end
    object ckTableSelectQuery: TWebCheckBox
      Left = 649
      Top = 208
      Width = 115
      Height = 20
      Caption = 'TableSelectQuery'
      ChildOrder = 21
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtTableSelectQuery: TWebEdit
      Left = 649
      Top = 228
      Width = 250
      Height = 22
      ChildOrder = 2
      HeightPercent = 100.000000000000000000
      Text = 'id;Date'
      WidthPercent = 100.000000000000000000
    end
    object gBoxTableWhereQuery: TWebGroupBox
      Left = 281
      Top = 203
      Width = 362
      Height = 120
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
        Top = 4
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
    object ckTableJoinQuery: TWebCheckBox
      Left = 649
      Top = 275
      Width = 105
      Height = 22
      Caption = 'TableJoinQuery'
      ChildOrder = 23
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object edtTableJoinQuery: TWebEdit
      Left = 649
      Top = 297
      Width = 240
      Height = 22
      ChildOrder = 24
      HeightPercent = 100.000000000000000000
      Text = 'products;id_group=groups;id'
      WidthPercent = 100.000000000000000000
    end
  end
  object WebPanel1: TWebPanel
    Left = 0
    Top = 672
    Width = 1231
    Height = 73
    Align = alBottom
    ChildOrder = 1
    Padding.Right = 10
    TabOrder = 1
    object WebLabel1: TWebLabel
      Left = 1176
      Top = 0
      Width = 39
      Height = 73
      Align = alRight
      Caption = 'Count: '
      HeightPercent = 100.000000000000000000
      Layout = tlCenter
      WidthPercent = 100.000000000000000000
      ExplicitHeight = 15
    end
    object lbCount: TWebLabel
      Left = 1215
      Top = 0
      Width = 6
      Height = 73
      Align = alRight
      Caption = '0'
      HeightPercent = 100.000000000000000000
      Layout = tlCenter
      WidthPercent = 100.000000000000000000
      ExplicitHeight = 15
    end
    object gBoxPagination: TWebGroupBox
      Left = 0
      Top = 0
      Width = 445
      Height = 73
      Align = alLeft
      BorderColor = clSilver
      Caption = ' Pagination '
      ChildOrder = 8
      object lbPagination: TWebLabel
        Left = 187
        Top = 30
        Width = 67
        Height = 15
        Caption = 'lbPagination'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object lbPaginationCount: TWebLabel
        Left = 187
        Top = 46
        Width = 100
        Height = 15
        Caption = 'lbPaginationCount'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object WebLabel9: TWebLabel
        Left = 8
        Top = 17
        Width = 59
        Height = 15
        Caption = 'Take (limit)'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object btnPrevious: TWebButton
        Left = 85
        Top = 33
        Width = 96
        Height = 25
        Cursor = crHandPoint
        Caption = 'Previous'
        ChildOrder = 8
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnPreviousClick
      end
      object btnNext: TWebButton
        Left = 336
        Top = 33
        Width = 96
        Height = 25
        Cursor = crHandPoint
        Caption = 'Next'
        ChildOrder = 8
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnNextClick
      end
      object edtTakeLimit: TWebEdit
        Left = 8
        Top = 34
        Width = 73
        Height = 22
        ChildOrder = 4
        HeightPercent = 100.000000000000000000
        Text = '5'
        WidthPercent = 100.000000000000000000
        OnChange = edtTakeLimitChange
        OnExit = edtTakeLimitExit
      end
    end
  end
  object WebPanel2: TWebPanel
    Left = 0
    Top = 405
    Width = 1231
    Height = 267
    Align = alClient
    ChildOrder = 2
    TabOrder = 2
    DesignSize = (
      1231
      267)
    object WebImageControl1: TWebImageControl
      Left = 974
      Top = 111
      Width = 249
      Height = 162
      WidthStyle = ssAuto
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      ChildOrder = 2
    end
    object WebDBGrid1: TWebDBGrid
      Left = 0
      Top = 0
      Width = 968
      Height = 267
      Cursor = crHandPoint
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
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goFixedRowDefAlign]
      TabOrder = 0
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      ExplicitTop = 6
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
      Height = 102
      Caption = 'Choose a file'
      ChildOrder = 3
      DragCaption = 'or drag it here'
      OnDroppedFiles = WebFileUpload1DroppedFiles
      OnGetFileAsArrayBuffer = WebFileUpload1GetFileAsArrayBuffer
    end
    object btnClearImage: TWebButton
      Left = 974
      Top = 236
      Width = 248
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Clear image'
      ChildOrder = 3
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = btnClearImageClick
    end
  end
  object WebDBNavigator1: TWebDBNavigator
    Left = 0
    Top = 373
    Width = 1231
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
    Left = 480
    Top = 432
  end
  object WebDataSource1: TWebDataSource
    DataSet = WebStellarDataStoreClientDataset1
    OnStateChange = WebDataSource1StateChange
    Left = 480
    Top = 496
  end
  object DatasetCount: TWebStellarDataStoreClientDataset
    TableId = 0
    Left = 656
    Top = 437
  end
end
