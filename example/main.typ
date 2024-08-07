#import "../book.typ": *

#show: book.with(info: (
  name: "qujihan",
  title: "typst-book-template Demo",
))

#referenceBlock("Hello, world!")

#let abc = [这是一个块的的内容,这个块可能有许多的内容. #{parbreak()} 现在开始换行了]
#tipsBlock(
  "这是一个标题",
  abc,
)