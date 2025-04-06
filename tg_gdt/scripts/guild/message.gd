extends RefCounted

enum MessageType {
	NOTIFICATION,
	TOWN_SUPPORT_REQUEST,
	WORLD_NEWS,
	ADVENTURER_SUPPORT,
	DUNGEON_NOTIFICATION,
	ADVENTURER_UPDATES,
	ADVENTURER_APPLIES
}

var text: String
var preview: String
var sender: String
var messageType: MessageType
var applied_adventurer = null

func initialize(_text: String, _preview: String, _sender: String, _messageType: MessageType):
	text = _text
	preview = _preview
	sender = _sender
	messageType = _messageType
