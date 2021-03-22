class Expense < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :expenses_groups, dependent: :destroy
    has_many :groups, through: :expenses_groups

    validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
    validates :amount, presence: true, numericality: { less_than: 10_000 }
end
