class PollenCollected < ApplicationRecord
    belongs_to :worker_bee,
    foreign_key: :bee_id,
    class_name: :WorkerBee
end
