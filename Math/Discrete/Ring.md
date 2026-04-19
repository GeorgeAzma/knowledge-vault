- **3 Binary Operations** $+-*$ (if you also have division then it's a [[Field]])
- [[Group|Additive Abelian Group]] meaning $+-$ has:
    - [[Closure]]
    - [[Associativity]] `a+(b+c) = (a+b)+c`
    - [[Identity Element]] `0`
    - [[Inverse Element]] `-x`
    - [[Commutativity]] `a+b = b+a`
- [[Group|Multiplicative Monoid]] `might not be commutative` meaning $*$ has:
    - [[Closure]]
    - [[Associativity]] `a(bc) = (ab)c`
    - [[Identity Element]] `1`
- [[Distributivity]] `a(b+c) = ab+ac`
#### Polynomial Vanishing $\prod^n_{k=1}(x-a_k)$
this polynomial vanishes `(=0)` at all elements of ring 
> [!example]  $\mod 3$ `ints` $\mathbb{Z}_3=\set{0,1,2}$
> $f(x)=(x-0)(x-1)(x-2)=x(x-1)(x-2)=x^3-3x^2+2x=x^3+2x$ `mod 3`
> $f(0)=0^3+2*0=0$
> $f(1)=1^3+2*1=3\mod3=0$
> $f(2)=2^3+2*2=8+4=12=0$
