#import "../params.typ": *

#let info-check(
  info: (:),
) = {
  let info-after-check = global-book-info

  /*****************
  *  basic info    *
  *****************/
  if title in info {
    info-after-check.insert(title, info.title)
  }

  if name in info {
    info-after-check.insert(name, info.name)
  }

  if outline-depth in info {
    info-after-check.insert(outline-depth, info.outline-depth)
  }


  /*****************
  *  font family   *
  *****************/
  if latin-font in info {
    if type(info.latin-font) == str {
      info-after-check.insert(latin-font, (info.latin-font,))
      context {
        latin-font-state.update((info.latin-font))
      }
    } else if type(info.latin-font) == array {
      info-after-check.insert(latin-font, info.latin-font)
      context {
        latin-font-state.update(info.latin-font)
      }
    }
  }

  if cjk-font in info {
    if type(info.cjk-font) == str {
      info-after-check.insert(cjk-font, (info.cjk-font,))
      context {
        cjk-font-state.update((info.cjk-font))
      }
    } else if type(info.cjk-font) == array {
      info-after-check.insert(cjk-font, info.cjk-font)
      context {
        cjk-font-state.update(info.cjk-font)
      }
    }
  }

  if code-font in info {
    if type(info.code-font) == str {
      info-after-check.insert(code-font, (info.code-font,))
      context {
        code-font-state.update((info.code-font))
      }
    } else if type(info.code-font) == array {
      info-after-check.insert(code-font, info.code-font)
      context {
        code-font-state.update(info.code-font)
      }
    }
  }

  /*****************
  *      size      *
  *****************/
  if content-size in info {
    info-after-check.insert(content-size, info.content-size)
    context {
      content-size-state.update(info.content-size)
    }
  }

  /*****************
  *    color       *
  *****************/
  if content-color in info {
    info-after-check.insert(content-color, info.content-color)
    context {
      content-color-state.update(info.content-color)
    }
  }

  if line-color in info {
    info-after-check.insert(line-color, info.line-color)
    context {
      line-color-state.update(info.line-color)
    }
  }

  if inline-code-color in info {
    info-after-check.insert(inline-code-color, info.inline-code-color)
    context {
      inline-code-color-state.update(info.inline-code-color)
    }
  }

  if emph-color in info {
    info-after-check.insert(emph-color, info.emph-color)
    context {
      emph-color-state.update(info.emph-color)
    }
  }

  if util-reference-color in info {
    info-after-check.insert(util-reference-color, info.util-reference-color)
    context {
      util-reference-color-state.update(info.util-reference-color)
    }
  }

  return info-after-check
}