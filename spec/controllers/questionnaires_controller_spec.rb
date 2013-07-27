require 'spec_helper'

describe QuestionnairesController do
  describe 'GET #index' do
    before { get :index }
    it { should respond_with :success }
    it { should render_template :index }
  end

  describe 'GET #show' do
    let!(:questionnaire) { create :questionnaire }
    before { get :show, id: questionnaire }
    it { should respond_with :success }
    it { should render_template :show }
  end

  describe 'GET #new' do
    before { get :new }
    it { should respond_with :success }
    it { should render_template :new }
  end
end
