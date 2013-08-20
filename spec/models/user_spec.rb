require 'spec_helper'

describe User do
  let(:user){create(:user)}

  context 'having to do with permissions and roles' do

    it 'should know whether they are an admin?' do
      user.role = "admin"

      user.admin?.should == true
    end

    it 'should know whether they are an student?' do
      user.role = "student"

      user.student?.should == true
    end  

    it 'should know whether they are an guest?' do
      user.role = "guest"

      user.guest?.should == true
    end
  end

  context 'has to do with relationships and jobs' do
    it "should have a relationship with a job" do

      job = Job.new

      interview = user.relationships.build(:job => job)
      user.save

      user.relationship_for_job(job).should == interview
    end
    
    it "should not return another users relationship to a job" do
      false_user = create(:user)

      job = Job.new

      interview = user.relationships.build(:job => job)
      user.save

      false_user.relationship_for_job(job).should_not == interview
    end
  end
end