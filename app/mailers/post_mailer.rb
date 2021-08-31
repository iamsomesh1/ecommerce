class PostMailer < ApplicationMailer
	def order_placed_email(user)
    @user = user
    mail(to: @user.email, subject: 'Order Placed')
  end
end
