Used for simplifying [[Boolean Algebra]]
> [!bug] Wrong
```C++
struct Term
{
    uint32_t minterm = 0;
    uint32_t diff = 0;
    bool operator==(const Term& other) const { return minterm == other.minterm && diff == other.diff; }
};

std::vector<Term> simplify(size_t inputs, std::vector<uint32_t> minterms)
{
    std::sort(minterms.begin(), minterms.end());
    std::vector<std::vector<Term>> groups(inputs + 1);

    for (const auto& m : minterms)
        groups[std::popcount(m)].emplace_back(m, 0);

    for (int i = 0; i < groups.size(); ++i)
    {
        if (groups[i].empty())
        {
            groups.erase(groups.begin() + i);
            --i;
        }
    }

    std::vector<Term> s;
    while (true)
    {
        std::vector<std::vector<Term>> new_groups(groups.size() - 1);
        size_t index = 0;
        std::vector<bool> prev_used(groups[0].size());
        for (size_t i = 0; i < groups.size() - 1; ++i)
        {
            const auto& group = groups[i];
            const auto& next_group = groups[i + 1];
            std::vector<bool> used(group.size());
            std::vector<bool> next_used(next_group.size());
            bool different = false;
            for (size_t j = 0; j < group.size(); ++j)
                for (size_t k = 0; k < next_group.size(); ++k)
                {
                    uint32_t diff = group[j].minterm ^ next_group[k].minterm;
                    if (std::popcount(diff) == 1 && group[j].diff == next_group[k].diff)
                    {
                        different = true;
                        used[j] = true;
                        next_used[k] = true;
                        Term t = { group[j].minterm, diff | group[j].diff | next_group[k].diff };
                        bool exists = false;
                        for (const auto& ng : new_groups[index])
                        {
                            if (ng == t)
                            {
                                exists = true;
                                break;
                            }
                        }
                        if (!exists)
                            new_groups[index].emplace_back(std::move(t));
                    }
                }

            for (size_t i = 0; i < group.size(); ++i)
                if (!prev_used[i] && !used[i])
                    s.emplace_back(group[i].minterm, group[i].diff);
            prev_used = next_used;

            if (!different)
                new_groups.pop_back();
            else
                ++index;
        }

        for (size_t i = 0; i < prev_used.size(); ++i)
            if (!prev_used[i])
                s.emplace_back(groups.back()[i].minterm, groups.back()[i].diff);

        if (new_groups.empty())
            return s;

        groups = std::move(new_groups);
    }

    return s;
}
```
- Note: You can also simplify Booleans by hand using Karnaugh map
