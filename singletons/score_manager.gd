extends Node


var _score: int = 0
var _high_score: int = 0

func get_score() -> int:
	return _score

func get_high_score() -> int:
	return _high_score

func set_score(new_score: int) -> void:
	_score = new_score
	
	if new_score > _high_score:
		_high_score = new_score
		
	SignalManager.on_score_updated.emit()

func increment_score() -> void:
	set_score(_score + 1)
