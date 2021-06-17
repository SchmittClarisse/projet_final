class StoriesController < ApplicationController

    before_action :set_story, only: %i[show edit update destroy]
    before_action :authenticate_user!, except: %i[index show]

    def index
        @stories = Story.all
    end

    def show
    end

    def edit
    end

    def update 
        if @story.update(story_params)
            redirect_to root_path, notice: "Story update"
        else
            flash.now[:alert] = @story.errors.full_messages[0]
            render "edit"
        end
    end
    
    def new
        @story = Story.new
    end

    def create
        @story = Story.new(story_params)
        @story.user_id = current_user.id
        if @story.save
            redirect_to root_path, notice: "Story create"
        else
            flash.now[:alert] = @story.errors.full_messages[0]
            render "new"
        end
    end
    
    def destroy
        @story.destroy
        redirect_to root_path, notice: "Story delete"
    end

    #######
    private
    #######

    def story_params
        params.require(:story).permit(:title, :content, :author)
    end

    def set_story
        @story = Story.find(params[:id])
    end

end