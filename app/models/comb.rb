class Comb < ApplicationRecord
    belongs_to :hive

    has_many :assignments
end
