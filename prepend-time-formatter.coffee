{Formatter, cliColor} = require 'caterpillar'

class PrependTimeFormatter extends Formatter

	# getTime
	getDate: ->
		# Prepare
		now      = new Date()
		hours    = @padLeft '0', 2, now.getHours()
		minutes  = @padLeft '0', 2, now.getMinutes()
		seconds  = @padLeft '0', 2, now.getSeconds()
		ms       = @padLeft '0', 3, now.getMilliseconds()

		# Return
		"#{hours}:#{minutes}:#{seconds}.#{ms}"

	format: (levelCode,levelName,args) ->
		# Prepare
		{date,file,line,method,color,levelName,message} = @details(levelCode, levelName, args)

		# Check
		return message  if !message

		# Mappings
		color = color and cliColor[color] or (str) -> str
		levelName = color(levelName+':')

		messageString = "#{levelName} #{message}"

		# Prepend with the time
		if @config.level is 7
			"[#{date}] #{messageString}"
		else
			messageString

module.exports = PrependTimeFormatter