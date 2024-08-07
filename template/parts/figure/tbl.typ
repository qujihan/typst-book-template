#import "../../params.typ": *

#let tbl-num(_) = {
  locate(loc => {
    let chapter-num = counter(heading).at(loc).at(0)
    let type-num = counter(figure-kind-tbl + str(chapter-num))
    str(chapter-num) + "-" + str(type-num.at(loc).at(0) + 1)
  })
}

#let tblIn(title, content) = align(center + horizon)[ #content ]

#let tbl(title, code, caption) = {
  figure(
    tblIn(title, code),
    caption: caption,
    supplement: [表格],
    numbering: tbl-num,
    kind: figure-kind-tbl,
  )
}