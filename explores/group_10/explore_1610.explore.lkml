# Update for 2000 file diff target
# Explore: explore_1610
# Auto-generated LookML Explore File

include: "/views/domain_31/view_04831.view.lkml"
include: "/views/domain_33/view_04833.view.lkml"
include: "/views/domain_34/view_04834.view.lkml"
include: "/views/domain_35/view_04835.view.lkml"

explore: explore_1610 {
  label: "Explore Explore 1610"
  description: "Comprehensive analytics explore joining base view_04831 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04831
  
  always_filter: {
    filters: [view_04831.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04831.created_at_date: "7 days"]
    unless: [view_04831.id, view_04831.status]
  }

  join: view_04833 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04831.user_id} = ${view_04833.id} ;;
    required_joins: []
  }

  join: view_04834 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04831.account_id} = ${view_04834.account_id} ;;
    required_joins: [view_04833]
  }

  join: view_04835 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04831.category} = ${view_04835.category} ;;
  }

  access_filter: {
    field: view_04831.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04831.is_deleted} = false ;;
}
