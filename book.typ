#import "template/parts/lib.typ": *
#import "template/params.typ": *
#import "template/utils.typ": *

#let book(info: (), body) = {
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

      let curr_page = here().page()
      let heading_1_anchors = query(
        selector(heading.where(level: 1)),
      ).map(it => it.location().page())
      let title1_infos = query(selector(heading.where(level: 1)).before(here()))
      let title2_infos = query(selector(heading.where(level: 2)).before(here()))

      if curr_page not in heading_1_anchors and title1_infos.len() != 0 and title2_infos.len() != 0 {
        let title1_body = title1_infos.last().body
        let title2_body = title2_infos.last().body
        grid(
          columns: (1fr, 1fr),
          align: (left, right),
          text(
            size: 1em,
            fill: black,
            baseline: 0.5em,
            font: content_font,
            title1_body,
          ),
          text(
            size: 1em,
            fill: black,
            baseline: 0.5em,
            font: content_font,
            title2_body,
          ),
        )
        line(length: 100%, stroke: 0.7pt)
      }
    },

    footer: context {
      set align(center)
      let curr_page = here().page()
      let heading_1_anchors = query(
        selector(heading.where(level: 1)),
      ).map(it => it.location().page())
      if curr_page not in heading_1_anchors {
        grid(
          columns: (5fr, 1fr, 5fr),
          line(length: 100%, stroke: 0.7pt),
          text(
            font: chinese_font,
            1em,
            baseline: -3pt,
            counter(page).display("1"),
          ),
          line(length: 100%, stroke: 0.7pt),
        )
      }
    },
  )

  set text(
    font: content_font,
    size: content_font_size,
    weight: 400,
    fill: content_color,
  )

  show par: set block(spacing: 1.5em)
  set par(
    first-line-indent: 2em,
    // justify: true,
    leading: 0.8em,
    linebreaks: "optimized",
  )

  show_cover(info.title, info.name)

  show_outline()

  show footnote.entry: set text(
    font: content_font,
    size: 0.8em,
    fill: content_color,
  )

  set footnote.entry(
    // separator: "",
    clearance: 0.8em,
    gap: 0.8em,
    indent: 0em,
  )

  show heading: set heading(numbering: "1.1.1 ")

  show heading.where(level: 1): it => {
    pagebreak(weak: false)
    let str = counter(heading).display("第1章") + "   " + it.body
    text(size: 2em, strong(str))
    // reference: https://github.com/typst/typst/issues/311
    par(leading: 2em)[#text(size: 0.0em)[#h(0.0em)]]
  }

  show heading.where(level: 2): it => {
    text(size: 1.7em, strong(it))
    // reference: https://github.com/typst/typst/issues/311
    par(leading: 2em)[#text(size: 0.0em)[#h(0.0em)]]
  }

  show heading.where(level: 3): it => {
    text(size: 1.4em, strong(it))
    // reference: https://github.com/typst/typst/issues/311
    par(leading: 2em)[#text(size: 0.0em)[#h(0.0em)]]
  }

  show figure: it => {
    set align(center)
    if it.kind == "code" {
      it.body
      it.supplement
      " " + it.counter.display(it.numbering)
      " " + it.caption.body
      locate(loc => {
        let chapter_num = counter(heading).at(loc).at(0)
        counter("code-num" + str(chapter_num)).step()
      })
    } else if it.kind == "pic" {
      it.body
      it.supplement
      " " + it.counter.display(it.numbering)
      " " + it.caption.body
      locate(loc => {
        let chapter_num = counter(heading).at(loc).at(0)
        let c = counter("pic-num" + str(chapter_num))
        c.step()
      })
    } else if it.kind == "tbl" {
      it.body
      it.supplement
      " " + it.counter.display(it.numbering)
      " " + it.caption.body
      locate(loc => {
        let chapter_num = counter(heading).at(loc).at(0)
        counter("tbl-num" + str(chapter_num)).step()
      })
    }
  }

  counter(page).update(1)
  body
}

