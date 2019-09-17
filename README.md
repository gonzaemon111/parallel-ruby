# Ruby での並列処理

## 使用しているライブラリ

```Gemfile
gem "parallel"
```

## 実行コマンド

```
$ ruby sample.rb
```

## 並列処理メソッド対応表

|Rubyのメソッド|対応するparallelのメソッド|
|:---:|:---:|
|`Enumerable#each`|`Parallel.each`|
|`Enumerable#map`|`Parallel.map`|
|`Enumerable#any?`|`Parallel.any?`|
|`Enumerable#each_with_index`|`Parallel.each_with_index`|
|`Enumerable#map`,` Enumerator#with_index`|`Parallel.map_with_index`|

## 内容

#### each

Parallel.eachはブロックが並列に実行されるeachです。 並列に処理しているためブロックの実行が完了する順序はバラバラです。 戻り値はParallel.eachの引数が返ります。

#### map

Parallel.mapはブロックが並列に実行されるmapです。 並列に処理しているためブロックの実行が完了する順序はバラバラです。 戻り値はmapと同様に入力した各要素に対応した値の配列が返ります。

#### ワーカー番号の取得

上記のメソッド以外の機能もあります。 ブロック内でParallel.worker_numberを呼ぶとワーカースレッド/プロセスの番号を取得できます。 デバッグやロギングで利用できます。

### スレッドとプロセス

parallelのメソッドはオプションでプロセスで処理(in_processes)するかスレッドで処理(in_threads)するかを切り替えることができます。


#### プロセスで処理する場合

CRubyで何もオプションを指定しなければプロセスによる並列処理になります。 並列数はparallel内部のParallel::ProcessorCount.countが返す論理コア数になります。

in_processes: 並列数を指定すると指定したプロセス数で並列化して実行できます。

```ruby
Paralell.each(1..10, in_processes: 10); end
```

parallelの内部でforkして作られたワーカープロセスはメソッド呼び出しが完了するまで使い回されます。 1回のブロックの実行毎にforkさせたい場合は`isolation: true`を指定することもできます。

```ruby
Paralell.each(1..10, in_processes: 10, isolation: true); end
```

#### スレッドで処理する場合

JRubyで何もオプションを指定しなければスレッドによる並列処理になります。 並列数はparallel内部の`Parallel::ProcessorCount.count`が返す論理コア数になります。

`in_threads: 並列数`を指定すると指定したスレッド数で並列化して実行できます。
