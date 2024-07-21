#show figure: it => {
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


#let get_pic_num(_) = {
  locate(loc => {
    let chapter_num = counter(heading).at(loc).at(0)
    let c = counter("pic-num" + str(chapter_num))
    str(chapter_num) + "-" + str(c.at(loc).at(0) + 1)
  })
}

#let picIn(path) = block(
  above: 2em,
  width: 100%,
  fill: white,
)[
  #align(center + horizon)[
    #image(path)
  ]
]

#let pic(path, caption) = {
  figure(
    picIn(path),
    caption: caption,
    supplement: [图],
    numbering: get_pic_num,
    kind: "pic",
  )
}
