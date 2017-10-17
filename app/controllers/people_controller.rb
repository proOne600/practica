class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  @person.delay(priority: 15, run_at: 2.minutes.from_now).prueba(@person.lastname) ##Se le da una prioridad de 15 al metodo y se ejecutara cada 2 minutos
  
  def pruebaPer
    time=Time.now
    puts "Tiempo: "+time.to_formatted_s(:rfc822)+" (Este metodo se ejecutara para siempre)"
  end
  
  handle_asynchronously :pruebaPer; :priority => 8, :run_at => 4.minutes.from_now ##El metodo pruebaPer tendra una prioridad de 8 y se ejecutara cada 4 minutos
  
  
  human=Person.new
  
  human.pruebaPer ##Hacemos el llamado a pruebaPer para que empieze a ejecutarse en segundo plano para siempre

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end
    
    def prueba(owner)
      puts "Tiempo actual :"+Time.now+" (Este metodo se ejecutara en segundo plano pero no para siempre)"+owner
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :lastname, :email, :phone, :biography)
    end
end
