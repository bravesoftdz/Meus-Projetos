unit Daruma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, RDprint;

type
  TDFM_DARUMA = class(TForm)
    RDprint1: TRDprint;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel3: TBevel;
    BitBtn4: TBitBtn;
    Button1: TButton;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label17: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Shape1: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DFM_DARUMA: TDFM_DARUMA;

implementation

{$R *.dfm}

procedure TDFM_DARUMA.BitBtn1Click(Sender: TObject);
begin
     Close;
end;

procedure TDFM_DARUMA.BitBtn2Click(Sender: TObject);
var
     lin : integer;
begin
{
     Imprime usando o modelo BOBINA, sem qualquer configura��o de fonte

     - Selecione o modelo BOBINA ap�s o comando ABRIR
     - N�o use acentua��o
     - N�o use PREVIEW, para imprimir CUPOM n�o tem sentido...
     - Limite 999 LINHAS por pagina... se for passar este limite,
       deve verificar e saltar p�gina para n�o sobrepor o texto  (ATEN��O)
}
     Lin := 1; // O limite ser� 999 linhas no cupom;
     RDprint1.Abrir;
     RDprint1.Impressora       := BOBINA;  // Depois do Abrir para FOR�AR o modelo BOBINA (sem comando)
     RDprint1.TamanhoQteLinhas := 1;   // Evita o salto indesejado no final
     RDprint1.TamanhoQteColunas:= 48;  // N�o importa... O preview N�o deve ser mostrado...
     RDprint1.Acentuacao       := SemAcento;
     RDprint1.MostrarProgresso := false;
     RDprint1.ImpASCII(01,01,'27 64');  // RESET DARUMA para possicionar a cabe�a de impress�o
     RDprint1.Imp(Lin,01,'------------------------------------------------');
     inc(Lin);
     RDprint1.Imp(Lin,01,'       C U P O M    N � O    F I S C A L        ');
     inc(Lin);
     RDprint1.Imp(Lin,01,'------------------------------------------------');
     inc(Lin);
     RDprint1.Imp(Lin,01,'            DELTRESS INFORM�TICA                ');
     inc(Lin);
     RDprint1.Imp(Lin,01,'        AV. REP�BLICA, 948 - CENTRO             ');
     inc(Lin);
     RDprint1.Imp(Lin,01,'                MAR�LIA - SP                    ');
     inc(Lin);
     RDprint1.Imp(Lin,01,'01/01/2006                                12:00 ');
     inc(Lin);
     RDprint1.Imp(Lin,01,'------------------------------------------------');
     inc(Lin);
     RDprint1.Imp(Lin,01,'Cod  Produto          Quant    Unit�rio    Total');
     inc(Lin);
     RDprint1.Imp(Lin,01,'------------------------------------------------');
     inc(Lin);
     RDprint1.Imp(Lin,01,'001  PRODUTO UM         1,0      17,50     17,50');
     inc(Lin);
     RDprint1.Imp(Lin,01,'002  PRODUTO DOIS       1,0 CX    5,60      5,60');
     inc(Lin);
     RDprint1.Imp(Lin,01,'003  PRODUTO TREIS      2,0 CX    5,00     10,00');
     inc(Lin);
     RDprint1.Imp(Lin,01,'------------------------------------------------');
     inc(Lin);
     RDprint1.Imp(Lin,01,'     TOTAL                       R$        33,10');
     inc(Lin);
     RDprint1.Imp(Lin,01,'     Dinheiro                    R$        50,00');
     inc(Lin);
     RDprint1.Imp(Lin,01,'                                 ---------------');
     inc(Lin);
     RDprint1.Imp(Lin,01,'     Troco                       R$        16,90');
     // Avan�a 9 linhas em branco no final do cupom para DESTAQUE...
     Lin := Lin + 9;
     RDprint1.Imp(Lin,01,' '#10#13);
     // Finaliza e imprime o Cupom.. SEM PREVIEW
     RDprint1.Fechar;
end;


procedure TDFM_DARUMA.BitBtn3Click(Sender: TObject);
    Procedure Imprime(Texto : string);
    begin
       RDprint1.Abrir;
       RDprint1.Impressora       := BOBINA;  // Depois do Abrir para FOR�AR o modelo BOBINA (sem comando)
       RDprint1.TamanhoQteLinhas := 1;       // Evita o salto indesejado no final
       RDprint1.MostrarProgresso := false;
       RDprint1.Acentuacao       := SemAcento;
       // Acrescenta #10 + #13 no Texto para saltar a linha e possicionar a cabe�a de impress�o
       RDprint1.Imp(01,01,Texto+#10+#13);
       RDPrint1.Fechar;
       // Usando o Gerenciador de impress�o, Pode ser necess�rio "SLEEP" para evitar
       // a INVERS�O DE ORDEM das linhas pelo gerenciador de impress�o...  (Coisas do Windows...)
       sleep(200);
    end;
begin
{
     ESTE EXEMPLO IMPRIME LINHA A LINHA, COMO NO CUPOM FISCAL (CONCOMITANTE AO COMANDO)

     Imprime usando o modelo BOBINA, sem qualquer configura��o de fonte

     - Selecione o modelo BOBINA ap�s o comando ABRIR
     - N�o use acentua��o
     - N�o use PREVIEW, para imprimir CUPOM n�o tem sentido...
     - SEM Limite de Linhas
     * Rotina IMPRIME faz o envio a CADA LINHA, igual a CUPOM FISCAL
}
     Imprime('------------------------------------------------');
     Imprime('       C U P O M    N � O    F I S C A L        ');
     Imprime('------------------------------------------------');
     Imprime('            DELTRESS INFORM�TICA                ');
     Imprime('        AV. REP�BLICA, 948 - CENTRO             ');
     Imprime('                MAR�LIA - SP                    ');
     Imprime('01/01/2006                                12:00 ');
     Imprime('------------------------------------------------');
     Imprime('Cod  Produto          Quant    Unit�rio    Total');
     Imprime('------------------------------------------------');
     Imprime('001  PRODUTO UM         1,0      17,50     17,50');
     Imprime('002  PRODUTO DOIS       1,0 CX    5,60      5,60');
     Imprime('003  PRODUTO TREIS      2,0 CX    5,00     10,00');
     Imprime('------------------------------------------------');
     Imprime('     TOTAL                       R$        33,10');
     Imprime('     Dinheiro                    R$        50,00');
     Imprime('                                 ---------------');
     Imprime('     Troco                       R$        16,90');
     // Avan�a 9 linhas em branco no final do cupom para DESTAQUE...
     Imprime(' ');
     Imprime(' ');
     Imprime(' ');
     Imprime(' ');
     Imprime(' ');
     Imprime(' ');
     Imprime(' ');
     Imprime(' ');
     Imprime(' ');
end;

procedure TDFM_DARUMA.BitBtn4Click(Sender: TObject);
var
     lin : integer;
begin
{
     Imprime usando o modelo BOBINA, sem qualquer configura��o de fonte

     - Selecione o modelo BOBINA ap�s o comando ABRIR
     - N�o use acentua��o
     - N�o use PREVIEW, para imprimir CUPOM n�o tem sentido...
     - Limite 999 LINHAS por pagina... se for passar este limite,
       deve verificar e saltar p�gina para n�o sobrepor o texto  (ATEN��O)
}
     Lin := 1; // O limite ser� 999 linhas no cupom;
     RDprint1.Abrir;
     RDprint1.Impressora       := BOBINA;  // Depois do Abrir para FOR�AR o modelo BOBINA (sem comando)
     RDprint1.TamanhoQteLinhas := 1;   // Evita o salto indesejado no final
     RDprint1.Acentuacao       := SemAcento;
     RDprint1.MostrarProgresso := false;
     // Inicio da Impress�o...
    // RESET DARUMA para possicionar a cabe�a de impress�o
     RDprint1.ImpASCII(01,01,'27 64');

     RDprint1.Imp(Lin,01,'------------------------------------------------');
     inc(Lin);
     // Liga Expandido... ESC �
     RDprint1.ImpASCII(Lin,01,'27 14');
     RDprint1.Imp(Lin,01,'    CUPOM N�O FISCAL');
     inc(Lin);
     // Desliga Expandido... ESC dc4
     RDprint1.ImpASCII(Lin,01,'27 20');
     RDprint1.Imp(Lin,01,'------------------------------------------------');
     inc(Lin);
     RDprint1.Imp(Lin,01,'            DELTRESS INFORM�TICA                ');
     inc(Lin);
     RDprint1.Imp(Lin,01,'        AV. REP�BLICA, 948 - CENTRO             ');
     inc(Lin);
     RDprint1.Imp(Lin,01,'                MAR�LIA - SP                    ');
     inc(Lin);
     RDprint1.Imp(Lin,01,'01/01/2006                                12:00 ');
     inc(Lin);
     RDprint1.Imp(Lin,01,'------------------------------------------------');
     inc(Lin);
     RDprint1.Imp(Lin,01,'Cod  Produto          Quant    Unit�rio    Total');
     inc(Lin);
     RDprint1.Imp(Lin,01,'------------------------------------------------');
     inc(Lin);
     RDprint1.Imp(Lin,01,'001  PRODUTO UM         1,0      17,50     17,50');
     inc(Lin);
     RDprint1.Imp(Lin,01,'002  PRODUTO DOIS       1,0 CX    5,60      5,60');
     inc(Lin);
     RDprint1.Imp(Lin,01,'003  PRODUTO TREIS      2,0 CX    5,00     10,00');
     inc(Lin);
     RDprint1.Imp(Lin,01,'------------------------------------------------');
     inc(Lin);
     // Liga Negrito... ESC F
     RDprint1.ImpASCII(Lin,01,'27 71');
     RDprint1.Imp(Lin,01,'     TOTAL                       R$        33,10');
     inc(Lin);
     // Desliga Negrito... ESC H
     RDprint1.ImpASCII(Lin,01,'27 72');
     RDprint1.Imp(Lin,01,'     Dinheiro                    R$        50,00');
     inc(Lin);
     RDprint1.Imp(Lin,01,'                                 ---------------');
     inc(Lin);
     RDprint1.Imp(Lin,01,'     Troco                       R$        16,90');
     // Avan�a 9 linhas em branco no final do cupom para DESTAQUE...
     Lin := Lin + 9;
     RDprint1.Imp(Lin,01,' ');
     // Finaliza e imprime o Cupom.. SEM PREVIEW
     RDprint1.Fechar;
end;

procedure TDFM_DARUMA.Button1Click(Sender: TObject);
var
     Lin : integer;
begin
     Lin := 1; // O limite ser� 999 linhas no cupom;
     RDprint1.Abrir;
     RDprint1.Impressora       := BOBINA;  // Depois do Abrir para FOR�AR o modelo BOBINA (sem comando)
     RDprint1.TamanhoQteLinhas := 1;   // Evita o salto indesejado no final
     RDprint1.Acentuacao       := SemAcento;
     RDprint1.MostrarProgresso := false;
     // Inicio da Impress�o...

    // RESET DARUMA para possicionar a cabe�a de impress�o
     RDprint1.ImpASCII(01,01,'27 64');

     // Outros Comandos...
     inc(lin);
     RDprint1.Imp(Lin,01,'123456789012 - MODO NORMAL');

     // NEGRITO   ESC F
     inc(lin);
     RDprint1.ImpASCII(Lin,01,'27 71');  // Liga Negrito
     RDprint1.Imp(Lin,01,'Impress�o em NEGRITO');
     inc(lin);
     RDprint1.ImpASCII(Lin,01,'27 72');  // Delisga Negrito

     // Liga Italico... ESC 4
     inc(lin);
     RDprint1.ImpASCII(Lin,01,'27 52');  // Liga Italico
     RDprint1.Imp(Lin,01,'Impress�o em ITALICO');
     inc(lin);
     RDprint1.ImpASCII(Lin,01,'27 53');  // Desliga Italico

     // Liga Expandido... ESC �
     inc(lin);
     RDprint1.ImpASCII(Lin,01,'27 14');
     RDprint1.Imp(Lin,01,'EXPANDIDO');
     inc(Lin);
     RDprint1.ImpASCII(Lin,01,'27 14'); // Deliga Expandido

     // Liga Expandido + Negrito... ESC �
     inc(lin);
     RDprint1.ImpASCII(Lin,01,'27 14 27 71');
     RDprint1.Imp(Lin,01,'EXPANDIDO + NEGRITO');
     inc(Lin);
     RDprint1.ImpASCII(Lin,40,'27 14 27 72'); // Deliga Expandido

     // Finaliza...
     RDprint1.Fechar;
end;

procedure TDFM_DARUMA.BitBtn6Click(Sender: TObject);
begin
     RDprint1.Abrir;
     RDprint1.Impressora       := BOBINA;  // Depois do Abrir para FOR�AR o modelo BOBINA (sem comando)
     RDprint1.TamanhoQteLinhas := 1;   // Evita o salto indesejado no final
     RDprint1.Acentuacao       := SemAcento;
     RDprint1.MostrarProgresso := false;

     // AUTENTICA��O DE DOCUMENTO - ESC Y
     RDprint1.ImpASCII(01,01,'27 89');  // Comando de Autentica��o...
     // Texto complementar para Autentica��o...
     RDprint1.Imp(01,05,'*** AUTENTICACAO COM LOGO ***');
     // LOGO - Ambul�ncia (By Diniz) - Impress�o GRAFICA
     RDprint1.ImpASCII(01,36,'27 94 17 0 126 0 126 0 126 0 111 0 71 0 110 0 126 0 126 0 126 0 126 0 254 0 70 0 71 0 39 0 22 0 14 0 14 0');

{
     // For�a Salto da Linha para emitir sinal sonoro para posicionamento do Papel...');
     RDprint1.ImpASCII(01,39,'13');
     // Outra maneira de Fazer... descomente o codigo (Abrindo e Fechando em 2 etapas)
     RDprint1.Fechar;
     showmessage('Coloque o Papel para Autentica��o');

     // 2� Autentica��o na BOBINA - Opcional
     RDprint1.Abrir;
     RDprint1.Impressora       := BOBINA;  // Depois do Abrir para FOR�AR o modelo BOBINA (sem comando)
     RDprint1.TamanhoQteLinhas := 1;   // Evita o salto indesejado no final
     RDprint1.Acentuacao       := SemAcento;
     RDprint1.MostrarProgresso := false;
}
     RDprint1.Imp(02,05,'*** AUTENTICACAO COM LOGO ***');
     // LOGO - Ambul�ncia (By Diniz) - Impress�o GRAFICA
     RDprint1.ImpASCII(02,36,'27 94 17 0 126 0 126 0 126 0 111 0 71 0 110 0 126 0 126 0 126 0 126 0 254 0 70 0 71 0 39 0 22 0 14 0 14 0');
     RDprint1.ImpASCII(02,39,'10 13'); // For�a Finaliza��o...
     RDprint1.Fechar;
end;

procedure TDFM_DARUMA.BitBtn5Click(Sender: TObject);
begin
     RDprint1.Abrir;
     RDprint1.Impressora       := BOBINA;
     RDprint1.MostrarProgresso := false;
     // ACIONA A ABERTURA DE GAVETA - ESC 255 - Depende do Modelo, Consulte o Manual da DARUMA / Gaveta
     RDprint1.ImpASCII(01,01,'27 255');
     RDprint1.Fechar;
end;

end.


