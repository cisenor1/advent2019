class Challenge1Controller < ApplicationController
  attr_reader :challenge1_result
  def calculate
    result = counter_upper.call(masses: masses_array) 
    challenge1_result = result
    respond_to do |format|
      format.json { render json: {result: result}, status: 200 }
    end
  rescue StandardError => e
    respond_to do |format|
     format.json { render json: {result: e.message}, status: 400 }
    end
  end

  private

  def masses_file_content
    params[:mass_file][:data].read
  end
  
  def challenge1_params
    params.require(:masses)
  end

  def masses_array
    masses_file_content.split("\n").map { |str| str.to_i }
  end

  def counter_upper
    @counter_upper ||= FuelCounterUpper.new
  end
end
