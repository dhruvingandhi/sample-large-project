# Explore: explore_2044
# Auto-generated LookML Explore File

include: "/views/domain_33/view_06133.view.lkml"
include: "/views/domain_35/view_06135.view.lkml"
include: "/views/domain_36/view_06136.view.lkml"
include: "/views/domain_37/view_06137.view.lkml"

explore: explore_2044 {
  label: "Explore Explore 2044"
  description: "Comprehensive analytics explore joining base view_06133 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06133
  
  always_filter: {
    filters: [view_06133.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06133.created_at_date: "7 days"]
    unless: [view_06133.id, view_06133.status]
  }

  join: view_06135 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06133.user_id} = ${view_06135.id} ;;
    required_joins: []
  }

  join: view_06136 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06133.account_id} = ${view_06136.account_id} ;;
    required_joins: [view_06135]
  }

  join: view_06137 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06133.category} = ${view_06137.category} ;;
  }

  access_filter: {
    field: view_06133.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06133.is_deleted} = false ;;
}
