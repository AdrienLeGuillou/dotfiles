local ls = require("luasnip")

-- ls.parser.parse_snippet(<test>, <VS**** style snippet>)
ls.snippets = {
  all = {
    -- available in any filetype
    ls.parser.parse_snippet("expand", "-- this is what was expanded")
  },
  lua = {
    -- lua specific
    ls.parser.parse_snippet("lf", "local $1 function = ($2)\n $0\nend")
  }
}
