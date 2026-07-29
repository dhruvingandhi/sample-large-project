# Explore: explore_3276
# Auto-generated LookML Explore File

include: "/views/domain_29/view_09829.view.lkml"
include: "/views/domain_31/view_09831.view.lkml"
include: "/views/domain_32/view_09832.view.lkml"
include: "/views/domain_33/view_09833.view.lkml"

explore: explore_3276 {
  label: "Explore Explore 3276"
  description: "Comprehensive analytics explore joining base view_09829 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09829
  
  always_filter: {
    filters: [view_09829.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09829.created_at_date: "7 days"]
    unless: [view_09829.id, view_09829.status]
  }

  join: view_09831 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09829.user_id} = ${view_09831.id} ;;
    required_joins: []
  }

  join: view_09832 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09829.account_id} = ${view_09832.account_id} ;;
    required_joins: [view_09831]
  }

  join: view_09833 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09829.category} = ${view_09833.category} ;;
  }

  access_filter: {
    field: view_09829.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09829.is_deleted} = false ;;
}
