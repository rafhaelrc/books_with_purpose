{ include("common.asl") }

//!holdBook.

//!holdBook(multiAgentSystem) depois do plano da linha 7 executou, esse estado fosse perceptível pelo agente e pelo sistema.

!setup_scenario.
!holdBook(multiAgentSystem).

+! holdBook(multiAgentSystem) 
	<-
		.wait(setupFinished);
      	
      	.intention(Id,State,Stack,current); // gets the state of the current intention
      	//.print("current intention number is ",Id," and its state is ",State);
	  	Stack = [Top|_]; // get the intended means in the top of current intention
      	Top   = im(Label, { +!Goal },PlanBody,Unifier);
      	//.print("current goal is ",Goal," being pursued by plan ",Label);
	  	Goal  =.. [NameSpace,Functor,Terms,Annots];
      	.print("Functor: " , Functor);
      	.print("Term: " , Terms);
      	.term2string(Terms, TermsString);
      	.print("Term String: ", TermsString);
      	.concat(Functor, TermsString, BuiltPredicate);
      	
      	.print("Predicado: " , BuiltPredicate);
      	// como concatenar Functor e Term? o term está entre []
      	.print("Goal: " , Goal);
      	
      	
      	
      	isPurposeOfState(holdBook, NamePurpose); // pego pega im purpose direto de um predicate. Ele deveria achar um state entre os dois.
      	isPurposeOfSF(NamePurpose, NameStatusFunctions);
     	
     	//!percorreList(NameStatusFunctions);
     	
     	// unifica StatusFunctionString com qualquer membro da Lista.
     	if(.member(StatusFunctionString,NameStatusFunctions) & .term2string(StatusFunctionAtom, StatusFunctionString)
     	& constitutive_rule(ConcreteAction, StatusFunctionAtom,_,_)){
     		println("performing the action.."); 
     		ConcreteAction;	
     	}
     	

//		?holdBook(multiAgentSystem) // deveria ter sucesso.
		println;
      	println("*** Final Phase ***");
		.



+!percorreList([]).

+!percorreList([H|T])
<-
	.print("Predicate: " , H);
	.term2string(Te,H);
	//!searchActionCountAsStatus(Te);
	!percorreList(T);
	.


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
