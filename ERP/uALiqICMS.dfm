inherited frmALiqICMS: TfrmALiqICMS
  Caption = 'Aliquotas de ICMS'
  ClientHeight = 492
  ClientWidth = 834
  Position = poDesigned
  WindowState = wsMaximized
  ExplicitWidth = 850
  ExplicitHeight = 531
  PixelsPerInch = 96
  TextHeight = 13
  object lblPos: TLabel
    Left = 0
    Top = 437
    Width = 834
    Height = 14
    Align = alBottom
    Caption = 'lblPos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
    ExplicitTop = 415
    ExplicitWidth = 30
  end
  object GridICMS: TcxDBPivotGrid
    Tag = 99
    Left = 25
    Top = 23
    Width = 809
    Height = 414
    Hint = 'Duplo clique na celula que deseja alterar'
    Align = alClient
    DataSource = DataICMS
    Groups = <>
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
    OptionsBehavior.FocusCellOnTab = True
    OptionsCustomize.Filtering = False
    OptionsCustomize.FilterResizable = False
    OptionsCustomize.Hiding = False
    OptionsCustomize.Moving = False
    OptionsCustomize.QuickCustomization = False
    OptionsCustomize.QuickPrefiltering = False
    OptionsCustomize.Sizing = False
    OptionsCustomize.Sorting = False
    OptionsDataField.Area = dfaRow
    OptionsView.ColumnFields = False
    OptionsView.ColumnGrandTotals = False
    OptionsView.ColumnTotals = False
    OptionsView.ColumnTotalsLocation = tlNear
    OptionsView.DataFields = False
    OptionsView.FilterFields = False
    OptionsView.FilterSeparator = False
    OptionsView.RowFields = False
    OptionsView.RowGrandTotals = False
    OptionsView.RowTotals = False
    ShowHint = True
    Styles.Content = DMConexao.Inativo
    Styles.Selected = DMConexao.Selecionado
    TabOrder = 0
    OnClick = GridICMSClick
    OnDblClick = GridICMSDblClick
    object cxDBPivotGrid1ALIQICMS: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Al'#237'quota'
      DataBinding.FieldName = 'ALIQICMS'
      PropertiesClassName = 'TcxCalcEditProperties'
      Properties.ImmediatePost = True
      Visible = True
      Width = 50
    end
    object cxDBPivotGrid1UFORIGEM: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Origem'
      DataBinding.FieldName = 'UFORIGEM'
      Visible = True
      Width = 50
    end
    object cxDBPivotGrid1UFDESTINO: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Destino'
      DataBinding.FieldName = 'UFDESTINO'
      Visible = True
      Width = 50
    end
  end
  object cxLabel1: TcxLabel
    Left = 0
    Top = 23
    Align = alLeft
    Caption = 'Origem'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.TextStyle = []
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taLeftJustify
    Properties.Alignment.Vert = taVCenter
    Properties.Angle = 90
    Properties.Orientation = cxoBottom
    AnchorY = 230
  end
  object cxLabel2: TcxLabel
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Destino'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taCenter
    AnchorX = 417
  end
  object Panel1: TPanel
    Left = 0
    Top = 451
    Width = 834
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
  end
  object DataICMS: TDataSource
    DataSet = CdsICMS
    Left = 272
    Top = 312
  end
  object CdsICMS: TpFIBClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = CdsICMSAfterPost
    Left = 408
    Top = 248
  end
end
