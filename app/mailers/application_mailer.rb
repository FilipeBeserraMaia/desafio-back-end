class ApplicationMailer < ActionMailer::Base
  default from: MAILER_DEFAULT_FROM
  layout "mailer"

end
