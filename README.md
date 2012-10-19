# PrependTimeFormatter for Caterpillar Logger

A custom formatter for [caterpillar](https://github.com/bevry/caterpillar) that only prepends the time before log entries when in debug mode.

See this difference in the test output between *coffee example.coffee* and *coffee example.coffee -d*

## How to use in a docpad project

Ah the beginning of your docpad.coffee config file, load the dependencies :

```
caterpillar = require 'caterpillar'
PrependTimeFormatter = require './prepend-time-formatter'
```

Paths are up to you, in this case caterpillar has been installed through *npm* and the prepend-time-formatter file simply added in the root directory.

Create a caterpillar config :

```
loggerConfig =
	transports:
		formatter: new PrependTimeFormatter
```

And create a new logger instance :

```
logger = new caterpillar.Logger loggerConfig
```

Finally specified this newly created object in the docpad config itself :

```
docpadConfig = {
	logger: logger
	...
```