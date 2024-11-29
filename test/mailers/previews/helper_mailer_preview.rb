# Preview all emails at http://localhost:3000/rails/mailers/helper_mailer
class HelperMailerPreview < ActionMailer::Preview
  def registered_mail
    HelperMailer.with(helper: Helper.first).registered_mail
  end
end
