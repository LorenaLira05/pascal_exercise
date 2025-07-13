program AnaliseNotas;

uses crt;

const
  NUM_ALUNOS = 5;
  NUM_PROVAS = 4;

type
  MatrizNotas = array[1..NUM_ALUNOS, 1..NUM_PROVAS] of Real;

var
  notas: MatrizNotas;
  i, j: Integer;
  soma, media, maiorMedia: Real;
  alunoMaiorMedia: Integer;
  mediasAlunos: array[1..NUM_ALUNOS] of Real;

begin
  clrscr;
  
  // 1. Leitura das notas
  for i := 1 to NUM_ALUNOS do
  begin
    writeln('Digite as notas do aluno ', i, ':');
    for j := 1 to NUM_PROVAS do
    begin
      write('Nota ', j, ': ');
      readln(notas[i, j]);
    end;
    writeln;
  end;

  // 2. Calculo da media de cada aluno
  maiorMedia := -1;
  for i := 1 to NUM_ALUNOS do
  begin
    soma := 0;
    for j := 1 to NUM_PROVAS do
      soma := soma + notas[i, j];

    media := soma / NUM_PROVAS;
    mediasAlunos[i] := media;

    writeln('Media do aluno ', i, ': ', media:0:2);

    // 3. Verifica se e a maior media
    if media > maiorMedia then
    begin
      maiorMedia := media;
      alunoMaiorMedia := i;
    end;
  end;

  writeln;
  writeln('Aluno com a maior media: Aluno ', alunoMaiorMedia, ' (Media: ', maiorMedia:0:2, ')');
  writeln;

  // 4. Media da turma por prova
  for j := 1 to NUM_PROVAS do
  begin
    soma := 0;
    for i := 1 to NUM_ALUNOS do
      soma := soma + notas[i, j];

    media := soma / NUM_ALUNOS;
    writeln('Media da prova ', j, ': ', media:0:2);
  end;

  writeln;
  writeln('Matriz de notas (linhas = alunos, colunas = provas):');
  
  // 5. Impressao da matriz
  for i := 1 to NUM_ALUNOS do
  begin
    write('Aluno ', i, ': ');
    for j := 1 to NUM_PROVAS do
      write(notas[i, j]:0:2, '  ');
    writeln;
  end;

  readln;
end.
