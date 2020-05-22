class WorkerBeesController < ApplicationController
    def index
        @worker_bees = WorkerBee.all
        render :index
    end

    def show
        # @worker_bee = WorkerBee.find(params[:id])
        @worker_bee = WorkerBee.first
        @comb_id = @worker_bee.comb_id
        @bee_table = ActiveRecord::Base.connection.execute(
            "SELECT nec.bee_id, nec.date_given, nectar_dosage, pollen_globs_collected,
            value, adv.id AS adv_id, nec.id AS nec_id
            FROM nectar_dosages AS nec
            LEFT OUTER JOIN pollen_collecteds AS pol
            ON nec.date_given = pol.date_collected
            LEFT OUTER JOIN advisements AS adv ON
            nec.date_given = adv.date_given
            WHERE nec.bee_id = #{@worker_bee.id} AND (pol.bee_id = #{@worker_bee.id} OR pol.bee_id is NULL) AND
            (adv.bee_id = #{@worker_bee.id} OR adv.bee_id is NULL) ORDER BY nec.date_given DESC").to_a
            
            @nectar_dosage = []
            @advisePerc = []
            @pollen_globs_collected = []
            @dates = []
            @bee_table.each do |row|
                @nectar_dosage.push(row["nectar_dosage"]/1000)
                @advisePerc.push(NectarDosage.find(row["nec_id"]).getAdvisementPercent())
                @dates.push(row["date_given"])
            end
            @bee_table.each do |row|
                if !row["pollen_globs_collected"]
                    @pollen_globs_collected.push(@pollen_globs_collected.last() || 0) 
                else
                    @pollen_globs_collected.push(row["pollen_globs_collected"])
                end
            end
            gon.nectar_dosage = @nectar_dosage
            gon.pollen_globs_collected = @pollen_globs_collected
            gon.dates = @dates
            debugger
        render :show
    end

    def update
        @worker_bee = WorkerBee.find(params[:id])
        @worker_bee.update(bee_params)
        redirect_to :show
    end

    private
    def bee_params
        params.require(:worker_bee).permit(:comb_id)
    end
end
