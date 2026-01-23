- my settings
``` python
import signal
signal.signal(signal.SIGINT, signal.SIG_DFL)
plt.style.use('dark_background')
plt.rcParams['toolbar'] = 'None'

fig.tight_layout()
# disable window frame/decoration
fig.canvas.manager.window.overrideredirect(1)
```
- remove windowing backend `if only exporting pngs`
``` python
matplotlib.use('Agg')
```
