module API
  module V1
    class BucketlistsController < ApplicationController
      before_action :user_bucketlists, only: [:index, :create]
      before_action :set_bucketlist, only: [:show, :destroy, :update]

      def index
        queried_bucketlists = search || paginate_only
        json_response(queried_bucketlists)
      end

      def create
        new_bucketlist = @bucketlists.new(bucketlist_params)
        new_bucketlist.save!
        json_response(new_bucketlist, :created)
      end

      def update
        @bucketlist.update!(bucketlist_params)
        json_response(@bucketlist)
      end

      def show
        json_response(@bucketlist)
      end

      def destroy
        @bucketlist.destroy
        json_response(message: Messages.deleted("bucketlist"))
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
    end
  end
end
