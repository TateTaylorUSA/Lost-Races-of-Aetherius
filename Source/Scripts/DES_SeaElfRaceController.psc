Scriptname DES_SeaElfRaceController extends Quest  

Race Property DES_SeaElfRace auto
Race Property DES_SeaElfRaceVampire auto

Actor Property PlayerRef auto
Spell Property Sparks auto
Quest Property MQ101 auto

Event OnInit () 

  if(SKSE.GetVersion() > 0)
    ;debug.messagebox("yeskse")
    RegisterForMenu("RaceSex Menu")
  else
	;debug.messagebox("no skse")
    RegisterForSingleUpdate(1.0)
  endIf

	FormList ExhaustionResistRacesMajor = Game.GetFormFromFile(0x000008A6, "ccQDRSSE001-SurvivalMode.esl") As FormList

    if(ExhaustionResistRacesMajor )
        ExhaustionResistRacesMajor.AddForm(DES_SeaElfRace)
        ExhaustionResistRacesMajor.AddForm(DES_SeaElfRaceVampire)
    endif

EndEvent

Event OnUpdate()
  if(MQ101.IsStageDone(80) || MQ101.GetStage() >= 80.0 || MQ101.IsCompleted() || MQ101.IsStopped())
    doSpells()
  else
    RegisterForSingleUpdate(1.0)
  endIf
endEvent

Event OnMenuClose(String MenuName)
  Utility.Wait(0.25)
  doSpells()
endEvent

Function dospells()
	Race PlayerRace = PlayerRef.GetRace()
	IF PlayerRace == DES_SeaElfRace
		PlayerRef.AddSpell(Sparks, false)
	ENDIF
EndFunction