
class Advisement < ApplicationRecord
    belongs_to :worker_bee,
    foreign_key: :bee_id,
    class_name: :WorkerBee
    def self.current_adv(date, bee_id)
        Advisement.select("*").where("bee_id = #{bee_id}").where('accepted IS NULL OR accepted = true')
        .where("date_given <= ?", date).order("date_given").last
    end
end


