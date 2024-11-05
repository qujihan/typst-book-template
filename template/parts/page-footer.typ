#import "../params.typ": *

#let page-footer-content(info: (:)) = (
  context {
    set align(center)
    let curr-page = here().page()
    let heading-1-anchors = query(
      selector(heading.where(level: 1)),
    ).map(it => it.location().page())
    grid(
      columns: (7fr, 1fr, 7fr),
      line(length: 100%, stroke: 0.7pt + line-color-state.get()),
      text(
        font: latin-font-state.get() + cjk-font-state.get(),
        fill: content-color-state.get(),
        0.8em,
        baseline: -3pt,
        strong(counter(page).display("1")),
      ),
      line(length: 100%, stroke: 0.7pt + line-color-state.get()),
    )
  }
)