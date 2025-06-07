Shells have energy levels and contain [[Subshell]][[s]] $SubshellCount=EnergyLevel^2$
$(s,p,d,f)$ are [[Subshell]][[s]] each of them have different orientations $(1,3,5,7)$
and each orientation can hold 2 [[Electron]][[s]] because of [[Pauli Exclusion Principle]]

| Energy Level |  s  |  p  |  d  |  f  | Shell [[Electron]] Capacity |
| :----------: | :-: | :-: | :-: | :-: | :-------------------------: |
|      1       |  ✓  |  ✕  |  ✕  |  ✕  |           $1*2=2$           |
|      2       |  ✓  |  ✓  |  ✕  |  ✕  |          $2+2*3=8$          |
|      3       |  ✓  |  ✓  |  ✓  |  ✕  |         $8+2*5=18$          |
|      4       |  ✓  |  ✓  |  ✓  |  ✓  |         $18+2*7=32$         |
```Python
# Subshell electron max capacity
for shell in shells:
	for subshell in shell.subshells:
		subshell.capacity = 2 * subshell.orientations
		shell.capacity += subshell.capacity
```

