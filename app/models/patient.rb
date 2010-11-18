class Patient < ActiveRecord::Base
  has_many :ailment_messages
end
