require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_neeing_repairs_sent_to_station_1

    robot = Robot.new
    robot.needs_repairs = true
    robot.vintage_model = false
    robot.foreign_model = true
    robot.day_off = false

    # act

    robot_at_station = robot.station

    # assert

    assert_equal(robot_at_station, 1)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange

    robot = Robot.new
    robot.needs_repairs = true
    robot.vintage_model = true
    robot.foreign_model = false
    robot.day_off = false

    # act
    robot_at_station = robot.station

    # assert

    assert_equal(robot_at_station, 2)

  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange

    robot = Robot.new
    robot.needs_repairs = true
    robot.vintage_model = false
    robot.foreign_model = false
    robot.day_off = false

    # act
    robot_at_station = robot.station

    # assert

    assert_equal(robot_at_station, 3)

  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange

    robot = Robot.new
    robot.needs_repairs = false
    robot.vintage_model = false
    robot.foreign_model = false
    robot.day_off = false

    # act
    robot_at_station = robot.station

    # assert

    assert_equal(robot_at_station, 4)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange

    robot = Robot.new

    # act

    empty_todo = robot.prioritize_tasks

    # assert

    assert_equal(empty_todo, -1)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange
   robot = Robot.new
   robot.todos = (5..9).to_a
    # act
     max_todo_value = robot.prioritize_tasks
    # assert
    assert_equal(max_todo_value, 9)
  end

  def test_workday_on_day_off_returns_true

    # arrange
    robot = Robot.new
    @day_off = "Friday"

    # act

     work_day = robot.workday?("Monday")

    # assert
    assert_equal(work_day, true)
  end

  def test_workday_not_day_off_returns_false
    robot = Robot.new
    robot.day_off = 'Monday'

    outcome = robot.workday?('Monday')

    assert_equal(outcome, false)
  end

end
