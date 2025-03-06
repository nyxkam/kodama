return {
	"nvzone/typr",
	lazy = false,
	cmd = { "Typr", "TyprStats" },
	opts = {
		config = {
			winlayout = "responsive",
			kblayout = "qwerty",
			wpm_goal = 120,
			numbers = false,
			symbols = false,
			random = false,
			insert_on_start = false,
			stats_filepath = vim.fn.stdpath("data") .. "/typrstats",
			mappings = nil,
			-- Ejemplo: function(buf)
			--   vim.keymap.set("n", "a", "cualquier_comando", { buffer = buf })
			-- end,
		},

		data = {
			accuracy = 0,
			wpm = 0,
			rawpm = 0,
			correct_word_ratio = "?",
			total_char_count = 0,
			typed_char_count = 0,
			char_times = {},
			char_stats = { all = 0, wrong = 0 },
			word_stats = { all = 0, wrong = 0 },
		},

		tabs = {},

		horiz_i = 1,
	},
}
