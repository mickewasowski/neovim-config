local ls = require("luasnip")
ls.snippets = {
	all = {
		ls.parser.parse_snippet("div", "<div>$0</div>"),
		ls.parser.parse_snippet("span", "<span>$0</span>"),
		ls.parser.parse_snippet("p", "<p>$0</p>"),
		ls.parser.parse_snippet("nav", "<nav>$0</nav>"),
		ls.parser.parse_snippet("li", "<li>$0</li>"),
		ls.parser.parse_snippet("ul", "<ul>$0</ul>"),
		ls.parser.parse_snippet("ol", "<ol>$0</ol>"),
		ls.parser.parse_snippet("textarea", "<textarea>$0</textarea>"),
		ls.parser.parse_snippet("h1", "<h1>$0</h1>"),
	},
}
