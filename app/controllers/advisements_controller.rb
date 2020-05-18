class AdvisementsController < ApplicationController
     def index
        @advisements = Advisement.all
        render :index
    end

    def show
        @advisement = Advisement.find(params[:id])
        render :show
    end

    def update
        @advisement = Advisement.find(params[:id])
        @advisement.update(bee_params)
        redirect_to :show
    end

    private
    def advisement_params
        params.require(:advisement).permit(:bee_id, :comb_id, :from_date, :to_date)
    end
end
