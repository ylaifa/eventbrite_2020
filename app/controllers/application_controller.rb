class ApplicationController < ActionController::Base
    def check_privileges!
        redirect_to root_path, notice: 'You dont have enough permissions' unless current_user == Profile.find(params[:id]).user
    end
end
