# vim:ft=coffee :

bold      = (text) -> "*#{text}*"
code      = (text) -> "`#{text}`"
emote     = (name) -> ":#{name}:"
italic    = (text) -> "_#{text}_"
link      = (url, title) -> if title then "#{url}|#{title}" else url
pre       = (text) -> "```#{text}```"

attach = (attachment = {}) ->
  attachment.fallback ?= textify(attachment)
  return attachment

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
  bold:     bold
  code:     code
  emote:    emote
  italic:   italic
  link:     link
  pre:      pre
  attach:   attach
  textify:  textify
  type:     "full"
