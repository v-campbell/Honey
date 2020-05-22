require 'concerns/getAdv.rb'
class NectarDosage < ApplicationRecord
    include GETADV
    belongs_to :worker_bee,
    foreign_key: :bee_id,
    class_name: :WorkerBee
    @adv_perc = nil
end
