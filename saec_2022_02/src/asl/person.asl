// Agent sample_agent in project SAEC_2022_02

/* Initial beliefs and rules */

/* Initial goals */

!dizer(ola).

/* Plans */

+!dizer(Content): brasileiro <- .broadcast(tell, Content).
-!dizer(Content).

+ola[source(Source)]: ingles <- 
	.print("Received a message from ", Source, " telling Ol�");
	.send(Source, tell, hello).

+ola[source(Source)]: alemao <- 
	.print("Ich habe eine Nachricht von ", Source, " erhalten, in der er Ol� sagt");
	.send(Source, tell, hallo).

+ola[source(Source)]: espanhol <- 
	.print("Recib� un mensaje de ", Source, " diciendo Ol�");
	.send(Source, tell, hola).

+ola[source(Source)]: italiano <- 
	.print("Ha ricevuto un messaggio da ", Source, " che lo raccontava Ol�");
	.send(Source, tell, ciao).

+ola[source(Source)]: brasileiro <- 
	.print("Ol� novamente ", Source).

+Content[source(Source)]: brasileiro <- .send(Source, achieve, learn(portugues)).
-Content[source(Source)].

+!learn(portugues)[source(Source)]: not brasileiro <- .send(Source, tell, ola).
-!learn(portugues)[source(Source)].

