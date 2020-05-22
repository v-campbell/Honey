require 'active_support/concern'
module GETADV
  extend ActiveSupport::Concern
    def getAdvisementPercent()
        if @adv_perc
             return @adv_perc
        end
        active_adv = Advisement.current_adv(self.date_given, self.bee_id)
        unless active_adv 
            return [0]
        end
        nec_acc = active_adv.value == self.nectar_dosage ? [1] : [0]
        if active_adv.date_given == self.date_given
            @adv_perc = nec_acc
        else
            @adv_perc = NectarDosage.select("*").where("date_given < ?", self.date_given)
            .order("date_given").last.getAdvisementPercent().concat(nec_acc)
        end
        return @adv_perc
    end
end