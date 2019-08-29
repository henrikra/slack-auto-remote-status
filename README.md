# Slack auto remote status

Changes you Slack status automatically when you connect to new wifi. Now you don't ever forget to leave status to "Remote" when you are at the office 🔥

## Prerequisites

Get Slack token from https://api.slack.com/custom-integrations/legacy-tokens before continuing

## Setup

1. Create `.slack-auto-remote-status` to your home folder with `touch .slack-auto-remote-status`
2. Fill it with this info

```
SLACK_TOKEN=YOUR_SLACK_TOKEN
OFFICE_NETWORK=YOUR_OFFICE_NETWORK_NAME
```

3. Run `launchctl load networkchange.plist`
4. Run `launchctl start networkchange`
5. Now your Slack status automatically based on your WIFI name!
