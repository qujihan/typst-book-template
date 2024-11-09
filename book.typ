#import "template/mod.typ": *

#let book(info: (:), body) = {
  let info = info-check(info: info)

  set document(
    title: info.title,
    author: info.name,
  )

  set page(
    paper: "a4",
    margin: auto,
    header: page-header-content(),
    footer: page-footer-content(),
  )

  set text(
    font: (info.latin-font + info.cjk-font),
    size: info.content-size,
    weight: 400,
    fill: info.content-color,
  )

  set par(
    first-line-indent: 2em,
    justify: true,
    leading: 0.8em,
    linebreaks: "optimized",
    spacing: 1.5em,
  )

  show-cover(info.title, info.name)
  show-outline(info.outline-depth)
  counter(page).update(1)

  show: set-emph-style.with(info)
  show: set-enum-style.with()
  show: set-first-line-indent.with()
  show: set-footnote-style.with(info)
  show: set-heading-style.with()
  show: set-raw-style.with(info)
  show: figure-env-set.with(info)

  body
}
