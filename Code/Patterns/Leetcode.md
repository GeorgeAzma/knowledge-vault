### Tips
- **all ways / all subsets** use backtracking
- **min/max ways to reach a value using choices** Dynamic Programming
- **tree/graph traversal** DFS
- **split array/interval** divide & conquer
- **reuse elements allowed** combination sum pattern
- **ordering matters** permutations
### Range
``` python
# finding subarray in a sorted array satisfying some condition
def two_pointers():
    l, r = 0, len(arr) - 1
    
    while l < r:
        if condition:
            l += 1
        else:
            r -= 1

# for finding longest subsequence satisfying condition
# e.g. longest substring without repeating characters
def sliding_window(arr):
    l = best = 0

    for r in range(len(arr)):
        add(arr[r])

        while is_invalid():
            remove(arr[l])
            l += 1

        best = max(best, r - l + 1)

    return best

# turns O(n) sums into O(1)
def prefix_sum():
    pref = [0]
    
    for x in arr:
        pref.append(pref[-1] + x)
    
    # sum from l to r
    s = pref[r + 1] - pref[l]

def hashmap_count():
    count = {}
    for x in arr:
        count[x] = count.get(x, 0) + 1

# next greater/lesser
def monotonic_stack():
    stack = []
    
    for x in arr:
        while stack and stack[-1] < x:
            stack.pop()
    
        stack.append(x)
```
### Dynamic Programming
caches optimal answers to smaller subproblems, used for the recursively bigger and bigger problems
``` python
def dp():
    dp = [float('inf')] * (target + 1)
    dp[base] = 0  # or 1 depending on problem
    for i in range(base+1, target+1):
        for option in options:
            if valid(i, option):
                dp[i] = min(dp[i], dp[transition(i, option)])
# memoization
memo = {}
def dp(state):
    if state in memo:
        return memo[state]

    memo[state] = result
    return memo[state]

# dp: minimum steps to reach n, using operations: [- 1, / 2, / 3]
def min_steps(n):
    dp = [float('inf')] * (n + 1)
    dp[1] = 0

    for i in range(2, n + 1):
        # subtract 1
        dp[i] = min(dp[i], dp[i - 1] + 1)

        # divide by 2 (if divisible)
        if i % 2 == 0:
            dp[i] = min(dp[i], dp[i // 2] + 1)

        # divide by 3 (if divisible)
        if i % 3 == 0:
            dp[i] = min(dp[i], dp[i // 3] + 1)

    return dp[n]
```
### Recursive
##### DFS
``` python
def dfs(path):
    if done: # len(path) == n
        ans.append(path.copy())
        return

    # 1. finding valid paths with backtracking
    for choice in choices:
        # if not valid(choice, path):
        #    continue
        path.append(choice)
        dfs(path)
        path.pop()

    # 2. exclude/include in path
    dfs(i + 1, path) # exclude
    path.append(nums[i])
    dfs(i + 1, path) # include
    path.pop()

    # 3. combination
    for i in range(start, len(nums)):
        path.append(nums[i])
        dfs(i + 1, path)
        path.pop()
        
    # 4. permutation
    for i in range(n):
        if used[i]:
            continue

        used[i] = True
        path.append(nums[i])
        dfs(path, used)
        path.pop()
        used[i] = False
    
def dfs(node):
    if not node:
        return

    visit(node)

    for nei in node.neighbors:
        if nei not visited:
            dfs(nei)

# binary tree
def dfs(root):
    if not root:
        return

    dfs(root.left)
    dfs(root.right)

# combination, reuse allowed
def dfs(start, path, total):
    if total == target:
        res.append(path[:])
        return
    if total > target:
        return

    for i in range(start, len(nums)):
        path.append(nums[i])
        dfs(i, path, total + nums[i])  # note: i (reuse allowed)
        path.pop()

# visit nodes (cycle safe)
def dfs(node):
    if node in visiting:
        return False  # cycle
    if node in visited:
        return True

    visiting.add(node)

    for nei in graph[node]:
        if not dfs(nei):
            return False

    visiting.remove(node)
    visited.add(node)
    return True
```
##### BFS
``` python
def bfs(start):
    queue = [start]
    visited = {start}
    i = 0

    while i < len(queue):
        curr = queue[i]
        i += 1

        if curr == target:
            return True

        for nxt in get_neighbors(curr):
            if nxt not in visited:
                visited.add(nxt)
                queue.append(nxt)
```
##### Other
``` python
def solve(l, r):
    if l == r:
        return base_case

    mid = (l + r) // 2
    left = solve(l, mid)
    right = solve(mid + 1, r)

    return combine(left, right)
```
