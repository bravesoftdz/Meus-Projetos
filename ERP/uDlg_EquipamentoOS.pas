unit uDlg_EquipamentoOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDlg_CadastroERP, StdCtrls, Buttons, ExtCtrls, Mask, EditPesquisa,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMemo, cxDBEdit,DB, ulibERP;

type
  TfrmDlg_EquipamentoOS = class(TfrmDlg_CadastroERP)
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    edtEquipamentos: TEditPesquisa;
    mmDefeito: TcxDBMemo;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtEquipamentosBtnNovoClick(Sender: TObject);
    procedure edtEquipamentosBtnEditarClick(Sender: TObject);
    procedure edtEquipamentosRegAchado(
      const ValoresCamposEstra: array of Variant);
  private
    FIdCliente: TipoCampoChave;
    procedure SetIdCliente(const Value: TipoCampoChave);
    { Private declarations }
  public
    { Public declarations }
    property IdCliente: TipoCampoChave read FIdCliente write SetIdCliente;
  end;

var
  frmDlg_EquipamentoOS: TfrmDlg_EquipamentoOS;

implementation

uses uCad_OS, Comandos, MinhasClasses, uForms;

{$R *.dfm}

procedure TfrmDlg_EquipamentoOS.btnOkClick(Sender: TObject);
begin
  if Trim(mmDefeito.Text) = '' then
  begin
    Avisa('Informe o detalhe da ocorr�ncia');
    mmDefeito.SetFocus;
    Exit;
  end;
  VerificaEdit(edtEquipamentos,'Informe o equipamento');
  if ExisteRegistro(pDataSet,'IDEQUIPAMENTOCLIENTE',False,True) Then
  begin
    Avisa('Esse equipamento j� foi adicionado');
    edtEquipamentos.SetFocus;
    exit;
  end;
  inherited;

end;

procedure TfrmDlg_EquipamentoOS.edtEquipamentosBtnEditarClick(Sender: TObject);
begin
  inherited;
  edtEquipamentos.ValorChave := TrotinasForms.AbreManutencaoEquipamentoCliente(IdCliente,toEditar);
  edtEquipamentos.Localiza;
end;

procedure TfrmDlg_EquipamentoOS.edtEquipamentosBtnNovoClick(Sender: TObject);
begin
  inherited;
  edtEquipamentos.ValorChave := TrotinasForms.AbreManutencaoEquipamentoCliente(IdCliente,toIncluir);
  edtEquipamentos.Localiza;
end;

procedure TfrmDlg_EquipamentoOS.edtEquipamentosRegAchado(
  const ValoresCamposEstra: array of Variant);
begin
  inherited;
  if pDataSet.State in [dsInsert,dsEdit] then
    pDataSet.FieldByName('IDENTIFICADOR').AsString := edtEquipamentos.Text;
end;

procedure TfrmDlg_EquipamentoOS.FormShow(Sender: TObject);
begin
  inherited;
  ConfiguraEditPesquisa(edtEquipamentos,pDataSet,tpERPClienteEquipamento,True,'','','IDENTIFICADOR','IDEQUIPAMENTOCLIENTE');
  edtEquipamentos.SQLComp := 'idcliente = '+TipoCampoChaveToStr(IdCliente);
end;

procedure TfrmDlg_EquipamentoOS.SetIdCliente(const Value: TipoCampoChave);
begin
  FIdCliente := Value;
end;

end.
