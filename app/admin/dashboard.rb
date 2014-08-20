ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    section "Recent Organizations" do
      table_for Organization.last(5) do
        column :name do |organization|
          link_to organization.name, [:admin, organization]
        end
        column :email
        column :address
      end
      strong { link_to "View all organizations", admin_organizations_path }
    end

    br
    br
    br

    section "Recent Events" do
      table_for Event.last(5) do
        column :name do |event|
          link_to event.name, [:admin, event]
        end
        column :date
        column :location
      end
      strong { link_to "View all events", admin_events_path }
    end 

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
