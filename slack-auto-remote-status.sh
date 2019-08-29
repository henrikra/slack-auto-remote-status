source ~/.slack-auto-remote-status

CURRENT_WIFI=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')

if [ $CURRENT_WIFI == $OFFICE_NETWORK ]
then
  STATUS='At Office'
	EMOJI='office'
else
	STATUS='Working remotely'
	EMOJI='house_with_garden'
fi

curl \
	-X POST \
	-H "Authorization: Bearer $SLACK_TOKEN" \
	-H "Content-Type: application/json; charset=utf-8" \
	-d '{"profile": {"status_text": "'"$STATUS"'", "status_emoji": "'":$EMOJI:"'"}}' \
	https://slack.com/api/users.profile.set