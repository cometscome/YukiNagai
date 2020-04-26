---
layout: page
title: 論文解説
tags: header
permalink: /papers/
---

このページは永井の原著論文の日本語解説のページです。<br>
解説は書き次第追加していきます。<br>

<HR ALIGN="center" WIDTH=100% SIZE=2>
<STRONG>原著論文（日本語解説付き）</STRONG><BR><P>
    <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=1>

    <TR>
    <TD ALIGN="left">48. </TD>
    <TD ALIGN="left">
    <FONT COLOR=#FF0000>Yuki Nagai</FONT>, Masahiko Okumura, and Akinori Tanaka<br>
    </TD>
    </TR>
    
    <TR>
      <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Self-learning Monte Carlo method with Behler-Parrinello neural networks
    </FONT>
<br>
    <A HREF="https://arxiv.org/abs/1807.04955">arXiv:1807.04955</A><br>
モンテカルロ法の機械学習を用いた高速化手法である自己学習モンテカルロ法では、有効ハミルトニアンを見いだすことで高速に計算を実行できる。<br>
本研究では、汎用的な有効ハミルトニアン構築方法を提案した。<br>
第一原理計算で計算したポテンシャルをニューラルネットワークで構成する機械学習分子動力学の手法を取り込むことにより、
有効ハミルトニアンとして多体相互作用するハミルトニアンを使うことができるようになった。<br>
ニューラルネットワークに隠れ層がない場合、有効ハミルトニアンは二体相互作用を持つ先行研究[45]の有効ハミルトニアンと一致する。<br>
本論文では、連続時間量子モンテカルロ法(CTINT)に対して多体有効ハミルトニアンの有用性を示した。
<br><br></TD>
    </TR>


    <TR>
    <TD ALIGN="left">47. </TD>
    <TD ALIGN="left">
    <FONT COLOR=#FF0000>Yuki Nagai</FONT> and Hiroshi Shinaoka<br>
    </TD>
    </TR>
    
    <TR>
      <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Smooth self-energy in the exact-diagonalization-based dynamical mean-field theory: Intermediate-representation filtering approach
    </FONT>
<br>
    <A HREF="https://arxiv.org/abs/1806.10316">arXiv:1806.10316</A><br>
強相関電子系でよく用いられる動的平均場理論（DMFT）では、有効不純物問題を正確に解くことが重要である。<br>
有効不純物問題のソルバーとして、厳密対角化を用いることで状態密度などの実振動数の量を計算することができる。<br>
しかし、系を少数サイトで近似してしまうが故に状態密度や自己エネルギーがスパイク状になってしまい、その物理的意義を調べることが困難であった。<br>
本研究では、スパースモデリングの観点から松原自己エネルギーが数十のパラメータで近似できることに着目し、自己エネルギーの中間状態基底を導入することで、
サイト数に対して収束している自己エネルギーを得ることができた。その結果、自己エネルギーの実振動数表示はサイト数に依存しない滑らかな関数となり、
その物理的意義を調べることが容易となった。<br>
<br></TD>
    </TR>

     


    <TR>
    <TD ALIGN="left">45. </TD>
    <TD ALIGN="left">
    <FONT COLOR=#FF0000>Yuki Nagai</FONT>, Huitao Shen, Yang Qi, Junwei Liu, and Liang Fu<br>
    </TD>
    </TR>
    
    <TR>
      <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Self-Learning Monte Carlo Method: Continuous-Time Algorithm
    </FONT>
<br>
Phys. Rev. B <b>96</b>, 161102(R) (2017).
<A Href="http://dx.doi.org/10.1103/PhysRevB.96.161102">[link]</A>
 <FONT COLOR=#FF0000>Editors' Suggestion</Font> and <FONT COLOR=#FF0000>Open Access</Font> <br>
    <A HREF="https://arxiv.org/abs/1705.06724">arXiv:1705.06724</A><br>
連続時間量子モンテカルロ法に対して自己学習モンテカルロ法を使った手法の提案の論文。<br>
マルコフ連鎖モンテカルロ法は、<br>
1. 次の配置を考える<br>
2. その配置の受け入れ確率を計算する<br>
の二つのプロセスに分けることができるが、この1の部分に対して、機械学習で求めた有効ハミルトニアンを用いている。<br>
2はオリジナルを使っているので、統計的にはオリジナルと厳密に同じ結果を与える。<br>
連続時間量子モンテカルロ法の場合には、擬スピンを導入して相互作用項を分解した後
フェルミオンのグリーン関数のダイヤグラムに関してモンテカルロ平均を取るが、
その有効模型は擬スピンのみの自由度を持ち、フェルミオンの自由度がない。<br>
そのため、0+1D模型が1Dの古典スピン系に変わるので、重みの計算が高速にできる。<br>
<br></TD>
    </TR>


    <TR>
    <TD ALIGN="left">44. </TD>
    <TD ALIGN="left">
    S. L. Goertzen, K. Tanaka, and <FONT COLOR=#FF0000>Y. Nagai</FONT><br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Self-consistent study of Abelian and non-Abelian order in a two-dimensional topological superconductor
    </FONT>
</br>
Phys. Rev. B <b>95</b>, 064509 (2017)									
<A Href="http://dx.doi.org/10.1103/PhysRevB.95.064509">[link]</A>
<br>
    <A HREF="https://arxiv.org/abs/1611.01610">arXiv:1611.01610</A><br><br></TD>
    </TR>

									


									
<TR>
	<TD ALIGN="left">43. </TD>
	<TD ALIGN="left">
	<FONT COLOR=#FF0000>Y. Nagai</FONT>, Yukihiro Ota, and K. Tanaka<br>
</TD>
</TR>


<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Time-reversal symmetry breaking and gapped surface states due to spontaneous emergence of new order in d-wave nanoislands
</FONT>
<br>
Phys. Rev. B <b>96</b>, 060503(R) (2016)
<A Href="http://dx.doi.org/10.1103/PhysRevB.96.060503">[link]</A>
<br>
<A HREF="http://arxiv.org/abs/1610.05501">arXiv:1610.05501</A><br><br></TD>
</TR>



<TR>
	<TD ALIGN="left">42. </TD>
	<TD ALIGN="left">
Howon Kim, Shi-Zeng Lin, Matthias J. Graf, Yoshinori Miyata, <FONT COLOR=#FF0000>Yuki Nagai</FONT>, Takeo Kato, and Yukio Hasegawa<br>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Electrical Conductivity through a Single Atomic Step Measured with the Proximity-Induced Superconducting Pair Correlation
</FONT>
<br>
Phys. Rev. Lett <b>117</b>, 116802 (2016).
<A Href="http://dx.doi.org/10.1103/PhysRevLett.117.116802">[link]</A><br><br></TD>
</TR>
									
									

<TR>
	<TD ALIGN="left">41. </TD>
	<TD ALIGN="left">
	<FONT COLOR=#FF0000>Y. Nagai</FONT>, Yasushi Shinohara, Yasunori Futamura, and Tetsuya Sakurai<br>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Reduced-Shifted Conjugate-Gradient Method for a Green's Function: Efficient Numerical Approach in a Nano-structured Superconductor
</FONT>
    <br>
J. Phys. Soc. Jpn. <b>86</b>, 014708 (2017) 
<A Href="http://dx.doi.org/10.7566/JPSJ.86.014708">[link]</A>
<br>
<A HREF="http://arxiv.org/abs/1607.03992">arXiv:1607.03992</A><br>
物理で多くの場合Green関数を計算することは有用である。この論文では、Green関数を固有値問題を解かずに連立方程式を解いて高速に求める手法を提案した。<br>
これは、(z I -H) x = bという形の連立方程式の場合、複素数zが異なる複数の連立方程式は共通のクリロフ部分空間を持てるために同時に共役勾配法で解ける、ということを利用している。<br>
さらに、解ベクトルxとあるベクトルvとの内積v^T xのみが欲しい場合、さらにメモリと計算の効率を上げられることを示した。<br>
この手法は、これまで我々が取り組んできていたChebyshev多項式展開法と比べて、実装が簡単、精度保証ができる、固有値分布を規格化する必要がない、などの利点があり、超伝導以外にも応用できる。
<br>
サンプルコードはこちら。<A Href="https://github.com/cometscome/RSCG">[Sample code]</A><br>
<br>
<br></TD>
</TR>


    <TR>
    <TD ALIGN="left">40. </TD>
    <TD ALIGN="left">
Shingo Yonezawa, Kengo Tajiri, Suguru Nakata, <FONT COLOR=#FF0000>Yuki Nagai</FONT>, Zhiwei Wang, Koji Segawa, Yoichi Ando, and Yoshiteru Maeno
<br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Thermodynamic evidence for nematic superconductivity in CuxBi2Se3
    </FONT>
</br>
Nature Physics <b>13</b>, 123 (2017) 
<A Href="http://dx.doi.org/10.1038/NPHYS3907">[link]</A>
<br>
    <A HREF="https://arxiv.org/abs/1602.08941">arXiv:1602.08941</A><br><br></TD>
    </TR>

    <TR>
    <TD ALIGN="left">39. </TD>
    <TD ALIGN="left">
    Evan D. B. Smith, K. Tanaka, and <FONT COLOR=#FF0000>Y. Nagai</FONT><br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Manifestation of chirality in the vortex lattice in a two-dimensional topological superconductor
    </FONT>
</br>
Phys. Rev. B <b>94</b>, 064515 (2016).
<A Href="http://dx.doi.org/10.1103/PhysRevB.94.064515">[link]</A>
</br>
    <A HREF="https://arxiv.org/abs/1605.08934">arXiv:1605.08934</A><br><br></TD>
    </TR>

    
    <TR>
    <TD ALIGN="left">38. </TD>
    <TD ALIGN="left">
    <FONT COLOR=#FF0000>Y. Nagai</FONT> and  Y. Ota<br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Nuclear magnetic relaxation rates of unconventional superconductivity in doped topological insulators
    </FONT>
	<br>
	Phys. Rev. B <b>94</b>, 134516 (2016).
<A Href="http://dx.doi.org/10.1103/PhysRevB.94.134516">[link]</A>
<br>

    <A HREF="https://arxiv.org/abs/1605.08164">arXiv:1605.08164</A><br>
トポロジカル超伝導体か否かを表面や界面に生じるマヨラナ束縛状態の検出以外でどう決めるか、という問題に関する文献[32]の続編。<br>
通常のs波超伝導体の場合NMRの1/T1の温度依存性はTc直下でコヒーレンスピークと呼ばれるピーク構造を持ち、<br>
その他のd波やp波などの非従来型超伝導体ではピークを持たない。<br>
一方、多軌道トポロジカル超伝導体では、その奇パリティに応じてコヒーレンスピークの符号が負となり、Tc直下で急減少（逆コヒーレンスピーク）
が生じる。本論文では、強い二回対称性を持つ超伝導秩序変数ではコヒーレンスピークが出ないことと、結晶構造の影響をモデルに取り入れてもほとんど結果が変わらないことを示した。<br>
具体的な計算には時間反転対称性を持つ3Dトポロジカル超伝導体のミニマルモデルである質量のあるディラックハミルトニアンに超伝導を入れたモデルを用いた。<br>
また、転移温度近傍での異常グリーン関数の解析表式を導出してコヒーレンスピークの符号を議論した。<br><br>

    <TR>
    <TD ALIGN="left">37. </TD>
    <TD ALIGN="left">
	<FONT COLOR=#FF0000>Yuki Nagai</FONT>, Shintaro Hoshino, and Yukihiro Ota<br>
    </TD>
    </TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Critical Temperature Enhancement of Topological Superconductors: A Dynamical Mean Field Study
</FONT>
</br>
Phys. Rev. B <b>93</b>, 220505(R) (2016).
<A Href="http://dx.doi.org/10.1103/PhysRevB.93.220505">[link]</A>
</br>
<A HREF="http://arxiv.org/abs/1602.06087">arXiv:1602.06087</A><br>


スピン軌道相互作用の強いトポロジカル超伝導体候補物質CuxBi2Se3の転移温度Tcが第一原理計算で計算されたフォノン由来のTcより二桁大きいことに着目し、<br>
スピン軌道相互作用が超伝導転移温度に与える影響を調べた。対象とした系は、Rashbaスピン軌道相互作用とZeeman磁場のある二次元s波超伝導体である。<br>
動的平均場理論(DMFT)を用い、不純物ソルバにはもっとも数値的に正確と言われる混成展開連続時間量子モンテカルロ法を用いた。<br>
DMFTによって局所的なファインマンダイヤグラムを全て取り入れた転移温度計算を行った結果、スピン軌道相互作用とZeeman磁場が協調してTcをあげることがわかった。<br>
この振る舞いは強結合極限によってある程度理解できる。クーパーペアはスピン軌道相互作用の二次摂動によりスピンが一度揃ってから隣のサイトに飛び移る新しいチャンネルを持ち、<br>
それがTcをあげる。スピンが一度揃う準位はZeeman磁場がある時よりエネルギーが低いのである。<br>
一方、Tcのスピン軌道相互作用強度依存性はこのシナリオでは説明できない。<br>
また、系を特徴付けるトポロジカル数(TKNN数)が1の時にもっともTcが高いという結果が得られており、
トポロジカル数がTcになんらかの影響を与えている可能性がある。<br>
この系を実現するセットアップとして、電気二重層トランジスタ（EDLT）を用いたシステムを提案した。<br>
<br>
</TD>
</TR>

    <TR>
    <TD ALIGN="left">36. </TD>
    <TD ALIGN="left">
	Yoichi Higashi, <FONT COLOR=#FF0000>Yuki Nagai</FONT>, Tomohiro Yoshida, Yusuke Masaki, and Youichi Yanase<br>
    </TD>
    </TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Robust zero-energy bound states around a pair-density-wave vortex core in locally noncentrosymmetric superconductors
</FONT>
<br>
Phys. Rev. B <b>93</b>, 104529 (2016).
<A Href="http://dx.doi.org/10.1103/PhysRevB.93.104529">[link]</A>
</br>
<A HREF="http://arxiv.org/abs/1602.00425">arXiv:1602.00425</A><br><br>
</TD>
</TR>

    <TR>
    <TD ALIGN="left">35. </TD>
    <TD ALIGN="left">
    A. Shitade and <FONT COLOR=#FF0000>Y. Nagai</FONT> <br>
    </TD>
    </TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Orbital angular momentum in a topological superconductor with high Chern number
</FONT>
</br>
Phys. Rev. B <b>93</b>, 174517 (2016).
<A Href="http://dx.doi.org/10.1103/PhysRevB.93.174517">[link]</A>
<br>
<A HREF="http://arxiv.org/abs/1512.07997">arXiv:1512.07997</A><br><br></TD>
</TR>


    <TR>
    <TD ALIGN="left">34. </TD>
    <TD ALIGN="left">
    <FONT COLOR=#FF0000>Y. Nagai</FONT>, and H. Nakamura <br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Multi-band Eilenberger theory of superconductivity: Systematic low-energy projection
    </FONT>
<br>
	J. Phys. Soc. Jpn.  <b>85</b>, 074707 (2016).
<A Href="http://dx.doi.org/10.7566/JPSJ.85.074707">[link]</A>
<br>
    <A HREF="http://arxiv.org/abs/1507.06039">arXiv:1507.06039</A><br><br></TD>
    </TR>


    <TR>
    <TD ALIGN="left">33. </TD>
    <TD ALIGN="left">
    <FONT COLOR=#FF0000>Y. Nagai</FONT>, H. Nakamura, M. Machida, and K. Kuroki<br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
First-principle study of antimony doping effects on the iron-based superconductor CaFe(Sb$_{x}$As$_{1-x}$)$_{2}$
    </FONT>
<br>
	J. Phys. Soc. Jpn.  <b>84</b>, 093702 (2015).
<A Href="http://dx.doi.org/10.7566/JPSJ.84.093702">[link]</A>
<br>
    <A HREF="http://arxiv.org/abs/1506.08515">arXiv:1506.08515</A><br><br></TD>
    </TR>


    <TR>
    <TD ALIGN="left">32. </TD>
    <TD ALIGN="left">
    <FONT COLOR=#FF0000>Y. Nagai</FONT>, Y. Ota, and M. Machida <br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Inverse coherence effects in nuclear magnetic relaxation rates as a sign of topological superconductivity
    </FONT>
<br>
Phys. Rev. B <b>92</b>, 180502(R) (2015).
<A Href="http://dx.doi.org/10.1103/PhysRevB.92.180502">[link]</A>
<br>
    <A HREF="http://arxiv.org/abs/1504.08095">arXiv:1504.08095</A><br>
トポロジカル超伝導体か否かを表面や界面に生じるマヨラナ束縛状態の検出以外でどう決めるか、という問題に対し、<br>
核磁気緩和率測定(NMR)で転移温度Tc直下の測定を行う事でトポロジカル超伝導の兆候を捉える事ができることを理論的に提案した。<br>
通常のs波超伝導体の場合NMRの1/T1の温度依存性はTc直下でコヒーレンスピークと呼ばれるピーク構造を持ち、<br>
その他のd波やp波などの非従来型超伝導体ではピークを持たない。<br>
一方、多軌道トポロジカル超伝導体では、その奇パリティに応じてコヒーレンスピークの符号が負となり、Tc直下で急減少（逆コヒーレンスピーク）
が生じる事を理論的に提案した。<br>
具体的な計算は文献[19]等で取り扱っているトポロジカル超伝導体候補CuxBi2Se3を対象とした。<br>

<br>
    
<br></TD>
    </TR>


    <TR>
    <TD ALIGN="left">31. </TD>
    <TD ALIGN="left">
    A. Shitade and <FONT COLOR=#FF0000>Y. Nagai</FONT> <br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
 Orbital angular momentum in a nonchiral topological superconductor
    </FONT>
</br>
	Phys. Rev. B <b>92</b>, 024502 (2015).
<A Href="http://dx.doi.org/10.1103/PhysRevB.92.024502">[link]</A>
<br>
    <A HREF="http://arxiv.org/abs/1501.06677">arXiv:1501.06677</A><br><br></TD>
    </TR>

    <TR>
    <TD ALIGN="left">30. </TD>
    <TD ALIGN="left">
    <FONT COLOR=#FF0000>Y. Nagai</FONT>, H. Nakamura, M. Machida<br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
  Surface states around a vortex in topological superconductors: Intersection of a surface and a vortex
    </FONT>
<br>
J. Phys. Soc. Jpn. <b>84</b>, 033703 (2015).
<A Href="http://dx.doi.org/10.7566/JPSJ.84.033703">[link]</A>
    <br>
    <A HREF="http://arxiv.org/abs/1412.5713">arXiv:1412.5713</A><br><br></TD>
    </TR>

    <TR>
    <TD ALIGN="left">29. </TD>
    <TD ALIGN="left">
    <FONT COLOR=#FF0000>Y. Nagai</FONT><br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Robust superconductivity with nodes in the superconducting topological insulator CuxBi2Se3: Zeeman orbital field and non-magnetic impurities
    </FONT>
    <br>
	Phys. Rev. B <b>91</b>, 060502(R) (2015).
<A Href="http://dx.doi.org/10.1103/PhysRevB.91.060502">[link]</A>
    <br>
    <A HREF="http://arxiv.org/abs/1410.4646">arXiv:1410.4646</A><br><br>
</TD>
    </TR>
    



    <TR>
    <TD ALIGN="left">28. </TD>
    <TD ALIGN="left">
    <FONT COLOR=#FF0000>Y. Nagai</FONT>, Y. Ota, and M. Machida<br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Topological s-wave pairing superconductivity with spatial inhomogeneity: Mid-gap-state appearance and Anderson's theorem
    </FONT>
    <br>
    J. Phys. Soc. Jpn. <b>84</b>, 034711 (2015).
    <A Href="http://dx.doi.org/10.7566/JPSJ.84.034711">[link]</A>
    <br>
    <A HREF="http://arxiv.org/abs/1407.1125">arXiv:1407.1125</A><br><br>
</TD>
    </TR>
    



    <TR>
    <TD ALIGN="left">27. </TD>
    <TD ALIGN="left">
    S. Yoshizawa, H. Kim, T. Kawakami, <FONT COLOR=#FF0000>Y. Nagai</FONT>, T. Nakayama, X. Hu, Y. Hasegawa, and T. Uchihashi<br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Direct Observation of Josephson Vortices on the Surface Superconductor Si(111)-(root7xroot3)-In by Scanning Tunneling Microscopy
    </FONT>
	<br>
	Phys. Rev. Lett. <b>113</b>, 247004.
<A Href="http://dx.doi.org/10.1103/PhysRevLett.113.247004">[link]</A>
 <FONT COLOR=#FF0000>Featured in Physics</FONT> and <FONT COLOR=#FF0000>Editors' Suggestion</Font> <br>
 <A HREF="http://physics.aps.org/synopsis-for/10.1103/PhysRevLett.113.247004">"Ultrathin Superconductors Take a Step Up"</A><br>
    <A HREF="http://arxiv.org/abs/1405.5953">arXiv:1405.5953</A><br><br></TD>
    </TR>

    <TR>
    <TD ALIGN="left">26. </TD>
    <TD ALIGN="left">
    <FONT COLOR=#FF0000>Y. Nagai</FONT><br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Field-angle-dependent low-energy excitations around a vortex in the superconducting topological insulator CuxBi2Se3
    </FONT>
<br>
J. Phys. Soc. Jpn. <b>83</b> (2014) 063705.
<A Href="http://journals.jps.jp/doi/abs/10.7566/JPSJ.83.063705">[link]</A>
    <br>
    <A HREF="http://arxiv.org/abs/1404.6874">arXiv:1404.6874</A><br>
       文献[23]で構築したトポロジカル超伝導体候補CuxBi2Se3に対する準古典理論を用いて、ポイントノードを持つ場合に量子化磁束の周りに生じる準粒子束縛状態を調べた。<br>
その際、磁束周りの準古典Eilenberger方程式の近似的解析解をKramer-Pesch近似により構築した。
	   そして、磁場を様々な方向に回転させた時に起きる束縛状態の変化を調べ、磁場をab面内で回転させながら比熱を測ることでそのポイントノードの方向を特定できることを示した。
	   <br>
<br></TD>
    </TR>
    

    <TR>
    <TD ALIGN="left">25. </TD>
    <TD ALIGN="left">
    <FONT COLOR=#FF0000>Y. Nagai</FONT>, Y. Ota, and M. Machida<br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
From p- to s-wave behaviors in a three-dimensional topological superconductor with non-magnetic impurities
    </FONT>
<br>
Phys. Rev. B <b>89</b>, 214506 (2014) 214506.  
<A Href="http://dx.doi.org/10.1103/PhysRevB.89.214506">[link]</A>
    <br>
    <A HREF="http://arxiv.org/abs/1404.1662">arXiv:1404.1662</A><br>
    トポロジカル超伝導体候補CuxBi2Se3の非磁性不純物効果を調べ、超伝導状態に対する不純物効果が、常伝導状態における絶縁体ギャップ(質量)<br>
    によって特徴付けられることを示した。文献[19]等で述べているように、この物質のハミルトニアンは質量のある三次元ディラックハミルトニアン<br>
    であり、質量とフェルミ運動量の比で定義される相対論パラメータが不純物効果を決めている。そして、非相対論的極限（フェルミ準位がバンドの底）<br>
    においては、超伝導ハミルトニアンに対して非相対論極限による展開が可能であり、その時トポロジカル超伝導体はp波超伝導体になることを示した。<br>
    また、超相対論的極限ではs波的になり不純物に強い。ドープ量変化による化学ポテンシャル変化を用いる事で、不純物耐性をコントロールできることを示した。<br>
        <br></TD>
    </TR>
    


    <TR>
    <TD ALIGN="left">24. </TD>
    <TD ALIGN="left">
    <FONT COLOR=#FF0000>Y. Nagai</FONT>, Y. Ota, and M. Machida<br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Impurity effects in a two-dimensional topological superconductor: A link of Tc-robustness with a topological number
    </FONT>
<br>
J. Phys. Soc. Jpn. <b>83</b> (2014) 094722.
<A Href="http://journals.jps.jp/doi/abs/10.7566/JPSJ.83.094722">[link]</A>
    <br>
    <A HREF="http://arxiv.org/abs/1312.3065">arXiv:1312.3065</A><br>
    
    Rashbaスピン軌道相互作用とZeeman磁場がある二次元s波超伝導体の非磁性不純物効果とトポロジカル数との関連を調べた。<br>
    この系はある磁場以上でトポロジカル超伝導となる。そして、この超伝導はいわゆるカイラルp波超伝導として理解されることが多い。<br>
    一方、超伝導秩序変数はトポロジカル転移前後で変わらずs波である。一般に、カイラルp波は不純物に弱くs波は強い。<br>
    そこで、不純物に対する自己無撞着T行列近似を用いてこの超伝導体の不純物耐性を調べ、トポロジカル数が0のときは超伝導は不純物に強く、<br>
    1になると連続的に徐々に弱くなっていくことを明らかにした。<br>
    <br>
    </TD>
    </TR>
    
    
    <TR>
    <TD ALIGN="left">23. </TD>
    <TD ALIGN="left">
    <FONT COLOR=#FF0000>Y. Nagai</FONT>, H. Nakamura, M. Machida<br>
    </TD>
    </TR>
    
    <TR>
    <TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
   Quasiclassical Treatment and Odd-parity/Triplet Correspondence in Topological Superconductors
    </FONT>
<br>
J. Phys. Soc. Jpn. <b>83</b> (2014) 053705.
<A Href="http://journals.jps.jp/doi/abs/10.7566/JPSJ.83.053705">[link]</A>
    <br>
    <A HREF="http://arxiv.org/abs/1305.3025">arXiv:1305.3025</A><br>
    文献[19]等で取り扱ったトポロジカル超伝導体候補CuxBi2Se3に対して準古典近似を適用し、波数依存のない奇パリティの超伝導ギャップ<br>
    は一体スピン軌道相互作用によってヘリウム3と同じようなスピントリプレット超伝導ギャップにマップできることを示した。<br>
    その際、常伝導状態のフェルミ準位での多軌道波動関数を用いることで、準古典近似を多軌道系へと拡張することができた。<br>
    <br></TD>
    </TR>


<TR>
<TD ALIGN="left">22. </TD>
<TD ALIGN="left">
Y. Higashi, <FONT COLOR=#FF0000>Y. Nagai</FONT>, M. Machida, N. Hayashi<br>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Field-angle Resolved Flux-flow Resistivity as a Phase-sensitive Probe of Unconventional Cooper Pairing
</FONT>
<br>
Phys. Rev. B <b>88</b> (2013) 224511.
<A Href="http://link.aps.org/doi/10.1103/PhysRevB.88.224511">[link]</A>
<br>
<A HREF="http://arxiv.org/abs/1304.6509">arXiv:1304.6509</A><br><br></TD>
</TR>


<TR>
<TD ALIGN="left">21. </TD>
<TD ALIGN="left">
<FONT COLOR=#FF0000>Y. Nagai</FONT>, Yasushi Shinohara, Yasunori Futamura, Yukihiro Ota, and Tetsuya Sakurai<br>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Numerical construction of a low-energy effective Hamiltonian in a self-consistent Bogoliubov-de Gennes approach of superconductivity
</FONT>
<br>
J. Phys. Soc. Jpn. <b>82</b> (2013) 094701.
<A Href="http://jpsj.ipap.jp/link?JPSJ/82/094701/">[link]</A>
<br>
<A HREF="http://arxiv.org/abs/1303.3683">arXiv:1303.3683</A><br>
実空間でBogoliubov-de Gennes(BdG)方程式を数値的に自己無撞着に高速に解く為の手法を提案した。<br>
実空間でギャップ方程式とBdG方程式を自己無撞着に解くためには文献[16]の直交多項式展開を用い、BdG方程式の固有値や固有ベクトルを利用して核磁気緩和率等の<br>
物理量を計算する際には、Sakurai-Sugiura(SS)法を用いることを提案した。<br>
超伝導で用いるBdGハミルトニアンで一番重要な固有値は固有値分布の中央付近に位置するゼロ近傍の固有値である。<br>
固有値分布の中央付近の固有値を効率的に求める手法としては、SS法が知られている。<br>
この二つの手法はともに大規模並列計算が容易なアルゴリズムとなっており、超伝導の磁束状態などを簡単に高速に計算できることを示した。<br>
参考となるノートは<A HREF="./nagainotes.htm">こちら</A><br>
    <br></TD>
</TR>


<TR>
<TD ALIGN="left">20. </TD>
<TD ALIGN="left">
<FONT COLOR=#FF0000>Y. Nagai</FONT>, H. Nakamura, and M. Machida<br>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Spin-polarized Majorana Bound States around a Vortex in Topological Superconductors
</FONT>
<br>
J. Phys. Soc. Jpn. <b>83</b> (2014) 064703.
<A Href="http://journals.jps.jp/doi/abs/10.7566/JPSJ.83.064703">[link]</A>
 <FONT COLOR=#FF0000>Papers of Editors' Choice </Font> <br> <!-- !' -->
 <A HREF="http://journals.jps.jp/doi/full/10.7566/JPSJNC.11.11">"Hunting Majorana Fermions in Topological Superconductors" in JPSJ News and Comments</A><br>
<A HREF="http://arxiv.org/abs/1211.0125">arXiv:1211.0125</A><br>
文献[19]と同じトポロジカル超伝導体候補CuxBi2Seを考え、その渦糸状態にスピン偏極したマヨラナ束縛状態が現れることを数値的におよび解析的に示した。<br>
この系は強いスピン軌道相互作用により、全角運動量は保存していても軌道角運動量とスピン角運動量のそれぞれは保存しない。<br>
そのため、渦糸の回る準粒子が持つ軌道角運動量がスピン角運動量に影響を与え、その結果渦糸周りにスピン分布が生じ、スピン偏極した渦糸
束縛状態が現れる。
    <br><br></TD>
</TR>

<TR>
<TD ALIGN="left">19. </TD>
<TD ALIGN="left">
<FONT COLOR=#FF0000>Y. Nagai</FONT>, H. Nakamura, and M. Machida<br>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Rotational Isotropy Breaking as Proof for Spin-polarized Cooper Pair in Topological Superconductor CuxBi2Se3
</FONT>
<br>
Phys. Rev. B <b>86</b> (2012) 094507.
<A Href="http://link.aps.org/doi/10.1103/PhysRevB.86.094507">[link]</A>
<br>
<A HREF="http://arxiv.org/abs/1206.0563">arXiv:1206.0563</A><br>
トポロジカル超伝導体候補CuxBi2Se3を念頭におき、軌道間接触型相互作用から生じるスピンが揃ったクーパーペアを考えると<br>
熱伝導率に二回対称の異方性が現れることを理論的に示した。<br>
Bi2Se3にCuをドープしたCuxBi2Se3は約3Kで超伝導になり、３次元トポロジカル超伝導体の候補として考えられている。<br>
ある種の軌道間クーパーペアを考えると、その超伝導秩序変数は波数依存しないにも関わらず、二回空間対称な系になってしまう。<br>
これは、常伝導状態の低エネルギー有効ハミルトニアンは質量のある３次元ディラックハミルトニアンで書けることと関係しており、<br>
常伝導ハミルトニアンが持つローレンツ対称性を超伝導秩序変数が破ることによって生じることを明らかにした。<br>

<br><br></TD>
</TR>


<TR>
<TD ALIGN="left">18. </TD>
<TD ALIGN="left">
<FONT COLOR=#FF0000>Y. Nagai</FONT>, K. Tanaka, and N. Hayashi<br>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Quasiclassical numerical method for mesoscopic superconductors: bound states in a circular d-wave island with a single vortex
</FONT>
<br>
Phys. Rev. B <b>86</b> (2012) 094526.
<A Href="http://link.aps.org/doi/10.1103/PhysRevB.86.094526">[link]</A>
<br>
<A HREF="http://arxiv.org/abs/1202.2661">arXiv:1202.2661</A><br><br></TD>
</TR>


<TR>
<TD ALIGN="left">17. </TD>
<TD ALIGN="left">
<FONT COLOR=#FF0000>Y. Nagai</FONT>, and K. Kuroki<br>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Q-scan-analysis of the neutron scattering in iron-based superconductors
</FONT>
<br>
Phys. Rev. B <b>85</b> (2012) 134521.
<A Href="http://link.aps.org/doi/10.1103/PhysRevB.85.134521">[link]</A>
<br>
<A HREF="http://arxiv.org/abs/1201.2453">arXiv:1201.2453</A><br><br></TD>
</TR>

<TR>
<TD ALIGN="left">16 </TD>
<TD ALIGN="left">
<FONT COLOR=#FF0000>Y. Nagai</FONT>, Y. Ota, and M. Machida<br>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Efficient Numerical Self-consistent Mean-field Approach for Fermionic Many-body Systems by Polynomial Expansion on Spectral Density
</FONT>
<br>
J. Phys. Soc. Jpn. <b>81</b> (2012) 024710.
<A Href="http://jpsj.ipap.jp/link?JPSJ/81/024710/">[link]</A>
<br>
<A HREF="http://arxiv.org/abs/1105.4939">arXiv:1105.4939</A><br><br></TD>
</TR>

<TR>
<TD ALIGN="left">15 </TD>
<TD ALIGN="left">
<FONT COLOR=#FF0000>Y. Nagai</FONT>, N. Nakai, and M. Machida<br>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Direct Numerical Demonstration of Sign-preserving Quasiparticle Interference via Impurity inside Vortex Core in Unconventional Superconductors
</FONT>
<br>
Phys. Rev. B <b>85</b> (2012) 092505.
<A Href="http://link.aps.org/doi/10.1103/PhysRevB.85.092505">[link]</A>
<br>
<A HREF="http://arxiv.org/abs/1103.5842">arXiv:1103.5842</A><br><br></TD>
</TR>

<TR>
<TD ALIGN="left">14. </TD>
<TD ALIGN="left">
<FONT COLOR=#FF0000>Y. Nagai</FONT>, and K. Kuroki<br>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Determination of the pairing state in iron-based superconductors through neutron scattering
</FONT>
<br>
Phys. Rev. B <b>83</b> (2011) 220516(R). 
<A Href="http://link.aps.org/doi/10.1103/PhysRevB.83.220516">[link]</A>
<br>
<A HREF="http://arxiv.org/abs/1103.0586">arXiv:1103.0586</A><br><br></TD>
</TR>

<TR>
<TD ALIGN="left">13. </TD>
<TD ALIGN="left">
<FONT COLOR=#FF0000>Y. Nagai</FONT>, H. Nakamura, and M. Machida<br>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Superconducting Gap Function in an Organic Superconductor (TMTSF)2ClO4 with Anion Ordering; First-principles Calculations and Quasi-classical Analyses for Angle-resolved Heat Capacity</FONT>
<br>
Phys. Rev. B <b>83</b> (2011) 104523.
<A Href="http://link.aps.org/doi/10.1103/PhysRevB.83.104523">[link]</A>
<br>
<A HREF="http://arxiv.org/abs/1101.2277">arXiv:1101.2277</A><br><br></TD>
</TR>


<TR>
<TD ALIGN="left">12. </TD>
<TD ALIGN="left">
M. Ishikado, <FONT COLOR=#FF0000>Y. Nagai</FONT>, K. Kodama, R. Kajimoto, M. Nakamura, Y. Inamura, S. Wakimoto, H. Nakamura, 
M. Machida, K. Suzuki, H. Usui, K. Kuroki, A. Iyo, H. Eisaki, M. Arai, S. Shamoto<br>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
s±-like spin resonance in the iron-based nodal superconductor BaFe2(As0.65P0.35)2 observed using inelastic neutron scattering</FONT>
<br>
Phys. Rev. B <b>84</b> (2011) 144517. 
<A Href="http://link.aps.org/doi/10.1103/PhysRevB.84.144517">[link]</A>
<br><A HREF="http://arxiv.org/abs/1011.3191">arXiv:1011.3191</A><br><br></TD>
</TR>


<TR>
<TD ALIGN="left">11. </TD>
<TD ALIGN="left">
Y. Imai, H. Takahashi, K. Kitagawa, K. Matsubayashi, N. Nakai, 
<FONT COLOR=#FF0000>Y. Nagai</FONT>, Y. Uwatoko, M. Machida, A. Maeda<br>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Microwave Surface Impedance Measurements of LiFeAs Single Crystals</FONT>
<br>
J. Phys. Soc. Jpn. <b>80</b> (2011) 013704.
<A Href="http://jpsj.ipap.jp/link?JPSJ/80/013704/">[link]</A>
<br><A HREF="http://arxiv.org/abs/1009.4628">arXiv:1009.4628</A><br><br></TD>
</TR>


<TR>
<TD ALIGN="left">10. </TD>
<TD ALIGN="left">
M. Kunimi, <FONT COLOR=#FF0000>Y. Nagai</FONT>
, and Y. kato
<BR>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Josephson effects in one-dimensional supersolids</FONT>
<br>
Phys. Rev. B <b>84</b> (2011) 094521.
<A Href="http://link.aps.org/doi/10.1103/PhysRevB.84.094521">[link]</A>
<br><A HREF="http://arxiv.org/abs/1005.3936">arXiv:1005.3936</A><br><br></TD>
</TR>

<TR>
<TD ALIGN="left">9. </TD>
<TD ALIGN="left">
N. Nakai, H. Nakamura, Y. Ota, <FONT COLOR=#FF0000>Y. Nagai</FONT>
, N. Hayashi and M. Machida
<BR>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
First-principles-based pm s-wave modelling for iron-based
 superconductors:Studies for specific heat and nuclear magnetic relaxation rate</FONT>
<br>
Phys. Rev. B <b>82</b> (2010) 094501.
<A Href="http://link.aps.org/doi/10.1103/PhysRevB.82.094501">[link]</A>
<br>
<A HREF="http://arxiv.org/abs/0909.1195">arXiv:0909.1195</A><br><br></TD>
</TR>


<TR>
<TD ALIGN="left">8. </TD>
<TD ALIGN="left"><FONT COLOR=#FF0000>Y. Nagai</FONT> and Y. Kato
<BR>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Impurity scattering rate and coherence factor in vortex core of sign-reversing s-wave superconductors</FONT><br>
Phys. Rev. B <b>82</b> (2010) 174507.
<A Href="http://link.aps.org/doi/10.1103/PhysRevB.82.174507">[link]</A>
<br><A HREF="http://arxiv.org/abs/0908.4451">arXiv:0908.4451</A><br><br></TD>
</TR>

<TR>
<TD ALIGN="left">7. </TD>
<TD ALIGN="left">S. Nakakura, <FONT COLOR=#FF0000>Y. Nagai</FONT> and D. Yoshioka
<BR>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
 Uniform current in graphene strip with zigzag edges</FONT><BR>
J. Phys. Soc. Jpn. <b>78</b> (2009) 065003.
<A Href="http://jpsj.ipap.jp/link?JPSJ/78/065003/">[link]</A>
<br><A HREF="http://arxiv.org/abs/0903.1483">arXiv:0903.1483</A><br><br></TD>
</TR>


<TR>
<TD ALIGN="left">6. </TD>
<TD ALIGN="left"><FONT COLOR=#FF0000>Y. Nagai</FONT> and N. Hayashi
<BR>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Surface Bound States in n-band Systems with Quasiclassical Approach</FONT><BR>
Phys. Rev. B <b>79</b> (2009) 224508.
<A Href="http://link.aps.org/doi/10.1103/PhysRevB.79.224508">[link]</A>
<br>
<A HREF="http://arxiv.org/abs/0903.1227">arXiv:0903.1227</A><br><br></TD>
</TR>


<TR>
<TD ALIGN="left">5. </TD>
<TD ALIGN="left"><FONT COLOR=#FF0000>Y. Nagai</FONT>, N. Hayashi, N. Nakai, H. Nakamura, M. Okumura and  M.  Machida
<BR>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Nuclear magnetic relaxation and superfluid density in Fe-pnictide superconductors: An anisotropic \pm s-wave scenario</FONT><BR>
New J. Phys. <b>10</b> (2008) 103026.
<A Href="http://www.iop.org/EJ/abstract/1367-2630/10/10/103026">[link]</A>
<br>
<A HREF="http://jp.arxiv.org/abs/0809.1197">arXiv:0809.1197</A><br><br></TD>
</TR>


<TR>
<TD ALIGN="left">4. </TD>
<TD ALIGN="left"><FONT COLOR=#FF0000>Y. Nagai</FONT> and N. Hayashi<BR>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Kramer-Pesch approximation for analyzing field-angle-resolved
   measurements made in unconventional superconductors: A calculation of
   the zero-energy density of states
</FONT><BR>
Phys. Rev. Lett. <b>101</b> (2008) 097001.
<A Href="http://link.aps.org/abstract/PRL/v101/e097001">[link]</A>
<br>
<A HREF="http://jp.arxiv.org/abs/0802.1579">arXiv:0802.1579</A><br><br></TD>
</TR>

<TR>
<TD ALIGN="left">3. </TD>
<TD ALIGN="left"><FONT COLOR=#FF0000>Y. Nagai</FONT>, Y. Kato, N. Hayashi, K. Yamauchi and H. Harima <BR>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Calculated Positions of Point Nodes in the Gap Structure of the Borocarbide Superconductor YNi2B2C
</FONT><BR>
Phys. Rev. B <b>76</b>, (2007) 214514.
<A Href="http://link.aps.org/abstract/PRB/v76/e214514">[link]</A><br>
<A HREF="http://jp.arxiv.org/abs/0706.1863">arXiv:0706.1863</A><br><br></TD>
</TR>

<TR>
<TD ALIGN="left">2. </TD>
<TD ALIGN="left"><FONT COLOR=#FF0000>Y. Nagai</FONT>, Y. Ueno, Y. Kato and N. Hayashi <BR>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Analytical Formulation of the Local Density of States around a Vortex Core in Unconventional Superconductors</FONT><BR>
J. Phys. Soc. Jpn. <b>75</b> (2006) 104701.<A Href="http://jpsj.ipap.jp/link?JPSJ/75/104701">[link]</A><br>
<A HREF="http://jp.arxiv.org/abs/cond-mat/0605441">cond-mat/0605441</A><br><br></TD>
</TR>


<TR>
<TD ALIGN="left">1. </TD>
<TD ALIGN="left"><FONT COLOR=#FF0000>Y. Nagai</FONT>, Y. Kato and N. Hayashi <BR>
</TD>
</TR>

<TR>
<TD ALIGN="center"></TD><TD ALIGN="left"><FONT COLOR=#0000FF>
Analytical Result on Electronic States around a Vortex Core in a Noncentrosymmetric Superconductor</FONT><BR>
J. Phys. Soc. Jpn. <STRONG>75</STRONG> (2006) 043706 <A HREF="http://jpsj.ipap.jp/link?JPSJ/75/043706">[link]</A><BR>
<A HREF="http://jp.arxiv.org/abs/cond-mat/0602254">cond-mat/0602254</A><br><br></TD>
</TR>



</TABLE>
<br>



<HR ALIGN="center" WIDTH=100% SIZE=2>
<HR ALIGN="center" WIDTH=100% SIZE=2>
このページはリンクフリーです。
<HR ALIGN="center" WIDTH=100% SIZE=2>
<A HREF="../index.htm">研究室のtopへ</A>

