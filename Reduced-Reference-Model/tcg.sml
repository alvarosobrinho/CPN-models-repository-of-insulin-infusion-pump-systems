(* implementation of the test case specification for the TPC example *)

structure TPCTCSpec : TCSPEC = struct
	  
fun detection (Bind.Configuration'Start _) = true
  | detection (Bind.Standard_Infusion'Finish1 _) = true
  | detection (Bind.Standard_Infusion'Finish2 _) = true
  | detection (Bind.Standard_Infusion'Finish3 _) = true
  | detection (Bind.Standard_Infusion'Finish4 _) = true
  | detection (Bind.Personalized_Infusion'Finish5 _) = true
  | detection (Bind.Personalized_Infusion'Finish6 _) = true
  | detection (Bind.Personalized_Infusion'Finish7 _) = true
  | detection (Bind.Personalized_Infusion'Finish8 _) = true
  | detection _ = false;

exception obsExn;
fun observation (Bind.Configuration'Start (_,{c3}))  = [InEvent (c3)]
  | observation (Bind.Standard_Infusion'Finish1 (_,{f1}))  = [OutEvent (f1)]
  | observation (Bind.Standard_Infusion'Finish2 (_,{f2}))  = [OutEvent (f2)]
  | observation (Bind.Standard_Infusion'Finish3 (_,{f8}))  = [OutEvent (f8)]
  | observation (Bind.Standard_Infusion'Finish4 (_,{f3}))  = [OutEvent (f3)]
  | observation (Bind.Personalized_Infusion'Finish5 (_,{f4}))  = [OutEvent (f4)]
  | observation (Bind.Personalized_Infusion'Finish6 (_,{f5}))  = [OutEvent (f5)] 
  | observation (Bind.Personalized_Infusion'Finish7 (_,{f6}))  = [OutEvent (f6)]
  | observation (Bind.Personalized_Infusion'Finish8 (_,{f7}))  = [OutEvent (f7)]
  | observation _ = raise obsExn; 

fun format (InEvent (c3)) =
  "      <Standard>\n"^
  "        <Insulin>^c^</Insulin>\n"^
  "      </Standard>\n"
  | format (OutEvent (f1)) =
    "        <Decision>\n"^
    "          <DecisionValue>f1</DecisionValue>\n"^
    "        </Decision>\n";

end;

(* setup test case generation for the TPC example *)
Config.setTCdetect(TPCTCSpec.detection);
Config.setTCobserve(TPCTCSpec.observation);
Config.setTCformat(TPCTCSpec.format);

(* logging and output *)
Config.setModelDir (mbtcpnlibpath^"examples/pump/");
Config.setOutputDir ((Config.getModelDir())^"output/");

(* configuration and test case naming *)
Config.setConfigNaming (fn () => "pumptests");
Config.setTCNaming(fn i => "CaseID=\""^(Int.toString i)^"");
