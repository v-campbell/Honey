class Assignment < ApplicationRecord
    belongs_to :comb

    belongs_to :worker_bee,
    foreign_key: :bee_id,
    class_name: :WorkerBee
end
