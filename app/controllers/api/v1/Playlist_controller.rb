module Api 
    module V1
        class PlaylistController < ApplicationController

            def index 
                render json: Playlist.all          
            end

            def show
                @playlist = Playlist.all 
                if @playlist.present?
                    @playlist = @playlist.where(video_rooms_id: params[:id]).order('id desc')
                    render json: @playlist
                else
                    render json: { message: "Playlist not found" }, status: 404
                end
            end


            def create  
                playlist = Playlist.new(playlist_params)
                if playlist.save
                    render json: playlist , status: :created                                                                 
                else
                    render json: {erros: playlist.errors.full_messages}, status: :bad_request
                end
                
            end

            def update  
                playlist = Playlist.find(params[:id])
                if playlist.update(playlist_params_update)
                    render json: playlist , status: :accepted                                                                
                else
                    render json: playlist.errors, status: :bad_request
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
            def playlist_params
                params.require(:playlist).permit(:video_rooms_id, :user_id, :link,:status)
            end

            def playlist_params_update
                params.require(:playlist).permit(:status,:user_id)
            end
        end
    end
    
end