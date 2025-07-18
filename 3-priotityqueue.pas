Program FilaComPrioridade;

uses crt;

type
  Item = record
    valor: integer;
    prioridade: integer; // 1 (mais alta), 2, 3 (mais baixa)
  end;

  Fila = record
    itens: array[1..10] of Item;
    fim: integer;
  end;

var
  f: Fila;
  i, valor, prioridade: integer;

procedure IniciarFila(var f: Fila);
begin
  f.fim := 0;
end;

procedure Enqueue(var f: Fila; v, p: integer);
begin
  if f.fim < 10 then
  begin
    f.fim := f.fim + 1;
    f.itens[f.fim].valor := v;
    f.itens[f.fim].prioridade := p;
  end
  else
    writeln('Fila cheia!');
end;

procedure Dequeue(var f: Fila);
var
  i, indice, menor: integer;
begin
  if f.fim = 0 then
  begin
    writeln('Fila vazia!');
    exit;
  end;

  menor := 4; // maior que a prioridade maxima (3)
  indice := -1;

  for i := 1 to f.fim do
  begin
    if f.itens[i].prioridade < menor then
    begin
      menor := f.itens[i].prioridade;
      indice := i;
    end;
  end;

  writeln('Removido: ', f.itens[indice].valor, ' (Prioridade ', f.itens[indice].prioridade, ')');

  // Deslocar os itens para "remover" o item
  for i := indice to f.fim - 1 do
    f.itens[i] := f.itens[i + 1];

  f.fim := f.fim - 1;
  writeln;
end;

procedure ImprimirFila(f: Fila);
var
  i: integer;
begin
  writeln('Fila atual:');
  for i := 1 to f.fim do
    writeln(i, ') Valor: ', f.itens[i].valor, ' | Prioridade: ', f.itens[i].prioridade);
end;

begin
  clrscr;
  IniciarFila(f);

  writeln('== Digite 10 elementos e sua prioridade (1=Alta, 2=Media, 3=Baixa) ==');
  writeln;

  for i := 1 to 10 do
  begin
    write('Elemento ', i, ' - Valor: ');
    readln(valor);

    repeat
      write('Prioridade (1 a 3): ');
      readln(prioridade);
    until (prioridade >= 1) and (prioridade <= 3);

    Enqueue(f, valor, prioridade);
    writeln;
  end;

  writeln('=== Fila preenchida ===');
  ImprimirFila(f);

  writeln;
  writeln('== Removendo todos os elementos por prioridade ==');
  while f.fim > 0 do
    Dequeue(f);

  writeln('Todos os elementos foram removidos.');
  readln;
end.

