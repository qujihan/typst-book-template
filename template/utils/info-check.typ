#let info-check(info: (:)) = {
  let info-after-check = (:)

  /*
  Basic information check
  */

  if not "title" in info {
    info-after-check.insert("title", "Unnamed Book")
  } else {
    info-after-check.insert("title", info.title)
  }

  if not "name" in info {
    info-after-check.insert("name", "Unnamed Author")
  } else {
    info-after-check.insert("name", info.name)
  }

  if not "outline-depth" in info {
    info-after-check.insert("outline-depth", 3)
  } else {
    info-after-check.insert("outline-depth", info["outline-depth"])
  }


  /*
  Config check
  */

  return info-after-check
}