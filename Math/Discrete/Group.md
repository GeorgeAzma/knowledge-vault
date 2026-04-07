### Group Properties
- [[Closure]]
- [[Associativity]]
- [[Identity Element]]
- [[Inverse Element]]
### Group Examples
- $\mathbb{Z}$ `unit = 0, inverse = -a`
- $\mathbb{Q^\times}$ `unit = 1, inverse = 1/a`
- $\mathbb{C}^\wedge$ `unit = 1, inverse = -1`
- $\mathbb{Q}^+$ `unit = 0, inverse = -a`
- $(G,+)$ `any additive group`
### [[Subgroup]]
### Groups

``` mermaid
graph TD

M("**Magma**<br/>• binary op a ∘ b<br/>• closure")

S("**Semigroup**<br/>• associativity<br/>(a ∘ b) ∘ c = a ∘ (b ∘ c)")

MO("**Monoid**<br/>• ∃ identity e<br/>a ∘ e = e ∘ a = a")

CM("**Commutative Monoid**<br/>• commutativity<br/>a ∘ b = b ∘ a")

G("**Group**<br/>• ∃ inverse a⁻¹<br/>a ∘ a⁻¹ = e")

AG("**Abelian Group**<br/>• commutativity<br/>a ∘ b = b ∘ a")

R("**Ring**<br/>• addition → abelian group<br/>• multiplication → monoid<br/>• distributivity<br/>a⋅(b+c) = a⋅b + a⋅c")

F("**Field**<br/>• division")

M --> S
S --> MO
MO --> CM
MO --> G
G --> AG

R --> F
```

- [[Commutativity]]
