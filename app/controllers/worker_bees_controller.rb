class WorkerBeesController < ApplicationController
    def index
        @worker_bee = WorkerBee.first
        redirect_to 
        render :index
    end

    def show

        # @worker_bee = WorkerBee.find(params[:id])
        @worker_bee = WorkerBee.first
        @comb_id = @worker_bee.comb_id
        @bee_table = ActiveRecord::Base.connection.execute(
            "SELECT nec.bee_id, nec.date_given, nectar_dosage, pollen_globs_collected, value, adv.comb_id
            FROM nectar_dosages AS nec
            LEFT OUTER JOIN pollen_collecteds AS pol
            ON nec.date_given = pol.date_collected
            LEFT OUTER JOIN advisements AS adv ON
            nec.date_given = adv.date_given
            WHERE nec.bee_id = #{@worker_bee.id} AND (pol.bee_id = #{@worker_bee.id} OR pol.bee_id is NULL) AND
            (adv.comb_id = #{@comb_id} OR adv.comb_id is NULL) ORDER BY nec.date_given DESC").to_a

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
