class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_tenant :account, optional: true

  # has_many :messages, class_name: 'Messaged::Message'
  # has_many :rooms, class_name: 'Messaged::Room'
end
