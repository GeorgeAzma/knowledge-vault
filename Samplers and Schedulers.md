
|        Sampler        |  Speed  | Quality |  Complexity  |              Description              |
| :-------------------: | :-----: | :-----: | :----------: | :-----------------------------------: |
|         Euler         |  Fast   |  Lower  |    Simple    |            Experimentation            |
|    Euler Ancestral    |   Mid   |   Mid   |    Medium    |             Stylized Art              |
|         Heun          |   Mid   |   Mid   |    Medium    |            General-purpose            |
|         DPM2          | Slower  | Higher  |   Complex    |             High-quality              |
|    DPM2 Ancestral     | Slower  | Higher  |   Complex    |         High-quality, diverse         |
|  DPM++ 2S Ancestral   | Slower  | Higher  |   Complex    |         Better DPM2 Ancestral         |
|       DPM++ 2M        | Slowest | Highest | Very Complex |      Exceptional detail/realism       |
|       DPM++ SDE       | Slower  | Higher  |   Complex    |           Smooth/Realistic            |
|   Linear Scheduler    |  Fast   |  Lower  |    Simple    |                 Basic                 |
|   Karras Scheduler    |   Mid   | Higher  |    Medium    |       Optimized / High Quality        |
| Exponential Scheduler |   Mid   |  High   |    Medium    |                Decent                 |
|         DDIM          |  Fast   |  High   |    Medium    | Efficient with [[DDIM\|DDIM Uniform]] |

### Samplers
- **Euler** 1st order, simple, fast, less accurate
- **Euler Ancestral** more creative
- **Euler CFG PP** [[Classifier Free Guidance]] and post processing, less reliance on classifiers
- **Heun** 2nd order, better/slower than euler
- **Heun PP2** improved Heun
- **DPM2** 2nd order DDPM
- **LMS** linear multi-step, uses info from prev steps
- **DPM Fast** faster DPM with same quality
- **DPM Adaptive** dynamic step size based on diffusion state
- **DPM++ 2S Ancestral** 2nd order DPM, fast and good quality
- **DPM++ 2M** 2nd order multi-step sampler, high quality, bit slower
- **DPM++ SDE Variations** stochastic differential equations, faster on GPUI
- [[Denoising Diffusion Probabilistic Models|DDPM]] high quality
- **LCM** reduces steps by ensuring latent space consistency
- **IPNDM** improved pseudo numerical diffusion model, 4th order, good for small resolutions
- **IPNDM Variable Step** flexible resolutions
- **DEIS** diffusion exponential integrator sampler, fast, high quality
- [[DDIM]] efficient [[Denoising Diffusion Probabilistic Models|DDPM]]
- **UniPC** unidirectional predictor, combines prediction/correction steps, fast, high quality
### Schedulers
- **Normal** gaussian distribution noise
- **Simple** linear noise addition
- **Karras**
- **Exponential** exponentialy decayed noise over diffusion steps
- **SGM Uniform** score-based generative model, maintains consistent noise levels across steps
- [[DDIM|DDIM Uniform]] uniform noise for [[DDIM]], consistent noise distribution across steps
- **Beta** parameter controls noise addition each step, beta is usually linear/cosine over steps
### Good Combos
##### Anime
- **dpmpp_2m + sgm_uniform**
- **ipndm_v + sgm_uniform**
- **ipndm + sgm_uniform** sharper, higher contrast
- **lms + sgm_uniform**
- **gradient_estimation + simple** sharp
- **seeds3 + sgm_uniform** best quality, slow
- **heunpp2 + sgm_uniform** good quality, slow
- **heun + sgm_uniform** sharp, good quality, slow
- **er_sde + beta** smooth, good quality