#import "libs/template.typ": *

//以下のテンプレートおよびその変数は自作です．template.typを見て，うまくカスタマイズしてください．
#show: project.with(
  title: [Typst Template#footnote[This template assumes version 0.11.0]],
  authors: (
    "多鹿 智哉", "The other Author"
  ), //,で区切って著者名を追加します
  notes: ([日本大学経済学部, #link("mailto:tajika.tomoya@nihon-u.ac.jp")[tajika.tomoya\u{0040}nihon-u.ac.jp]],[Institutions and mail address]), //AuthorにつけられるNoteです．
  lang: "en", //ここをjpに変えると表や定理の名称が全て日本語になる．他の言語は未対応
  date: Today(style:"ymd-jp"), //年月日のスタイル ymd-en, mdy-en,mdy-en-abr, ymd-jp, ymd-jp-warekiなどのスタイルがある
  abstract: [Typstの機能の個人的なメモです。数ある機能のうちのほんの少しを紹介しています。Typst 0.11.0を前提にしています。],
  //フォントサイズの設定
  font-size: 12pt,
  //フォントの設定, 以下はデフォルトです．フォントがない場合は適当なフォントで代替されます．使用できるフォントはコマンドラインで typst fonts で調べることができます．
  body-font: ("Times","Hiragino Mincho Pro"), //地の文のフォント
  sans-font: ("Times","Hiragino Kaku Gothic Pro"), //強調やheadingに使うフォント
  math-font: ("STIX Two Math","Hiragino Mincho Pro"), //数式フォント
  //行間の設定
  leading: 1.2em,
  //マージンの設定
  margin: (left:1in, top:1in, right:1in, bottom:1in),
  //その他
  keywords:none,
  JEL: none
)

#set raw(theme: "halcyon.tmTheme")
#show raw: it => box(
  fill: rgb("#1d2433"),
  inset: 4pt,
  radius: 5pt,
  text(fill: rgb("#a2aabc"), it)
  ,baseline: 20%)

= Typstについて
- TeX/LaTeXに代わる（かもしれない）組版システム

- 特徴
  - TeX/LaTeXよりコンパイルが早い（リアルタイム）
  - 直観的な構文
  - カスタマイズの容易さ
  - エラーメッセージのわかりやすさ

- 詳しく知りたい方は公式ドキュメント(https://typst.app/docs/reference)を読むこと。


= 使用方法/インストール方法
- 公式アプリ(https://typst.app)が使いやすいのでそちらを使ってみましょう。
- ローカルにインストールするには\ https://github.com/typst/typst#installation をご覧ください
  - macならターミナルで以下のように入力する。
  ```c brew install typst```
  - Windowsでもいろいろ方法があります。
    - 例えば「アプリインストーラー」がインストールされていれば#footnote[Windows 10/11 であれば既にインストールされているか、Microsoft Storeにあります。「アプリインストーラー」で検索してみてください。]Powershell/コマンドプロンプトから以下のように入力します。
    ```c winget install --id Typst.Typst``` 
- エディタはいろいろありますが VS code では Typst LSP および Typst Preview の二つの拡張機能をインストールします．

- Typst のバージョンのアップデートには、インストール時と同じことをするか、v0.8.0以降であればpowershell/コマンドプロンプトやターミナルから

```c typst update```

でアップデートされます。



= 簡単な使い方

== はじめに
初めにいろいろ文字を入力してみましょう。Typstでは書いた文字がそのまま反映されます。

=== 見出し
見出しは次のように設定します。

```typ
= 見出しレベル1
== 見出しレベル2
```

見出しのレベルは`=`を重ねると下がります。

Typstでは特殊な機能を使うために`#`を用います。```#```のついた命令は *関数* といいます。
例えば見出しは次のようにも書くことができます。

```typ
#heading("見出し")
```

見出しのレベルを設定するには次のようにします。

```typ
#heading("見出し",level:2)
```

また、次のようにすれば見出しに番号をつけることができます。

```typ
#heading("見出し",numbering:"1.1")
```

//デフォルトで番号をつけるようにするには @default 節を参照してください。

=== 箇条書き

箇条書きは次のようにします。

```typ
- 箇条書き項目1
- 箇条書き項目2
```

これによって次のように出力されます。
- 箇条書き項目1
- 箇条書き項目2

箇条書きのレベルを下げるにはインデントを下げる（Tabキーで空白を開ける）だけで十分です。

```typ
- 箇条書き項目1
  - 箇条書き項目2
```


また、番号付きの箇条書きをするには次のように入力します。

```typ
+ 箇条書き項目1
+ 箇条書き項目2
```

これによって次のように出力されます。
+ 箇条書き項目1
+ 箇条書き項目2
箇条書きの記号や番号の設定については @default をご覧ください。

=== 脚注

脚注は```typ #footnote[脚注の中身]```と入力します#footnote[このように脚注ができます。]。

=== 改行

改行には`\`を用います。

=== 段落の左/右/中央揃え
段落を右揃えにしたり中央揃えにするには```typ #align```を用います。

```typ
#align(center, "中央に配置")
```

と入力すれば次のように配置されます。
#align(center, "中央に配置")

=== 文章の強調
斜体は```typ _italic_```、あるいは```typ #emph[italic]```とします。そうすれば _italic_ と表示されます。太字は```typ *strong*```、あるいは```typ #strong[strong]```とします。そうすれば *strong* と表示されます。

=== 下線を引く
下線を引くには```typ #underline[下線を引く]```とします。そうすれば#underline[下線を引く]と出力されます。
=== 文字色/ハイライト
文字色を変更するには```typ #text(fill:red)[赤い文字]```とします。そうすると #text(fill:red)[赤い文字] と出力できます。
#highlight[ハイライトで強調]するには```typ #highlight[ハイライトで強調]```と入力します．
== 数式
Typstで数式は
```typ
$x^2$
```
などと入力します。これによって$x^2$と出力できます。基本的に`$`
で囲んだ領域は数式モードになります。

- いくつか関数などもあります。以下が例です.#footnote[LaTeXのように`\`をつける必要はありません。] 
  - $x_2$: ```typ x_2```
  - $sin(x)$: ```typ $sin(x)$```
  - $lim_(x -> infinity) x$: ```typ $lim_(x -> infinity) x$```
  - $sum_(x=1)^n x^2$: ```typ $sum_(x=1)^n x^2$```
  - $1/2$: ```typ $1/2$```
  - $(diff f)/(diff x)$: ```typ $(diff f)/(diff x)$```
  - $(dif f)/(dif x)$: ```typ $(dif f)/(dif x)$```
  - $integral_a^b f(x)dif x$: ```typ $integral_a^b f(x)dif x$```
  - $[1/2,1]$: ```typ $[1/2,1]$ ```
  - $[1/2,1)$:  ```typ $[1/2,1)$ ```
  - $RR$: ```typ $RR$```



- 記号のリストについては以下を参照してください。\
  https://typst.app/docs/reference/symbols/sym/

  - こちらは手書きで記号を探すアプリです．\ https://detypify.quarticcat.com/




また、```typ $ f(x)$```のように```typ $```の後にスペースを入れるか、あるいは改行するとディスプレイ数式ができます。例えば次のような入力をしてみましょう。

```typ
$
f(x)&=integral_0^x y dif y  \ 
&= x^2/2
$
```

すると次のように出力されます。
$
f(x)&=integral_0^x y dif y  \ 
&= x^2/2
$

ここで`\`は改行、`&`は位置を揃えることを意味します。

 またカッコの大きさは自動で調整されます．ただし||は自動調整されません．なので絶対値やノルムは ```typ $abs(a)$，$norm(x/2)$``` と入力します．そうすると$abs(a^2)$，$norm(x/2)$と出力されます，

長々しい数式を繰り返し使うときは```typ #let```をつかって省略してみましょう．例えば以下のようにしてみてください．

```typ
#let Bnm = $sum_(i=0)^(n) binom(n,i) x^i (1-x)^(n-i)$
$Bnm$
```

こうすることで```typ Bnm```を新しい数学記号として定義できるのです．
ここの文字列は既存のものとかぶっていなければ何でも良いです．（出力がおかしい場合には既存のものとかぶっている可能性があるので少し変更してみましょう）


数式について詳しくは https://typst.app/docs/reference/math/ をご覧ください．
== 図表

図表を

=== 図
図には```typ #image```を使います．画像を取り込むときは```typ #image(ファイル名.拡張子)```とします．詳しくは以下のページを参照してください


=== 表

表は以下のように書きます． 

```typ
table(columns:3,[1],[2],[3],[4])
```
#table(columns:3,[1],[2],[3],[4])
このように columnsで列の数を指定すれば，あとは配列を書き連ねると表を組版してくれます．
より細かい設定は以下をご覧ください

https://typst.app/docs/reference/model/table/




== 相互参照/引用<ref>
引用したい図．数式や見出しにラベルをつけます．ラベルの名称は何でも良いです．
ラベルをつけられるのは， figure, heading, math.equation, footnoteのみです


```typ
= 引用したい節<label>
@label で引用できます． 
```

- 図表を参照するには以下のようにfigureで囲む必要があります．figureの後ろにラベルをつけます．

    ```
    #figure(
      #table([],[],[])
      caption: "my first table"
    )<table>
    ```

  - 詳しくは以下を参照してください
    
  https://typst.app/docs/reference/model/figure/

- 文献の引用にはBibTeXが使えます．まずbibファイルを作成し#footnote[例えば https://mathlandscape.com/latex-bib/ を参照のこと]，参考文献を出力したい場所に以下のように入力した上で参照キーを```typ @```を使って引用すれば引用文献が参考文献リストに現れます．
  詳しくはこちらを参照してください
  
  https://typst.app/docs/reference/model/bibliography/




 

== パッケージ
パッケージを利用することでTypstの機能を拡張できます。パッケージの一覧はこちらです。https://typst.app/universe

パッケージの一例を挙げれば次のようなものがあります．
/ #link("https://typst.app/universe/package/physica")[Physica]: 数式関数の拡張．より容易に数式を書くことができます．

/ #link("https://github.com/typst/packages/tree/main/packages/preview/lemmify/0.1.2")[Lemmify]: 定理環境
/ #link("https://github.com/typst/packages/tree/main/packages/preview/cetz/0.1.1")[CeTZ]: 図の描画（LaTeXで言うTikZのようなもの）
/ #link("https://github.com/typst/packages/tree/main/packages/preview/showybox/1.1.0")[Showybox]: カスタマイズ可能なボックス（LaTeXで言うtcolorbox）




= カスタマイズする 

== set-show rule <default>
ここでは関数のデフォルトを変更することを考えます。
例えば、フォントを変更したいときには次のようにします。

```typ
#set text(font:"フォントの名前")
```

このように```typ #set```を使うことでデフォルトを変更できます。
他にも、箇条書きの記号を変更するときは次のようにします。

```typ
#set list(marker: ([•], [--]))
- Top-level
  - Nested
  - Items
- Items
```

これによって記号を次のように変更できます。
#set list(marker: ([•], [--]))
- Top-level
  - Nested
  - Items
- Items

Typstの関数にはカスタマイズできる項目が多数あり、それを
```typ #set```を使うことで変更しています。


これに対して、```typ #show```関数を使うと、関数を丸ごとカスタマイズすることができます。例えば以下のようにすれば強調関数をそのまま書き換えることができます。

```typ
#show strong: it => {text(fill:red)[[#it.body]]}
*強調*
```




set-rule や show-rule について詳しくは以下を見てください。

 https://typst.app/docs/reference/styling/ 


== 自作関数/変数

```#let```命令を使うことで、自作の関数を作ることができます。
例えば以下のようにします。

```typ
#let pd(num,denom) = {$(diff num)/(diff denom)$}
$pd(f,x)$  
```

そうすると次のように出力されます。
#let pd(num,denom) = {$(diff num)/(diff denom)$}
$pd(f,x)$

デフォルトを設定することもできます。例えば次のようにしてみましょう。

```typ
#let pd(num,denom,mode:none) = {
  if mode == "D" {
    $D_(denom) num$
    }
  else {
  $(diff num)/(diff denom)$
    }
  }
```
#let pd(num,denom,mode:none) = {
  if mode == "D" {
    $D_(denom) num$
    }
  else {
  $(diff num)/(diff denom)$
    }
  }

すると、デフォルトで```typ $pd(f,x)$```を入力すれば$pd(f,x)$が, ```typ $pd(f,x,mode:"D")$```とすれば$pd(f,x,mode:"D")$と主力されます。

なお，physicaパッケージを用いれば，偏微分などの記号は設定されています．


= このテンプレートに含まれる機能

このファイル自体がテンプレートになっています．必要に応じて，書き換えてみてください．

== 数式の自動参照

以下の関数を使うと，数式は，参照されたときのみ数式番号をつけます．

```typst
#aeq("math_eq")[$
integral_(-oo)^oo (1/root(,2 pi))e^(-x^2/2) dif x = 1
$]
```

#aeq(<math_eq>)[$
integral_(-oo)^oo (1/root(,2 pi))e^(-x^2/2) dif x = 1
$]

@math_eq は参照されています．

#aeq(<math_eq2>)[$
integral_(-oo)^oo (1/root(,2 pi))e^(-x^2/2) dif x = 1
$]

参照されない数式には番号はつきません

== 定理環境

以下の定理が使えます. projectのlangのところをenかjpにすれば，変更できます．
辞書の中身はlibs/translation.typにあるので，そこを編集すれば，変えられます.

#theorem[
  定理の中身
]

#prop(name:"名称")[命題の中身]<prop>

#proof(name:[@prop])[証明を書く]

#assump[]

#ex[]

#fact[]

#cor[]

#lemma[]

