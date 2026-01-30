local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    -- "main" function + source 'main' in Python
    s("main", {
        t({
            "def main():",
            "    print(\"Hello World\")",
        }),
        -- drop the cursor in here ( unfortunately still in INSERT Mode )
        i(1),
        t({
            "",
            "",
            "if __name__ == '__main__':",
            "    main()"
        })
    })
}
