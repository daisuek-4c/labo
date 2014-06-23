require "api/api_client"

class InstancesController < ApplicationController
  def index
    puts "index"

    instance = DbInstance.new
    instance.process = "index"

    if instance.valid?
      puts "validate successful"
      ApiClient.execute
    end
  end

  def show
    puts "show"

    instance = DbInstance.new
    instance.process = "show"
    instance.identifier = params[:id]

    if instance.valid?
      ApiClient.execute
    end
  end

  def _new
    puts "_new"

    @db_instance = DbInstance.new
  end

  def create
    puts "create"
    puts params[:db_instance]

    instance = DbInstance.new params[:db_instance]
    instance.process = "create"

    if instance.valid?
      puts "validate@create successful"
      ApiClient.execute
    end
  end

  def edit
    puts "edit"

    @db_instance = DbInstance.new
    @db_instance = params[:id]
  end

  def update
    puts "update"

    instance = DbInstanve.new params[:db_instance]
    instance.identifier = params[:id]
    instance.process = "update"

    if instance.valid?
      puts "validate@update sucessful"
      ApiClient.execute
    end
  end

  def delete
  end

  def destroy
  end

  def reboot
  end

end
