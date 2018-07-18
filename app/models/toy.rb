class Toy < ApplicationRecord
  validates :fun_level, numericality: {
                                        only_integer: true,
                                        greater_than_or_equal_to: 0,
                                        less_than_or_equal_to: 10
                                      },
                        presence: true

  belongs_to :dog, optional: true #,  inverse_of: :toys
end
