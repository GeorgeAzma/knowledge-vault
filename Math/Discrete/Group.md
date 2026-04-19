---
aliases:
- Magma
- Semigroup
- Monoid
- Commutative Monoid
- Abelian Group
---

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
### Group Properties
- [[Closure]]
- [[Associativity]]
- [[Identity Element]]
- [[Inverse Element]]
- + [[Commutativity]] = Abelian Group
### Group Examples
- $\mathbb{Z}^+$ `identity = 0, inverse = -a`
- $\mathbb{Q^\times}$ `identity = 1, inverse = 1/a`
- $\mathbb{C}^\wedge$ `identity = 1, inverse = -1`
- $\mathbb{Q}^+$ `identity = 0, inverse = -a`
- $(G,+)$ `any additive group`
### [[Subgroup]]