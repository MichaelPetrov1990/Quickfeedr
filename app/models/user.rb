class User < ApplicationRecord
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_one_attached :cv

  has_many :jobs

  def fullname
    "#{first_name} #{last_name}"
  end
end
