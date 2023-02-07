module Api 
    module V1
        class UserVideosRoomController < ApplicationController

            def index
                # @user_videos_room = VideoRoomUser.all
                @user_videos_room = VideoRoomUser.all
                # @user_videos_room = @user_videos_room.where(user_id: params[:user_id])
                render json: @user_videos_room
                
            end

            def show
                @user_videos_room = VideoRoomUser.all
                @user_videos_room = @user_videos_room.where(user_id: params[:id])
                if @user_videos_room.present?
                    render json:  @user_videos_room
                else    
                    render json: {erros: videoRoomUser.errors.full_messages}, status: :bad_request
                end
            end


            def create  
                videoRoomUser = VideoRoomUser.new(userVideoRoom_params)
                if videoRoomUser.save
                    render json: videoRoomUser , status: :created                                                                 
                else
                    render json: {erros: videoRoomUser.errors.full_messages}, status: :bad_request
                end
                
            end

            def update  
                videoRoomUser = VideoRoomUser.find(params[:id])
                if videoRoomUser.update(userVideoRoom_params_update)
                    render json: videoRoomUser , status: :accepted                                                                
                else
                    render json: videoRoomUser.errors, status: :bad_request
                end
                
            end

            def destroy  
                videoRoomUser = VideoRoomUser.find(params[:id])
                if videoRoomUser.destroy
                    render json: videoRoomUser , status: :accepted                                                                
                else
                    render json: videoRoomUser.errors, status: :bad_request
                end
                
            end



            private
            def userVideoRoom_params
                params.require(:user_videos_room).permit(:login_date, :user_id, :video_rooms_id)
            end

            def userVideoRoom_params_update
                params.require(:user_videos_room).permit(:login_date)
            end
        end
    end
    
end