+!setup_scenario
	<- !buildPurpose;
	   !prepareScenario;
	   !setup_sai;
	   .

+!buildPurpose 
	<- println("");
	.

 +!prepareScenario : nameWorkspace(NW) & nameArtifact(NA) &
 					nameInstitutionalWorkspace (NIW) & nameInstitutionalArtifact(NIA)
 	<- 
 	   createWorkspace(NW);
       // criar o artefato
       joinWorkspace(NW, WspBookStore); // enter in the wsp_libray and get a ID "WspLibrary"
       makeArtifact(NA, "tools.ElectronicMachine")[wid(WspBookStore)];
 	   
 	   //makeArtifact(Name, Template, Params, Id)
 	   
 	   //artifact onto_different_intentionality: mas.OntologyArtifact("src/resources/initial_ontology_model_five_version.owl")
 	   makeArtifact("onto", "mas.OntologyArtifact", ["src/resources/initial_ontology_model_five_version.owl"])[wid(WspBookStore)];
 	   lookupArtifact("onto", OntoArt);
 	   lookupArtifact(NA, ElectronicMachineArt); // diferentes lugares pode ter diferentes artefatos.
       focus(ElectronicMachineArt);
       focus(OntoArt);
       .


+!setup_sai : nameWorkspace(NW) & nameInstitutionalSpecification(NIS)
   <-
   	  .wait(1000);
   	  makeArtifact(i1,"sai.bridges.jacamo.ConstitutiveArt",["i1",NIS], InstArt); //launch institution
      focus(InstArt);
      getRuleEngine(RE)[artifact_id(InstArt)]; //gets the reference RE for instutional rule engine (responsible for handling the environmental state)
      joinWorkspace(NW,W1);
      setWSPRuleEngine(RE)[artifact_id(W1)];
      +setupFinished;
      .
