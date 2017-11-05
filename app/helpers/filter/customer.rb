module Filter
  module Customer
 
    def self.do params
      return if params[:string].nil? && params[:activo].nil?
      @params = params
      if @params[:activo].present?
        return by_status
      end
      if @params[:string]
        return by_string
      end
    end

    def self.by_status
      query = "activo = '#{@params[:activo]}' "
      User.where(query + 'and nombre_contacto is not null')
    end

    def self.by_string
      query = "(lower(nombre) like '%#{@params[:string].downcase}%' or 
               lower(nombre_contacto) like '%#{@params[:string].downcase}%' or
               lower(email) like '%#{@params[:string].downcase}%' )"
      User.where(query + 'and nombre_contacto is not null')
    end

  end
end
