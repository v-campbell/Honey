class Advisement < ApplicationRecord
    belongs_to :worker_bee,
    foreign_key: :bee_id,
    class_name: :WorkerBee

    def self.current_adv

    end
end


