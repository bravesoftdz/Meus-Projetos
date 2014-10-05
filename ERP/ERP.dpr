program ERP;

uses
  ExceptionLog,
  Forms,
  SysUtils,
  MidasLib,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uFormPadrao in '..\Global\uFormPadrao.pas' {frmPadrao},
  Cad_CadastroPai in '..\Global\Cad_CadastroPai.pas' {frmCad_CadastroPai},
  Comandos in '..\Global\Comandos.pas',
  Dlg_Cadastro in '..\Global\Dlg_Cadastro.pas' {frmDlg_Cadastro},
  Lst_CadastroSimples in '..\Global\Lst_CadastroSimples.pas' {frmLstCadastroSimples},
  MinhasClasses in '..\Global\MinhasClasses.pas',
  uAcessoUsuario in '..\Global\uAcessoUsuario.pas',
  uAguarde in '..\Global\uAguarde.pas' {frmAguarde},
  uCad_Licenca in '..\Global\uCad_Licenca.pas' {frmCad_Licenca},
  UCfgPadrao in '..\Global\UCfgPadrao.pas',
  UdlgRelatorioPadrao in '..\Global\UdlgRelatorioPadrao.pas' {frmdlgRelatorioPadrao},
  UDmConexao in '..\Global\UDmConexao.pas' {DMConexao: TDataModule},
  uDmRelatorio in '..\Global\uDmRelatorio.pas' {DmRelatorio: TDataModule},
  uLibEmail in '..\Global\uLibEmail.pas',
  uLibLicenca in '..\Global\uLibLicenca.pas',
  uLista_Layouts in '..\Global\uLista_Layouts.pas' {frmLista_Layouts},
  uListagemPadrao in '..\Global\uListagemPadrao.pas' {frmListagemPadrao},
  uMetodosRB in '..\Global\uMetodosRB.pas',
  uObs in '..\Global\uObs.pas' {frmOBS},
  uPesquisa_kimera in '..\Global\uPesquisa_kimera.pas' {frmPesquisa},
  uPrincipalPadrao in '..\Global\uPrincipalPadrao.pas' {frmPrincipalPadrao},
  uSQL in '..\Global\uSQL.pas',
  Lst_CadastroERP in 'Lst_CadastroERP.pas' {frmLstCadastroSimplesERP},
  uCad_CadastroPaiERP in 'uCad_CadastroPaiERP.pas' {frmCad_CadastroPaiERP},
  Lst_Empresa in 'Lst_Empresa.pas' {frmLst_Empresa},
  uAuditoria in 'uAuditoria.pas' {frmAuditoria},
  Cad_CEP in 'Cad_CEP.pas' {frmCad_CEP},
  Cad_usuario in 'Cad_usuario.pas' {frmCad_usuario},
  uLst_Unidade in 'uLst_Unidade.pas' {frmLst_Unidade},
  Cad_Agenda in 'Cad_Agenda.pas' {frmCad_Agenda},
  uAgenda in 'uAgenda.pas' {frmAgenda},
  uLogin in 'uLogin.pas' {frmLogin},
  uCadNCM in 'uCadNCM.pas' {frmCad_NCM},
  uSQLERP in 'uSQLERP.pas',
  uForms in 'uForms.pas',
  Cad_Cliente in 'Cad_Cliente.pas' {frmCad_Cliente},
  uCad_Funcionario in 'uCad_Funcionario.pas' {frmCadFuncionario},
  uCad_Fornecedor in 'uCad_Fornecedor.pas' {frmCad_Fornecedor},
  uCad_Produto in 'uCad_Produto.pas' {frmCad_Produto},
  uLst_Periodicidade in 'uLst_Periodicidade.pas' {frmLst_Periodicidade},
  uLst_ContaBancaria in 'uLst_ContaBancaria.pas' {frmLst_ContaBancaria},
  uLst_CondicaoPagamento in 'uLst_CondicaoPagamento.pas' {frmLst_CondicaoPagamento},
  uConstantes in 'uConstantes.pas',
  uListagemPadraoERP in 'uListagemPadraoERP.pas' {frmListagemPadraoERP},
  uLst_Proposta in 'uLst_Proposta.pas' {frmLst_Proposta},
  uCad_proposta in 'uCad_proposta.pas' {frmCad_Proposta},
  uDlg_CadastroERP in 'uDlg_CadastroERP.pas' {frmDlg_CadastroERP},
  udlgCondicaoPagamento in 'udlgCondicaoPagamento.pas' {frmdlgCondicaoPagamento},
  uRegras in 'uRegras.pas',
  uLst_TipoContrato in 'uLst_TipoContrato.pas' {frmLst_TipoContrato},
  uLst_Contratos in 'uLst_Contratos.pas' {frmLst_Contratos},
  uCad_Contratos in 'uCad_Contratos.pas' {frmCad_Contrato},
  uDlg_ServicoContrato in 'uDlg_ServicoContrato.pas' {frmDlg_ServicoContrato},
  uAddItemPadrao in 'uAddItemPadrao.pas' {frmAddItemPadrao},
  uDlgEquipamentoClienteContrato in 'uDlgEquipamentoClienteContrato.pas' {frmDlg_EquipamentoClienteContrato},
  uDlg_EquipamentoCliente in 'uDlg_EquipamentoCliente.pas' {frmDlg_EquipamentoCliente},
  uLst_TipoOS in 'uLst_TipoOS.pas' {frmLst_TipoOS},
  uLst_StatusOS in 'uLst_StatusOS.pas' {frmLst_StatusOS},
  uLst_OS in 'uLst_OS.pas' {frmLst_OS},
  uCad_OS in 'uCad_OS.pas' {frmCad_OS},
  uDlg_EquipamentoOS in 'uDlg_EquipamentoOS.pas' {frmDlg_EquipamentoOS},
  uDlg_ExecucaoOSEquipamento in 'uDlg_ExecucaoOSEquipamento.pas' {frmDlg_ExecucaoOSEquipamento},
  uDlg_ServicoEquipamentoOS in 'uDlg_ServicoEquipamentoOS.pas' {frmDlg_ServicoEquipamentoOS},
  uLibERP in 'uLibERP.pas',
  uEntrada in 'uEntrada.pas' {frmEntradaEstoque},
  Inc_ProdutoEntrada in 'Inc_ProdutoEntrada.pas' {frmInc_ProdutoEntrada},
  Lst_OperacaoEstoque in 'Lst_OperacaoEstoque.pas' {frmLst_OperacaoEstoque},
  uDlg_ManutencaoSerialProduto in 'uDlg_ManutencaoSerialProduto.pas' {frmDlg_ManutencaoSerialProduto},
  uLst_Entrada in 'uLst_Entrada.pas' {frmLst_Entrada},
  uCad_Entrada in 'uCad_Entrada.pas' {frmCad_Entrada},
  udlg_SaidaSerial in 'udlg_SaidaSerial.pas' {frmDlg_SaidaSerial},
  udlg_ItensProposta in 'udlg_ItensProposta.pas' {frmDlg_ItensProposta},
  uSaida in 'uSaida.pas' {frmSaida},
  uLibSaida in 'uLibSaida.pas',
  uDlg_SaidaItem in 'uDlg_SaidaItem.pas' {frmDlg_SaidaItem},
  uCad_Transportadora in 'uCad_Transportadora.pas' {frmCad_Transportadora},
  uLst_Saidas in 'uLst_Saidas.pas' {frmLst_Saidas},
  uCadConfiguracoes in 'uCadConfiguracoes.pas' {frmCadConfiguracao},
  uGerenteConfiguracao in 'uGerenteConfiguracao.pas',
  uConfiguracaoFaturamento in 'uConfiguracaoFaturamento.pas',
  uConfiguracaoOS in 'uConfiguracaoOS.pas',
  uLst_ContasReceber in 'uLst_ContasReceber.pas' {frmLst_ContasReceber},
  uCad_ContasReceber in 'uCad_ContasReceber.pas' {frmCad_ContasReceber},
  uDlg_RecebimentosContasReceber in 'uDlg_RecebimentosContasReceber.pas' {frmDlg_RecebimentosContasReceber},
  uConfiguracaoFinanceiro in 'uConfiguracaoFinanceiro.pas',
  uLst_TipoPatrimonio in 'uLst_TipoPatrimonio.pas' {frmLst_TipoPatrimonio},
  uCad_Patrimonio in 'uCad_Patrimonio.pas' {frmCad_Patrimonio},
  uLst_TipoEvento in 'uLst_TipoEvento.pas' {ftmLst_TipoEvento},
  uLst_ManutencaoPatrimonio in 'uLst_ManutencaoPatrimonio.pas' {frmLst_ManutencaoPatrimonio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  InfoSistema.UsaGuidChave := True;
  InfoSistema.LocalBancoDados := 'D:\Meus Projetos\Bancos\Erp.fdb';
  if not FileExists(InfoSistema.LocalBancoDados) then
    InfoSistema.LocalBancoDados := ExtractFilePath(Application.ExeName)+'Erp.fdb';
  InfoSistema.NomeBanco :='Erp.fdb';
  InfoSistema.Host := '127.0.0.1';
  InfoSistema.UsaBancoDados := True;
  InfoSistema.Sistema := sERP;
  InfoSistema.VerificaLicenca := False;
  InfoSistema.SQLs := TSQLERP.Create;

  USuarioLogado.Id := 1;

  Application.Title := 'ERP';


  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
