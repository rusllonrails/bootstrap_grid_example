class ProvidersController < ApplicationController


  def index
    render json: Provider.json_entries(params["searchString"])
  end

  def create
    ops = {}

    params["provider"].map do |key, value|
      if key != "s_id"
        ops[key.gsub("s_", "")] = if key == "s_top_on"
          value == "1" ? true : false
        else
          value
        end
      end
    end

    Provider.create!(ops)
  end

  def update
    provider = Provider.find(params[:id])

    ops = {}

    params["provider"].map do |key, value|
      if key != "s_id"
        ops[key.gsub("s_", "")] = if key == "s_top_on"
          value == "1" ? true : false
        else
          value
        end
      end
    end

    provider.update(ops)
  end

  def destroy
    provider = Provider.find(params[:id])

    provider.destroy

    render nothing: true, status: :ok
  end

  def toggle
    provider = Provider.find(params[:provider_id])

    provider.toggle!(:top_on)

    render nothing: true, status: :ok
  end

  def turn_on
    Provider.update_all(top_on: true)

    render nothing: true, status: :ok
  end

  def turn_off
    Provider.update_all(top_on: false)

    render nothing: true, status: :ok
  end
end
