class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket

    mail(to: user.email, subject: 'You buy ticket')
  end

  def cancel_ticket(user, ticket)
    @user = user
    @ticket = ticket

    mail(to: user.email, subject: 'You cancel ticket')
  end
end
