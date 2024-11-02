#import "../params.typ": *

#let page-footer-content = context {
  set align(center)
  let curr-page = here().page()
  let heading-1-anchors = query(
    selector(heading.where(level: 1)),
  ).map(it => it.location().page())
  grid(
    columns: (7fr, 1fr, 7fr),
    line(length: 100%, stroke: 0.7pt + line-color),
    text(
      font: chinese-font,
      fill: content-color,
      0.8em,
      baseline: -3pt,
      strong(counter(page).display("1")),
    ),
    line(length: 100%, stroke: 0.7pt + line-color),
  )
}