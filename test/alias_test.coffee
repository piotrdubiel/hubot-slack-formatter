# vim:ft=coffee :

should = require "should"

describe "Alias", ->
  it "should alias slack functions", ->
    class Slack
    robot =
      adapter: new Slack()
    formatter = require("../index").using(robot)
    
    formatter.b.should.eql formatter.bold
    formatter.c.should.eql formatter.code
    formatter.e.should.eql formatter.emote
    formatter.i.should.eql formatter.italic
    formatter.l.should.eql formatter.link
