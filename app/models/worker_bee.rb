class WorkerBee < ApplicationRecord    
    belongs_to :comb
    has_many :pollen_collecteds
    has_many :nectar_dosages
end
