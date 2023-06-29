####################################################################
# PROJETO DE ARQUITETURA DE COMPUTADORES 2020/2021-UAL
# TEMA: Calculadora Científica
#GRUPO:
# 30007687 Diogo Matos
# 30007531 João Fernandes
# 30007237 João Ribeiro
# 30007389 Vasco Rodrigues
####################################################################

	.data
	####################################################################
	# BASE DO PROGRAMA (base)
	####################################################################
	
	#VARIAVEIS
	base_input: .word 0
	
	#MENSAGENS
	msg_base_cabecalho: .asciiz  "\n\n ===========// CALCULADORA CIENTÍFICA \\===========\n"
	msg_base_menu: .asciiz " 1 -> Calculadora Simples(Fase 1) \n 2 -> Conversões(Fase 1) \n 3 -> Calculadora Avançada (Fase 2) \n 4 -> HELP(Fase 3)\n 5 -> SAIR \n"
	msg_base_input: .asciiz "\n Escolha o que pretende fazer: $"
	msg_base_error: .asciiz "ERRO:: ESSE COMANDO NÃO EXISTE! $"
	
	
	####################################################################
	# CALCULADORA SIMPLES (cs)
	####################################################################
	
	#VARIAVEIS
	cs_input: .word 0
	cs_num1: .word 0
	cs_num2: .word 0
	
	#MENSAGENS
	msg_cs_menu: .asciiz "\n\n\n\n ===========// CALCULADORA SIMPLES \\=========== \n 1 -> Soma \n 2 -> Subtração \n 3 -> Multiplicação \n 4 -> Divisão \n 5 -> Voltar \n"
	msg_cs_input: .asciiz "Escolha qual a operação que deseja realizar: $"
	msg_cs_num1: .asciiz "Introduza o primeiro número : $"
	msg_cs_num2: .asciiz "Introduza o segundo número : $"
	msg_cs_error: .asciiz "ERRO:: ESTE COMANDO NÃO EXISTE! $"
	msg_cs_error2: .asciiz "ERRO:: ERRO MATEMÁTICO! $"
	msg_cs_result: .asciiz "O Resultado é: $"
	
	
	####################################################################
	# CONVERSOR (cv)
	####################################################################
	
	#VARIAVEIS
	cv_index1: .word 0	#ARRAY
	cv_index2: 64		#ARRAY
	cv_input: .word 0
	cv_num: .word 0
	cv_array: .space 64
	cv_array2: .space 8
	cv_array3: .space 8
	cv_bin_num: .space 16
	cv_hello: .space 16
	
	#MENSAGENS
	msg_cv_menu: .asciiz "\n\n\n\n ===========// CONVERSÕES \\=========== \n 1 -> Binário \n 2 -> Decimal \n 3 -> Voltar  \n"
	msg_cv_input: .asciiz "Escolha qual a operação que deseja realizar: $"
	msg_cv_num: .asciiz "Introduza o número : $"
	msg_cv_result1: .asciiz "\nO Resultado em binário é: $"
	msg_cv_result2: .asciiz "\nO Resultado em decimal é: $"
	msg_cv_result3: .asciiz "\nO Resultado em hexadecimal: $"
	msg_cv_error: .asciiz "ERRO:: ESSE COMANDO NÃO EXISTE! $"
	
	####################################################################
	# CALCULADORA AVANÇADA (ca)
	####################################################################
	
	#VARIAVEIS
	ca_input: .word 0
	ca_num1: .float 0.000001
	float1: .float 0.000001
	float_pi_2:.float 1.5708
	float_pi:.float 3.14159
	float_3pi_2:.float 4.71239
	float_5pi_2:.float 7.85398
	float_2pi:.float 6.28319
	floatxgraus: .float 0.017453
	floatxrad: .float  57.2958

	
	#MENSAGENS
	msg_ca_menu: .asciiz "\n\n\n\n ===========// CALCULADORA AVANÇADA \\=========== \n 1 -> Seno \n 2 -> Cosseno \n 3 -> Raiz quadrada \n 4 -> Potência \n 5 -> Conversor(graus) \n 6 -> logaritmo  \n 7 -> Voltar  \n"
    	msg_ca_input: .asciiz "Escolha qual a operação que deseja realizar: $"
	msg_ca_num: .asciiz "Introduza o número : $"
	msg_ca_resultado: .asciiz "Resultado: "
	msg_ca_input_cos: .asciiz "Programa que calcula cos(x) em radianos até 2PI. \n\Insira o valor de x:"
	msg_ca_erro_cos:    .asciiz "\n\no valor tem de ser menor que 2PI\n"
	msg_ca_expo: .asciiz "introduza o expoente: "
	msg_ca_menu_g: .asciiz "Escolha o número associado à operação:\n 1-> Graus para Radianos\n 2-> Radianos para Graus\n 3-> Voltar \n"
	msg_ca_texto_graus: .asciiz " Graus "
	msg_ca_texto_rads: .asciiz " Radianos "
	msg_ca_log_base: .asciiz "Introduza a base : $"

	
	####################################################################
	# HELP (he)
	####################################################################
	
	he_file1: .asciiz "C:/Users/user/Desktop/Projeto de AC/programa.txt"
	he_file2: .asciiz "C:/Users/user/Desktop/Projeto de AC/cs.txt"
	he_file3: .asciiz "C:/Users/user/Desktop/Projeto de AC/ccon.txt"
	he_file4: .asciiz "C:/Users/user/Desktop/Projeto de AC/ca.txt"
	he_file_ler: .space 1024
	
	#MENSAGENS 
	msg_he_menu: .asciiz "\n\n\n\n ===========// HELP! \\=========== \n 1 -> PROGRAMA \n 2 -> CALCULADORA SIMPLES \n 3 -> CONVERSOR \n 4 -> CALCULADORA AVANÇADA \n 5 -> VOLTAR \n"
	msg_he_input: .asciiz "Em que operação tem duvidas: $"
	msg_he_error: .asciiz "ERRO:: ESTE COMANDO NÃO EXISTE! $"
	
	
	
	
	.text
	.globl main
	
main:
		#Print do cabeçalho
		li $v0, 4
		la $a0, msg_base_cabecalho
		syscall
		
		#Print do Menu
		li $v0, 4
		la $a0, msg_base_menu
		syscall
		
		#Conseguir input
		li $v0, 4
		la $a0, msg_base_input
		syscall
		
		li $v0, 5
		syscall
		sw $v0, base_input
		
		#Colocar o comando em memória
		lw $t0, base_input
		
		#Ir para outra função
		beq $t0, 1, cs  #Calculadora Simples
		beq $t0, 2, cv #Conversões
		beq $t0, 3, ca  #Calculadora Avançada
		beq $t0, 4, he  #HELP
		beq $t0, 5, exit  #SAIR
		
		# PRINT ERRO
		li $v0, 4
		la $a0, msg_base_error
		syscall
		
		j main
		
exit:
		#ENCERRAR PROGRAMA
		li $v0, 10
		syscall
		
		
		
####################################################################
# INICIO DE CALCULADORA SIMPLES (cs)
####################################################################
cs:
		#Print do cabeçalho da calculadora simples
		li $v0, 4
		la $a0, msg_cs_menu
		syscall
		
		#Conseguir input
		li $v0, 4
		la $a0, msg_cs_input
		syscall
		
		li $v0, 5
		syscall
		sw $v0, cs_input
		
		#Colocar o operador em memória
		lw $t0, cs_input
			
		beq $t0, 5, main
			
		#Conseguir o primeiro número
		li $v0, 4
		la $a0, msg_cs_num1
		syscall
		
		li $v0, 5			
		syscall		
		sw $v0, cs_num1
		
		#Conseguir o segundo número
		li $v0, 4
		la $a0, msg_cs_num2
		syscall
		
		li $v0, 5			
		syscall		
		sw $v0, cs_num2
			
		#Colocar os números em memória
		lw $t1, cs_num1
		lw $t2, cs_num2
			
		move $a0, $t1
		move $a1, $t2
		
		#Ir para outra função
		beq $t0, 1, soma
		beq $t0, 2, subtr
		beq $t0, 3, multi
		beq $t0, 4, divi
		
		
		#Print Erro
		li $v0, 4
		la $a0, msg_cs_error
		syscall
		
		j cs
		
		
soma:
		add $a0, $a0, $a1
		j mostrarcs


subtr:
		sub $a0, $a0, $a1
		j mostrarcs
		
multi:
		mult $a0, $a1
		mflo $a0
		j mostrarcs
		
divi:
		div $a0, $a0, $a1
		j mostrarcs						

mostrarcs:
		#PRINT MSG E RESULTADO
		move $v1, $a0
		li $v0, 4
		la $a0, msg_cs_result
		syscall
		li $v0, 1
		move $a0, $v1
		syscall
		
		j cs	
		
####################################################################
# FIM DE CALCULADORA SIMPLES (cs)
####################################################################	
	
####################################################################
# INICIO DE CONVERSOR
####################################################################

cv:
		#Print do cabeçalho do conversor
		li $v0, 4
		la $a0, msg_cv_menu
		syscall
	
		#conseguir input
		li $v0, 4
		la $a0, msg_cv_input
		syscall

		li $v0, 5
		syscall
		sw $v0, cv_input
		
		#Colocar input em memoria
		lw $t0, cv_input
			
		beq $t0, 3, main
		
		#Bin para dec
		beq $t0, 1, bindec
		
		#Introduzir um numero
		li $v0, 4
		la $a0, msg_cv_num
		syscall
		
		li $v0, 5			
		syscall		
		sw $v0, cv_num
		
		#Guardar em memoria
		lw $t1, cv_num
		lw $t2, cv_index1 #0
		lw $t3, cv_index2 #64
		lw $t7, cv_num
		
		move $a1, $t1
		move $a2, $t2
		move $a3, $t3
		move $s1, $t7
		
		#dec para bin
		beq $t0, 2, decbin
		
		
		#Print ERRO
		li $v0, 4
		la $a0, msg_cv_error
		syscall
		
		j cv
	
decbin:
		#Ver se o número é par ou ímpar
		andi $t5 , $a1 , 0x0001
		
		#Se ímpar saltar para escrever_bin
		beq $a1, 0, escrever_bin 
		
		
		div $a1, $a1, 2
		sw $t5, cv_array($a2)
			addi $a2, $a2, 4

		j decbin
	
escrever_bin:
		#Print Msg
		li $v0, 4
		la $a0, msg_cv_result1
		syscall
		j escrever_bin2
		
escrever_bin2:
		subi $a3, $a3, 4
		lw $t6, cv_array($a3)
		
		
		li $v0, 1
		move $a0, $t6
		syscall
		beq $a3, 0, dechex
		j escrever_bin2
		
dechex:
		move $a1, $s1
		li $v0, 4
		la $a0, msg_cv_result3
		syscall
		
		li $t0, 8
		la $t3, cv_array2 
		j escrever_hex
		
escrever_hex:
		beqz $t0, escrever_hex3 # Sair do branch se contador for igual a zero 
		rol $a1, $a1, 4 # rodar 4 bits a esquerda 
		and $t4, $a1, 0xf # variavel com 1111 
		ble $t4, 9, soma_hex # Se menor ou igual a 9, saltar para soma
		addi $t4, $t4, 55 # se maior que 9, adicionar 55 à variavel $t4
		b escrever_hex2

soma_hex:
		addi $t4, $t4, 48 # adicionar 48 a $t4

escrever_hex2:
		sb $t4, 0($t3) # guarda o digito hexadecimal no resultado 
		addi $t3, $t3, 1 # incrementa ao contador
		addi $t0, $t0, -1 # decrementa ao contador loop 
		j escrever_hex

escrever_hex3:
		#Imprimir Resultado
		la $a0, cv_array2 
		li $v0, 4 
		syscall 
		
		j cv
		
bindec:		

		li $v0, 4
		la $a0, msg_cv_num
		syscall
		
		la $a0, cv_bin_num
		li $a1, 16              # Fazer Load de 16 bits ao tamanho maximo de leitura em $a1
		li $v0,8                
		syscall

		li $t4, 0               
		
startConvert:
		la $t1, cv_bin_num
  		li $t9, 16             # Começar o contador
  	
firstByte:
  		lb $a0, ($t1)      # Fazer load do primeiro byte
  		blt $a0, 48, printSum   
  		addi $t1, $t1, 1          
  		subi $a0, $a0, 48         # retirar 48 para converter para inteiro
  		subi $t9, $t9, 1         
 		beq $a0, 0, isZero
 		beq $a0, 1, isOne
 		j convert     
 
isZero:
   		j firstByte
   
   
 isOne:                  	
   		li $t8, 1              
   		sllv $t5, $t8, $t9    
   		add $t4, $t4, $t5         # incrementar o valor de $t5 a $t4

   		move $a0, $t4        
   		j firstByte


convert:

printSum:
   		srlv $t4, $t4, $t9
		#Print msg
   		la $a0, msg_cv_result2
   		li $v0, 4
   		syscall

		#print resultado
 		move $a0, $t4      # load sum
 		li $v0, 1      # print int
 		syscall
 		
 		move $s1, $t4

exithex:
		
   		j dechex

####################################################################
# INICIO DE CALCULADORA AVNANÇADA
####################################################################

ca:
		#Print do cabeçalho do conversor
		li $v0, 4
		la $a0, msg_ca_menu
		syscall
	
		#conseguir a operação
		li $v0, 4
		la $a0, msg_ca_input
		syscall

		li $v0, 5
		syscall
		sw $v0, ca_input
		
		#Colocar input em memoria
		lw $t0, ca_input
			
		beq $t0, 7, main
		
		#Guardar em memoria
		lw $a1, cv_num

		# Ir para outra função
		beq $t0, 1, sen
		beq $t0, 2, cos
		beq $t0, 3, raiz
		beq $t0, 4, pot
		beq $t0, 5, congrad
		beq $t0, 6, log
				
		#Print Erro				
		li $v0, 4
		la $a0, msg_cv_error
		syscall
		
		j ca
	
sen:
	li $t0,3 
	#conseguir o número 
	l.s $f4,ca_num1 	# precisão
	li $v0,4 		
	la $a0, msg_ca_num 
	syscall 
	li $v0,6 
	syscall
	b seno
	
seno:
	mul.s $f2,$f0,$f0 # x^2
	mov.s $f12,$f0 # impressão de float deve estar em $f12
	
for:
	abs.s $f1,$f0 # Compara com valor não negativo da série
	c.lt.s $f1,$f4 # numero < que 0.000001?
	bc1t endfor
	subu $t1,$t0,1 # (n-1)
	mul $t1,$t1,$t0 # n(n-1)
	mtc1 $t1, $f3 # move n(n-1) para registo floating
	cvt.s.w $f3, $f3 # converte n(n-1) num float
	div.s $f3,$f2,$f3 # (x^2)/(n(n-1))
	neg.s $f3,$f3 # -(x^2)/(n(n-1))
	mul.s $f0,$f0,$f3 # (Serie*x^2)/(n(n-1))
	
	add.s $f12,$f12,$f0 # resposta em $f12
	addu $t0,$t0,2 # Incrementa n
	b for # G vai para início do loop for
endfor:
	#Print msg
	li $v0, 4
	la $a0, msg_ca_resultado
	syscall

	# print resultado
	li $v0,2 
	syscall
	j ca
	
cos:
	li $t0,3 # Initilizar n
	l.s $f4,float1# precisão
	li $v0,4 # syscall para imprimir string
	la $a0, msg_ca_input_cos # carregar endereço da prompt
	syscall # imprimr a prompt
	li $v0,6 # ler float do teclado para $f0
	syscall
	l.s $f6,float_pi_2
	c.le.s $f0,$f6
	bc1t primeiro
	l.s $f6,float_pi
	c.le.s $f0,$f6
	bc1t segundo
	l.s $f6,float_3pi_2
	c.le.s $f0,$f6
	bc1t terceiro
	l.s $f6,float_2pi
	c.le.s $f0,$f6
	bc1t quarto
	la $a0, msg_ca_erro_cos
	li $v0,4
	syscall
	b endfor
	
quarto:
	l.s $f6,float_5pi_2
	sub.s $f0,$f6,$f0
	b seno
	
terceiro:
	l.s $f6,float_5pi_2
	sub.s $f0,$f6,$f0
	b seno
	
segundo:
	l.s $f6,float_pi_2
	add.s  $f0,$f6,$f0
	b seno
	
primeiro:
	sub.s $f0,$f6,$f0
	b seno

raiz:
	li $v0, 4
	la $a0, msg_ca_num
	syscall
	
	li $v0,5
	syscall


	add  $a0, $zero, $v0
	
	
	
	jal   isqrt # v0 = resultado

	

	move $t1,$v0 # Imprimir resultado
	li $v0, 4
	la $a0, msg_ca_resultado
	syscall
	li $v0,1
	move $a0,$t1
	syscall
	
	j ca

isqrt:
	# v0 -entrada e retorno
	# t0 -bit
	# t1 -num
	# t2,t3 -temporarios
	move  $v0, $zero       # initaliza retorno
	move  $t1, $a0          # move a0 para t1

	addi  $t0, $zero, 1
	sll   $t0, $t0, 30 
	    
isqrt_bit:
	slt $t2, $t1, $t0       # num < bit
	beq   $t2, $zero, isqrt_loop
	srl   $t0, $t0, 2       # bit >> 2
	j     isqrt_bit

isqrt_loop:
	beq   $t0, $zero, isqrt_return
	add   $t3, $v0, $t0     # t3 = retorno + bit
	slt   $t2, $t1, $t3
	beq   $t2, $zero, isqrt_else
	srl   $v0, $v0, 1       # retorno >> 1
	j     isqrt_loop_end

isqrt_else:
	sub   $t1, $t1, $t3     # num -= retorno + bit
	srl   $v0, $v0, 1       # retorno >> 1
	add   $v0, $v0, $t0     # retorno + bit
	
isqrt_loop_end:
	srl   $t0, $t0, 2       # bit >> 2
	j     isqrt_loop
	
isqrt_return:
	jr  $ra
	

	
pot:
	#Conseguir num
	li $v0, 4
	la $a0, msg_ca_num
	syscall
	
	li $v0,5
	syscall

	add  $a3, $zero, $v0
	add  $s1, $zero, $v0
	#Conseguir expo
	li $v0, 4
	la $a0, msg_ca_expo
	syscall
	
	li $v0,5
	syscall


	add  $a1, $zero, $v0
	addi $a2, $zero, 1
	
	j contas_expo
	
contas_expo:
	
	addi $a2, $a2, 1
	
	mult $a3, $s1
	mflo $a3
	
	beq $a2, $a1, mostrar_conta_expo
	
	j contas_expo
	
mostrar_conta_expo:
		#Print Resultado
		move $t1,$a3
		li $v0,1
		move $a0,$t1
		syscall
		
		j ca

congrad:
		# Imprimir o menu
		li $v0,4
		la $a0, msg_ca_menu_g
		syscall
		
		li $v0, 4
		la $a0, msg_ca_input
		syscall
		# Ler o numero pelo teclado
		li $v0,5
		syscall
		move $t0,$v0 # guardar em $t0 para utilização futura

		# Encaminhamento do numero escolhido para a operacao
		li $t1,1
		li $t2,2
		li $t3,3

		beq $t0,$t1,Grau_radiano
		beq $t0,$t2,Radiano_grau
		beq $t0,$t3,ca
		
Grau_radiano:
		# Imprimir o menu Graus
		li $v0,4
		la $a0, msg_ca_texto_graus
		syscall

		# Ler o numero pelo teclado
		li $v0,6
		syscall
		l.s $f3,floatxgraus
		mul.s $f0,$f0,$f3
		mov.s $f12,$f0 # impressão de float deve estar em $f12
		li $v0,2 # imprime resposta em $f12
		syscall

		# Imprimir o menu Graus
		li $v0,4
		la $a0, msg_ca_texto_rads
		syscall
		j ca

Radiano_grau:
		# Imprimir o menu Graus
		li $v0,4
		la $a0, msg_ca_texto_rads
		syscall
		# Ler o numero pelo teclado
		li $v0,6
		syscall
		l.s $f3,floatxrad
		mul.s $f0,$f0,$f3
		mov.s $f12,$f0 # impressão de float deve estar em $f12
		li $v0,2 # imprime resposta em $f12
		syscall# Imprimir o menu Graus
		li $v0,4
		la $a0, msg_ca_texto_graus
		syscall
		j ca


log:
		#Conseguir base
		li $v0, 4
		la $a0, msg_ca_log_base
		syscall
		
		li $v0,5
		syscall
		move $s2,$v0
		
		#Conseguir num
		li $v0, 4
		la $a0, msg_ca_num
		syscall
		
		
		li $v0,5
		syscall
		move $s1,$v0
		
		addi $v1, $zero, 0
		addi $a3, $zero, 1
		
logdois:
		addi $v1, $v1, 1
		mult $a3, $s2
		mflo $a3

		slt $at, $s1, $a3
		bne $at, $zero, res
		j logdois
 		
res:
		li $v0, 4
		la $a0, msg_ca_resultado
		syscall
		
		subi $v1, $v1, 1
		
		move $t4, $v1
		
	 	move $a0, $t4      # load sum
 		li $v0, 1      # print int
 		syscall
		
		j ca
		
	####################################################################
	# HELP (he)
	####################################################################
	
he:
	li $v0, 4
	la $a0, msg_he_menu
	syscall
	
	li $v0, 4
	la $a0, msg_he_input
	syscall
	
	
	li $v0,5
	syscall
	move $t0, $v0 
	
	beq $t0, 1, lerficheiro1
	beq $t0, 2, lerficheiro2
	beq $t0, 3, lerficheiro3
	beq $t0, 4, lerficheiro4
	
	beq $t0, 5, main
	
	li $v0, 4
	la $a0, msg_cv_error
	syscall
	
	j he
	
lerficheiro1:
		#ABRIR O FICHEIRO
		li $v0, 13
		la $a0, he_file1
		li $a1, 0
		syscall
		move $s0, $v0
		
		
		
		#LER O FICHEIRO
		move $a0, $s0
		li $v0, 14
		la $a1, he_file_ler
		la $a2, 1024
		syscall
		
		#fazer "print" do ficheiro
		li $v0, 4
		move $a0, $a1
		syscall
		
		#Fechar o ficheiro
		li $v0 16
		move $a0, $s0
		syscall
 		
 		j he
 		
lerficheiro2:
		#ABRIR O FICHEIRO
		li $v0, 13
		la $a0, he_file2
		li $a1, 0
		syscall
		move $s0, $v0
		
		
		
		#LER O FICHEIRO
		move $a0, $s0
		li $v0, 14
		la $a1, he_file_ler
		la $a2, 1024
		syscall
		
		#fazer "print" do ficheiro
		li $v0, 4
		move $a0, $a1
		syscall
		
		#Fechar o ficheiro
		li $v0 16
		move $a0, $s0
		syscall
 		
 		j he

lerficheiro3:
		#ABRIR O FICHEIRO
		li $v0, 13
		la $a0, he_file3
		li $a1, 0
		syscall
		move $s0, $v0
		
		
		
		#LER O FICHEIRO
		move $a0, $s0
		li $v0, 14
		la $a1, he_file_ler
		la $a2, 1024
		syscall
		
		#fazer "print" do ficheiro
		li $v0, 4
		move $a0, $a1
		syscall
		
		#Fechar o ficheiro
		li $v0 16
		move $a0, $s0
		syscall
 		
 		j he
 		
 lerficheiro4:
		#ABRIR O FICHEIRO
		li $v0, 13
		la $a0, he_file4
		li $a1, 0
		syscall
		move $s0, $v0
		
		
		
		#LER O FICHEIRO
		move $a0, $s0
		li $v0, 14
		la $a1, he_file_ler
		la $a2, 1024
		syscall
		
		#fazer "print" do ficheiro
		li $v0, 4
		move $a0, $a1
		syscall
		
		#Fechar o ficheiro
		li $v0 16
		move $a0, $s0
		syscall
 		
 		j he
