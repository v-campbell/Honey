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
        @advisement.update(advisement_params)
        redirect_to :show
    end
    def overrule
        @advisement = Advisement.find(params[:id])
        @advisement.accepted = true
        @advisement.save
    end

    private
    def advisement_params
        params.require(:advisement).permit(:bee_id, :accepted, :date_given, :value)
    end
end
