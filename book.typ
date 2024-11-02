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
    header: page-header-content,
    footer: page-footer-content,
  )

  set text(
    font: content-font,
    size: content-font-size,
    weight: 400,
    fill: content-color,
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
  show page: it => {
    counter(footnote).update(0)
    it
  }

  show: set-raw-style.with(body)
  show: set-emph-style.with(body)
  show: set-footnote-style.with(body)
  show: set-enum-style.with(body)
  show: set-heading-style.with(body)
  show: set-first-line-indent.with(body)
  show: figure-env-set.with(body)

  body
}
