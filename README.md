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
