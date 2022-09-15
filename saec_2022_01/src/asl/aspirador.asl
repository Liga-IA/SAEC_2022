// Agent aspirador in project SAEC-2022

/* Initial beliefs and rules */

posicao(posicao_esquerda).
sujo(posicao_esquerda).
sujo(posicao_direita).

/* Initial goals */

!limpar_ambiente.

/* Plans */

+!limpar_ambiente : ~sujo(posicao_esquerda) & ~sujo(posicao_direita) <- .print("Lol Terminei!!.").

+!limpar_ambiente : sujo(X) & posicao(X) 
	<- 
		-sujo(X);
		+~sujo(X);
		.print("Limpei ", X, "!");
		!limpar_ambiente.

+!limpar_ambiente : ~sujo(X) & posicao(X)
	<-
		.print("Trocando de posição!");
		!mover.
		
+!mover: posicao(posicao_direita)
	<-	
		-posicao(posicao_direita);
		+posicao(posicao_esquerda);
		!limpar_ambiente.
		
+!mover: posicao(posicao_esquerda)
	<-	
		-posicao(posicao_esquerda);
		+posicao(posicao_direita);
		!limpar_ambiente.
		
