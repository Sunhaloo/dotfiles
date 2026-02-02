local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- the "code" in the return statement are some of custom Luasnip ( snippets ) that I wrote
return {
    -- snippet to link markdown files in Obsidian
    s("Olink", {
        t({
            "[["
        }),
        i(1),
        t({
            "]]"
        })
    }),
    -- snippet to create task
    -- NOTE: 'friendly-snippets' already has a "task" thingy but I hate where it places the cursor
    s("mytask", {
        t({
            "- [ ] "
        }),
        i(1)
    })
}
