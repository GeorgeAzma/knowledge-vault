### Formulas
-  $\large\int\sqrt{a^2-x^2}$
    - $x=a\sin\theta\implies dx=a\cos\theta\ d\theta$ where $\theta\in[-{\large\frac{\pi}{2}},{\large\frac{\pi}{2}}]$ `invertible range`
    - $\sqrt{a^2-x^2}=\sqrt{a^2-a^2\sin^2\theta}=\sqrt{a^2(1-\sin^2\theta)}=\sqrt{a^2\cos^2\theta}=a\cos\theta$ 
     `cos(θ) is always positive in θ's range`
    - $\int a\cos\theta\cdot a\cos\theta\ d\theta=a^2\int\cos^2\theta\ d\theta$
    - $=a^2\int{\large\frac{1+\cos2\theta}{2}}\ d\theta={\large\frac{a^2}{2}}\int(1+\cos2\theta)\ d\theta$ `substitute trig identity`
    - $\large=\frac{a^2}{2}(\theta+\frac{\sin2\theta}{2})+C=\frac{a^2}{2}\theta +\frac{a^2}{4}\sin2\theta+C$
    - back-substitute $\large x=a\sin\theta\implies\theta=\arcsin\frac{x}{a}$ and $\sin\theta=\frac{x}{a},\ \cos\theta=1-(\frac{x}{a})^2$
    - and $\large\sin2\theta=2\sin\theta\cos\theta=2\cdot\frac{x}{a}\cdot\frac{\sqrt{a^2-x^2}}{a}=2x\frac{\sqrt{a^2-x^2}}{a^2}$
    - plug those in $\large\frac{a^2}{2}\arcsin\frac{x}{a}+\frac{a^2}{4}(2x\frac{\sqrt{a^2-x^2}}{a^2})+C=\frac{a^2\arcsin\frac{x}{a}+x\sqrt{a^2-x^2}}{2}+C$
- $\large\int\sqrt{a^2+x^2}$
    - $x=a\tan\theta$
    - $\sqrt{a^2+\tan^2\theta}=a|\sec\theta|\implies a\int|\sec\theta|\ d\theta$