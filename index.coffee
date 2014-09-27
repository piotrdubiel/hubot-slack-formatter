# vim:ft=coffee :


construct = (formatter) ->
  bold: formatter.bold
  b: formatter.bold
  type: formatter.type

using = (robot) ->
  if robot?.adapter?.constructor.name is "Slack"
    construct(require "./src/slack")
  else
    construct(require "./src/fallback")

module.exports = {
  using
}
