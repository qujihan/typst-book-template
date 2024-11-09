#import "../params.typ": *

#let set-footnote-style(info, body) = {
  // https://typst.app/docs/reference/model/footnote/
  // 
  // If you prefer per-page footnote numbering, 
  // you can reset the footnote counter in the page header. 
  // In the future, there might be a simpler way to achieve this.
  // 
  // i set this at template/parts/page-header.typ
  // counter(footnote).update(0)

  show footnote.entry: set text(
    font: info.latin-font + info.cjk-font,
    size: 0.8em,
    fill: info.content-color,
  )

  set footnote.entry(
    clearance: 0.8em,
    gap: 0.8em,
    indent: 0em,
  )

  body
}