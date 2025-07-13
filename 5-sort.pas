program OrdenacaoBusca;

const
  TAMANHO_VETOR = 10;

type
  VetorInteiros = array[1..TAMANHO_VETOR] of integer;

// Implementacao do Bubble Sort
procedure BubbleSort(var vetor: VetorInteiros);
var
  i, j, temp: integer;
  trocou: boolean;
begin
  for i := 1 to TAMANHO_VETOR - 1 do //Passa pelo vetor n-1 vezes
  begin
    trocou := false;
    for j := 1 to TAMANHO_VETOR - i do
    begin
      if vetor[j] > vetor[j + 1] then
      begin
        temp := vetor[j];
        vetor[j] := vetor[j + 1];
        vetor[j + 1] := temp;
        trocou := true; //Indica que houve troca
      end;
    end;
    if not trocou then
      exit; // O vetor ja esta ordenado
  end;
end;

// Implementacao do Selection Sort
procedure SelectionSort(var vetor: VetorInteiros);
var
  i, j, minIndex, temp: integer;
begin
  for i := 1 to TAMANHO_VETOR - 1 do
  begin
    minIndex := i;
    for j := i + 1 to TAMANHO_VETOR do
    begin
      if vetor[j] < vetor[minIndex] then
        minIndex := j;
    end;
    temp := vetor[i];
    vetor[i] := vetor[minIndex];
    vetor[minIndex] := temp;
  end;
end;

// Implementacao da Busca Linear
function BuscaLinear(vetor: VetorInteiros; valor: integer): integer;
var
  i: integer;
begin
  for i := 1 to TAMANHO_VETOR do
  begin
    if vetor[i] = valor then
      exit(i);
  end;
  exit(-1); // Retorna -1 se o valor não for encontrado
end;

// Implementacao da Busca Binaria
function BuscaBinaria(vetor: VetorInteiros; valor: integer): integer;
var
  esquerda, direita, meio: integer;
begin
  esquerda := 1; // Limite esquerdo inicial
  direita := TAMANHO_VETOR; // Limite direito inicial

  while esquerda <= direita do
  begin
    meio := (esquerda + direita) div 2; //Calcula o meio
    if vetor[meio] = valor then //Verifica se encontrou
      exit(meio);
    if vetor[meio] < valor then
      esquerda := meio + 1
    else
      direita := meio - 1;
  end;
  exit(-1); // Retorna -1 se o valor nao for encontrado
end;

//Professor, esse comentario e um pedido de socorro!Que bomba de questao e essa pelo amor de Deus kkkkkkk

// Programa Principal
var
  numeros: VetorInteiros;
  i, escolha, valorBusca, posicaoLinear, posicaoBinaria: integer;

begin
  // 1. Solicita ao usuario que digite 10 numeros inteiros
  writeln('Digite 10 numeros inteiros: ');
  writeln;
  for i := 1 to TAMANHO_VETOR do
  begin
    write('Numero ', i, ': ');
    readln(numeros[i]); 
  end;

  // 2. Pergunta ao usuario qual algoritmo de ordenacao deseja utilizar
  writeln('');
  writeln('Escolha o algoritmo de ordenacao:');
  writeln('1 - Bubble Sort');
  writeln('2 - Selection Sort');
  readln(escolha);

  // 3. Realiza a ordenacao do vetor conforme a escolha do usuario
  if escolha = 1 then
  begin
    BubbleSort(numeros);
    writeln('');
    writeln('Vetor ordenado usando Bubble Sort:');
  end
  else if escolha = 2 then
  begin
    SelectionSort(numeros);
    writeln('');
    writeln('Vetor ordenado usando Selection Sort:');
  end
  else
  begin
    writeln('');
    writeln('Opcao invalida. O vetor nao sera ordenado.');
  end;

  // Exibe o vetor ordenado (ou nao, se a opçao for invalida)
  if (escolha = 1) or (escolha = 2) then
  begin
    for i := 1 to TAMANHO_VETOR do
    begin
      write(numeros[i], ' ');
    end;
    writeln('');
  end;

  // 4. Solicita ao usuario que informe um valor a ser buscado no vetor
  writeln('');
  writeln('Digite o valor que deseja buscar no vetor:');
  readln(valorBusca);

  // 5. Executa a busca linear e a busca binaria
  // 5.1 Busca Linear
  posicaoLinear := BuscaLinear(numeros, valorBusca);
  if posicaoLinear <> -1 then
    writeln('Busca Linear: Valor encontrado na posicao: ', posicaoLinear)
  else
    writeln('Busca Linear: Valor nao encontrado.');

  // 5.2 Busca Binaria (o vetor precisa estar ordenado para a busca binária funcionar corretamente)
  if (escolha = 1) or (escolha = 2) then
  begin
    posicaoBinaria := BuscaBinaria(numeros, valorBusca);
    if posicaoBinaria <> -1 then
      writeln('Busca Binaria: Valor encontrado na posicao: ', posicaoBinaria)
    else
      writeln('Busca Binaria: Valor nao encontrado.');
  end
  else
  begin
    writeln('Busca Binaria nao foi executada pois o vetor nao foi ordenado.');
  end;

  // 6. Finaliza o programa
  writeln('');
  writeln('Fim do programa.');
  readln; // Para pausar a tela no final da execucao
end.
