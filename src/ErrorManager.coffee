# Creation of an `ErrorManager` object that is shared through the Application
# This allows for: 
#
# * creating a namespace for registering all types of ErrorManager
# * removes using strings for errors
#
util = require "util"

# yes, I'm a bad ass and I'm injecting a `is()` handler into this mofo.
# so we can use `err.is(ErrorManager.Application)` 
Error.prototype.is = (toCheck) ->
    @ instanceof toCheck

# All errors extend the BaseError 
BaseError = (message, constr) ->
    Error.captureStackTrace @, if constr then constr else @
    @message = if message then message else "Error"

util.inherits BaseError, Error
BaseError.prototype.name = "BaseError"

# Global Container for ErrorManager within the system
ErrorManager = 
    BaseError: BaseError
    
    # this creates a new type of error within the system
    # and adds it to the global ErrorManager object to be shared
    # throughout the system
    create: (name, defaultMessage="", base=BaseError) ->
        NewError = (message) ->
            NewError.super_.call @, message, @constructor

        defaultMessage = "Error: #{name} occured" if defaultMessage == ""
        util.inherits NewError, base
        NewError.prototype.name = name
        NewError.prototype.message = defaultMessage
       
        @[name] = NewError
        NewError

module.exports = ErrorManager
