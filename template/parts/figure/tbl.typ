#import "../../params.typ": *

#let tbl-num(_) = {
  let chapter-num = counter(heading.where(level: 1)).display()
  let type-num = counter(figure-kind-tbl + chapter-num).display()
  str(chapter-num) + "-" + str(int(type-num) + 1)
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