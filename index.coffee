# vim:ft=coffee :


construct = (formatter) ->
  bold:     formatter.bold
  b:        formatter.bold
  code:     formatter.code
  c:        formatter.code
  emote:    formatter.emote
  e:        formatter.emote
  italic:   formatter.italic
  i:        formatter.italic
  link:     formatter.link
  l:        formatter.link
  pre:      formatter.pre
  attach:   formatter.attach
  textify:  formatter.textify
  type:     formatter.type

using = (robot) ->
  if /slack/i.test(robot?.adapter?.constructor.name) or
  robot?.adapter?.constructor.name is "AdapterProxy" and
  /slack/i.test(robot?.adapter?.config.adapter.constructor.name)
    construct(require "./src/slack")
  else
    construct(require "./src/fallback")

module.exports = {
  using
}
