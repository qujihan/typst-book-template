// reference: https://github.com/typst/typst/issues/311
// https://github.com/typst/typst/issues/311#issuecomment-2023038611

#let virtual-line(radio) = (
  context {
    let a = par(box())
    a
    v(radio * measure(2 * a).width)
  }
)

#let set-first-line-indent(info, body) = {
  let indent-size = 1.7em

  show heading: it => it + virtual-line(-0.7)

  set list(indent: indent-size)
  show list: it => it + virtual-line(-0.7)

  set enum(indent: indent-size, number-align: center)
  show enum: it => it + virtual-line(-0.7)

  show align: it => it + virtual-line(-0.7)

  body
}
