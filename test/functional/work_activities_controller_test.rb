require 'test_helper'

class WorkActivitiesControllerTest < ActionController::TestCase
  setup do
    @work_activity = work_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_activity" do
    assert_difference('WorkActivity.count') do
      post :create, work_activity: { contract_id: @work_activity.contract_id, end_date: @work_activity.end_date, start_date: @work_activity.start_date, total_hours: @work_activity.total_hours }
    end

    assert_redirected_to work_activity_path(assigns(:work_activity))
  end

  test "should show work_activity" do
    get :show, id: @work_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_activity
    assert_response :success
  end

  test "should update work_activity" do
    put :update, id: @work_activity, work_activity: { contract_id: @work_activity.contract_id, end_date: @work_activity.end_date, start_date: @work_activity.start_date, total_hours: @work_activity.total_hours }
    assert_redirected_to work_activity_path(assigns(:work_activity))
  end

  test "should destroy work_activity" do
    assert_difference('WorkActivity.count', -1) do
      delete :destroy, id: @work_activity
    end

    assert_redirected_to work_activities_path
  end
end
