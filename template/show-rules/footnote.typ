#import "../params.typ": *

#let set-footnote-style(body) = {
  show footnote.entry: set text(
    font: content-font,
    size: 0.8em,
    fill: content-color,
  )

  set footnote.entry(
    clearance: 0.8em,
    gap: 0.8em,
    indent: 0em,
  )

  body
}