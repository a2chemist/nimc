import dimscord, asyncdispatch

type
    SlashCommand* = object
        data*: ApplicationCommand
        resp*: proc(c: DiscordClient, i: Interaction) {.async.}