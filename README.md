# saves the data of the Twitter Streaming API to slack and s3



+ input-Twitter
+ filter-twitterurl
+ output-idcf
+ output-slack
```
<match input.twitter.sampling.timestamp>
  type slack
  webhook_url ${SLACK_WEBHOOK_URL}
  channel ${SLACK_CHANNEL}
  username ${SLACK_USERNAME}
  icon_emoji ${SLACK_ICON}
  flush_interval 2s
  message_keys twitter_url
  message %s
</match>
```