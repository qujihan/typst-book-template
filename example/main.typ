#import "../book.typ": *

#show: book.with(info: (
  name: "qujihan",
  title: "typst-book-template Demo",
))


= Chapter 1

#referenceBlock("Hello, world!")

#let abc = [这是一个块的的内容,这个块可能有许多的内容. #{parbreak()} 现在开始换行了]
#tipsBlock(
  "这是一个标题",
  abc,
)

= Code
代码可以自动标号, 以及可以配置显示代码路径等信息

#code(
  "sh tree src",
  "src目录树以及简单注释",
  ```bash
  src
  ├── confchange # 集群成员变更
  │   ├── changer.rs
  │   ├── datadriven_test.rs
  │   ├── restore.rs
  │   └── testdata # 测试文件
  │       └── ...
  ├── confchange.rs
  ├── config.rs
  ├── errors.rs
  ├── lib.rs
  ├── log_unstable.rs
  ├── quorum
  │   ├── datadriven_test.rs
  │   ├── joint.rs
  │   ├── majority.rs
  │   └── testdata # 测试文件
  │       └── ...
  ├── quorum.rs
  ├── raft.rs
  ├── raft_log.rs
  ├── raw_node.rs
  ├── read_only.rs
  ├── status.rs
  ├── storage.rs
  ├── tracker
  │   ├── inflights.rs
  │   ├── progress.rs
  │   └── state.rs
  ├── tracker.rs
  └── util.rs


  src
  ├── confchange # 集群成员变更
  │   ├── changer.rs
  │   ├── datadriven_test.rs
  │   ├── restore.rs
  │   └── testdata # 测试文件
  │       └── ...
  ├── confchange.rs
  ├── config.rs
  ├── errors.rs
  ├── lib.rs
  ├── log_unstable.rs
  ├── quorum
  │   ├── datadriven_test.rs
  │   ├── joint.rs
  │   ├── majority.rs
  │   └── testdata # 测试文件
  │       └── ...
  ├── quorum.rs
  ├── raft.rs
  ├── raft_log.rs
  ├── raw_node.rs
  ├── read_only.rs
  ├── status.rs
  ├── storage.rs
  ├── tracker
  │   ├── inflights.rs
  │   ├── progress.rs
  │   └── state.rs
  ├── tracker.rs
  └── util.rs
  ```,
)



#code(
  "raft-rs/src/utils.rs",
  "Raft库工具类",
  ```rust
  pub fn limit_size<T: PbMessage + Clone>(entries: &mut Vec<T>, max: Option<u64>) {
      if entries.len() <= 1 {
          return;
      }
      let max = match max {
          None | Some(NO_LIMIT) => return,
          Some(max) => max,
      };

      let mut size = 0;
      let limit = entries
          .iter()
          .take_while(|&e| {
              if size == 0 {
                  size += u64::from(e.compute_size());
                  return true;
              }
              size += u64::from(e.compute_size());
              size <= max
          })
          .count();

      entries.truncate(limit);
  }

  /// Check whether the entry is continuous to the message.
  /// i.e msg's next entry index should be equal to the index of the first entry in `ents`
  pub fn is_continuous_ents(msg: &Message, ents: &[Entry]) -> bool {
      if !msg.entries.is_empty() && !ents.is_empty() {
          let expected_next_idx = msg.entries.last().unwrap().index + 1;
          return expected_next_idx == ents.first().unwrap().index;
      }
      true
  }

  struct FormatKeyValueList {
      pub buffer: String,
  }

  impl slog::Serializer for FormatKeyValueList {
      fn emit_arguments(&mut self, key: slog::Key, val: &fmt::Arguments) -> slog::Result {
          if !self.buffer.is_empty() {
              write!(&mut self.buffer, ", {}: {}", key, val).unwrap();
          } else {
              write!(&mut self.buffer, "{}: {}", key, val).unwrap();
          }
          Ok(())
      }
  }

  pub(crate) fn format_kv_list(kv_list: &OwnedKVList) -> String {
      let mut formatter = FormatKeyValueList {
          buffer: "".to_owned(),
      };
      let record = record_static!(slog::Level::Trace, "");
      kv_list
          .serialize(
              &Record::new(&record, &format_args!(""), b!()),
              &mut formatter,
          )
          .unwrap();
      formatter.buffer
  }

  /// Get the majority number of given nodes count.
  #[inline]
  pub fn majority(total: usize) -> usize {
      (total / 2) + 1
  }

  /// A convenient struct that handles queries to both HashSet.
  pub struct Union<'a> {
      first: &'a HashSet<u64>,
      second: &'a HashSet<u64>,
  }

  impl<'a> Union<'a> {
      /// Creates a union.
      pub fn new(first: &'a HashSet<u64>, second: &'a HashSet<u64>) -> Union<'a> {
          Union { first, second }
      }

      /// Checks if id shows up in either HashSet.
      #[inline]
      pub fn contains(&self, id: u64) -> bool {
          self.first.contains(&id) || self.second.contains(&id)
      }

      /// Returns an iterator iterates the distinct values in two sets.
      pub fn iter(&self) -> impl Iterator<Item = u64> + '_ {
          self.first.union(self.second).cloned()
      }

      /// Checks if union is empty.
      pub fn is_empty(&self) -> bool {
          self.first.is_empty() && self.second.is_empty()
      }

      /// Gets the count of the union.
      ///
      /// The time complexity is O(n).
      pub fn len(&self) -> usize {
          // Usually, second is empty.
          self.first.len() + self.second.len() - self.second.intersection(self.first).count()
      }
  }

  /// Get the approximate size of entry
  #[inline]
  pub fn entry_approximate_size(e: &Entry) -> usize {
      //  message Entry {
      //      EntryType entry_type = 1;
      //      uint64 term = 2;
      //      uint64 index = 3;
      //      bytes data = 4;
      //      bytes context = 6;
      //      bool sync_log = 5;(Deprecated)
      // }
      // Each field has tag(1 byte) if it's not default value.
      // Tips: x bytes can represent a value up to 1 << x*7 - 1,
      // So 1 byte => 127, 2 bytes => 16383, 3 bytes => 2097151.
      // If entry_type is normal(default), in general, the size should
      // be tag(4) + term(1) + index(2) + data(2) + context(1) = 10.
      // If entry_type is conf change, in general, the size should be
      // tag(5) + entry_type(1) + term(1) + index(2) + data(1) + context(1) = 11.
      // We choose 12 in case of large index or large data for normal entry.
      e.data.len() + e.context.len() + 12
  }
  ```,
)


= Picture
在插入图片的时候, 需要使用库提供的 `figure-root-path` 来拼接图片路径, 其中 figure-root-path 是模板的所在目录的上层目录.

注意编译指令里的 `--root`, 需要指定为模板所在目录的上层目录.

#let path-prefix = figure-root-path + "typst-book-template/example/pics/"
#pic(path-prefix + "TofinoVancouver.jpg", "bing daily picture")
#pic(path-prefix + "MichiganLighthouse.jpg", "bing daily picture")