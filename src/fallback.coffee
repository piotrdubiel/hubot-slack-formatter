# vim:ft=coffee :

passthrough = (_) -> _

bold      = passthrough
code      = passthrough
emote     = (name) -> ""
italic    = passthrough
link      = (url, title) -> url
pre       = passthrough
attach    = (attachment) -> textify(attachment)

line = (text) ->
  text.split("\n").map((line) -> "| #{line}").join("\n")

textify = (attachment) ->
  pretext = attachment?.pretext
  text = if attachment.text then line(attachment.text) else null
  fields = attachment?.fields?.map (field) ->
    rendered = "|  #{field.title}"
    if field.value
      rendered += "\n|  #{field.value}"
    return rendered
  
  [pretext, text, fields?.join "\n"]
    .filter (item) -> item
    .join "\n"

module.exports =
  bold:   bold
  code:   code
  emote:  emote
  italic: italic
  link:   link
  pre:    pre
  attach: attach
  type:   "fallback"
