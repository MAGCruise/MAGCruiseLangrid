MAGCruiseLangrid
=================

MAGCruiseから言語グリッドを呼び出すモジュールです．
MAGCruiseと連携せずに，Scheme(Kawa)から言語グリッドを呼び出すサービスクライアントとしても利用できます．．

## 使い方 (Windows)
1. "config/config-sample.scm"を"config/config.scm"にリネームし，ユーザIDとパスワードを設定します．．
2. magcruise-langrid.batを起動するとkawaの実行画面が表示されます．
3. kawaの実行画面に (load (path "sample/sample.scm"))と入力すると，辞書検索と翻訳，辞書連携翻訳，テンポラル辞書付き辞書連携翻訳などのサンプルが実行されます．

