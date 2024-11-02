#let set-enum-style(info, body) = {
  let indent-size = 1.7em

  set list(
    tight: true,
    indent: indent-size,
    body-indent: 0.2em,
    spacing: auto,
    marker: [•],
  )

  set enum(
    tight: true,
    indent: indent-size,
    body-indent: 0.2em,
  )
  body
}