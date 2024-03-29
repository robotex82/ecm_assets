require 'spec_helper'

RSpec.configure do |c|
  c.include ActiveAdmin::SignInHelper
end

describe "AdminPages" do
  describe "GET /admin_pages" do
    before do
      @admin_user = FactoryGirl.create(:admin_user)
      sign_in @admin_user
    end

    describe "check all pages:" do
      all_admin_pages = Dir['spec/dummy/app/admin/*.rb'].map { |entry| entry[/[^\/]+\.rb/][0..-4] }
      excludes = %w( admin_users )

      if all_admin_pages.delete('dashboards')
        it 'dashboard' do
          get send("admin_dashboard_path")
          response.status.should be(200)
        end
      end

      all_admin_pages.delete_if { |admin_page| excludes.include?(admin_page) }.each do |path|
        it "#{path} -> INDEX" do
          get send("admin_#{path}_path")
          response.status.should be(200)
        end
      end

      all_admin_pages.each do |path|
        path = path.singularize
        it "#{path} -> NEW" do
          get send("new_admin_#{path}_path")
          response.status.should be(200)
        end

        it "#{path} -> CREATE" do
          #not just attributes_for, because then associated ids are not set up
#         attributes = FactoryGirl.build(path).attributes
          instance = FactoryGirl.build(path)
          attributes = instance.attributes.reject() { |k, v| !instance.class.accessible_attributes.include?(k) }
          #user should have password, generated with #attributes_for
          attributes.merge!(FactoryGirl.attributes_for(:admin_user)) if path == 'admin_user'
          post send("admin_#{path.pluralize}_path"),
               { path => attributes }
          response.status.should be(302)
          response.should redirect_to(:action => :show, :id => assigns(path))
        end

        it "#{path} -> EDIT" do
          get send("edit_admin_#{path}_path", FactoryGirl.create(path))
          response.status.should be(200)
        end

        it "#{path} -> UPDATE" do
          object = FactoryGirl.create(path)
          attributes = FactoryGirl.attributes_for(path)
          #except password for admin user
          attributes.except!(:password, :password_confirmation) if path == 'admin_user'
          put send("admin_#{path}_path", object),
               { path => attributes }
          response.status.should be(302)
          updated_object = assigns(path)
          response.should redirect_to(:action => :show, :id => updated_object)
          attributes.each do |k,v|
            updated_object[k].should == v
          end
        end

        it "#{path} -> SHOW" do
          get send("admin_#{path}_path", FactoryGirl.create(path))
          response.status.should be(200)
        end

        it "#{path} -> DELETE" do
          delete send("admin_#{path}_path", FactoryGirl.create(path))
          response.status.should be(302)
        end
      end
    end
  end
end

