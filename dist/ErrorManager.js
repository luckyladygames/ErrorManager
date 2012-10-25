// Generated by CoffeeScript 1.3.3
(function() {
  var BaseError, ErrorManager, util;

  util = require("util");

  BaseError = function(message, constr) {
    Error.captureStackTrace(this, constr ? constr : this);
    return this.message = message ? message : "Error";
  };

  util.inherits(BaseError, Error);

  BaseError.prototype.name = "BaseError";

  ErrorManager = {
    BaseError: BaseError,
    errorList: [],
    create: function(name, defaultMessage, base) {
      var NewError;
      if (defaultMessage == null) {
        defaultMessage = "";
      }
      if (base == null) {
        base = BaseError;
      }
      NewError = function(message) {
        return NewError.super_.call(this, message, this.constructor);
      };
      if (defaultMessage === "") {
        defaultMessage = "Error: " + name + " occured";
      }
      util.inherits(NewError, base);
      NewError.prototype.name = name;
      NewError.prototype.message = defaultMessage;
      if (this[name] != null) {
        throw new Error("Error: " + name + " already exists");
      }
      this[name] = NewError;
      this.errorList.push(NewError);
      return NewError;
    }
  };

  module.exports = ErrorManager;

}).call(this);
