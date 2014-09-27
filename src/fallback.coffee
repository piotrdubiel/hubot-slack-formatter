# vim:ft=coffee :

passthrough = (_) -> _
{textify}   = require "./slack"

bold      = passthrough
code      = passthrough
emote     = (name) -> ""
italic    = passthrough
link      = (url, title) -> url
pre       = passthrough
attach    = (attachment) -> textify(attachment)

module.exports =
  bold:   bold
  code:   code
  emote:  emote
  italic: italic
  link:   link
  pre:    pre
  attach: attach
  type:   "fallback"
