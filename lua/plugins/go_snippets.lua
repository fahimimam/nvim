-- Go snippets
return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        ft = { "go" },
        config = function()
            local ls = require("luasnip")
            local s = ls.snippet
            local t = ls.text_node
            local i = ls.insert_node

            ls.add_snippets("go", {
                s("main", {
                    t({ "package main", "", "import (" }),
                    t({ '\t"fmt"' }),
                    t({ "", ")", "", "func main() {", "\tfmt.Println(" }), i(1, '"Hello World"'), t({ ")", "}" }),
                }),
                s("test", {
                    t({ "func Test" }), i(1, "Name"), t({ "(t *testing.T) {", "\t" }), i(2), t({ "", "}" }),
                }),
                s("bench", {
                    t({ "func Benchmark" }), i(1, "Name"), t({ "(b *testing.B) {", "\tfor i := 0; i < b.N; i++ {", "\t\t" }),
                    i(2),
                    t({ "", "\t}", "}" }),
                }),
                s("errwrap", {
                    t({ "if err != nil {", "\t" }), i(1, "return err"), t({ "", "}" }),
                }),
                s("iface", {
                    t({ "type " }), i(1, "Name"), t({ " interface {", "\t" }), i(2), t({ "", "}" }),
                }),
            })
        end,
    },
}
