require 'spec_helper'

describe "Courses" do
  subject { page }
  
describe "index" do

    it { should have_title('Browse courses') }
    it { should have_content('Browse courses') }

    it "should list each course" do
      Course.all.each do |course|
        expect(page).to have_selector('li', text: course.name)
      end
    end
  end
  
	describe "pagination" do

	before(:all) { 30.times {(:course) } }
	after(:all)  { Course.delete_all }

	it { should have_selector('div.pagination') }

	it "should list each course" do
		Course.paginate(page: 1).each do |course|
        expect(page).to have_selector('li', text: course.name)
    	end
      end
    end
end
