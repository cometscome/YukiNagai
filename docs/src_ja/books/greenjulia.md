# 1週間で学べる！　Julia数値計算プログラミング(KS情報科学専門書)

```@raw html
<img src="../images/greenjulia.jpg" height="319.8" width="250.9" alt="Julia本表紙" >
```
[1週間で学べる！　Julia数値計算プログラミング(KS情報科学専門書)](https://www.kspub.co.jp/book/detail/5282823.html)

## 更新履歴
- 2022年7月19日　サイトを公開しました

## 誤植について
もし誤植や間違いと思われる箇所を発見した方は[こちら](https://github.com/cometscome/YukiNagai/issues/1)に記入していただければチェックして反映したいと思います。


## 第1刷の誤植

- p.123 中央付近
```math
d_{ij} = -(\delta_{i,i+1} + \delta_{i,i-1}-2\delta_{ij})/(\Delta x)^2
```
->
```math
d_{ij} = -(\delta_{i,j+1} + \delta_{i,j-1}-2\delta_{ij})/(\Delta x)^2
```
コードの修正はありません。

- p.129 ```V(q)```の式
```math
e^{-eqx}
```
->
```math
e^{-iqx}
```

- p.17 下部
```math
f(x) = \cos(x) + 2 \sin(3 x^2)
```
はコードとずれていますので、
```math
f(x) = \cos(x) + 2 \sin(2 x^2)
```
が正しいです。

- p.19 上部
```math
f(x,y) = \cos(x) + 2 \sin(3 y^2)
```
はコードとずれていますので、
```math
f(x,y) = \cos(x) + 2 \sin(2 y^2)
```
が正しいです。

- p.146 上部
```math
\exp(i {\cal H} \Delta t) \exp(-i {\cal H} \Delta t) \sim (1- i {\cal H} \Delta t)(1- i {\cal H} \Delta t)
```
->
```math
\exp(i {\cal H} \Delta t) \exp(-i {\cal H} \Delta t) \sim (1+ i {\cal H} \Delta t)(1- i {\cal H} \Delta t)
```
最右辺の結果は変わりません。

- p.111　反発係数の定義式
```math
e = \frac{v'- V'}{v-V}
```
->
```math
e = -\frac{v'- V'}{v-V}
```

- p.111 $V'$の表式
```math
V' = \frac{2v(r-1)V}{1+r}
```
->
```math
V' = \frac{2v+(r-1)V}{1+r}
```
コードに変更はありません。

- p.117のコード
```julia
x,v = get_xv(small,ith)
X,V = get_xv(large,ith)
```
の部分の2変数関数```get_xv(small,ith)```は本では定義されていませんでした。
関数の終わり(25行目の後)に
```julia
function get_xv(ball::Ball, ith)  
    return ball.x_history[ith], ball.v_history[ith]  
end
```
を定義してください。[報告](https://github.com/cometscome/YukiNagai/issues/1#issuecomment-1191747775)ありがとうございます。

### 謝辞
Twitterやメールなどを通じて誤植の指摘をしていただいた方々に深く感謝いたします。

