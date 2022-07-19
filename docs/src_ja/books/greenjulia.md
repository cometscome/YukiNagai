# 1週間で学べる！　Julia数値計算プログラミング(KS情報科学専門書)

## 更新履歴
- 2022年7月19日　サイトを公開しました

## 初版の誤植

1. p.123 中央付近
```math
d_{ij} = -(\delta_{i,i+1} + \delta_{i,i-1}-2\delta_{ij})/(\Delta x)^2
```
->
```math
d_{ij} = -(\delta_{i,j+1} + \delta_{i,j-1}-2\delta_{ij})/(\Delta x)^2
```
コードの修正はありません。

2. p.129 ```V(q)```の式
```math
e^{-eqx}
```
->
```math
e^{-iqx}
```