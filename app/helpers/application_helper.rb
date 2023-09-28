# app/helpers/application_helper.rb

module ApplicationHelper
  def staff_count
    Staff.count
  end

def student_count
  if Admission.where(admission_status: true).exists?
    Student.count+1
  else
    0
  end
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
