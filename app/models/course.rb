class Course < ApplicationRecord
	has_many :materials, dependent: :delete_all
end
