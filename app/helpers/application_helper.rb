# app/helpers/application_helper.rb

module ApplicationHelper
  def staff_count
    Staff.count
  end

  def student_count
    Student.count
  end

  def revenue_count
    Revenue.count
  end

  def visitor_count
    Visitor.count
  end

  def classroom_count
    Classroom.count
  end

  def expenditure_count
    Expenditure.count
  end

  def salary_count
    Salary.count
  end
end
