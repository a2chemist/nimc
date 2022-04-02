import
    dimscord,
    asyncdispatch,
    options,
    types

let commands*: seq[SlashCommand] = @[
    SlashCommand(
        data: ApplicationCommand(
            name: "hello",
            kind: atSlash,
            description: "Responds with a classic.",
            default_permission: true
        ),
        resp: proc(c: DiscordClient, i: Interaction) {.async.} =
            await c.api.createInteractionResponse(
                i.id,
                i.token,
                InteractionResponse(
                    kind: irtChannelMessageWithSource,
                    data: some InteractionApplicationCommandCallbackData(
                        content: "world!"
                    )
                )
            )
    )
]