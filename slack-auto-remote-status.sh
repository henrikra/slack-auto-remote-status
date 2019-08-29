
TOKEN=$(</Users/henrikra/projects/slack-auto-remote-status/.slack-token.config)
SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')

OFFICE_NETWORK="xxx"

if [ $SSID == $OFFICE_NETWORK ]
then
  STATUS='At%20Office'
	EMOJI='office'
else
	STATUS='Working%20remotely'
	EMOJI='house_with_garden'
fi

curl -X POST https://slack.com/api/users.profile.set\?profile\=%7B%0D%0A%20%20%20%20%22status_text%22%3A%20%22$STATUS%22%2C%0D%0A%20%20%20%20%22status_emoji%22%3A%20%22%3A$EMOJI%3A%22%0D%0A%7D\&token\=$TOKEN