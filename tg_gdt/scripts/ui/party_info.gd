extends VBoxContainer

@onready var partyName = $partyName
@onready var missionNumber = $HSplitContainer/missionsLabel/missionsNumber
@onready var guildEval = $HSplitContainer/missionsLabel/guildEvaluationValue
@onready var partyRank = $HSplitContainer/rankLabel/rankValue

func populate_party_info(party):
    partyName.text = party.name
    missionNumber.text = str(party.mission_number)
    guildEval.text = str(party.guild_evaluation)
    partyRank.text = str(party.rank)
