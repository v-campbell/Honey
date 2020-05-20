class WorkerBeesController < ApplicationController
    def index
        @worker_bee = WorkerBee.first
        @p = ActiveRecord::Base.connection.execute(
            "SELECT * FROM pollen_collecteds
            LEFT OUTER JOIN nectar_dosages ON 
            pollen_collecteds.bee_id = nectar_dosages.bee_id").to_a
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
