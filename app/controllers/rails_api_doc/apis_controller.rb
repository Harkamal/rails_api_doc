require_dependency "rails_api_doc/application_controller"

module RailsApiDoc
  class ApisController < ApplicationController
    # GET /apis
    # GET /apis.json
    def index
      @apis = Api.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @apis }
      end
    end
  
    # GET /apis/1
    # GET /apis/1.json
    def show
      @api = Api.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @api }
      end
    end
  
    # GET /apis/new
    # GET /apis/new.json
    def new
      @api = Api.new
      @parameters = @api.parameters.build
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @api }
      end
    end
  
    # GET /apis/1/edit
    def edit
      @api = Api.find(params[:id])
    end
  
    # POST /apis
    # POST /apis.json
    def create
      @api = Api.new(params[:api])
      # paramerer_attr = params[:api][:parameters_attributes].delete_if { |k, v| v["name"].blank? }
      respond_to do |format|
        if @api.save
          # paramerer_attr.each do |k, v|
          #   debugger
          #   @api.parameters.create(v)
          # end
          format.html { redirect_to @api, notice: 'Api was successfully created.' }
          format.json { render json: @api, status: :created, location: @api }
        else
          format.html { render action: "new" }
          format.json { render json: @api.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /apis/1
    # PUT /apis/1.json
    def update
      @api = Api.find(params[:id])
      @api.parameters.build
      respond_to do |format|
        if @api.update_attributes(params[:api])
          format.html { redirect_to @api, notice: 'Api was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @api.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /apis/1
    # DELETE /apis/1.json
    def destroy
      @api = Api.find(params[:id])
      @api.destroy
  
      respond_to do |format|
        format.html { redirect_to apis_url }
        format.json { head :no_content }
      end
    end

    def generate_doc
      puts "dir>>>>>>>>>>>>>>>#{Dir.pwd}"
      unless File.directory?("app/assets/doc/")
        FileUtils.mkdir_p("app/assets/doc")
      end
      Dir.chdir("app/assets/doc/") do 
      puts "dir>>>>>>>>>>>>>>>#{Dir.pwd}"
      apis = Api.all
      data = ""
      params = ""
      unless apis.blank?
        apis.each do |api|
        data += '/**
* @api {' "#{api.request_type}" +  '}' +   " #{api.url}" + " #{api.name}" + "\n" + 
'* @apiName' +  " #{api.name}"  + "\n" +
'* @apiGroup' + " #{api.api_group}" + "\n" + 
'* @apiVersion' + " #{api.version}" + "\n" +   
'*' +  (val = api.parameters.blank? ? "\n" : api.parameters.map{|p| "\n" + '* @apiParam {' + "#{p.param_type}" + '}' +  " #{p.name}" + " #{p.note}" + "\n"}.join("")) +
'* @apiSuccessExample Success-Response:
 *     HTTP/1.1 200 OK
 *     {
 *       "firstname": "John",
 *       "lastname": "Doe"
 *     }
*/'
end   

      File.open("api.js", 'w+') {
        |f| f.write("#{data}") 
      }
      end
      system "apidoc"
    end
      flash[:notice] = "Api Doc Generated"
      redirect_to apis_path 
    end
  end

end