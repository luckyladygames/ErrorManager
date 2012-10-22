About
====

ErrorManager is a very small utility for managing types of Errors in 
an [ExpressJS](http://expressjs.com/) application.

This is pretty _alpha_ so design may change as I use tweak it
in actual real world usage.

Example Usage
-------------

    Errors = require "ErrorManager"
   
    # ==================== 
    # Create a new types of errors usable in the application
    # ==================== 
    Errors.create "MyCustomError"
    Errors.create "DatabaseBlewUp"
   
    # ==================== 
    # Create a custom express error handling middleware 
    # ==================== 
    app.use (err, req, res, next) ->
        # errors can be checked  using instanceof
        if ! err instanceof Errors.MyCustomError
            return next(err)

        res.send "Got MyCustomError"

    app.use (err, req, res, next) ->
        # errors can also be checked with a is(), which is injected by ErrorManager
        # into the Error object's prototype
        if err.is(Errors.DatabaseBlewUp) == false
            return next(err)

        res.send "Oh snap! The DB blew up."

    # ... more error handling middle ware
