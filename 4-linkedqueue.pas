program ListaEncadeadaSimples;

type
  // a. Declaracao avancada do ponteiro e depois do registro (no)
  PonteiroNo = ^No;
  No = record
    valor: Integer;
    prox: PonteiroNo;
  end;

var
  // Variavel global para o inicio da lista
  inicio: PonteiroNo;

// Procedimento para imprimir a lista
procedure ImprimeLista(cabeca: PonteiroNo);
var
  atual: PonteiroNo;
begin
  if cabeca = nil then
  begin
    WriteLn('Lista vazia.');
  end
  else
  begin
    atual := cabeca;
    while atual <> nil do
    begin
      Write(atual^.valor, ' ');
      atual := atual^.prox;
    end;
    WriteLn;
  end;
end;

// b. Procedimento para inserir no inicio
procedure InsereInicio(var cabeca: PonteiroNo; v: Integer);
var
  novoNo: PonteiroNo;
begin
  New(novoNo);
  novoNo^.valor := v;
  novoNo^.prox := cabeca;
  cabeca := novoNo;
end;

// b. Procedimento para inserir no fim
procedure InsereFim(var cabeca: PonteiroNo; v: Integer);
var
  novoNo, atual: PonteiroNo;
begin
  New(novoNo);
  novoNo^.valor := v;
  novoNo^.prox := nil;

  if cabeca = nil then
  begin
    cabeca := novoNo;
  end
  else
  begin
    atual := cabeca;
    while atual^.prox <> nil do
    begin
      atual := atual^.prox;
    end;
    atual^.prox := novoNo;
  end;
end;

// c. Procedimento para remover do inicio
procedure RemoveInicio(var cabeca: PonteiroNo);
var
  noParaRemover: PonteiroNo;
begin
  if cabeca = nil then
  begin
    WriteLn('Erro: Tentativa de remover de lista vazia.');
  end
  else
  begin
    noParaRemover := cabeca;
    cabeca := cabeca^.prox;
    WriteLn('Removido no inicio: ', noParaRemover^.valor);
    Dispose(noParaRemover);
  end;
end;

// c. Procedimento para remover do fim
procedure RemoveFim(var cabeca: PonteiroNo);
var
  ultimo, penultimo: PonteiroNo;
begin
  if cabeca = nil then
  begin
    WriteLn('Erro: Tentativa de remover de lista vazia.');
  end
  else if cabeca^.prox = nil then
  begin
    WriteLn('Removido no fim (unico elemento): ', cabeca^.valor);
    Dispose(cabeca);
    cabeca := nil;
  end
  else
  begin
    penultimo := cabeca;
    ultimo := cabeca^.prox;

    while ultimo^.prox <> nil do
    begin
      penultimo := ultimo;
      ultimo := ultimo^.prox;
    end;

    WriteLn('Removido no fim: ', ultimo^.valor);
    Dispose(ultimo);
    penultimo^.prox := nil;
  end;
end;

// Procedimento para liberar toda a memoria da lista
procedure DestroiLista(var cabeca: PonteiroNo);
var
  atual, proximo: PonteiroNo;
begin
  atual := cabeca;
  while atual <> nil do
  begin
    proximo := atual^.prox;
    WriteLn('Deletando no com valor: ', atual^.valor);
    Dispose(atual);
    atual := proximo;
  end;
  cabeca := nil;
end;

// --- Programa Principal ---
begin
  inicio := nil;

  Write('Estado inicial: ');
  ImprimeLista(inicio);

  WriteLn;
  WriteLn('1. Inserindo 10, 20, 30 no inicio...');
  InsereInicio(inicio, 10);
  InsereInicio(inicio, 20);
  InsereInicio(inicio, 30);
  Write('Lista atual: ');
  ImprimeLista(inicio);

  WriteLn;
  WriteLn('2. Removendo do inicio...');
  RemoveInicio(inicio);
  Write('Lista atual: ');
  ImprimeLista(inicio);

  WriteLn;
  WriteLn('3. Inserindo 40 no fim...');
  InsereFim(inicio, 40);
  Write('Lista atual: ');
  ImprimeLista(inicio);

  WriteLn;
  WriteLn('4. Removendo do fim...');
  RemoveFim(inicio);
  Write('Lista atual: ');
  ImprimeLista(inicio);

  WriteLn;
  WriteLn('5. Impressao final da lista: ');
  ImprimeLista(inicio);

  WriteLn;
  WriteLn('Destruindo a lista e liberando memoria...');
  DestroiLista(inicio);
  Write('Lista apos destruicao: ');
  ImprimeLista(inicio);

  WriteLn;
  WriteLn('Programa terminado.');
  readln;
end.


