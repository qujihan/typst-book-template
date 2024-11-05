#import "../params.typ": *

#let page-header-content(info: (:)) = (
  context {
    set align(center)

    let curr-page = here().page()

    let heading-1-anchors = query(
      selector(heading.where(level: 1)),
    ).map(it => it.location().page())

    let heading-2-anchors = query(
      selector(heading.where(level: 2)),
    ).map(it => it.location().page())

    let title1-infos = query(selector(heading.where(level: 1)).before(here()))
    let title2-infos = query(selector(heading.where(level: 2)).before(here()))

    let title1-body = ""
    let title2-body = ""
    if title1-infos.len() != 0 {
      title1-body = title1-infos.last().body
    }
    if title2-infos.len() != 0 {
      title2-body = title2-infos.last().body
    }

    if curr-page not in heading-1-anchors and curr-page not in heading-2-anchors {
      grid(
        columns: (1fr, 1fr),
        align: (left, right),
        text(
          size: 1em,
          fill: content-color-state.get(),
          baseline: 0.5em,
          font: latin-font-state.get() + cjk-font-state.get(),
          strong(title1-body),
        ),
        text(
          size: 1em,
          fill: content-color-state.get(),
          baseline: 0.5em,
          font: latin-font-state.get() + cjk-font-state.get(),
          strong(title2-body),
        ),
      )
      line(length: 100%, stroke: 0.7pt + line-color-state.get())
    }

    if curr-page not in heading-1-anchors and curr-page in heading-2-anchors {
      grid(
        columns: (1fr),
        align: (center),
        text(
          size: 1em,
          fill: content-color-state.get(),
          baseline: 0.5em,
          font: latin-font-state.get() + cjk-font-state.get(),
          strong(title1-body),
        )
      )
      line(length: 100%, stroke: 0.7pt + line-color-state.get())
    }
  }
)