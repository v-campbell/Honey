class NectarDosage < ApplicationRecord
    belongs_to :worker_bee,
    foreign_key: :bee_id,
    class_name: :WorkerBee
    def getAdvisementPercent()
        # debugger
        active_adv = Advisement.current_adv(self.date_given, self.bee_id)
        # debugger
        nec_acc = active_adv.value <= self.nectar_dosage ? [1] : [0]
        if active_adv.date_given == self.date_given && active_adv
            return nec_acc
        else
            return NectarDosage.select("*").where("date_given < ?", self.date_given).order("date_given").last.getAdvisementPercent().concat(nec_acc)
        end
    end
end
