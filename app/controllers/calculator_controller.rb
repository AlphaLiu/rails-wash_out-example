class CalculatorController < ApplicationController
  soap_service namespace: 'urn:WashOut', wsse_username: "test", wsse_password: "password"

  soap_action "sum",
    :args => {:a => :integer, :b => :integer},
    :return => :integer
  def sum
    result = (params[:a] + params[:b])
    render :soap => result
  end

  soap_action "substract",
    :args => {:a => :integer, :b => :integer},
    :return => :integer
  def substract
    render :soap => (params[:a] - params[:b])
  end

  soap_action "multiply",
    :args => {:a => :integer, :b => :integer},
    :return => :integer
  def multiply
    render :soap => (params[:a] * params[:b])
  end

  soap_action "divide",
    :args => {:a => :integer, :b => :integer},
    :return => :integer
  def divide
    render :soap => (params[:a] / params[:b])
  end
end
