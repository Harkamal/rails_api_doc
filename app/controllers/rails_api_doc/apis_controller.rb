require_dependency "rails_api_doc/application_controller"

module RailsApiDoc
  class ApisController < ApplicationController
    # GET /apis
    # GET /apis.json
    def index
      @project = Project.find params[:project_id]
      @apis = @project.apis.page(params[:page]).per(RailsApiDoc::Api::DEFAULT_PAGE_SIZE)
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @apis }
      end
    end
  
    # GET /apis/1
    # GET /apis/1.json
    def show
      @project = Project.find params[:project_id]
      @api = Api.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @api }
      end
    end
  
    # GET /apis/new
    # GET /apis/new.json
    def new
      @project = Project.find params[:project_id]
      @api = @project.apis.new
      @parameters = @api.parameters.build
      @api.success_responses.build
      @api.failure_responses.build
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @api }
      end
    end
  
    # GET /apis/1/edit
    def edit
      @project = Project.find params[:project_id]
      @api = Api.find(params[:id])
    end
  
    # POST /apis
    # POST /apis.json
    def create
      @project = Project.find params[:project_id]
      @api = @project.apis.new(params[:api])
      # paramerer_attr = params[:api][:parameters_attributes].delete_if { |k, v| v["name"].blank? }
      respond_to do |format|
        if @api.save
          # paramerer_attr.each do |k, v|
          #   debugger
          #   @api.parameters.create(v)
          # end
          format.html { redirect_to project_apis_path, notice: 'Api was successfully created.' }
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
      @project = Project.find params[:project_id]
      @api = @project.apis.find(params[:id])
      # @api.parameters.build
      respond_to do |format|
        if @api.update_attributes(params[:api])
          format.html { redirect_to project_api_path(@project, @api), notice: 'Api was successfully updated.' }
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
      @project = Project.find params[:project_id]
      @api = @project.apis.find(params[:id])
      @api.destroy
  
      respond_to do |format|
        format.html { redirect_to project_apis_path }
        format.json { head :no_content }
      end
    end

    def generate_doc
      @project = Project.find params[:project_id]
      puts "dir>>>>>>>>>>>>>>>#{Dir.pwd}"
      project_name = @project.name.gsub(" ", "_")
      _dir = "app/assets/projects/#{project_name}/"
      unless File.directory?(_dir)
        FileUtils.mkdir_p(_dir)
      end
      Dir.chdir(_dir) do 
      puts "dir>>>>>>>>>>>>>>>#{Dir.pwd}"
      apis = @project.apis
      data = ""
      params = ""
      unless apis.blank?
        apis.each do |api|
        data += '/**
* @api {' "#{api.request_type}" +  '}' +   " #{api.url}" + " #{api.name}" + "\n" + 
'* @apiName' +  " #{api.name}"  + "\n" +
'* @apiGroup' + " #{api.api_group}" + "\n" + 
'* @apiVersion' + " #{api.version}" + "\n" +   
'*' +  (val = api.parameters.blank? ? "\n" : api.parameters.map{|p| "\n" + '* @apiParam {' + "#{p.param_type}" + '}' +  " #{p.name}" + " #{p.note}" }.join("")) + "\n" +
'* @apiSuccessExample Success-Response:' + (response = api.success_responses.blank? ? "\n" + "*" + "{}" : "\n" +  api.success_responses.map{|p|  "*" + (note = p.note.blank? ? "" : (p.note + "\n")) + "#{res = p.success_structure.gsub("\r\n", "\n*")}"  + "\n"}.join("")) + "\n"  +
'* @apiErrorExample Error-Response:' + (response = api.failure_responses.blank? ? "\n" + "*" + "{}" : "\n" +  api.failure_responses.map{|p|  "*" + (note = p.note.blank? ? "" : (p.note + "\n")) + "#{res = p.failure_structure.gsub("\r\n", "\n*")}"  + "\n"}.join("")) + "\n"  + 
"*/" + "\n" 
end

      File.open("api.js", 'w+') {
        |f| f.write("#{data}") 
      }

      # write package file
      package_data = '{
        "name": '+  '"' + @project.name + ' APIDOC",
        "version": "0.1.0",
        "description": "Documentation for RESTful web APIs"
      }'
      File.open("package.json", 'w+') {
        |f| f.write("#{package_data}") 
      }

      end
      system "apidoc"
    end
      flash[:notice] = "Api Doc Generated"
      redirect_to project_apis_path(@project)
    end
  end

end