# Update for 2000 file diff target
# Explore: explore_3610
# Auto-generated LookML Explore File

include: "/views/domain_31/view_10831.view.lkml"
include: "/views/domain_33/view_10833.view.lkml"
include: "/views/domain_34/view_10834.view.lkml"
include: "/views/domain_35/view_10835.view.lkml"

explore: explore_3610 {
  label: "Explore Explore 3610"
  description: "Comprehensive analytics explore joining base view_10831 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10831
  
  always_filter: {
    filters: [view_10831.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10831.created_at_date: "7 days"]
    unless: [view_10831.id, view_10831.status]
  }

  join: view_10833 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10831.user_id} = ${view_10833.id} ;;
    required_joins: []
  }

  join: view_10834 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10831.account_id} = ${view_10834.account_id} ;;
    required_joins: [view_10833]
  }

  join: view_10835 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10831.category} = ${view_10835.category} ;;
  }

  access_filter: {
    field: view_10831.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10831.is_deleted} = false ;;
}
