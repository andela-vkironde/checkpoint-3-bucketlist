module API
  module V1
    class ItemsController < ApplicationController

      def index

      end

      def create

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
    end
  end
end
