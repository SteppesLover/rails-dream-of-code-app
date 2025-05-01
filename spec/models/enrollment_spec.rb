require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  describe '.#is_past_application_deadline' do
    # We will create one student object and we will rewrite it every time 
    let(:student) {
      Student.create!(
        first_name: 'Test',
        last_name: 'Student',
        email: 'student@example.com'
      )
    }
  

      let!(:enrolled_student) {
        Enrollement.create!(
          created_at: '08/08/2024'
        )

      }
      let!(:enrolled_student_2) {
        Student.create!(
          created_at: '09/09/2024'
        )
      }
  
    context 'when application deadline date less than student Enrollment(created_at)' do
      # No additional data to set up in this scenario
      it 'returns an true' do
        expect(enrollment.is_past_application_deadline).to eq([true])
      end
  
    context 'when application deadline date more or equal than student Enrollment(created_at)' do
      it 'returns an false' do
        expect(enrollment.is_past_application_deadline).to eq([false])
      end
    end
      
  end
end
