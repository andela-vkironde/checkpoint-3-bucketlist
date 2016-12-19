module API
  module V1
    class ItemsController < ApplicationController
      before_action :bucketlist_items, only: [:index, :create]

      def index
        json_response(paginate_items)
      end

      def create
        new_item = @items.new(item_params)
        new_item.save!
        json_response(new_item, :created)
      end

      def update

      end

      def show

      end

      def destroy

      end

      private

      def item_params
        params.permit(:name, :bucketlist_id, :done)
      end

      def paginate_items
        @items.paginate(params[:limit], params[:page]) if @items
      end

      def bucketlist_items
        @items = item_bucketlist.items if item_bucketlist
      end

      def item_bucketlist
        @current_user.bucketlists.find_by(id: params[:bucketlist_id])
      end
    end
  end
end
