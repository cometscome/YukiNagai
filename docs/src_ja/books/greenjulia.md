# 1週間で学べる！　Julia数値計算プログラミング(KS情報科学専門書)

```@raw html
<img src="../images/greenjulia.jpg" height="319.8" width="250.9" alt="Julia本表紙" >
```
[1週間で学べる！　Julia数値計算プログラミング(KS情報科学専門書)](https://www.kspub.co.jp/book/detail/5282823.html)

## 更新履歴
- 2022年7月19日　サイトを公開しました
- 2022年8月3日　動作確認したコードの公開を始めました（2章から順番にアップロードしていきます）

## 動作確認したコード
コメントなどは省いたJupyterノートブックとコードです。コードの方は開いて該当箇所をREPLにコピーペーストすることで動かすことができます。動作確認にはJulia 1.7.3を用いています。
- 2日目 [Jupyter notebook](02.ipynb)と[コード](02.jl)
- 3日目 [Jupyter notebook](03.ipynb)と[コード1](03_1.jl)、[コード2](03_2.jl)、[コード3](03_3.jl)
- 4日目 [Jupyter notebook その1](04_1.ipynb)と[Jupyter notebook その2](04_2.ipynb)、[コード1](04_1.jl)と[コード2](04_2.jl)
- 5日目　[Jupyter notebook その1](05_1.ipynb)と[コード　その1](05_1.jl)。本書ではJulia 1.6を用いていましたが、Julia 1.7以降だと乱数の発生方法が変わっているためにそのままでは本書の結果を再現できません（乱数が違う程度の値の変化があります）。ですので、二種類のコードを用意しました。Julia 1.6以前で再現する場合の[Jupyter notebook その2](05_2.ipynb)と[コード　その2](05_2.jl)。Julia 1.7以降を使う場合に本書を再現する場合の[Jupyter notebook その2](05_2_1_7.ipynb) と[コード　その2](05_2_1_7.jl)。

## 誤植について
もし誤植や間違いと思われる箇所を発見した方は[こちら](https://github.com/cometscome/YukiNagai/issues/1)に記入していただければチェックして反映したいと思います。


## 第1刷の誤植

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

- p.95
```正$(8N)角形の場合```は```正$(N)角形の場合```が正しいです。本文の出力を全て8で割って読み替えてください。

- p.102 最後のplot
```julia
markershape = [:circle,:star5]
```
->
```julia
markershape = [:circle :star5]
```

- p.105の最後
```julia
n = 10000
```
-> 
```julia
N = 10000
```

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

- p130の```make_Hk```内
```julia
v += Ukkp
```
->
```julia
v += Vkkp
```

- p130の```calc_psi```内
```julia
nmax = length(bn)
```
->
```julia
nmax = length(cn)
```
です。
- p138の```calc_Vij```
正しくは、
```julia
function calc_Vij(n,i,j,R,V)
    αi = besselj_zero(n,i)
    αj = besselj_zero(n,j)
    f(r) = r*V(R*r)*besselj(n,αi*r)*besselj(n,αj*r)
    v,err  = quadgk(f,0,1)
    Vij =v*2/besselj(n+1,αi)^2 
    return Vij
end
```
です（申し訳ありません。なぜこんな間違いになっているか、謎です）。

- p141の```timedep_simple()```内
```julia
H = zeros(Float64,N,N)
make_H!(H,N,L,V)
```
->
```julia
H = make_H(N,L,V)
```
```make_H!```はp143で定義されていますので、この修正をしなくてもそちらを先に定義してからなら動きます（登場順番が逆になっています）。[報告](https://github.com/cometscome/YukiNagai/issues/1#issuecomment-1192714109)ありがとうございます。



- p.146 上部
```math
\exp(i {\cal H} \Delta t) \exp(-i {\cal H} \Delta t) \sim (1- i {\cal H} \Delta t)(1- i {\cal H} \Delta t)
```
->
```math
\exp(i {\cal H} \Delta t) \exp(-i {\cal H} \Delta t) \sim (1+ i {\cal H} \Delta t)(1- i {\cal H} \Delta t)
```
最右辺の結果は変わりません。





- p160の```test6```
コードの定義の前に、
```julia
using Plots
using Measures
```
を追加。```add Measures```でパッケージを追加しておく必要があります。

- p170のコード
```julia
return mz_data,accept_count/(num_total*Lx*Ly)
```
-> 
```julia
return mz_data,accept_count/(num_total*Lx*Ly),absmz_meanvalue/measure_count
```
です。p173のコードを動かすためには引数が一つ足りませんでした。関連して、p171のコードはp173と同様に
```julia
@time mz_data,acceptance_ratio
```
->
```julia
@time mz_data,acceptance_ratio,absmz
```
と修正してください。

- p170のコード
引数が${\rm measure_{i}nterval}$となっているものを
```julia
measure_interval
```
と修正。

- p210のOptim
```julia
optimize(f, [0.0, 0.0])
```
->
```julia
a1 = optimize(f, [0.0, 0.0])
```
と修正。

- p232のコード
14行目と15行目の間に
```julia
n = 10000
```
を挿入。






### 謝辞
Twitterやメールなどを通じて誤植の指摘をしていただいた方々に深く感謝いたします。

