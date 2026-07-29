# Explore: explore_2974
# Auto-generated LookML Explore File

include: "/views/domain_23/view_08923.view.lkml"
include: "/views/domain_25/view_08925.view.lkml"
include: "/views/domain_26/view_08926.view.lkml"
include: "/views/domain_27/view_08927.view.lkml"

explore: explore_2974 {
  label: "Explore Explore 2974"
  description: "Comprehensive analytics explore joining base view_08923 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08923
  
  always_filter: {
    filters: [view_08923.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08923.created_at_date: "7 days"]
    unless: [view_08923.id, view_08923.status]
  }

  join: view_08925 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08923.user_id} = ${view_08925.id} ;;
    required_joins: []
  }

  join: view_08926 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08923.account_id} = ${view_08926.account_id} ;;
    required_joins: [view_08925]
  }

  join: view_08927 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08923.category} = ${view_08927.category} ;;
  }

  access_filter: {
    field: view_08923.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08923.is_deleted} = false ;;
}
