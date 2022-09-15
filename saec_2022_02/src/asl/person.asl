// Agent sample_agent in project SAEC_2022_02

/* Initial beliefs and rules */

/* Initial goals */

!dizer(ola).

/* Plans */

+!dizer(Content): brasileiro <- .broadcast(tell, Content).
-!dizer(Content).

+ola[source(Source)]: ingles <- 
	.print("Received a message from ", Source, " telling Olá");
	.send(Source, tell, hello).

+ola[source(Source)]: alemao <- 
	.print("Ich habe eine Nachricht von ", Source, " erhalten, in der er Olá sagt");
	.send(Source, tell, hallo).

+ola[source(Source)]: espanhol <- 
	.print("Recibí un mensaje de ", Source, " diciendo Olá");
	.send(Source, tell, hola).

+ola[source(Source)]: italiano <- 
	.print("Ha ricevuto un messaggio da ", Source, " che lo raccontava Olá");
	.send(Source, tell, ciao).

+ola[source(Source)]: brasileiro <- 
	.print("Olá novamente ", Source).

+Content[source(Source)]: brasileiro <- .send(Source, achieve, learn(portugues)).
-Content[source(Source)].

+!learn(portugues)[source(Source)]: not brasileiro <- .send(Source, tell, ola).
-!learn(portugues)[source(Source)].

