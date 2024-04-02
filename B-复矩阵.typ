#import "lib/sci-book.typ": *
#show: doc => conf(
  title: "附录B：复矩阵",
  header: "现代控制理论",
  author: ("ivaquero"),
  header-cap: "github@ivaquero",
  outline-on: false,
  doc,
)
#show: thmrules

= 复数
<复数>

== 基本运算
<基本运算>

#definition[
  复数是一个有序对$(a, b)$，其中，$a, b ∈ R$，通常写作$a + b i$。复数集记作$ℂ$，实数集$ℝ$可看作是其子集。
]

令横轴为实部，纵轴为虚部，复数$z = a + b i$可表示为向量

$ arrow(z) = (a, b) $

#tip[
  符号$i$最早由瑞士数学家欧拉（Leonhard Euler）在 1777 年用于表示$sqrt(-1)$。
]

#definition[
  令$z_1 = a_1 + b_1 i$，$z_2 = a_2 + b_2 i$，且$a_1, a_2, b_1, b_2 ∈ ℝ$，则有

  - 复数的加法
  $ z_1 + z_2 = (a_1 + a_2) + (b_1 + b_2) i $

  - 复数的乘法
  $ z_1⋅z_2 = (a_1 a_2 - b_1 b_2) + (a_2 b_1 + a_1 b_2) i $

  - 复数的减法
  $ z_1 - z_2 = z_1 + (- z_2) $

  - 复数的除法
  $ z_2 \ z_1 = z_2(1 \ z_1), ∀z_1 ≠ 0 $
]

#tip[
  运算律同实矩阵。
]

由于$ℂ$和$ℝ$是数学上属于域（field）的实例，故也被统一记为$𝔽$，$𝔽$的元素被称为标量（scalar），用以指代非向量形式的数。

对于标量$α ∈ 𝔽$和$m > 0$，可定义

$ α^m = underbrace(α ⋯ α, "m times") $

== Euler 公式
<Euler-公式>

设

$ f(θ) = frac(e^(i θ), cos θ + i sin θ) $

求导，得$f^′(θ) = 0$，故$f(θ)$为常数，从而有

$ f(θ) = f(0) = 1 $

整理得

$ e^(i θ) = cos θ + i sin θ $

== 极坐标形式
<极坐标形式>

由 Euler 公式，得

$ "Re"^(i θ) = r cos θ + r i sin θ $

令横轴为实部，纵轴为虚部，则$r cos θ$和$i sin θ$分别为横轴和纵轴坐标，故

$ z = "Re"^(i θ) $

其中，$r = sqrt(𝑨^2 + b^2)$，$θ = arctan b/a$

#theorem("Euler 恒等式")[
  当$r = 1, θ = π$，得
  $ z = e^(i π) = -1 $

  即
  $ e^(i π) + 1 = 0 $
]

由上，复数的积可表示为

$ z_1 z_2 = r_1 r_2 e^(i(θ_1 + θ_2)) $

即，积向量的长度为$r_1 r_2$，夹角为$θ_1 + θ_2$。

== 共轭
<共轭>

#definition[
  对两个复数$z_1$和$z_2$，若其实部相等，虚部互为相反数，则称其共轭，表示为
  $ z_2 = macron(z)_1 Im(z)$

  共轭复数具有如下性质
  - 模相等，$|z_1| = |z_2|$
  - 夹角相反，$θ_1 = -θ_2$
]

= 复向量
<复向量>

对复向量

$ z = mat(delim: "[", z_1; z_2; ⋮; z_n) $

向量的每个分量均是复数。此时$z ∉ ℝ^n$，它现在处于$ℂ^n$复向量空间。

通常情况，计算模只需要计算$|v| = sqrt(v^(⊤) v)$即可，而若对复向量使用$z^(⊤) z$则有

$ z^(⊤) z =
mat(delim: "[", z_1, z_2, ⋯, z_n)
mat(delim: "[", z_1; z_2; ⋮; z_n) = ∑ z_i^2 $

这里$z_i$是复数，平方后虚部为负，求模时本应相加的运算变成了减法。

#tip[
  如向量$mat(delim: "[", 1, i)$，右乘其转置后结果为$0$，但此向量的长度显然不是零。
]

应使用$|z| = sqrt(macron(z)^(⊤) z)$，即

$ mat(delim: "[", macron(z)_1, macron(z)_2, ⋯, macron(z)_n)
mat(delim: "[", z_1; z_2; ⋮; z_n) $

即使用向量共轭的转置乘以原向量即可。

#tip[
  如向量$mat(delim: "[", 1, i)$，右乘其共轭转置后结果为$mat(delim: "[", 1, - i) mat(delim: "[", 1; i) = 2$。
]

通常，把共轭转置乘以原向量记为$z^H z$，$H$读作 Hermitian。

有了复向量模的计算公式，同理可得，对于复向量，内积不再是实向量的$y^(⊤) x$形式，复向量内积应为$y^H x$。

== 复向量的性质
<复向量的性质>

对于实矩阵，$𝑨^(⊤) = 𝑨$即可表达矩阵的对称性。而对于复矩阵，还需要求一次共轭$macron(𝑨) = 𝑨$。

如$mat(delim: "[", 2, 3 + i; 3 - i, 5)$是一个复数情况下的对称阵。这称为
Hermite 矩阵，有性质$𝑨^H = 𝑨$。

此前，我们定义标准正交向量：$q_i^(⊤) q_j = cases(delim: "{", 0 i ≠ j, 1 & i = j)$。现在，对于复向量我们需要求共轭：

$ macron(q)_i^(⊤) q_j = q_i^H q_j = cases(delim: "{", 0 & i ≠ j, 1 & i = j) $

此前，我们定义标准正交阵：$𝑸 =[q_1 med q_2 med ⋯ med q_n]$有$𝑸^(⊤) 𝑸 = 𝑰$。现在对于复矩阵则有

$ 𝑸^H 𝑸 = i $

正交性（orthogonal）在复数情况下也有了新名字，酉（unitary），酉阵（unitary
matrix）与正交阵类似，满足$𝑸^H 𝑸 = 𝑰$的性质。

== 复数共轭
<复数共轭>

#definition[
  设$z = a + b i$，其中，$a$和$b$是实数。
  - $z$的实部，表示为$"Re" z$，由$"Re" z = a$定义。
  - $z$的虚部，表示为$"Im" z$，由$"Im" z = b$定义。
]

#definition[
  设$z ∈ C$
  - $z ∈ C$中的复共轭，表示$z ̄$定义为
  $ macron(z) = "Re" z - ("Im" z) i $

  - 复数$z$的绝对值表示为$|z|$，定义为
  $|z| = sqrt(("Re" z))^2 + ("Im" z)^2 $
]

设$w, z in C$，则

- $z$和$macron(z)$之和：$z + macron(z) = 2 "Re" z$
- $z$和$macron(z)$之差：$macron(z) macron(z) = 2 ("Im" z) i$
- $z$和$macron(z)$之积：$z macron(z) = |z|^2$
- 复共轭可加性：$macron(w + z) = macron(w) + macron(z)$
- 复共轭可乘性：$macron(w z) = macron(w) macron(z)$
- 共轭的共轭：$macron(macron(z)) = z$
- 复共轭的绝对值：$|macron(z)| = |z|$
- 绝对值的倍增性：$|w z| = |w||z|$
- 三角形不平等：$|w + z| ≤ |w| +|z|$
- 实部和虚部的边界为$|z|$

$|"Re" z| ≤ |z|\
|"Im" z| ≤ |z| $

= 复矩阵
<复矩阵>

== Fourier 矩阵
<fourier-矩阵>

$n$阶 Fourier 矩阵

$ 𝑭_n = mat(delim: "[",
1, 1, 1, ⋯, 1;
1, w, w^2, ⋯, w^(n - 1);
1, w^2, w^4, ⋯, w^(2(n - 1)));
⋮, ⋮, ⋮, ⋱, ⋮;
1, w^(n - 1), w^(2(n - 1)), ⋯, w^((n - 1))^2 $

对于每个元素有$𝑭_n_(i j) = w^(i j) i, j = 0, 1, 2, ⋯, n - 1$。矩阵中的$w$是一个非常特殊的值，满足$w^n = 1$，其公式为$w = e^(i 2π \ n)$。易知$w$在复平面的单位圆上，$w = cos frac(2π, n) + i sin frac(2π, n)$。

在 Fourier 矩阵中，当计算$w$的幂时，$w$在单位圆上的角度翻倍。如在$6$阶情形下，$w = e^(2π \ 6)$，即位于单位圆上$60^compose$角处，其平方位于单位圆上$120^compose$角处，而$w^6$位于$1$处。从开方的角度看，它们是$1$的$6$个六次方根，而一次的$w$称为原根。

现在来看$4$阶 Fourier 矩阵，先计算$w$有$w = i, w^2 = -1, w^3 = -i, w^4 = 1$，

$ 𝑭_4 =
mat(delim: "[",
  1, 1, 1, 1;
  1, i, i^2, i^3;
  1, i^2, i^4, i^6;
  1, i^3, i^6, i^9) =
mat(delim: "[",
  1, 1, 1, 1;
  1, i, -1, - i;
  1, -1, 1, -1;
  1, - i, -1, i) $

矩阵的四个列向量正交，验证一下第二列和第四列，$c macron(z)_x^(⊤) c_4 = 1 - 0 + 1 - 0 = 0$，正交。不过我们应该注意到，$𝑭_4$的列向量并不是标准的，我们可以给矩阵乘上系数$1/2$（除以列向量的长度）得到标准正交阵

$ 𝑭_4 = 1/2
mat(delim: "[",
1, 1, 1, 1;
1, i, -1, - i;
1, -1, 1, -1;
1, - i, -1, i) $

此时有$𝑭_4^H 𝑭_4 = 𝑰$，于是该矩阵的逆阵也就是其共轭转置$𝑭_4^H$。

== 快速 Fourier 变换
<快速-fourier-变换>

对于 Fourier 矩阵，$𝑭_6, 𝑭_3$、$𝑭_8, 𝑭_4$、$𝑭_64, 𝑭_32$之间有着特殊的关系。

有 Fourier 矩阵$𝑭_64$，一般情况下，用一个列向量右乘$𝑭_64$需要约$64^2$次计算，显然这个计算量是比较大的。我们想要减少计算量，于是想要分解$𝑭_64$，联系到$𝑭_32$，有

$𝑭_64 = mat(delim: "[", 𝑰, 𝑫; 𝑰, - 𝑫)
mat(delim: "[", 𝑭_32, 0; 0, 𝑭_32)
mat(delim: "[",
1, med, ⋯, med, med, 0, med, ⋯, med, med;
0, med, ⋯, med, med, 1, med, ⋯, med, med;
med, 1, ⋯, med, med, med, 0, ⋯, med, med;
med, 0, ⋯, med, med, med, 1, ⋯, med, med;
med, med, med, ⋱, med, med, med, , ⋱, med, med;
med, med, med, ⋱, med, med, med, , ⋱, med, med;
med, med, med, ⋯, 1, med, med, med, ⋯, 0;
med, med, med, ⋯, 0, med, med, med, ⋯, 1) $

我们分开来看等式右侧的这三个矩阵：

- 第一个矩阵由单位矩阵$𝑰$和对角阵

$ 𝑫 = mat(delim: "[",
1, med, med, med, med;
med, w, med, med, med;
med, med, w^2, med, med;
med, med, med, ⋱, med;
med, med, med, med, w^31) $

组成，这个矩阵被称为修正矩阵，显然其计算量来自$𝑫$矩阵，对角阵的计算量约为 32 即这个修正矩阵的计算量约为 32，单位矩阵的计算量忽略不计。

- 第二个矩阵是两个$𝑭_32$与零矩阵组成的，计算量约为$2 × 32^2$。
- 第三个矩阵通常记为$𝑷$矩阵，这是一个置换矩阵，其作用是讲前一个矩阵中的奇数列提到偶数列之前，将前一个矩阵从$[x_0 med x_1 med ⋯]$变为$[x_0 med x_2 med ⋯ med x_1 med x_3 med ⋯]$，这个置换矩阵的计算量也可以忽略不计。

故我们把$64^2$复杂度的计算化简为$2 × 32^2 + 32$复杂度的计算，可以进一步化简$𝑭_32$得到与$𝑭_16$有关的式子

$ mat(delim: "[", 𝑰_32, 𝑫_32; 𝑰_32, - 𝑫_32)
mat(delim: "[", 𝑰_16, 𝑫_16, med, med;
  𝑰_16, - 𝑫_16, med, med;
  med, med, 𝑰_16, 𝑫_16;
  med, med, 𝑰_16, - 𝑫_16)
  mat(delim: "[",
    𝑭_16, med, med, med;
    med, 𝑭_16, med, med;
    med, med, 𝑭_16, med;
    med, med, med, 𝑭_16)
mat(delim: "[", P_16, med; med, P_16)[P_32] $

而$32^2$的计算量进一步分解为$2 × 16^2 + 16$的计算量，如此递归下去我们最终得到含有一阶 Fourier 矩阵的式子。

化简后计算量，$2(2(2(2(2(2(1))^2 + 1)) + 2)) + 4 + 8 + 16 + 32$，约为$6 × 32 = log_2 64 × 64/2$，算法复杂度为$n/2 log_2 n$。原来需要$n^2$的运算现在只需要$n/2 log_2 n$就可以实现了。
