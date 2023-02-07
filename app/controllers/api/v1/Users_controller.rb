module Api 
    module V1
        class UsersController < ApplicationController

            def index
                render json: User.all
                
            end

            def show
                user = User.find(params[:id])
                render json: user
            end


            def create  
                user = User.new(user_params)
                if user.save
                    render json: user , status: :created                                                                 
                else
                    render json: {erros: user.errors.full_messages}, status: :bad_request
                end
                
            end

            def update  
                user = User.find(params[:id])
                if user.update(user_params)
                    render json: user , status: :accepted                                                                
                else
                    render json: user.errors, status: :bad_request
                end
                
            end

            def destroy  
                user = User.find(params[:id])
                if user.destroy
                    render json: user , status: :accepted                                                                
                else
                    render json: user.errors, status: :bad_request
                end
                
            end



            private
            def user_params
                params.require(:user).permit(:name)
            end
        end
    end
    
end