extends Resource
class_name utils

# Loads Settings
func _load_setting(path: String):
	# Loads Cfg
	var setting
	
	if not FileAccess.file_exists(path):
		return
		
	if path.ends_with(".cfg"):
		setting = ConfigFile.new().load(path)
	
	elif path.ends_with(".json"):
		var file = 
	
# Defines Settings Path
var settings_path: String = "user://settings/settings.cfg"
var player_path: String = "user://settings/player.json"
var enemies_path: String = "user://settings/enemies.json"
var attacks_path: String = "user://settings/attacks.json"
