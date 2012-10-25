About
====

ErrorManager is a very small utility for managing types of Errors in 
an [ExpressJS](http://expressjs.com/) application.

This is pretty _alpha_ so design may change as I use tweak it
in actual real world usage.

Example Usage
-------------
It's Coffeescript:

    ErrorManager = require "error-manager"
   
    # ==================== 
    # Create a new types of errors usable in the application
    # ==================== 
    ErrorManager.create "MyCustomError"
    ErrorManager.create "DatabaseBlewUp"
   
    # ==================== 
    # Create a custom express error handling middleware 
    # ==================== 
    app.use (err, req, res, next) ->
        # errors can be checked  using instanceof
        if ! err instanceof ErrorManager.MyCustomError
            return next(err)

        res.send "Got MyCustomError"

    # ... more error handling middle ware

Installation
------------

It is meant to be installed as part of your `package.json` via NPM. Just 
add a `"error-manager": "latest"` to the `dependencies` section.
