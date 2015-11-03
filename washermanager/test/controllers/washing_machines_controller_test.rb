require 'test_helper'

class WashingMachinesControllerTest < ActionController::TestCase
  setup do
    @washing_machine = washing_machines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:washing_machines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create washing_machine" do
    assert_difference('WashingMachine.count') do
      post :create, washing_machine: { dorm: @washing_machine.dorm, floor: @washing_machine.floor, state: @washing_machine.state }
    end

    assert_redirected_to washing_machine_path(assigns(:washing_machine))
  end

  test "should show washing_machine" do
    get :show, id: @washing_machine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @washing_machine
    assert_response :success
  end

  test "should update washing_machine" do
    patch :update, id: @washing_machine, washing_machine: { dorm: @washing_machine.dorm, floor: @washing_machine.floor, state: @washing_machine.state }
    assert_redirected_to washing_machine_path(assigns(:washing_machine))
  end

  test "should destroy washing_machine" do
    assert_difference('WashingMachine.count', -1) do
      delete :destroy, id: @washing_machine
    end

    assert_redirected_to washing_machines_path
  end
end
