# vim:ft=coffee :

should = require "should"

describe "Slack or fallback", ->
  class Slack
  
  class SlackBot
    
  class Shell
  
  it "should return rich format for Slack adapter", ->
    robot =
      adapter: new Slack()
    formatter = require("../index").using(robot)
    formatter.type.should.eql "full"
  
  it "should return rich format for new Slack adapter", ->
    robot =
      adapter: new SlackBot()
    formatter = require("../index").using(robot)
    formatter.type.should.eql "full"

  it "should return fallback format for any other adapter", ->
    robot =
      adapter: new Shell()
    formatter = require("../index").using(robot)
    formatter.type.should.eql "fallback"
  
  it "should return fallback format for null adapter", ->
    robot = {}
    formatter = require("../index").using(robot)
    formatter.type.should.eql "fallback"
  
  it "should return fallback format for null robot", ->
    robot = null
    formatter = require("../index").using(robot)
    formatter.type.should.eql "fallback"

  class AdapterProxy
    constructor: (adapter) ->
      @config = adapter: adapter

  it "should return rich format for AdapterProxy if it proxy to Slack", ->
    robot =
      adapter: new AdapterProxy(new Slack)
    formatter = require("../index").using(robot)
    formatter.type.should.eql "full"

  it "should return rich format for AdapterProxy if it proxy to new Slack", ->
    robot =
      adapter: new AdapterProxy(new SlackBot)
    formatter = require("../index").using(robot)
    formatter.type.should.eql "full"
