# vim:ft=coffee :

should      = require "should"
fallback    = require "../src/fallback"


describe "Fallback formatting when Slack adapter is not available", ->
  it "should passthrough bold text", ->
    fallback.bold("bold").should.eql "bold"

  it "should passthrough code text", ->
    fallback.code("code").should.eql "code"
  
  it "should passthrough pre text", ->
    fallback.pre("pre").should.eql "pre"

  it "should passthrough italic text", ->
    fallback.italic("italic").should.eql "italic"

  it "should ignore emote", ->
    fallback.emote("smile").should.eql ""
  
  it "should passthrough urls with title", ->
    fallback.link("http://www.x.com", "X").should.eql "http://www.x.com"
  
  it "should format urls without title", ->
    fallback.link("http://www.x.com").should.eql "http://www.x.com"
  
  it "should provide fallback for attachment", ->
    attachment = fallback.attach
      pretext: "Pretext"
      text: "text"
      fields: [
        {title: "T1", value: "V1"}
        {title: "T2", value: "V2"}
      ]

    attachment.should.eql "Pretext\n| text\n|  T1\n|  V1\n|  T2\n|  V2"

