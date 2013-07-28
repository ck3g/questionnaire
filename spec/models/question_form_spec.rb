require 'spec_helper'

describe QuestionForm do
  let(:questionnaire) { create :questionnaire }
  let!(:parent1) { create :question, questionnaire: questionnaire }
  let!(:parent2) { create :question, questionnaire: questionnaire }
  let(:question_params) do
    {
      title: 'Question title',
      description: 'Question description',
      answers: [
        { content: 'Answer 1' },
        { content: 'Answer 2' },
        { content: 'Answer 3' },
        { content: '' }
      ],
      possible_parents: ["", parent1.id, parent2.id]
    }
  end

  let(:no_title_params) do
    {
      answers: []
    }
  end

  let(:no_answers_params) do
    {
      title: 'Question',
      answers: []
    }
  end

  describe '.validations' do
    context 'when valid' do
      subject { QuestionForm.new(questionnaire, question_params) }
      it { should be_valid }
    end

    context 'when not valid' do
      context 'when title is blank' do
        subject { QuestionForm.new(questionnaire, no_title_params) }
        it { should be_invalid }
      end

      context 'when answers is blank' do
        subject { QuestionForm.new(questionnaire, no_answers_params)}
        it { should be_invalid }
      end
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

    it 'creates two parents' do
      expect {
        question_form.save
      }.to change { question_form.question.parents.count }.by(2)
    end
  end
end
