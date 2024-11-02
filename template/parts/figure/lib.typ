#import "code.typ": code
#import "pic.typ": pic
#import "tbl.typ": tbl
#import "../../params.typ": *

#let figure-root-path = "../../../../"

#let figure-env-set(info, body) = {

  set block(breakable: true)

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
  body
}