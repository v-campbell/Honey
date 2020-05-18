class WorkerBeesController < ApplicationController
    def index
        @worker_bees = WorkerBee.all
        render :index
    end

    def show
        @worker_bee = WorkerBee.find(params[:id])
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
