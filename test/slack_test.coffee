# vim:ft=coffee :

should  = require "should"
slack   = require "../src/slack"

describe "Slack", ->
  it "should format text as bold", ->
    slack.bold("bold").should.eql "*bold*"

  it "should format text as code", ->
    slack.code("code").should.eql "`code`"
  
  it "should format text as pre", ->
    slack.pre("pre").should.eql "```pre```"

  it "should format text as italic", ->
    slack.italic("italic").should.eql "_italic_"

  it "should format emote", ->
    slack.emote("smile").should.eql ":smile:"
  
  it "should format urls with title", ->
    slack.link("http://www.x.com", "X").should.eql "http://www.x.com|X"
  
  it "should format urls without title", ->
    slack.link("http://www.x.com").should.eql "http://www.x.com"

  it "should provide default fallback", ->
    attachment = slack.attach
      pretext: "Pretext"
      text: "text"
      fields: [
        {title: "T1", value: "V1"}
        {title: "T2", value: "V2"}
      ]

    attachment.fallback.should.eql "Pretext\ntext\n  T1\n  V1\n  T2\n  V2"

  it "should accept no fields", ->
    attachment = slack.attach
      pretext: "Pretext"
      text: "text"
    attachment.fallback.should.eql "Pretext\ntext"
  
  it "should accept no pretext", ->
    attachment = slack.attach
      text: "text"
      fields: [
        title: "T1"
        value: "V1"
      ]
    attachment.fallback.should.eql "text\n  T1\n  V1"
  
  it "should accept no text", ->
    attachment = slack.attach
      pretext: "Pretext"
      fields: [
        title: "T1"
        value: "V1"
      ]
    attachment.fallback.should.eql "Pretext\n  T1\n  V1"
