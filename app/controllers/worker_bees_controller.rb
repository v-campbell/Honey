class WorkerBeesController < ApplicationController
    def index
        @worker_bee = WorkerBee.first
        @p = ActiveRecord::Base.connection.execute(
            "SELECT a.nectar_dosage, b.pollen_globs_collected, date,
            CASE WHEN a.bee_id is NULL THEN b.bee_id ELSE a.bee_id END AS bee_id,
            CASE WHEN a.date_given is NULL THEN b.date_collected ELSE a.date_given END AS date
            FROM nectar_dosages AS a JOIN pollen_collecteds AS b ON
            a.date_given =b.date_collected WHERE bee_id = 1").to_a
        render :index
    end

    def show

        @worker_bee = WorkerBee.find(params[:id])
        @dates = []
        @worker_bee.nectar_dosages.each do |nectar_dosage|
            @dates.push(nectar_dosage.date_given)
        end
        @worker_bee.pollen_collecteds.each do |pollen_collected|
            @dates.push(pollen_collected.date_collected)
        end
        print (@dates)
        # @worker_bee.advisements.each do |

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
