#import "../params.typ": *
#let set-heading-style(info, body) = {
  show heading: set heading(numbering: "1.1.1 ")

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    let str = counter(heading).display("第1章") + "   " + it.body
    text(size: 1.7em, str)
  }

  show heading.where(level: 2): it => {
    text(size: 1.5em, it)
  }

  show heading.where(level: 3): it => {
    text(size: 1.3em, it)
  }

  body
}