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
		if !message
			message
		else
			# Mappings
			color = color and cliColor[color] or (str) -> str
			levelName = color(levelName+':')

			# Message
			messageString = "#{levelName} #{message}"

			if @config.level is 7
				# Prepend with the time
				message = "[#{date}] #{messageString}"
			else
				# Result
				message = messageString

module.exports = PrependTimeFormatter