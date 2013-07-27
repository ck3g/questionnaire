require 'spec_helper'

describe QuestionnairesController do
  describe 'GET #index' do
    before { get :index }
    it { should respond_with :success }
    it { should render_template :index }
  end
end
