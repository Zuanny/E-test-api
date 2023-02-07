module Api 
    module V1
        class VideosRoomController < ApplicationController

            def index
                videoroom = VideoRoom.all
                if videoroom != []
                    render json: videoroom, status: :ok
                else
                    render json: videoroom.errors, status: 404
                end
                
            end

            def show
                sql =  "Select vr.id as videoRoom_id, vr.name as videoRoom_name , 
                            u.name as user_name, u.id as user_id
                       from video_rooms vr 
                       left join users u on vr.user_id = u.id "
                
                records_array = ActiveRecord::Base.connection.execute(sql)
               
                if records_array != []
               
                    render json: records_array, status: :ok
                else
                    render json: videoroom.errors, status: 404
                end
                
            end


            def create  
                videoroom = VideoRoom.new(videosroom_params)
                if videoroom.save
                    render json: videoroom , status: :created                                                                 
                else
                    render json: {erros: videoroom.errors.full_messages}, status: :bad_request
                end
               
            end
           

            def update  
                videoroom = VideoRoom.find(params[:id])
                if videoroom.update(videosroom_params)
                    render json: videoroom , status: 203                                                                 
                else
                    render json: {erros: videoroom.errors.full_messages}, status: :bad_request
                end
               
            end

            def destroy  
                videoroom = VideoRoom.find(params[:id])
                if videoroom.destroy()
                    render json: videoroom , status: 203                                                                 
                else
                    render json: {erros: videoroom.errors.full_messages}, status: :bad_request
                end
               
            end

           def videosroom_params
                params.require(:videos_room).permit(
                    :name, :user_id)
            
           end
            
            
          
        end
    end
    
end