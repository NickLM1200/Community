module ApplicationHelper
  def current_page_without_header?
    controller_name == 'asession' ||
    controller_name == 'admins' ||
    controller_name == 'categories' ||
    controller_name == 'organizations' ||
    controller_name == 'classifications' ||
    controller_name == 'questions' ||
    controller_name == 'reviews' ||
    controller_name == 'surveys' ||
    controller_name == 'users' ||
    controller_name == 'answers' ||
    controller_name == 'question_answer_rels'

    controller_path.include?('administrator/')
  end
  
  def formatPhoneNumber(number)
    return number unless number.present?
    number.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  end
end
