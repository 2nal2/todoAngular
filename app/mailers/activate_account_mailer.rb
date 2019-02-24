class ActivateAccountMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def submitted(user)
    @user = user
    logger.info(@user.email)
    mail(to: 'luisalfonsocb83@gmail.com', subject: 'New User Awaiting Admin Approval')
  end
end
