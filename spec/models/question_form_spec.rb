require 'spec_helper'

describe QuestionForm do
  let(:questionnaire) { create :questionnaire }
  let(:question_params) do
    {
      title: 'Question title',
      description: 'Question description',
      answers: [
        { content: 'Wrong answer 1', correct: false },
        { content: 'Right answer', correct: true },
        { content: 'Wrong answer 2', correct: false }
      ]
    }
  end

  let(:invalid_params) do
    {
      answers: []
    }
  end

  describe '.validations' do
    context 'when valid' do
      subject { QuestionForm.new(questionnaire, question_params) }
      it { should be_valid }
    end

    context 'when not valid' do
      subject { QuestionForm.new(questionnaire, invalid_params) }
      it { should be_invalid }
    end
  end

  describe '#save' do
    let(:question_form) { QuestionForm.new(questionnaire, question_params) }
    it 'creates new question' do
      expect { question_form.save }.to change { Question.count }.by(1)
    end
    it 'creates 3 new answers' do
      expect { question_form.save }.to change { Answer.count }.by(3)
    end
  end
end
