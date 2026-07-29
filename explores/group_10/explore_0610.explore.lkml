# Explore: explore_0610
# Auto-generated LookML Explore File

include: "/views/domain_31/view_01831.view.lkml"
include: "/views/domain_33/view_01833.view.lkml"
include: "/views/domain_34/view_01834.view.lkml"
include: "/views/domain_35/view_01835.view.lkml"

explore: explore_0610 {
  label: "Explore Explore 0610"
  description: "Comprehensive analytics explore joining base view_01831 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01831
  
  always_filter: {
    filters: [view_01831.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01831.created_at_date: "7 days"]
    unless: [view_01831.id, view_01831.status]
  }

  join: view_01833 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01831.user_id} = ${view_01833.id} ;;
    required_joins: []
  }

  join: view_01834 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01831.account_id} = ${view_01834.account_id} ;;
    required_joins: [view_01833]
  }

  join: view_01835 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01831.category} = ${view_01835.category} ;;
  }

  access_filter: {
    field: view_01831.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01831.is_deleted} = false ;;
}
