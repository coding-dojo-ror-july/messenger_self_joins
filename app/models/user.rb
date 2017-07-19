class User < ApplicationRecord
  has_many :sent_messages,
    class_name: 'Message',
    foreign_key: 'from_user_id'

  has_many :received_messages,
    class_name: 'Message',
    foreign_key: 'to_user_id'
  
  has_many :users_i_have_sent_messages_to,
    through: :sent_messages,
    source: :to_user
  
  has_many :users_i_have_received_messages_from,
    through: :received_messages,
    source: :from_user
  
  # def users_i_have_sent_messages_to
  #   messages = Message.where(from_user_id: self.id)
  #   user_ids = messages.pluck(:to_user_id)  # only get the ids
  #   User.find(user_ids)  # find all users with ids in the array
  # end

  # # David says, creative, but nooo
  # def sent_messages
  #   Message.where(from_user_id: self.id)
  # end
end


# #  IN SOME ONROLLRE FILE
# class SomeController
#   def index
#     @current_user = User.find(session[:id])
#     @users_list = @current_user.users_i_have_received_messages_from
#   end
# end


# #  IN SOME HTML FILE
# <% @users_list.each do |user| %>
#   <p> <%= user.name %> </p>
# <% end %>