# Update for 2000 file diff target
# Explore: explore_0318
# Auto-generated LookML Explore File

include: "/views/domain_05/view_00955.view.lkml"
include: "/views/domain_07/view_00957.view.lkml"
include: "/views/domain_08/view_00958.view.lkml"
include: "/views/domain_09/view_00959.view.lkml"

explore: explore_0318 {
  label: "Explore Explore 0318"
  description: "Comprehensive analytics explore joining base view_00955 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00955
  
  always_filter: {
    filters: [view_00955.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00955.created_at_date: "7 days"]
    unless: [view_00955.id, view_00955.status]
  }

  join: view_00957 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00955.user_id} = ${view_00957.id} ;;
    required_joins: []
  }

  join: view_00958 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00955.account_id} = ${view_00958.account_id} ;;
    required_joins: [view_00957]
  }

  join: view_00959 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00955.category} = ${view_00959.category} ;;
  }

  access_filter: {
    field: view_00955.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00955.is_deleted} = false ;;
}
