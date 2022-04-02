import
    dimscord,
    dotenv,
    os,
    asyncdispatch,
    types,
    sequtils,
    app,
    options

load()

let client = newDiscordClient(getEnv("token"))

proc onReady(s: Shard, r: Ready) {.event(client).} =
    discard await client.api.bulkOverwriteApplicationCommands(
        s.user.id,
        app.commands.map(proc(c: SlashCommand): ApplicationCommand = c.data),
        guild_id = getEnv("guild")
    )

    echo "Ready!"

proc interactionCreate(s: Shard, i: Interaction) {.event(client).} =
    let data: ApplicationCommandInteractionData = i.data.get

    if data.name == "hello":
        for c in app.commands:
            if c.data.name == data.name:
                discard c.resp(client, i)

waitFor client.startSession()