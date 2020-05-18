class Comb < ApplicationRecord
    belongs_to :hive
    has_many :worker_bees
    has_many :assignments
    has_many :advisements
end
