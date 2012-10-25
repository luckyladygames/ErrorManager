ErrorManager = require "../dist/ErrorManager"

describe "ErrorManager.create", ->
    it "should exist", ->
        ErrorManager.should.have.property "create"

    it "should add a new member to the global ErrorManager object", ->
        ErrorManager.create "NewError"
        ErrorManager.should.have.property "NewError"

    it "should create a new member that can be used with `new`", ->
        ErrorManager.create "Test2"
        newError = new ErrorManager.Test2 "I am new error 2"
        newError.should.have.property "message", "I am new error 2"

    it "should also add new errors to the `errorList` property", ->
        ErrorManager.should.have.property "errorList"
        ErrorManager.errorList.should.be.instanceOf Array

describe "Errors", ->

    TestCompare = ErrorManager.create "TestCompare"
    it "should be comparable with instanceof", ->
        err = new TestCompare 
        (err instanceof ErrorManager.TestCompare).should.be.true

    it "should have the correct default message", ->
        MyError = ErrorManager.create("MyError", "TEST1")
        err = new MyError
        err2 = new MyError("TEST2")

        err.message.should.equal 'TEST1'
        err2.message.should.equal 'TEST2'
