#import "../params.typ": *

#let set-emph-style(info, body) = {
  // repr(args.pos())

  show emph: it => {
    let left-right-space = 0.18em
    let top-size = 1em
    let bottom-size = -0.3em
    let radius-size = 0.35em

    let emph-context = context {
      box(
        baseline: -bottom-size,
        rect(
          width: left-right-space * 2,
          height: top-size - bottom-size,
          stroke: none,
          radius: (left: radius-size),
          fill: info.emph-color,
        ),
      )

      it

      box(
        baseline: -bottom-size,
        rect(
          width: left-right-space * 2,
          height: top-size - bottom-size,
          stroke: none,
          radius: (right: radius-size),
          fill: info.emph-color,
        ),
      )
    }

    highlight(
      fill: info.emph-color,
      top-edge: top-size,
      bottom-edge: bottom-size,
      emph-context,
    )
  }

  body
}