program PilhaComVetor;
uses crt;

const
  MAX = 10; // Tamanho maximo da pilha

var
  pilha: array[1..MAX] of integer; // Vetor para armazenar a pilha
  topo: integer; // Controla a posicao do topo

// Procedimento para empilhar (Push)
procedure Push(valor: integer);
begin
  if topo < MAX then
  begin
    inc(topo); // Move o topo para cima
    pilha[topo] := valor; // Insere o valor
  end
  else
    writeln('Erro: Pilha cheia');
end;

// Funcao para desempilhar (Pop)
function Pop: integer;
begin
  if topo > 0 then
  begin
    Pop := pilha[topo]; // Pega o valor do topo
    dec(topo); // Move o topo para baixo
  end
  else
  begin
    writeln('Erro: Pilha vazia!');
    Pop := -1; // Valor de erro
  end;
end;

// Funcao para ver o topo sem remover (Top)
function Top: integer;
begin
  if topo > 0 then
    Top := pilha[topo] // Retorna o valor do topo
  else
  begin
    writeln('Pilha vazia!');
    Top := -1;
  end;
end;

// Funcao para verificar se a pilha esta vazia
function IsEmpty: boolean;
begin
  IsEmpty := (topo = 0);
end;

// Programa principal
var
  i, numero: integer;
begin
  topo := 0; // Inicializa pilha vazia

  writeln('Digite ', MAX, ' numeros para empilhar:');

  // Loop para ler os valores e empilhar
  for i := 1 to MAX do
  begin
    write('Numero ', i, ': ');
    readln(numero);
    Push(numero); // Empilha o numero
  end;

  writeln(#10'=== DESEMPILHANDO ===');
  // Loop para desempilhar ate esvaziar
  while not IsEmpty do
  begin
    writeln('Pop -> ', Pop);
  end;

  writeln('A pilha esta vazia agora.');
  readln; // Pausa antes de fechar
end.

