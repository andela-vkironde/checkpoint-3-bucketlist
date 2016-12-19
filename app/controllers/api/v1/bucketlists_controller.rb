module API
  module V1
    class BucketlistsController < ApplicationController
      before_action :user_bucketlists, only: [:index, :create]

      def index
        queried_bucketlists = search || paginate_only
        json_response(queried_bucketlists)
      end

      def create
        new_bucketlist = @bucketlists.new(bucketlist_params)
        new_bucketlist.save!
        json_response(new_bucketlist, :created)
      end

      private

      def bucketlist_params
        params.permit(:name, :user_id)
      end

      def search
        if params[:q] && @bucketlists
          @bucketlists
            .search(params[:q])
            .paginate(params[:limit], params[:page])
        end
      end

      def paginate_only
        @bucketlists.paginate(params[:limit], params[:page]) if @bucketlists
      end

      def user_bucketlists
        @bucketlists = @current_user.bucketlists
      end
    end
  end
end
