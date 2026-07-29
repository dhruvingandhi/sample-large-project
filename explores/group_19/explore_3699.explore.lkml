# Explore: explore_3699
# Auto-generated LookML Explore File

include: "/views/domain_48/view_11098.view.lkml"
include: "/views/domain_50/view_11100.view.lkml"
include: "/views/domain_01/view_11101.view.lkml"
include: "/views/domain_02/view_11102.view.lkml"

explore: explore_3699 {
  label: "Explore Explore 3699"
  description: "Comprehensive analytics explore joining base view_11098 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11098
  
  always_filter: {
    filters: [view_11098.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11098.created_at_date: "7 days"]
    unless: [view_11098.id, view_11098.status]
  }

  join: view_11100 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11098.user_id} = ${view_11100.id} ;;
    required_joins: []
  }

  join: view_11101 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11098.account_id} = ${view_11101.account_id} ;;
    required_joins: [view_11100]
  }

  join: view_11102 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11098.category} = ${view_11102.category} ;;
  }

  access_filter: {
    field: view_11098.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11098.is_deleted} = false ;;
}
