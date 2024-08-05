# JMusicBot Docker Image

This is a very basic Docker image for JMusicBot, a music bot for Discord.
See the [JMusicBot](https://github.com/jagrosh/MusicBot) repository for more information.

## Environment Variables

| Name | Description | Required |
|------|-------------|----------|
| `TOKEN` | Your bot's token. | Yes |
| `OWNER` | The ID of the bot owner. | Yes |
| `PREFIX` | This sets the prefix for the bot | Yes |

This mirrors the options in the config.txt file. See the [Example Config](https://jmusicbot.com/config/) for more information.

More environment variables may be added in the future. Feel free to open a PR!

## Updates

This image is updated automatically via github actions from the [JMusicBot](https://github.com/jagrosh/MusicBot) repository's releases every tuesday.
