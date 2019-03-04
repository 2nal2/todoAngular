class ActivateAccountMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def submitted(user)
    @user = user
    mail(to: @user.email, subject: 'New User Awaiting Admin Approval')
  end
end
