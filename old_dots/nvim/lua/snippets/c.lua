local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    -- "main" function
    s("mymain", {
        t({
            "#include <stdio.h>",
            "",
            "int main() {",
            "    printf(\"\\nHello World\\n\");",
        }),
        i(0),
        t({
            "",
            "",
            "    return 0;",
            "}",
        }),
    }),
}
