-- import the LuaSnip
local ls = require("luasnip")
-- variable what will take user input / be our trigger
local s = ls.snippet
-- variable that will allow us to write static text
local t = ls.text_node
-- variable that will allow us to drop our cursor at a specific position ( could be in NORMAL / INSERT Mode )
local i = ls.insert_node


return {
    -- "luasnip" snippet for writing snippets ( nice )
    s("luasnip", {
        t({
            "local ls = require(\"luasnip\")",
            "local s = ls.snippet",
            "local t = ls.text_node",
            "local i = ls.insert_node",
            "",
            "return {",
            "    s(\"",
        }),
        i(1, ""), -- Insert node for user input
        t({
            "\", {",
            "        t({",
            "",
            "        })",
            "    })",
            "}",
        }),
    })
}
