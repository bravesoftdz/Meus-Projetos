unit uPesquisa_kimera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormPadrao, ExtCtrls, cxPC, cxControls, StdCtrls, Buttons, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, DBClient, cxContainer, cxListBox,
  Contnrs, MinhasClasses, Mask, StrUtils, EditPesquisa, DBCtrls, cxTL,
  cxInplaceContainer, cxTLData, cxDBTL, Menus, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxPropertiesStore, cxMaskEdit, JvExControls, JvLabel,
  pFIBClientDataSet, cxTLdxBarBuiltInMenu, cxLookAndFeels,
  cxLookAndFeelPainters,
  LabelDBEdit, FIBDataSet, pFIBDataSet, cxExtEditRepositoryItems,
  cxEditRepositoryItems, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TTypeShow = (tsCampoPesquisa, tsMostraGrid, tsCampoPesquisaGrid);


  TCampoPesquisa = class(TComponent)
  private
    FDescricao: String;
    FNomeCampo: String;
    FTipoCampo: TTipoCampo;
    FTamanho: Integer;
    FTypeShow: TTypeShow;
    RepositoryItem: TcxEditRepositoryItem;
    FCampoProcura: String;
  published
    constructor Create(AOwner: TComponent); override;
    property TipoCampo: TTipoCampo read FTipoCampo write FTipoCampo;
    property NomeCampo: String read FNomeCampo write FNomeCampo;
    property Descricao: String read FDescricao write FDescricao;
    property Tamanho: Integer read FTamanho write FTamanho;
    property TypeShow: TTypeShow read FTypeShow write FTypeShow;
    Property CampoProcura: String read FCampoProcura write FCampoProcura;
  end;

  TListaCampoPesquisa = class(TObjectList)
  private
    function GetItems(Index: Integer): TCampoPesquisa;
    procedure SetItems(Index: Integer; const Value: TCampoPesquisa);
  public
    constructor Create;
    property Items[Index: Integer]: TCampoPesquisa read GetItems write SetItems;
    Function Add(aCampoPesquisa: TCampoPesquisa): Integer; overload;
    Function Add(aDescricao, aNomeCampo: String; aTipoCampo: TTipoCampo;
      aTypeShow: TTypeShow; aTamanho: Integer = 70;
      aRepositoryItem: TcxEditRepositoryItem = nil; aCampoProcura: String = '')
      : Integer; overload;
    Procedure Delete(Index: Integer);
  published

  end;

  TfrmPesquisa = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl: TcxPageControl;
    tsGrid: TcxTabSheet;
    Panel3: TPanel;
    btnCancelar: TBitBtn;
    btnOk: TBitBtn;
    DataPesquisa: TDataSource;
    GroupBox1: TGroupBox;
    lstCampos: TcxListBox;
    GroupBox2: TGroupBox;
    grpOpcaoPesquisa: TRadioGroup;
    ChkTempoReal: TCheckBox;
    Panel5: TPanel;
    btnPesquisar: TBitBtn;
    lblTituloPesquisa: TLabel;
    edtPesquisa: TMaskEdit;
    Panel6: TPanel;
    lblRegistros: TLabel;
    TsTree: TcxTabSheet;
    Cenario: TcxPropertiesStore;
    TvTree: TcxDBTreeList;
    cxGrid1: TcxGrid;
    TvPesquisa: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel4: TPanel;
    chkGrupo: TCheckBox;
    lblTIpoPesquisa: TJvLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cdsPesquisa: TpFIBDataSet;
    cxEditRepository: TcxEditRepository;
    ColorComboBox: TcxEditRepositoryColorComboBox;
    Imagem: TcxEditRepositoryImageItem;
    Blob: TcxEditRepositoryBlobItem;
    procedure FormCreate(Sender: TObject);
    procedure lstCamposClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CdsPesquisa_AfterScroll(DataSet: TDataSet);
    procedure btnOkClick(Sender: TObject);
    procedure TvPesquisaCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TvTreeDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkGrupoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cdsPesquisaAfterScroll(DataSet: TDataSet);
  private
    FTipoPesquisa: TTipoPesquisa;
    FTitulo: String;
    ConteudoPesquisa: String;
    FTipoForm: TTipoFormBasico;
    FWhere: String;
    FPermiteSintetico: Boolean;
    FAbreListando: Boolean;
    procedure SetTipoPesquisa(const Value: TTipoPesquisa);
    procedure SetTitulo(const Value: String);
    procedure ProcessaCampo(Const CampoPesquisa: TListaCampoPesquisa);
    procedure CriaCampoTree(Campo, Titulo: String; Tamanho: Integer = 90);
    procedure SetTipoForm(const Value: TTipoFormBasico);
    procedure SalvarCenario;
    procedure CarregarCenario;
    Procedure CdsPesquisaAfterOpen(DataSet: TDataSet);
    { Private declarations }
  public
    { Public declarations }
    property TipoPesquisa: TTipoPesquisa read FTipoPesquisa write
      SetTipoPesquisa;
    property Titulo: String read FTitulo write SetTitulo;
    property TipoForm: TTipoFormBasico read FTipoForm write SetTipoForm;
    property Where: String read FWhere write FWhere;
    property PermiteSintetico
      : Boolean read FPermiteSintetico write FPermiteSintetico default False;
    Property AbreListando: Boolean read FAbreListando write FAbreListando;
  end;

var
  frmPesquisa: TfrmPesquisa;
  Campos: TListaCampoPesquisa;

implementation

uses uDMConexao, Comandos, uSQL;
{$R *.dfm}

procedure TfrmPesquisa.btnOkClick(Sender: TObject);
var
  Camp: String;
begin
  inherited;
  if cdsPesquisa.IsEmpty then
    ModalResult := mrCancel
  else
  Begin
    Camp := InfoSistema.SQLs.GetMySQL(TipoPesquisa, '').CampoSintetico;
    if Camp <> '' then
      if (not FPermiteSintetico) and
        ((cdsPesquisa.FieldByName(Camp).AsString = '') or
          (cdsPesquisa.FieldByName(Camp).AsString = 'S')) then
      Begin
        Avisa('N�o � poss�vel selecionar um registro sint�tico!');
        Abort;
      End;
    ModalResult := mrOk;
  End;
end;

procedure TfrmPesquisa.btnPesquisarClick(Sender: TObject);
var
  StrSQL, Wh: String;
  i: Integer;
  Function GetConteudo: String;
  var
    x: Integer;
  Begin
    case (lstCampos.Items.Objects[lstCampos.ItemIndex] as TCampoPesquisa)
      .TipoCampo of
      tcString, tcLogico:
        Result := edtPesquisa.Text;
      tcReal, tcMoeda, tcInt:
        Result := edtPesquisa.Text;
      tcCampoData:
        Begin
          if true {edtPesquisa.Text <> ''} then
          Begin
            if not isDate(edtPesquisa.Text) Then
              Result := 'null' //'100'
            else
              Result := GetData(edtPesquisa.Text, False);
          End;
        End;
      tcHora:
        Result := GetTime(edtPesquisa.Text, False);
      tcCEP, tcCNPJ, tcCPF:
        Begin
          if Trim(edtPesquisa.Text) <> '' then
          Begin
            Result := edtPesquisa.Text;
            Result := StringReplace(Result, '/', '', [rfReplaceAll]);
            Result := StringReplace(Result, '\', '', [rfReplaceAll]);
            Result := StringReplace(Result, '-', '', [rfReplaceAll]);
          End;
          { for x := 1 to Length(edtPesquisa.Text) do
            if not (edtPesquisa.Text[x] in ['/','\','-']) then
            Result := Result+edtPesquisa.Text[x]; }
        End;
    end;
  End;

  Function GetCondicao: String;
  var
    Campo: String;
  Begin
    Campo := (lstCampos.Items.Objects[lstCampos.ItemIndex] as TCampoPesquisa)
      .CampoProcura;
    if Campo = '' then
      Campo := (lstCampos.Items.Objects[lstCampos.ItemIndex] as TCampoPesquisa)
        .NomeCampo;
    case grpOpcaoPesquisa.ItemIndex of
      0:
        Begin
          Result := Campo + ' CONTAINING ' + QuotedStr(GetConteudo);
        End;
      1:
        Begin
          Result := Campo + ' like ' + QuotedStr(GetConteudo + '%');
        End;
      2:
        Begin
          Result := Campo + ' = ' + QuotedStr(GetConteudo);
        End;
    end;
  End;

begin
  Application.ProcessMessages;
  if btnPesquisar.Tag = 0 then
  Begin
    ConteudoPesquisa := edtPesquisa.Text;
    btnPesquisar.Tag := 1;
  End
  else
  Begin
    if ConteudoPesquisa <> edtPesquisa.Text then
    Begin
      btnPesquisar.Tag := 0;
      ConteudoPesquisa := edtPesquisa.Text;
    End;

    if (ConteudoPesquisa = edtPesquisa.Text) and (btnPesquisar.Tag = 1) and
      (not ChkTempoReal.Checked) then
    Begin
      btnOkClick(nil);
      Exit;
    End;

  End;

  if lstCampos.ItemIndex = 0 then
  Begin
    Try
      LockWindowUpdate(Handle);
      for i := 1 to lstCampos.Items.Count - 1 do
      Begin
        lstCampos.ItemIndex := i;
        StrSQL := StrSQL + IfThen(StrSQL <> '', ' or ', '') + GetCondicao;
      End;
      StrSQL := '(' + StrSQL + ')';
    Finally
      lstCampos.ItemIndex := 0;
      LockWindowUpdate(0);
    End;

  End
  else
    StrSQL := GetCondicao;
  StrSQL := StrSQL + IfThen(Where <> '', ' AND ' + Where, '');
  Try
    cdsPesquisa.DisableScrollEvents;
    cdsPesquisa.DisableControls;
    cdsPesquisa.Close;
    cdsPesquisa.SelectSQL.Text := GetSelect(TipoPesquisa, StrSQL);
    cdsPesquisa.Prepare;
    cdsPesquisa.Open;
    cdsPesquisa.FetchAll;
  finally
    cdsPesquisa.EnableControls;
    cdsPesquisa.EnableScrollEvents;
  end;
  if cdsPesquisa.IsEmpty then
  Begin
    Avisa('N�o foi encontrado nenhum registro!');
    if ChkTempoReal.Checked then
      edtPesquisa.Clear;
  End;

  if TipoForm = tfTree then
  Begin
    TvTree.BeginUpdate;
    TvTree.FullExpand;
    TvTree.EndUpdate;
  End;

end;

procedure TfrmPesquisa.CarregarCenario;
var
  StrSQL: String;
  CdsOpen: TClientDataSet;
begin
  // Cenario.Active := True;
  // Try
  // CdsOpen := TClientDataSet.Create(Self);
  // StrSQL :=
  // 'select cenario '+
  // '  from usuariocenario '+
  // ' where idusuario = '+IntToStr(UsuarioLogado.Id)+
  // '   and idform  = '+VartoStr(TIdForm(idFrmPesquisa)) ;
  // Setcds(CdsOpen, StrSQL);
  // if not CdsOpen.IsEmpty  then
  // Begin
  // TBlobField(CdsOpen.Fields[0]).SaveToFile(ExtractFilePath(Application.ExeName)+'Cenario.ini');
  // Cenario.RestoreFrom;
  // TvPesquisa.RestoreFromIniFile(ExtractFilePath(Application.ExeName)+'Cenario.ini');
  // End;
  // chkGrupoClick(nil);
  // Finally
  // if FileExists(ExtractFilePath(Application.ExeName)+'Cenario.ini') then
  // DeleteFile(ExtractFilePath(Application.ExeName)+'Cenario.ini');
  // FreeAndNil(CdsOpen);
  // End;

end;

procedure TfrmPesquisa.CdsPesquisaAfterOpen(DataSet: TDataSet);
var
  i, r: Integer;
begin
  for i := 0 to cdsPesquisa.FieldCount - 1 do
  Begin
    for r := 0 to Campos.Count - 1 do
    Begin
      if cdsPesquisa.Fields[i].FieldName = Campos.Items[r].NomeCampo then
        FormataMascara(cdsPesquisa.Fields[i], Campos.Items[r].TipoCampo);
    End;

  End;
end;

procedure TfrmPesquisa.CdsPesquisa_AfterScroll(DataSet: TDataSet);
begin
  inherited;
  // if not CdsPesquisa.IsEmpty then
  // lblRegistros.Caption := 'Registro '+IntToStr(CdsPesquisa.RecNo) + ' de '+ IntToStr(CdsPesquisa.RecordCount)
  // else
  // lblRegistros.Caption := '';
  //
end;

procedure TfrmPesquisa.chkGrupoClick(Sender: TObject);
begin
  inherited;
  TvPesquisa.OptionsView.GroupByBox := chkGrupo.Checked;
end;

procedure TfrmPesquisa.CriaCampoTree(Campo, Titulo: String; Tamanho: Integer);
begin
  MontaTree(TvTree, Campo, Titulo, Tamanho);
end;

procedure TfrmPesquisa.cdsPesquisaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not cdsPesquisa.IsEmpty then
    lblRegistros.Caption := 'Registro ' + IntToStr(cdsPesquisa.RecNo)
      + ' de ' + IntToStr(cdsPesquisa.RecordCount)
  else
    lblRegistros.Caption := '';

end;

procedure TfrmPesquisa.edtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ChkTempoReal.Checked then
    if Length(edtPesquisa.Text) >= 3 then
      btnPesquisarClick(nil);

end;

procedure TfrmPesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SalvarCenario;
end;

procedure TfrmPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  PageControl.HideTabs := True;
  Campos := TListaCampoPesquisa.Create;
  TipoForm := TfGrid;
  lblRegistros.Caption := '';
end;

procedure TfrmPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2:
      lstCampos.SetFocus;
    VK_F6:
      ChkTempoReal.Checked := not ChkTempoReal.Checked;
    VK_F9:
      btnOkClick(nil);
    VK_RETURN:
      Begin
        btnPesquisarClick(nil);
        Key := 0;
      End;
    VK_UP:
      Begin
        if (ssCtrl in Shift) then
          TvPesquisa.DataController.GotoFirst
        else
          TvPesquisa.DataController.GotoPrev;
        Key := 0;
      End;
    VK_DOWN:
      Begin
        if (ssCtrl in Shift) then
          TvPesquisa.DataController.GotoLast
        else
          TvPesquisa.DataController.GotoNext;
        Key := 0;
      End;

  end;
  inherited;

end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
begin
  inherited;
  lstCampos.ItemIndex := 0;
  lstCamposClick(nil);
  lblRegistros.Caption := '';
  CarregarCenario;
  cdsPesquisa.AfterOpen := CdsPesquisaAfterOpen;
  if FAbreListando then
    btnPesquisarClick(nil);
end;

{ TCampoPesquisa }

constructor TCampoPesquisa.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  TipoCampo := tcString;
end;

{ TListaCampoPesquisa }

function TListaCampoPesquisa.Add(aCampoPesquisa: TCampoPesquisa): Integer;
begin
  Result := inherited Add(aCampoPesquisa);

end;

function TListaCampoPesquisa.Add(aDescricao, aNomeCampo: String;
  aTipoCampo: TTipoCampo; aTypeShow: TTypeShow; aTamanho: Integer = 70;
  aRepositoryItem: TcxEditRepositoryItem = nil; aCampoProcura: String = '')
  : Integer;
var
  CampoPesquisa: TCampoPesquisa;
begin
  CampoPesquisa := TCampoPesquisa.Create(Application);
  with CampoPesquisa do
  Begin
    Descricao := aDescricao;
    NomeCampo := aNomeCampo;
    TipoCampo := aTipoCampo;
    TypeShow := aTypeShow;
    Tamanho := aTamanho;
    RepositoryItem := aRepositoryItem;
    CampoProcura := aCampoProcura;
  End;
  Result := Add(CampoPesquisa);
end;

constructor TListaCampoPesquisa.Create;
begin
  inherited Create(True);

end;

procedure TListaCampoPesquisa.Delete(Index: Integer);
begin
  inherited Delete(Index);
end;

function TListaCampoPesquisa.GetItems(Index: Integer): TCampoPesquisa;
begin
  Result := inherited Items[Index] as TCampoPesquisa;
end;

procedure TListaCampoPesquisa.SetItems(Index: Integer;
  const Value: TCampoPesquisa);
begin
  Inherited Items[Index] := Value;
end;

procedure TfrmPesquisa.lstCamposClick(Sender: TObject);
begin
  inherited;
  if (lstCampos.Items.Objects[lstCampos.ItemIndex] as TCampoPesquisa)
    <> nil then
  Begin
    lblTituloPesquisa.Caption :=
      (lstCampos.Items.Objects[lstCampos.ItemIndex] as TCampoPesquisa)
      .Descricao;
    FormataMascara(edtPesquisa, (lstCampos.Items.Objects[lstCampos.ItemIndex]
          as TCampoPesquisa).TipoCampo);
    if (lstCampos.Items.Objects[lstCampos.ItemIndex] as TCampoPesquisa)
      .TipoCampo in [tcCampoData, tcHora] then
      grpOpcaoPesquisa.Controls[0].Enabled := False
    else
    Begin
      grpOpcaoPesquisa.Controls[0].Enabled := True;
      lblTituloPesquisa.Caption := lstCampos.Items[lstCampos.ItemIndex];
      edtPesquisa.EditMask := '';
    End;
  End
  else
  Begin
    grpOpcaoPesquisa.Controls[0].Enabled := True;
    lblTituloPesquisa.Caption := lstCampos.Items[lstCampos.ItemIndex];
    edtPesquisa.EditMask := '';
  End;
  edtPesquisa.SetFocus;
end;

procedure TfrmPesquisa.ProcessaCampo(const CampoPesquisa: TListaCampoPesquisa);
var
  i: Integer;
  Function GetNomeCampo(NomeOriginal: String): String;
  var
    x: Integer;
  Begin
    x := Pos('.', NomeOriginal);
    if x <> 0 then
      Result := Trim(copy(NomeOriginal, x + 1, Length(NomeOriginal)))
    else
      Result := NomeOriginal;
  end;

begin
  lstCampos.Items.Add('Pesquisa r�pida');
  for i := 0 to CampoPesquisa.Count - 1 do
  Begin
    case CampoPesquisa.Items[i].TypeShow of
      tsCampoPesquisa:
        Begin
          lstCampos.AddItem(CampoPesquisa.Items[i].Descricao,
            CampoPesquisa.Items[i]);
        End;

      tsCampoPesquisaGrid:
        Begin
          if TipoForm = TfGrid then
          Begin
            MontaGrid(TvPesquisa, GetNomeCampo(CampoPesquisa.Items[i].NomeCampo)
                , CampoPesquisa.Items[i].Descricao,
              CampoPesquisa.Items[i].TipoCampo, CampoPesquisa.Items[i].Tamanho);
          End
          else
          Begin
            CriaCampoTree(GetNomeCampo(CampoPesquisa.Items[i].NomeCampo),
              CampoPesquisa.Items[i].Descricao, CampoPesquisa.Items[i].Tamanho);
          End;
          lstCampos.AddItem(CampoPesquisa.Items[i].Descricao,
            CampoPesquisa.Items[i]);

        End;

      tsMostraGrid:
        Begin
          if TipoForm = TfGrid then
          Begin
            with MontaGrid(TvPesquisa, GetNomeCampo
                (CampoPesquisa.Items[i].NomeCampo),
              CampoPesquisa.Items[i].Descricao,
              CampoPesquisa.Items[i].TipoCampo, CampoPesquisa.Items[i].Tamanho)
              do
              RepositoryItem := CampoPesquisa.Items[i].RepositoryItem;
          end
          else
            CriaCampoTree(GetNomeCampo(CampoPesquisa.Items[i].NomeCampo),
              CampoPesquisa.Items[i].Descricao, CampoPesquisa.Items[i].Tamanho);

        End;

    end; // end case

  End; // end for
  if TipoForm = tfTree then
  Begin
    TvTree.BeginUpdate;
    TvTree.DataController.KeyField := GetCampoChave(TipoPesquisa);
    TvTree.DataController.ParentField := 'codpai';
    TvTree.DataController.DataSource := DataPesquisa;
    TvPesquisa.DataController.DataSource := nil;
    TvTree.EndUpdate;
    TvTree.Refresh;
  End;

end;

procedure TfrmPesquisa.SalvarCenario;
var
  CdsSave: TClientDataSet;
  Alteracao: TTipoAlteracao;
  StrSQL: String;
begin
  // Try
  // CdsSave := TClientDataSet.Create(Self);
  // CdsSave.FieldDefs.Add('idusuario', ftInteger);
  // CdsSave.FieldDefs.Add('cenario', ftBlob);
  // CdsSave.FieldDefs.Add('idform', ftInteger);
  // CdsSave.CreateDataSet;
  // Cenario.StoreTo;
  // TvPesquisa.StoreToIniFile(ExtractFilePath(Application.ExeName)+'cenario.ini', False, [gsoUseFilter, gsoUseSummary]);
  // if not FileExists(ExtractFilePath(Application.ExeName)+'cenario.ini') then
  // Exit;
  // CdsSave.Append;
  // CdsSave.FieldByName('idusuario').AsInteger := UsuarioLogado.Id;
  // CdsSave.FieldByName('idform').AsInteger := StrtoInt(VartoStr(TIdForm(idFrmPesquisa)));
  // TBlobField(CdsSave.FieldByName('cenario')).LoadFromFile(ExtractFilePath(Application.ExeName)+'cenario.ini');
  // CdsSave.Post;
  // Cenario.Active := False;
  // StrSQL := GetValorCds('select idusuario '+
  // '  from usuariocenario '+
  // ' where idusuario = '+IntToStr(UsuarioLogado.Id)+
  // '   and idform  = '+VartoStr(TIdForm(idFrmPesquisa)) );
  // if StrSQL = '' then
  // Alteracao := taInsere
  // else
  // Alteracao := taModifica;
  // AlteraBanco(Alteracao, CdsSave, 'usuariocenario', 'idusuario');
  // Finally
  // if FileExists(ExtractFilePath(Application.ExeName)+'cenario.ini') then
  // DeleteFile(ExtractFilePath(Application.ExeName)+'cenario.ini');
  // FreeAndNil(CdsSave);
  // End;
end;

procedure TfrmPesquisa.SetTipoForm(const Value: TTipoFormBasico);
begin
  FTipoForm := Value;
  case Value of
    TfGrid:
      PageControl.ActivePage := tsGrid;
    tfTree:
      Begin
        PageControl.ActivePage := TsTree;
        TvTree.BeginUpdate;
        TvTree.DataController.DataSource := nil;
        TvTree.DataController.KeyField := GetCampoChave(TipoPesquisa);
        TvTree.DataController.ParentField := 'codpai';
        TvTree.DataController.DataSource := DataPesquisa;
        TvTree.EndUpdate;
      End;
  end;
end;

procedure TfrmPesquisa.SetTipoPesquisa(const Value: TTipoPesquisa);
begin
  FTipoPesquisa := Value;
  Application.ProcessMessages;
  with InfoSistema.SQLs.GetMySQL(TipoPesquisa, '') do
  Begin
    if (Versao20) and (DescricaoTabela <> '') then
    Begin
      Titulo := DescricaoTabela;
      Self.TipoForm := TipoForm;
      Campos.Add('C�digo', CampoCodigo, tcString, tsCampoPesquisaGrid);
      Campos.Add(DescricaoCampoDisplay, CampoDisplay, tcString,
        tsCampoPesquisaGrid, 150);
      ProcessaCampo(Campos);
      Exit;
    End;
  End;

  case TipoPesquisa of
{$REGION 'L-Kimera'}
    tpLKimeraCliente:
      Begin
        Titulo := 'Cliente';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Cliente', 'NOMECLIENTE', tcString, tsCampoPesquisaGrid,
          150);
        Campos.Add('Telefone', 'TELEFONE', tcString, tsCampoPesquisaGrid, 100);
        Campos.Add('Logradouro', 'Logradouro', tcString, tsMostraGrid, 200);
        Campos.Add('Bairro', 'BAIRRO', tcString, tsCampoPesquisaGrid, 150);
        Campos.Add('Cidade', 'CIDADE', tcString, tsMostraGrid, 150);
      End;
    tpLKimeraProduto, tpLKimeraProdutoAtivo:
      Begin
        Titulo := 'Produto';
        Campos.Add('C�digo', 'P.CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Produto', 'NOMEPRODUTO', tcString, tsCampoPesquisaGrid,
          350);
        Campos.Add('C�digo aux�liar', 'CODIGOINTERNO', tcString,
          tsCampoPesquisaGrid, 90);
        Campos.Add('Pre�o', 'PRECOVENDA', tcMoeda, tsMostraGrid, 90);
        Campos.Add('Estoque', 'QUANTIDADE', tcReal, tsMostraGrid, 90);
        Campos.Add('Unidade', 'UNIDADE', tcString, tsMostraGrid, 50);
      End;

    tpLKimeraHistoricoPreco:
      ;
    tpLKimeraRecebimento:
      Begin
        Titulo := 'Recebimento';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Recebimento', 'NOMERECEBIMENTO', tcString,
          tsCampoPesquisaGrid, 350);
      End;
    tpLKimeraCEP, tpImoCEP, tpDragonCEP,tpERPCEP:
      Begin
        Titulo := 'CEP';
        Campos.Add('CEP', 'CEP', tcCEP, tsCampoPesquisaGrid, 50);
        Campos.Add('Logradouro', 'Logradouro', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Bairro', 'BAIRRO', tcString, tsCampoPesquisaGrid, 150);
        Campos.Add('Cidade', 'CIDADE', tcString, tsMostraGrid, 150);
      End;
    tpLKimeraContaReceber, tpLKimeraContaRecebida:
      Begin
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid);
        Campos.Add('Cliente', 'NOMECLIENTE', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('N� do pedido', 'NUMPEDIDO', tcInt, tsCampoPesquisaGrid,
          100);
        Campos.Add('Valor', 'VALOR', tcMoeda, tsMostraGrid, 100);
        if TipoPesquisa = tpLKimeraContaRecebida then
        Begin
          Campos.Add('Data do pagamento', 'DATAQUITADO', tcCampoData,
            tsCampoPesquisaGrid, 100);
          Campos.Add('Valor pago', 'VALORPAGO', tcMoeda, tsMostraGrid, 80);
          Titulo := 'Contas recebidas';
        End
        else
          Titulo := 'Contas a receber';
        Campos.Add('Cancelado', 'CANCELADO', tcString, tsMostraGrid);
      End;
    tpLKimeraVenda, tpLKimeraCompra:
      Begin
        if TipoPesquisa = tpLKimeraCompra then
          Titulo := 'Compra/Entrada'
        else
        Begin
          Titulo := 'Vendas';
          Campos.Add('N� venda', 'NUMPEDIDO', tcString, tsCampoPesquisaGrid);
        End;
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid);
        Campos.Add('Cliente', 'NOMECLIENTE', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Valor total', 'VALORTOTALLIQUIDO', tcString,
          tsCampoPesquisaGrid, 200);
      End;
{$ENDREGION}
{$REGION 'Imovel'}
    tpImoStatus, tpAquariosStatus:
      Begin
        Titulo := 'Status';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome', 'NOMESTATUS', tcString, tsCampoPesquisaGrid, 150);
      End;
    tpImoImposto:
      Begin
        Titulo := 'Encargos';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome', 'NOMEIMPOSTO', tcString, tsCampoPesquisaGrid, 150);
      End;
    tpImoTipoImovel, tpAquariosTipoImovel:
      Begin
        Titulo := 'Tipo de im�vel';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome', 'NOMETIPOIMOVEL', tcString, tsCampoPesquisaGrid,
          150);
      End;
    tpImoBanco, tpAquariosBanco:
      Begin
        Titulo := 'Banco';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome', 'NOMEBANCO', tcString, tsCampoPesquisaGrid, 150);
      End;
    tpImoFiador:
      Begin
        Titulo := 'Fiador';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome', 'NOMEFIADOR', tcString, tsCampoPesquisaGrid, 150);
        Campos.Add('CPF/CNPJ', 'CPF', tcString, tsCampoPesquisaGrid, 80);
        Campos.Add('Telefone', 'TELEFONE', tcString, tsCampoPesquisaGrid, 80);
      End;
    tpImoInquilino:
      Begin
        Titulo := 'Inquilino';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome', 'NOMEINQUILINO', tcString, tsCampoPesquisaGrid, 150);
        Campos.Add('CPF/CNPJ', 'CPFCNPJ', tcString, tsCampoPesquisaGrid, 80);
        Campos.Add('Telefone', 'TELEFONE', tcString, tsCampoPesquisaGrid, 80);
      End;
    tpImoLocatario:
      Begin
        Titulo := 'Propriet�rio';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome', 'NOMELOCATARIO', tcString, tsCampoPesquisaGrid, 150);
        Campos.Add('CPF/CNPJ', 'CPFCNPJ', tcString, tsCampoPesquisaGrid, 80);
        Campos.Add('Telefone', 'TELEFONE', tcString, tsCampoPesquisaGrid, 80);
      End;
    tpImoImovel:
      Begin
        Titulo := 'Im�vel';
        Campos.Add('C�digo', 'I.CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('CEP', 'CEP', tcString, tsMostraGrid, 50);
        Campos.Add('Logradouro', 'Logradouro', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Bairro', 'BAIRRO', tcString, tsMostraGrid, 150);
        Campos.Add('Cidade', 'CIDADE', tcString, tsMostraGrid, 150);
        Campos.Add('Propriet�trio', 'NOMELOCATARIO', tcString,
          tsCampoPesquisaGrid, 150);
        Campos.Add('Inquilino', 'NOMEINQUILINO', tcString, tsCampoPesquisaGrid,
          150);
        Campos.Add('Tipo de im�vel', 'NOMETIPOIMOVEL', tcString,
          tsCampoPesquisaGrid, 100);
        Campos.Add('Status', 'NOMESTATUS', tcString, tsCampoPesquisaGrid, 100);

      End;
    tpImoContaReceber, tpImoContaRecebidas, tpImoContaPagas, tpImoContaPagar:
      Begin
        Campos.Add('Data', 'C.DATA', tcCampoData, tsCampoPesquisaGrid, 80);
        Campos.Add('Documento', 'C.DOCUMENTO', tcString, tsCampoPesquisaGrid,
          150);
        Campos.Add('Hist�rico', 'HISTORICO', tcString, tsMostraGrid, 250);
        Campos.Add('Valor', 'VALOR', tcMoeda, tsMostraGrid, 90);
        Campos.Add('Vencimento', 'C.DATAVENCIMENTO', tcCampoData, tsMostraGrid,
          90);
        if TipoPesquisa in [tpImoContaReceber, tpImoContaRecebidas] then
        Begin
          Titulo := 'Contas  a receber ';
          Campos.Add('Inquilino', 'I.NOMEINQUILINO', tcString,
            tsCampoPesquisaGrid, 250);
        End;
        if TipoPesquisa in [tpImoContaPagar, tpImoContaPagas] then
        Begin
          Titulo := 'Contas  a pagar ';
          Campos.Add('Propriet�rio', 'L.NOMELOCATARIO', tcString,
            tsCampoPesquisaGrid, 250);
        End;
        if TipoPesquisa = tpImoContaRecebidas then
        Begin
          Titulo := 'Contas  a recebidas ';
          Campos.Add('Data do recebimento', 'C.DATAPAG', tcCampoData,
            tsCampoPesquisaGrid, 90);
        End;
        if TipoPesquisa = tpImoContaPagas then
        Begin
          Titulo := 'Contas  pagas ';
          Campos.Add('Data do recebimento', 'C.DATAPAG', tcCampoData,
            tsCampoPesquisaGrid, 90);
        End;
      End;
    tpImoTipoConta, tpImoTipoContaP, tpImoTipoContaR:
      Begin
        Titulo := 'Tipo de conta';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome', 'NOMETIPOCONTA', tcString, tsCampoPesquisaGrid, 150);
      End;
    tpImoCheque, tpImoChequeDepositado:
      Begin
        Campos.Add('Emitente', 'EMITENTE', tcString, tsCampoPesquisaGrid, 300);
        Campos.Add('Entrada', 'DATAENTRADA', tcCampoData, tsMostraGrid, 90);
        if TipoPesquisa = tpImoCheque then
          Titulo := 'Controle de cheques'
        else
        Begin
          Titulo := 'Controle de cheques depositados';
          Campos.Add('Dep�sito', 'DATADEPOSITADO', tcCampoData, tsMostraGrid,
            90);
        End;
        Campos.Add('N�mero', 'NUMEROCHEQUE', tcString, tsCampoPesquisaGrid,
          100);
        Campos.Add('Valor', 'VALOR', tcMoeda, tsMostraGrid, 90);
        Campos.Add('Banco', 'NOMEBANCO', tcString, tsMostraGrid, 160);
      End;
    tpImoCaixa:
      Begin
        Titulo := 'Lan�amentos no caixa';
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid, 80);
        Campos.Add('Hist�rico', 'HISTORICO', tcString, tsCampoPesquisaGrid,
          250);
        Campos.Add('Valor', 'VALOR_CALCULADO', tcMoeda, tsMostraGrid, 80);
      End;
{$ENDREGION}
{$REGION 'Alpha'}
    tpAlphaCaracteristica:
      Begin
        Titulo := 'Caracter�sticas de produtos';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Caracter�stica', 'NOMECARACTERISTICA', tcString,
          tsCampoPesquisaGrid, 150);
      End;
    tpAlphaUnidade:
      Begin
        Titulo := 'Caracter�sticas de produtos';
        Campos.Add('Unidade', 'UNIDADE', tcString, tsCampoPesquisaGrid);
      End;
    tpAlphaFabricante:
      Begin
        Titulo := 'Fabricante';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Fabricante', 'NOMEFABRICANTE', tcString,
          tsCampoPesquisaGrid, 150);
      End;
    tpAlphaSecao:
      Begin
        Titulo := 'Se��o';
        TipoForm := tfTree;
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Se��o', 'NOMESECAO', tcString, tsCampoPesquisaGrid, 150);
      End;
    tpAlphaProduto:
      Begin
        Titulo := 'Produto';
        Campos.Add('C�digo', 'P.CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Produto', 'NOMEPRODUTO', tcString, tsCampoPesquisaGrid,
          150);
        Campos.Add('Fabricante', 'NOMEFABRICANTE', tcString,
          tsCampoPesquisaGrid, 100);
        Campos.Add('Se��o', 'NOMESECAO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Quantidade', 'ESTOQUE', tcReal, tsMostraGrid);
        Campos.Add('Pre�o de venda', 'PRECOVENDA', tcReal, tsMostraGrid);
      End;
    tpAlphaFornecedor:
      Begin
        Titulo := 'Fornecedor';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Raz�o social', 'RAZAOSOCIAL', tcString,
          tsCampoPesquisaGrid, 150);
        Campos.Add('Fantasia', 'FANTASIA', tcString, tsCampoPesquisaGrid, 150);
        Campos.Add('CNPJ', 'CNPJ', tcCNPJ, tsCampoPesquisaGrid);
        Campos.Add('Estado', 'ESTADO', tcString, tsMostraGrid);
      End;
    tpAlphaEmpresa, tpDragonEmpresa:
      Begin
        Titulo := 'Empresa';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Raz�o social', 'RAZAOSOCIAL', tcString,
          tsCampoPesquisaGrid, 150);
      End;
    tpAlphaCFOP:
      Begin
        Titulo := 'CFOP';
        Campos.Add('CFOP', 'CFOP', tcString, tsCampoPesquisaGrid);
        Campos.Add('Descri��o', 'NATUREZA', tcString, tsCampoPesquisaGrid, 300);
      End;
    tpAlphaTerminal:
      Begin
        Titulo := 'Terminal';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Terminal', 'NOMETERMINAL', tcString, tsCampoPesquisaGrid,
          150);
      End;
    tpAlphaUsuario, tpDragonUsuario:
      Begin
        Titulo := 'Usuario';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Login', 'LOGIN', tcString, tsCampoPesquisaGrid, 80);
        Campos.Add('Nome completo', 'NOMEUSUARIO', tcString,
          tsCampoPesquisaGrid, 150);
      End;
    tpAlphaOperacao, tpAlphaOperacaoEntrada, tpAlphaOperacaoSaida,
      tpAlphaOperacaoVenda:
      Begin
        Titulo := 'Operacao';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Operacao', 'NOMEOPERACAO', tcString, tsCampoPesquisaGrid,
          150);
      End;
    tpAlphaNCM:
      Begin
        Titulo := 'NCM';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Descri��o', 'DESCRICAO', tcString, tsCampoPesquisaGrid,
          150);
      End;
    tpAlphaModelo:
      Begin
        Titulo := 'Modelo';
        Campos.Add('C�digo', 'MODELO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Descri��o', 'DESCRICAO', tcString, tsCampoPesquisaGrid,
          150);
      End;
    tpAlphaPerfilUsuario, tpDragonPerfilUsuario:
      Begin
        Titulo := 'Perfil de usu�rio';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Perfil', 'NOMEPERFIL', tcString, tsCampoPesquisaGrid, 150);
      End;
    tpAlphaDespesa:
      Begin
        Titulo := 'Despesas';
        Campos.Add('Data', 'DATADESPESA', tcCampoData, tsCampoPesquisaGrid);
        Campos.Add('Descri��o', 'HISTORICO', tcString, tsCampoPesquisaGrid,
          150);
        Campos.Add('Vencimento', 'DATAVENCIMENTO', tcCampoData,
          tsCampoPesquisaGrid);
        Campos.Add('Data do pagamento', 'DATAPAGO', tcCampoData,
          tsCampoPesquisaGrid);
      End;
{$ENDREGION}
{$REGION 'Dragon'}
    tpDragonProfissionais:
      Begin
        Titulo := 'Profissionais';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome', 'NOME', tcString, tsCampoPesquisaGrid, 150);
      End;
    tpDragonCategoria:
      Begin
        Titulo := 'Categoria de imagens';
        TipoForm := tfTree;
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Descri��o', 'NOMECATEGORIA', tcString, tsCampoPesquisaGrid,
          150);
      End;
    tpDragonCor:
      Begin
        Titulo := 'Cores';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Descri��o', 'NOMECOR', tcString, tsCampoPesquisaGrid, 150);
        Campos.Add('COR', 'COR', tcInt, tsMostraGrid, 40, ColorComboBox);
      End;
    tpDragonformaPag:
      Begin
        Titulo := 'Forma de pagamento';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Forma de pagamento', 'NOMEFORMAPAGAMENTO', tcString,
          tsCampoPesquisaGrid, 150);
      End;
    tpDragonPlanoConta:
      Begin
        Titulo := 'Plano de contas';
        TipoForm := tfTree;
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Plano de conta', 'NOMEPLANOCONTA', tcString,
          tsCampoPesquisaGrid, 150);
      End;
    tpDragonCliente:
      Begin
        Titulo := 'Cliente';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Cliente', 'NOME', tcString, tsCampoPesquisaGrid, 200);
        Campos.Add('Telefone', 'TELEFONE', tcString, tsCampoPesquisaGrid, 70);
        Campos.Add('Identidade', 'IDENTIDADE', tcString, tsCampoPesquisaGrid,
          70);
        Campos.Add('Logradouro', 'LOGRADOURO', tcString, tsCampoPesquisaGrid,
          250);
        Campos.Add('Bairro', 'BAIRRO', tcString, tsMostraGrid, 80);
        Campos.Add('N�mero', 'NUMERO', tcString, tsMostraGrid, 50);
        Campos.Add('Complemento', 'COMPLEMENTO', tcString, tsMostraGrid, 150);
      End;
    tpDragonTipoServico:
      Begin
        Titulo := 'Tipo de servi�o';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Tipo de servi�o', 'NOMETIPOSERVICO', tcString,
          tsCampoPesquisaGrid, 200);
      End;

    tpDragonVenda:
      Begin
        Titulo := 'Venda';
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid);
        Campos.Add('N� Venda', 'NUMVENDA', tcString, tsCampoPesquisaGrid, 90);
        Campos.Add('C�digo do cliente', 'CODIGO', tcString,
          tsCampoPesquisaGrid, 90);
        Campos.Add('Cliente', 'CLIENTE', tcString, tsCampoPesquisaGrid, 200);
        Campos.Add('Profissional', 'PROFISSIONAL', tcString,
          tsCampoPesquisaGrid, 150);
      End;
    tpDragonContaReceber:
      Begin
        Titulo := 'Conta a receber';
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid);
        Campos.Add('Vencimento', 'VENCIMENTO', tcCampoData, tsMostraGrid);
        Campos.Add('Cliente', 'C.NOME', tcString, tsCampoPesquisaGrid, 100);
        Campos.Add('Forma de pagamento', 'FP.NOMEFORMAPAGAMENTO', tcString,
          tsCampoPesquisaGrid, 100);
        Campos.Add('Hist�rico', 'HISTORICO', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Documento', 'NUMDOCUMENTO', tcString, tsCampoPesquisaGrid,
          100);
        Campos.Add('D�vida', 'DIVIDA', tcMoeda, tsMostraGrid, 100);
      End;
    tpDragonContaRecebida:
      Begin
        Titulo := 'Conta recebida';
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid);
        Campos.Add('Data recebimento', 'DATAPAGO', tcCampoData, tsMostraGrid,
          90);
        Campos.Add('Cliente', 'C.NOME', tcString, tsCampoPesquisaGrid, 100);
        Campos.Add('Forma de pagamento', 'FP.NOMEFORMAPAGAMENTO', tcString,
          tsCampoPesquisaGrid, 100);
        Campos.Add('Hist�rico', 'HISTORICO', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Documento', 'NUMDOCUMENTO', tcString, tsCampoPesquisaGrid,
          100);
        Campos.Add('Valor recebido', 'VALORPAGO', tcMoeda, tsMostraGrid, 100);
      End;
    tpDragonContaPagar:
      Begin
        Titulo := 'Conta a pagar';
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid);
        Campos.Add('Vencimento', 'VENCIMENTO', tcCampoData, tsMostraGrid);
        Campos.Add('Profissional', 'P.NOME', tcString, tsCampoPesquisaGrid,
          100);
        // Campos.Add('Fornecedor','F.NOME', tcString, tsCampoPesquisaGrid, 100);
        Campos.Add('Forma de pagamento', 'FP.NOMEFORMAPAGAMENTO', tcString,
          tsCampoPesquisaGrid, 100);
        Campos.Add('Hist�rico', 'HISTORICO', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Documento', 'NUMDOCUMENTO', tcString, tsCampoPesquisaGrid,
          100);
        Campos.Add('Valor', 'VALOR', tcMoeda, tsMostraGrid, 100);
      End;
    tpDragonContaPaga:
      Begin
        Titulo := 'Conta paga';
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid);
        Campos.Add('Data pagamento', 'DATAPAGO', tcCampoData, tsMostraGrid, 90);
        Campos.Add('Profissional', 'P.NOME', tcString, tsCampoPesquisaGrid,
          100);
        // Campos.Add('Fornecedor','F.NOME', tcString, tsCampoPesquisaGrid, 100);
        Campos.Add('Forma de pagamento', 'FP.NOMEFORMAPAGAMENTO', tcString,
          tsCampoPesquisaGrid, 100);
        Campos.Add('Hist�rico', 'HISTORICO', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Documento', 'NUMDOCUMENTO', tcString, tsCampoPesquisaGrid,
          100);
        Campos.Add('Valor pago', 'VALORPAGO', tcMoeda, tsMostraGrid, 100);
      End;
    tpDragonTipoCaixa:
      Begin
        Titulo := 'Tipo caixa';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Tipo de caixa', 'NOMETIPOCAIXA', tcString,
          tsCampoPesquisaGrid, 200);
      End;
    tpDragonCaixa:
      Begin
        Titulo := 'Caixa';
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid);
        Campos.Add('Hist�rico', 'HISTORICO', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Valor', 'VALOR_CALCULADO', tcMoeda, tsMostraGrid, 100);
      End;
    tpDragonGaleria:
      Begin
        Titulo := 'Galeria';
        Campos.Add('Descri��o', 'DESCRICAO', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Categoria', 'NOMECATEGORIA', tcString, tsCampoPesquisaGrid,
          200);
        // Campos.Add('Imagem','IMAGEM',tcVariant, tsMostraGrid, 300,BLob);

      End;
{$ENDREGION}
{$REGION 'PET'}
    tpPetCategoriaAnimal:
      Begin
        Titulo := 'Categoria animal';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Categoria de animal', 'NOMECATEGORIAANIMAL', tcString,
          tsCampoPesquisaGrid, 150);
        Campos.Add('Esp�cie', 'NOMETIPOANIMAL', tcString, tsCampoPesquisaGrid,
          100);
      End;
    tpPetProfissional:
      Begin
        Titulo := 'Profissional';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Profissional', 'NOMEPROFISSIONAL', tcString,
          tsCampoPesquisaGrid, 150);
      End;
    tpPetRacaAnimal:
      Begin
        Titulo := 'Ra�as';
        Campos.Add('C�digo', 'R.CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Ra�a', 'NOMERACA', tcString, tsCampoPesquisaGrid, 150);
      End;
    tpPetEmpresa:
      Begin
        Titulo := 'Empresa';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Raz�o social', 'RAZAOSOCIAL', tcString,
          tsCampoPesquisaGrid, 150);
      End;
    tpPetUsuario:
      Begin
        Titulo := 'Usu�rio';
        Campos.Add('Login', 'LOGIN', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome completo', 'Nome', tcString, tsCampoPesquisaGrid, 150);
      End;
    tpPetCliente:
      Begin
        Titulo := 'Cliente';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Cliente', 'NOMECLIENTE', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Telefone', 'TELEFONE', tcString, tsCampoPesquisaGrid, 70);
        Campos.Add('Identidade', 'RG', tcString, tsCampoPesquisaGrid, 70);
        Campos.Add('Logradouro', 'LOGRADOURO', tcString, tsCampoPesquisaGrid,
          250);
        Campos.Add('Bairro', 'BAIRRO', tcString, tsMostraGrid, 80);
        Campos.Add('N�mero', 'NUMERO', tcString, tsMostraGrid, 50);
        Campos.Add('Complemento', 'COMPLEMENTO', tcString, tsMostraGrid, 150);
      End;
    tpPetAnimal:
      Begin
        Titulo := 'Animal';
        Campos.Add('C�digo', 'A.CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome', 'NOMEANIMAL', tcString, tsCampoPesquisaGrid, 70);
        Campos.Add('Cliente', 'C.NOMECLIENTE', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Esp�cie', 'NOMETIPOANIMAL', tcString, tsMostraGrid, 70);
        Campos.Add('Categoria', 'NOMECATEGORIAANIMAL', tcString, tsMostraGrid,
          250);
        Campos.Add('Sexo', 'SEXO', tcString, tsMostraGrid, 80);
      End;
    tpPetServico:
      Begin
        Titulo := 'Servi�o';
        Campos.Add('N� Servi�o', 'NUMSERVICO', tcString, tsCampoPesquisaGrid,
          60);
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid, 80);
        Campos.Add('Hora', 'HORA', tcHora, tsMostraGrid, 80);
        Campos.Add('Usu�rio', 'LOGIN', tcString, tsMostraGrid, 80);
        Campos.Add('Cliente', 'C.NOMECLIENTE', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Total', 'VALORTOTALLIQUIDO', tcMoeda, tsMostraGrid, 100);
      End;
    tpPetCaixa:
      Begin
        Titulo := 'Caixa';
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid, 80);
        Campos.Add('Hist�rico', 'HISTORICO', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Valor', 'VALOR_CALC', tcMoeda, tsMostraGrid, 80);
      End;
    tpPetContasReceber, tpPetContasRecebidas:
      Begin
        Titulo := 'Contas a receber';
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid, 80);
        Campos.Add('Vencimento', 'DATAVENCIMENTO', tcCampoData,
          tsCampoPesquisaGrid, 90);
        Campos.Add('Cliente', 'NOMECLIENTE', tcString, tsCampoPesquisaGrid,
          300);
        Campos.Add('Valor', 'VALOR', tcMoeda, tsMostraGrid, 100);
        Campos.Add('D�vida', 'DIVIDA', tcMoeda, tsMostraGrid, 100);
        if TipoPesquisa = tpPetContasRecebidas then
        Begin
          Campos.Add('Data recebido', 'DATAPAGO', tcCampoData,
            tsCampoPesquisaGrid, 80);
          Titulo := 'Contas a recebidas';
        End;

      End;
{$ENDREGION}
{$REGION 'Aquarios2'}
    tpAquariosFiador:
      Begin
        Titulo := 'Fiador';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome', 'NOMEFIADOR', tcString, tsCampoPesquisaGrid, 150);
        Campos.Add('CPF/CNPJ', 'CPF_CNPJ', tcString, tsCampoPesquisaGrid, 80);
        Campos.Add('Telefone', 'TELEFONE', tcString, tsCampoPesquisaGrid, 80);
      End;
    tpAquariosInquilino:
      Begin
        Titulo := 'Inquilino';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome', 'NOMEINQUILINO', tcString, tsCampoPesquisaGrid, 150);
        Campos.Add('CPF/CNPJ', 'CPF_CNPJ', tcString, tsCampoPesquisaGrid, 80);
        Campos.Add('Telefone', 'TELEFONE', tcString, tsCampoPesquisaGrid, 80);
      End;
    tpAquariosProprietario:
      Begin
        Titulo := 'Propriet�rio';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome', 'NOMEPROPRIETARIO', tcString, tsCampoPesquisaGrid,
          150);
        Campos.Add('CPF/CNPJ', 'CPF_CNPJ', tcString, tsCampoPesquisaGrid, 80);
        Campos.Add('Telefone', 'TELEFONE', tcString, tsCampoPesquisaGrid, 80);
      End;
    tpAquariosImovel:
      Begin
        Titulo := 'Im�vel';
        Campos.Add('C�digo', 'I.CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Propriet�trio', 'P.NOMEPROPRIETARIO', tcString,
          tsCampoPesquisaGrid, 150);
        Campos.Add('Tipo de im�vel', 'TI.NOMETIPOIMOVEL', tcString,
          tsCampoPesquisaGrid, 100);
        Campos.Add('CEP', 'CEP', tcString, tsMostraGrid, 50);
        Campos.Add('Logradouro', 'Logradouro', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Bairro', 'BAIRRO', tcString, tsMostraGrid, 150);
        Campos.Add('Cidade', 'CIDADE', tcString, tsMostraGrid, 150);

        Campos.Add('Status', 'S.NOMESTATUS', tcString, tsCampoPesquisaGrid,
          100);
      End;
    tpAquariosTipoContrato:
      Begin
        Titulo := 'Tipo de contrato';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Nome', 'NOMETIPOCONTRATO', tcString, tsCampoPesquisaGrid,
          150);
      End;

    tpAquariosContratos:
      Begin
        Titulo := 'Contrato';
        Campos.Add('Num. Contrato', 'NUMCONTRATO', tcString,
          tsCampoPesquisaGrid, 90);
        Campos.Add('Data', 'DATACONTRATO', tcCampoData, tsCampoPesquisaGrid,
          80);
        Campos.Add('Inquilino', 'INQUILINO', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Logradouro', 'LOGRADOURO', tcString, tsCampoPesquisaGrid,
          150);
        Campos.Add('Bairro', 'BAIRRO', tcString, tsMostraGrid, 100);
        Campos.Add('Cidade', 'CIDADE', tcString, tsMostraGrid, 100);
        Campos.Add('C�d. Propriet�rio', 'CODIGOPROPRIETARIO', tcString,
          tsCampoPesquisaGrid, 90);
        Campos.Add('Propriet�rio', 'NOMEPROPRIETARIO', tcString,
          tsCampoPesquisaGrid, 90);
      End;
{$REGION 'Militour'}
    tpMilitourCliente:
      Begin
        Titulo := 'Cliente';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Cliente', 'NOME', tcString, tsCampoPesquisaGrid, 200);
        Campos.Add('Telefone 1', 'TELEFONE1', tcString, tsCampoPesquisaGrid,
          70);
        Campos.Add('Telefone 2', 'TELEFONE2', tcString, tsCampoPesquisaGrid,
          70);
        Campos.Add('Rua', 'RUA', tcString, tsCampoPesquisaGrid, 250);
        Campos.Add('Bairro', 'BAIRRO', tcString, tsMostraGrid, 80);
        Campos.Add('N�mero', 'NUMERO', tcString, tsMostraGrid, 50);
        Campos.Add('Complemento', 'COMPLEMENTO', tcString, tsMostraGrid, 150);
      End;
{$ENDREGION}
{$ENDREGION}
{$REGION 'CS'}
    tpCSCliente:
      Begin
        Titulo := 'Cliente';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Cliente', 'NOMECLIENTE', tcString, tsCampoPesquisaGrid, 200);
        Campos.Add('Nome fantasia', 'FANTASIA', tcString, tsCampoPesquisaGrid, 200);
        Campos.Add('Telefone', 'TELEFONE', tcString, tsCampoPesquisaGrid, 70);
        Campos.Add('CPF', 'CPF', tcString, tsCampoPesquisaGrid, 70);
        Campos.Add('CNPJ', 'CNPJ', tcString, tsCampoPesquisaGrid, 70);
        Campos.Add('Logradouro', 'LOGRADOURO', tcString, tsCampoPesquisaGrid,250);
        Campos.Add('Bairro', 'BAIRRO', tcString, tsMostraGrid, 80);
        Campos.Add('N�mero', 'NUMERO', tcString, tsMostraGrid, 50);
        Campos.Add('Complemento', 'COMPLEMENTO', tcString, tsMostraGrid, 150);
      End;
    tpCsServicos:
      Begin
        Titulo := 'Servi�o';
        Campos.Add('N� Servi�o', 'NUMSERVICO', tcString, tsCampoPesquisaGrid,
          60);
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid, 80);
        Campos.Add('Hora', 'HORA', tcHora, tsMostraGrid, 80);
        Campos.Add('Cliente', 'C.NOMECLIENTE', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Total', 'VALORTOTALLIQUIDO', tcMoeda, tsMostraGrid, 100);
      End;
    tpCSEmpresa:
      Begin
        Titulo := 'Empresa';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Razao social', 'RAZAOSOCIAL', tcString,
          tsCampoPesquisaGrid, 200);
      End;
    tpCSProdutos:
      Begin
        Titulo := 'Tipo de servi�o';
        Campos.Add('C�digo', 'P.CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Tipo de servi�o', 'P.NOME', tcString, tsCampoPesquisaGrid,
          200);
        Campos.Add('Marca', 'MARCA', tcString, tsMostraGrid, 200);
      End;
    tpCSConta:
      Begin
        Titulo := 'Contas banc�rias';
        Campos.Add('Banco', 'B.NOMEBANCO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Conta', 'CONTA', tcString, tsCampoPesquisaGrid, 200);
        Campos.Add('Agencia', 'AGENCIA', tcString, tsMostraGrid, 200);
      End;
    tpCSMaterial:
      Begin
        Titulo := 'Material';
        Campos.Add('C�digo', 'M.CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Descri��o', 'NOMEMATERIAL', tcString, tsCampoPesquisaGrid, 200);
        Campos.Add('Tipo de material', 'NOMETIPOMATERIAL', tcString, tsMostraGrid, 200);
        Campos.Add('Un', 'NOMEUNIDADE', tcString, tsMostraGrid, 40);
        Campos.Add('Qtd', 'ESTOQUETOTAL', tcReal, tsMostraGrid, 50);
        Campos.Add('C�digo no fornecedor', 'CODIGOFORNECEDOR', tcString, tsCampoPesquisaGrid, 110);

      End;
    tpCSEquipamento:
      Begin
        Titulo := 'Equipamento';
        Campos.Add('C�digo', 'E.CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Descri��o', 'NOMEEQUIPAMENTO', tcString, tsCampoPesquisaGrid, 200);
        Campos.Add('Grupo', 'NOMEGRUPO', tcString, tsMostraGrid, 200);
        Campos.Add('Marca', 'MARCA', tcString, tsMostraGrid, 100);
        Campos.Add('Combust�vel', 'COMBUSTIVEL', tcString, tsMostraGrid, 70);
        Campos.Add('Status', 'NOMESTATUS', tcString, tsMostraGrid, 90);
        Campos.Add('Cor. Status', 'COR', tcString, tsMostraGrid, 60,ColorComboBox);
      End;
     tpCSEntradaEquipamento :
      Begin
        Titulo := 'Entrada Dos equipamentos';
        Campos.Add('Data', 'DATAENTRADA', tcCampoData, tsCampoPesquisaGrid);
        Campos.Add('Documento', 'DOCUMENTO', tcString, tsCampoPesquisaGrid, 80);
        Campos.Add('Cliente', 'NOMECLIENTE', tcString, tsCampoPesquisaGrid, 200);
        Campos.Add('Local do estoque', 'NOMELOCALESTOQUE', tcString, tsMostraGrid, 100);
      End;
      tpCSEntradaMaterial :
      Begin
        Titulo := 'Entrada Dos materiais';
        Campos.Add('Data', 'DATANOTA', tcCampoData, tsCampoPesquisaGrid);
        Campos.Add('Documento', 'DOCUMENTO', tcString, tsCampoPesquisaGrid, 80);
        Campos.Add('Fornecedor', 'RAZAOSOCIAL', tcString, tsCampoPesquisaGrid, 200);

      End;

{$ENDREGION}
{$Region 'Controle de Importa��o'}
 tpCIFornecedor:
  Begin
    Titulo := 'Fornecedor';
    Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid,80, nil, 'F.CODIGO');
    Campos.Add('Fornecedor', 'NOME', tcString, tsCampoPesquisaGrid, 200, nil, 'F.NOME');
    Campos.Add('Pa�s', 'PAIS', tcString, tsMostraGrid, 200);
  End;

  tpCIProduto:
  Begin
    Titulo := 'Produto';
    Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid,80, nil, 'P.CODIGO');
    Campos.Add('Produto', 'NOMEPRICIPAL', tcString, tsCampoPesquisaGrid, 200);
    Campos.Add('NCM', 'NCM', tcString, tsCampoPesquisaGrid, 200,NIL,'NCM.CODIGO' );
  End;
  tpCIPedidoCompra:
  Begin
    Titulo := 'Pedido de compra';
    Campos.Add('N� pedido', 'NUMPEDIDO', tcString, tsCampoPesquisaGrid,80, nil, '');
    Campos.Add('Fornecedor', 'FORNECEDOR', tcString, tsCampoPesquisaGrid,130, nil, 'F.NOME');
    Campos.Add('Data', 'DATAPEDIDO', tcCampoData, tsCampoPesquisaGrid, 80);
    Campos.Add('Status', 'STATUS', tcString, tsMostraGrid, 80);
  End;

  tpCICotacao:
  Begin
    Titulo := 'Cota��o de compra';
    Campos.Add('N� cota��o', 'NUMCOTACAO', tcString, tsCampoPesquisaGrid,80, nil, '');
    Campos.Add('Coment�rio', 'COMENTARIO', tcString, tsCampoPesquisaGrid,130, nil, '');
    Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid, 80);
  End;



{$EndRegion}
  {$Region 'ERP'}
  tpERPCliente:
      Begin
        Titulo := 'Cliente';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid,80, nil, 'C.CODIGO');
        Campos.Add('Cliente', 'NOMECLIENTE', tcString, tsCampoPesquisaGrid, 200);
        Campos.Add('Nome fantasia', 'FANTASIA', tcString, tsCampoPesquisaGrid, 200);
        Campos.Add('Telefone', 'TELEFONE', tcString, tsCampoPesquisaGrid, 70);
        Campos.Add('CPF', 'CPF', tcString, tsCampoPesquisaGrid, 70);
        Campos.Add('CNPJ', 'CNPJ', tcString, tsCampoPesquisaGrid, 70);
        Campos.Add('Logradouro', 'LOGRADOURO', tcString, tsCampoPesquisaGrid,250);
        Campos.Add('Bairro', 'BAIRRO', tcString, tsMostraGrid, 80);
        Campos.Add('N�mero', 'NUMERO', tcString, tsMostraGrid, 50);
        Campos.Add('Complemento', 'COMPLEMENTO', tcString, tsMostraGrid, 150);
      End;
   tpERPFuncionario:
      Begin
        Titulo := 'Funcionario';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid,80,NIL,'F.CODIGO');
        Campos.Add('Funcionario', 'NOMEFUNCIONARIO', tcString, tsCampoPesquisaGrid, 200);
        Campos.Add('Departamento', 'NOMEDEPARTAMENTO', tcString, tsMostraGrid, 50);
        Campos.Add('Cargo', 'CARGO', tcString, tsMostraGrid, 150);
      End;
   tpERPProduto:
      Begin
        Titulo := 'Produto';
        Campos.Add('C�digo', 'P.CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Produto', 'P.NOMEPRODUTO', tcString, tsCampoPesquisaGrid,150);
        Campos.Add('Fabricante', 'NOMEFABRICANTE', tcString, tsCampoPesquisaGrid, 100);
        Campos.Add('Linha', 'NOMELINHA', tcString, tsCampoPesquisaGrid);
        Campos.Add('Quantidade', 'ESTOQUEATUAL', tcReal, tsMostraGrid);
        Campos.Add('Pre�o de venda', 'PRECO', tcReal, tsMostraGrid);
      End;
    tpERPContaBancaria:
      Begin
        Titulo := 'Conta banc�ria';
        Campos.Add('Banco', 'B.CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Ag�ncia', 'Agencia', tcString, tsCampoPesquisaGrid,80);
        Campos.Add('Conta', 'Conta', tcString, tsCampoPesquisaGrid, 80);
      End;
    tpERPEmpresa:
      Begin
        Titulo := 'Empresa';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Razao social', 'RAZAOSOCIAL', tcString,
          tsCampoPesquisaGrid, 200);
      End;
    tpERPPeridicidade:
      Begin
        Titulo := 'Periodicidade';
        Campos.Add('N� de dias', 'NUMDIAS', tcString, tsCampoPesquisaGrid);
        Campos.Add('Descri��o', 'DESCRICAOPERIODICIDADE', tcString,
          tsCampoPesquisaGrid, 200);
      End;
    tpERPTipoContrato:
      Begin
        Titulo := 'Tipo de contrato';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Descri��o', 'NOMETIPOCONTRATO', tcString, tsCampoPesquisaGrid, 200);
      End;
    tpERPContrato:
      Begin
        Titulo := 'Contrato';
        Campos.Add('N� contrato', 'C.NUMEROCONTRATO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid, 100);
        Campos.Add('Clente', 'CL.NOMECLIENTE', tcString, tsCampoPesquisaGrid, 200);
      End;
    tpERPOS:
      Begin
        Titulo := 'O.S.';
        Campos.Add('N� os', 'O.NUMEROOS', tcString, tsCampoPesquisaGrid);
        Campos.Add('Data', 'O.DATA', tcCampoData, tsCampoPesquisaGrid, 100);
        Campos.Add('Clente', 'C.NOMECLIENTE', tcString, tsCampoPesquisaGrid, 200);
      End;
    tpERPOperacao,tpERPOperacaoEntrada,tpERPOperacaoSaida:
      Begin
        Titulo := 'Opera��o de estoque';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Opera��o', 'NOMEOPERACAOESTOQUE', tcString, tsCampoPesquisaGrid, 200);
      End;
    tpERPEntrada:
      Begin
        Titulo := 'Entrada de produtos';
        Campos.Add('N� nota', 'NUMERONOTA', tcString, tsCampoPesquisaGrid);
        Campos.Add('Data', 'DATA', tcCampoData, tsCampoPesquisaGrid, 100);
        Campos.Add('Empresa', 'CODIGOEMPRESA', tcString, tsMostraGrid, 80);
        Campos.Add('Pessoa', 'PESSOA', tcString, tsCampoPesquisaGrid, 200);
        Campos.Add('Opera��o', 'NOMEOPERACAOESTOQUE', tcString, tsMostraGrid, 120);
        Campos.Add('Valor total', 'VALORTOTALNOTA', tcMoeda, tsMostraGrid, 120);
      End;
    tpERPTransportadora:
      Begin
        Titulo := 'Transportadora';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Razao social', 'RAZAOSOCIAL', tcString,tsCampoPesquisaGrid, 200);
        Campos.Add('Nome fantasia', 'NOMEFANTASIA', tcString,tsCampoPesquisaGrid, 200);
        Campos.Add('CNPJ', 'CNPJ', tcCNPJ,tsCampoPesquisaGrid,100);
      End;
     tpERPCompetenciaContrato:
      Begin
        Titulo := 'Contrato/copet�ncias';
        Campos.Add('N� contrato', 'NUMEROCONTRATO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Comp�ncia', 'COMPETENCIA', tcString,tsMostraGrid, 200);
      End;
     tpERPTipoPatrimonio:
      Begin
        Titulo := 'Tipo patrim�nio';
        Campos.Add('C�digo', 'CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Descri��o', 'NOMETIPOPATRIMONIO', tcString,tsCampoPesquisaGrid, 200);
      End;
     tpERPTipoEventos:
      Begin
        Titulo := 'Tipo eventos';
        Campos.Add('C�digo', 'TE.CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Evento', 'NOMETIPOEVENTOPATRIMONIO', tcString,tsCampoPesquisaGrid, 200);
      End;
     tpERPPatrimonio,tpERPPatrimonioDisponivel:
      Begin
        Titulo := 'Patrim�nio';
        Campos.Add('C�digo', 'P.CODIGO', tcString, tsCampoPesquisaGrid);
        Campos.Add('Descri��o', 'NOMEPATRIMONIO', tcString,tsCampoPesquisaGrid, 200);
        Campos.Add('Serial', 'SERIAL', tcString,tsCampoPesquisaGrid, 200);
        Campos.Add('Tipo de patrim�nio', 'NOMETIPOPATRIMONIO', tcString,tsMostraGrid, 200);
        Campos.Add('Fabricante', 'NOMEFABRICANTE', tcString,tsMostraGrid, 200);
        Campos.Add('Empresa', 'EMPRESA', tcString,tsMostraGrid, 80);

      End;
     tpERPPatrimonioManutencaoTerceiros:
      begin
         Titulo := 'Manuten��o de patrim�nio de terceiros ';
        Campos.Add('C�digo do patrim�nio', 'CODIGOPATRIMONIO', tcString, tsCampoPesquisaGrid,100,nil,'P.CODIGO');
        Campos.Add('Patrim�nio', 'P.NOMEPATRIMONIO', tcString,tsCampoPesquisaGrid, 200);
        Campos.Add('Fornecedor', 'F.RAZAOSOCIAL', tcString,tsCampoPesquisaGrid, 200);
        Campos.Add('Data', 'PM.DATA', tcString,tsCampoPesquisaGrid, 80);
        Campos.Add('Nota', 'E.NUMERONOTA', tcString,tsCampoPesquisaGrid, 100);
      end;
  {$EndRegion}

  end;
  // ----------------\\
  ProcessaCampo(Campos);
end;

procedure TfrmPesquisa.SetTitulo(const Value: String);
begin
  FTitulo := Value;
  lblTIpoPesquisa.Caption := 'Pesquisa de ' + Value;
end;

procedure TfrmPesquisa.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  TvPesquisa.ViewData.Collapse(True);
end;

procedure TfrmPesquisa.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  TvPesquisa.ViewData.Expand(True);

end;

procedure TfrmPesquisa.TvPesquisaCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  btnOkClick(nil);
end;

procedure TfrmPesquisa.TvTreeDblClick(Sender: TObject);
begin
  inherited;
  btnOkClick(nil);
end;

end.
