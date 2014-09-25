path = require 'path'
fs = require 'fs'
_ = require 'underscore'

mailer = require('./index')
  account:
    service: 'Postmark'
    auth:
      user: 'postmark-api-token'
      pass: 'postmark-api-token'

  send_from: 'Pomotodo <robot@pomotodo.com>'
  reply_to: 'support@pomotodo.com'

  default_template: 'jade'

  default_language: 'en'
  languages: _.map fs.readdirSync("#{__dirname}/locale"), (file_name) ->
    return path.basename file_name, '.json'

  template_prefix: "#{__dirname}/template"
  locale_prefix: "#{__dirname}/locale"

mailer.sendMail 'test_notice', 'jysperm@gmail.com',
  body: 'Test Notice'
,
  language: 'en'
  timezone: 'Asia/Shanghai'
, (err) ->
  throw err if err