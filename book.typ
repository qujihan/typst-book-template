#import "template/parts/lib.typ": *
#import "template/params.typ": *
#import "template/utils.typ": *

#let book(info: (), body) = {
  if not "title" in info {
    info.insert("title", "Unnamed Book")
  }

  if not "name" in info {
    info.insert("name", "Unnamed Author")
  }

  if not "outline-depth" in info {
    info.insert("outline-depth", 3)
  }

  set document(
    title: info.title,
    author: info.name,
  )

  set page(
    paper: "a4",
    number-align: center + bottom,
    margin: auto,

    header: context {
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
            fill: line-color,
            baseline: 0.5em,
            font: content-font,
            title1-body,
          ),
          text(
            size: 1em,
            fill: line-color,
            baseline: 0.5em,
            font: content-font,
            title2-body,
          ),
        )
        line(length: 100%, stroke: 0.7pt + line-color)
      }

      if curr-page not in heading-1-anchors and curr-page in heading-2-anchors {
        grid(
          columns: (1fr),
          align: (center),
          text(
            size: 1em,
            fill: line-color,
            baseline: 0.5em,
            font: content-font,
            title1-body,
          )
        )
        line(length: 100%, stroke: 0.7pt + line-color)
      }
    },

    footer: context {
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
          fill: line-color,
          0.8em,
          baseline: -3pt,
          counter(page).display("1"),
        ),
        line(length: 100%, stroke: 0.7pt + line-color),
      )
    },
  )

  set text(
    font: content-font,
    size: content-font-size,
    weight: 400,
    fill: content-color,
  )

  show-cover(info.title, info.name)

  show-outline(info.outline-depth)

  set block(breakable: true)

  show footnote.entry: set text(
    font: content-font,
    size: 0.8em,
    fill: content-color,
  )

  set footnote.entry(
    // separator: "",
    clearance: 0.8em,
    gap: 0.8em,
    indent: 0em,
  )

  set par(
    first-line-indent: 2em,
    justify: true,
    leading: 0.8em,
    linebreaks: "optimized",
    spacing: 1.5em,
  )

  show heading: set heading(numbering: "1.1.1 ")

  show heading.where(level: 1): it => {
    pagebreak(weak: false)
    let str = counter(heading).display("第1章") + "   " + it.body
    text(size: 2em, strong(str))
  }

  show heading.where(level: 2): it => {
    text(size: 1.7em, strong(it))
  }

  show heading.where(level: 3): it => {
    text(size: 1.4em, strong(it))
  }


  // reference: https://github.com/typst/typst/issues/311
  // https://github.com/typst/typst/issues/311#issuecomment-2023038611
  let virtual-line(radio) = (
    context {
      let a = par(box())
      a
      v(radio * measure(2 * a).width)
    }
  )

  let indent-size = 1em
  show heading: it => {
    it
    virtual-line(-0.5)
  }

  set list(indent: indent-size)
  show list: it => {
    it
    virtual-line(-0.7)
  }

  set enum(indent: indent-size)
  show enum: it => {
    it
    virtual-line(-0.7)
  }

  show raw.where(block: true): it => {
    set text(size: (content-font-size - 2pt))
    set par(justify: false)
    it
    virtual-line(-0.7)
  }

  show raw.where(block: false): it => {
    set text(size: content-font-size - 0.5pt)
    h(0.15em) + it + h(0.15em)
  }

  show raw: set block(breakable: true)
  show raw: it => {
    set text(font: (code-font, chinese-font))
    it
  }

  show figure: it => {
    set align(center)
    if it.kind == figure-kind-code {
      it.body
      it.supplement
      " " + it.counter.display(it.numbering)
      " " + it.caption.body

      let chapter-num = counter(heading.where(level: 1)).display()
      counter(figure-kind-code + str(chapter-num)).step()
    } else if it.kind == figure-kind-pic {
      it.body
      it.supplement
      " " + it.counter.display(it.numbering)
      " " + it.caption.body

      let chapter-num = counter(heading.where(level: 1)).display()
      counter(figure-kind-pic + str(chapter-num)).step()
    } else if it.kind == figure-kind-tbl {
      it.body
      it.supplement
      " " + it.counter.display(it.numbering)
      " " + it.caption.body

      let chapter-num = counter(heading.where(level: 1)).display()
      counter(figure-kind-tbl + str(chapter-num)).step()
    } else {
      it.body
    }
  }

  counter(page).update(1)
  show page: it => {
    counter(footnote).update(0)
    it
  }

  body
}
