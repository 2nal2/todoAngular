require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "creating a Employee" do
    visit employees_url
    click_on "New Employee"

    fill_in "Direction", with: @employee.direction
    fill_in "Dismissal date", with: @employee.dismissal_date
    fill_in "Dni", with: @employee.dni
    fill_in "First name", with: @employee.first_name
    fill_in "Hire date", with: @employee.hire_date
    fill_in "Last name", with: @employee.last_name
    fill_in "Phone", with: @employee.phone
    fill_in "Role", with: @employee.role
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "updating a Employee" do
    visit employees_url
    click_on "Edit", match: :first

    fill_in "Direction", with: @employee.direction
    fill_in "Dismissal date", with: @employee.dismissal_date
    fill_in "Dni", with: @employee.dni
    fill_in "First name", with: @employee.first_name
    fill_in "Hire date", with: @employee.hire_date
    fill_in "Last name", with: @employee.last_name
    fill_in "Phone", with: @employee.phone
    fill_in "Role", with: @employee.role
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "destroying a Employee" do
    visit employees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employee was successfully destroyed"
  end
end
