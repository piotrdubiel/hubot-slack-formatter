# vim:ft=coffee :

should = require "should"

describe "Slack or fallback", ->
  it "should return rich format for Slack adapter", ->
    class Slack
    robot =
      adapter: new Slack()
    formatter = require("../index").using(robot)
    formatter.type.should.eql "full"
  
  it "should return fallback format for any other adapter", ->
    class Shell
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
