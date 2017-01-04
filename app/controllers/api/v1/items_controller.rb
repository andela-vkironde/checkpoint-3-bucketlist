module API
  module V1
    class ItemsController < ApplicationController
      before_action :bucketlist_items, only: [:index, :create]
      before_action :set_bucketlist_item, only: [:show, :update, :destroy]

      def index
        json_response(paginate_items)
      end

      def create
        new_item = @items.new(item_params)
        new_item.save!
        json_response(new_item, :created)
      end

      def update
        @item.update!(item_params)
        json_response(@item)
      end

      def show
        json_response(@item)
      end

      def destroy
        @item.destroy
        json_response(message: Messages.deleted("item"))
      end

      private

      def item_params
        params.permit(:name, :bucketlist_id, :done)
      end

      def paginate_items
        @items.paginate(params[:limit], params[:page]) if @items
      end

      def set_bucketlist_item
        @item = item_bucketlist.items.find_by(id: params[:id]) if item_bucketlist
        unless @item
          raise(
            ActiveRecord::RecordNotFound, Messages.not_found("item")
          )
        end
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
