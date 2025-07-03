programa
{
	//Calculadora com as 4 operações
	funcao inicio()
	{
		real numero1, numero2, resultado=0.0
		caracter operador
//Pede para o usuário informar 2 números e 1 operador
		escreva("Digite o primeiro número: ")
		leia (numero1)

		escreva("Digite o segundo número: ")
		leia(numero2)

		escreva("Escolha um operador ( +, -, *, /): ")
		leia (operador)

		/* Verifica qual foi a operação selecionada */
		se(operador == '+')
		{
			resultado = numero1 + numero2
		}

		senao se(operador == '-')
		{
			resultado = numero1 - numero2
		}
		senao se(operador == '*')
		{
			resultado = numero1 * numero2
		}

		senao se(operador == '/')
		{
			resultado = numero1 / numero2
		}
		senao
		{
			escreva("Operador inválido! Use +, -, * ou /\n")
			retorne
		}
		
		limpa()

		escreva("O resultado da operação é:\n")
		escreva(numero1," ", operador, " ", numero2, " ", "=", " " , resultado)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 471; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {numero1, 6, 7, 7}-{numero2, 6, 16, 7}-{resultado, 6, 25, 9}-{operador, 7, 11, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */