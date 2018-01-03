module Filter
  module Dispatchs
 
    def self.do params
      return if params[:import_id].nil?
      @params = params
      if @params[:import_id]
        return by_import
      end
    end

    def self.by_import
      query = "import_id = '#{@params[:import_id]}' "
      Dispatch.where(query)
    end


  end
end
