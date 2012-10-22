ErrorManager = require "../src/ErrorManager"

describe "ErrorManager.create", ->
    it "should exist", ->
        ErrorManager.should.have.property "create"

    it "should add a new member to the global ErrorManager object", ->
        ErrorManager.create "NewError"
        ErrorManager.should.have.property "NewError"

    it "should create a new member that can create a new object", ->
        ErrorManager.create "Test2"
        newError = new ErrorManager.Test2 "I am new error 2"
        newError.should.have.property "message", "I am new error 2"

describe "Error", ->
    it "should have an is() method", ->
        Error.prototype.should.have.property "is"
        (typeof Error.prototype.is).should.equal "function"

describe "Errors", ->

    TestCompare = ErrorManager.create "TestCompare"
    it "should be comparable with instanceof", ->
        err = new TestCompare 
        (err instanceof ErrorManager.TestCompare).should.be.true
    it "should be comparable with is() method", ->
        err = new TestCompare
        (err.is ErrorManager.TestCompare).should.be.true


