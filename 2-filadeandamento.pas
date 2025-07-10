program FiladeStrings;
uses crt;

const
  MAX = 5;

type
  TFila = record
    nome: array[1..MAX] of string; // Vetor para armazenar os nomes
    inicio, fim: integer;          // Controles de inicio e fim da fila
  end;

var
  fila: TFila;

// Inicializa a fila vazia
procedure IniciarFila(var f: TFila);
begin
  f.inicio := 1;
  f.fim := 1;
end;

// Verifica se a fila esta vazia
function IsEmpty(f: TFila): boolean;
begin
  IsEmpty := (f.inicio = f.fim);
end;

// Verifica se a fila esta cheia
function IsFull(f: TFila): boolean;
begin
  IsFull := (f.fim mod MAX + 1 = f.inicio);
end;

// Remove e retorna o primeiro elemento da fila
function Dequeue(var f: TFila): string;
begin
  if IsEmpty(f) then
  begin
    writeln('Fila vazia. Nada para remover.');
    Dequeue := '';
  end
  else
  begin
    Dequeue := f.nome[f.inicio];
    f.inicio := f.inicio mod MAX + 1;
  end;
end;

// Adiciona um elemento no final da fila
procedure Enqueue(var f: TFila; nome: string);
begin
  if IsFull(f) then
  begin
    writeln('Fila cheia. Removendo o mais antigo: ', f.nome[f.inicio]);
    Dequeue(f); // Remove o mais antigo para fazer espaco
  end;

  f.nome[f.fim] := nome;
  f.fim := f.fim mod MAX + 1;
end;

// Retorna o primeiro elemento sem remover
function Front(f: TFila): string;
begin
  if IsEmpty(f) then
  begin
    writeln('Fila vazia. Nenhum elemento na frente.');
    Front := '';
  end
  else
    Front := f.nome[f.inicio];
end;

// Exibe todos os elementos da fila
procedure ExibirFila(f: TFila);
var
  i: integer;
begin
  write('Fila atual: [');
  if not IsEmpty(f) then
  begin
    i := f.inicio;
    repeat
      write(f.nome[i]);
      if i mod MAX + 1 <> f.fim then
        write(', ');
      i := i mod MAX + 1;
    until i = f.fim;
  end;
  writeln(']');
end;

// Programa principal
var
  nome: string;
  i: integer;
begin
  clrscr;
  IniciarFila(fila);

  writeln('=== FILA CIRCULAR DE STRINGS ===');
  writeln('Digite ', MAX, ' nomes para adicionar na fila:');

  // Preenche a fila inicial
  for i := 1 to MAX do
  begin
    write('Nome ', i, ': ');
    readln(nome);
    Enqueue(fila, nome);
    ExibirFila(fila);
  end;

  writeln;
  writeln('Fila cheia. Testando remocao automatica:');

  // Testa o comportamento quando a fila está cheia
  for i := 1 to 3 do
  begin
    write('Novo nome ', i, ': ');
    readln(nome);
    Enqueue(fila, nome);
    ExibirFila(fila);
  end;

  writeln;
  writeln('=== INFORMACOES DA FILA ===');
  writeln('Primeiro da fila: ', Front(fila));
  writeln('Fila esta cheia? ', IsFull(fila));
  writeln('Fila esta vazia? ', IsEmpty(fila));

  writeln;
  writeln('=== DESENFILEIRANDO TUDO ===');
  while not IsEmpty(fila) do
    writeln('Removido: ', Dequeue(fila));
    readln;
end.
