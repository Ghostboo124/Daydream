extends Resource
class_name utils

# DEFINE "Load Config"
static func _load_config() -> ConfigFile:
	var config := ConfigFile.new()
	var config_path: String = "user://settings.cfg" # Sets Config Path to Read
	
	config.load(config_path)
	
	return config
