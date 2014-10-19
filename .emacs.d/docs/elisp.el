;; Elisp入門
;; M-; 新規コメント作成
;; M-j コメントを改行
;; C-x C-e  eval (Lisp式の末尾で)


;; Elisp入門

1 リスト処理機

Lisp = List Processing (リスト処理機)

リストはLispの基本である。

1.1 リストとは何か

リストとは例えばこのようなもの。

'(rose violet daisy tulip)

縦に書いてもよい

'(rose
  violet
  daisy)

下記の場合、リストは+,2,2の３つの要素で構成される。

'(+ 2 2)

Lispにおいて、データとプログラムは同じものである。
どちらも、単語や数字やリストのリストである。

;や,を含むものはリストではない。
下記のものはリストではない。
'(a ; b)
'(a , b)


下記のように、リストの中にリストを含むことができる。

'( this list has ( another list ))

1.1.1 Atoms

上記のリストに登場する単語はsymbolと呼ばれる。


ダブルクォテーション""で囲まれたものはstringと呼ばれる。
stringもatomの一種である。

    '(this list includes "text between quotation marks.")


1.1.2

リスト内の空白文字の数は何個あっても同じである。

'( this list 
        looks like this )
↑↓どっちも同じ式。
'( this list looks like this)


1.2 プログラムを実行する

Lispにおいてリストとは実行可能なプログラムである。
リストを実行するとコンピュータは次の３つのうちのどれかを行う。

1 リストそのものを戻り値として返す
2 エラーメッセージを返す
3 リスト中の最初のシンボルをコマンドとして実行する

クォート(')の役割
リストの前にクォート'を書かないと、最初のシンボルを関数として実行する。

(+ 2 2)
評価すると4が返る
'(+ 2 2)
評価するとリストそのもの (+ 2 2)が返る

リストを評価するには、リストの最後の括弧の後ろでC-x C-eする。

1.3 エラーを発生させる

下記の式を評価する(末尾でC-x C-e)とエラーが出る。
なぜなら、リストの第一要素がコマンドではないから。

    (this is an unquoted list)

エラー画面の読み方
下から上に読む。

  call-interactively(eval-last-sexp nil nil)
これが最初の入り口。
eval-last-sexp はC-x C-eによって呼び出された関数。
sexp = S式

1.6 Evaluating inner lists

C-x C-e (eval-last-sexp) の意味

(直近のS式を評価する)
下記の式において、改行後の空行でC-x C-eしても正しく評価される。
また、(+ 3 3)の直後で実行すると6と表示される。

     (+ 2 (+ 3 3))

1.8.1 Arguments' Data Types

(concat "abc" "def") ;; 文字列連結。
(substring "What do you read, my lord ?"  18 25);; 18文字目から２５文字目までを取得

;; argumentにはsymbolも使える。

(+ 2 fill-column)

;; argumentにはlistも使える

(concat "The " (number-to-string (+ 2 fill-column)) " red foxes.")

1.8.5 message function

(message "Hello World!")

printfのように使える
(message "Hello %s"  (buffer-name))


(message "The value of fill--column is %d." fill-column)

(message "There are %d %s in the office!" (- fill-column 14) "pink elephants")

(message "Hello %s" "World")

(message "He saw %d %s"
         (- fill-column 32)
         (concat "red "
                 (substring
                  "The quick brown foxes jumped." 16 21)
                 " leaping."))

1.9.1 'set'

(set 'flowers '(rose violet daisy tulip))

flowers

'flowers


1.9.2 'setq' is 'set quote'

(setq carnivores '(lion tiger leopard))
carnivores

(set 'moju '(lion tiger loepard))
moju

一度に複数の変数をセットすることもできる。

(setq trees '(pine fir oak maple)
      herbivores '(gazella antelope zebra))


1.9.3 Counter

(setq counter 0)

(setq counter (+ counter 1))

counter


(foo)

bar

'bar


2.1 Buffer Names



;; 関数
;; ・あらゆる関数には戻り値がある。
;; ・関数の戻り値は、リスト中の最後の要素の値。

;; simple function
(+ 2 4)
;; return 6

(>= 4 2)
;; return t

(<= 4 2)
;; return nil


;; you can nest

(* 2  (+ 2 3) )
;; return 10 


;; setq
;; 変数に値を代入する
(setq auto-save-interval 800)
('auto-save-interval)

;; 複数の変数にそれぞれ一気に代入することもできる。
;; この場合は最後に代入された値がsetqの戻り値となる。
(setq  var_foo1  1
       var_foo2  2
       var_foo3  3)


;;  変数を使って変数へ代入できる

   (setq a 1)
   (setq b a)

;; 自分を自分に代入できる

   (setq a (+ a 1) )


;; defvarとは
(defvar foo 3)

;; setqと似ているが、defvarは既にその変数が定義されている場合は上書きしない。
;; phpでいうと
;; if( is_null($var) ){ $var = 'foo'; }
;; のような感じ。

;; defun 関数を定義する関数
(defun my-function-sample1())


;; Atom
;; int, float, char, string, boolean, symbolがある。

;; int
1
;; float
3.14
;; char
?a
;; string
"hello"
;; boolean
t
nil
;; symbol
'my-symbol





;; emacs ではクロージャが作れない?
;; http://d.hatena.ne.jp/keyword/%a5%af%a5%ed%a1%bc%a5%b8%a5%e3


(let ((count 0))
  (defun get-count ()
    (setq count (+ count 1))
    count)
  (let ((count 10))
     (print (get-count))
     (print (get-count))
     (print (get-count))
     (print (get-count))))

