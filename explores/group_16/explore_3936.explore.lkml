# Explore: explore_3936
# Auto-generated LookML Explore File

include: "/views/domain_09/view_11809.view.lkml"
include: "/views/domain_11/view_11811.view.lkml"
include: "/views/domain_12/view_11812.view.lkml"
include: "/views/domain_13/view_11813.view.lkml"

explore: explore_3936 {
  label: "Explore Explore 3936"
  description: "Comprehensive analytics explore joining base view_11809 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11809
  
  always_filter: {
    filters: [view_11809.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11809.created_at_date: "7 days"]
    unless: [view_11809.id, view_11809.status]
  }

  join: view_11811 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11809.user_id} = ${view_11811.id} ;;
    required_joins: []
  }

  join: view_11812 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11809.account_id} = ${view_11812.account_id} ;;
    required_joins: [view_11811]
  }

  join: view_11813 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11809.category} = ${view_11813.category} ;;
  }

  access_filter: {
    field: view_11809.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11809.is_deleted} = false ;;
}
