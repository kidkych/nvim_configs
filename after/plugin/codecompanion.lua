require("codecompanion").setup({
    strategies = {
        chat = {
            adapter = "ollama",
        },
        inline = {
            adapter = "ollama",
        }
    },
    adapters = {
        ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
                env = {
                    url = "http://host.docker.internal:11434",
                },
                parameters = {
                    sync = true,
                },
            })
        end,
    },
})
