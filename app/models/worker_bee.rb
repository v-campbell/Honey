class WorkerBee < ApplicationRecord    
    belongs_to :comb  
    
    has_many :pollen_collecteds,
    foreign_key: :bee_id,
    class_name: :PollenCollected

    has_many :nectar_dosages,
    foreign_key: :bee_id,
    class_name: :NectarDosage

    # has_many :assignments,
    # foreign_key: :bee_id,
    # class_name: :Assignment

    has_many :advisements,
    through: :comb
end
