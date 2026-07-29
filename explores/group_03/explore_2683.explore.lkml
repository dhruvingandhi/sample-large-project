# Explore: explore_2683
# Auto-generated LookML Explore File

include: "/views/domain_50/view_08050.view.lkml"
include: "/views/domain_02/view_08052.view.lkml"
include: "/views/domain_03/view_08053.view.lkml"
include: "/views/domain_04/view_08054.view.lkml"

explore: explore_2683 {
  label: "Explore Explore 2683"
  description: "Comprehensive analytics explore joining base view_08050 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08050
  
  always_filter: {
    filters: [view_08050.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08050.created_at_date: "7 days"]
    unless: [view_08050.id, view_08050.status]
  }

  join: view_08052 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08050.user_id} = ${view_08052.id} ;;
    required_joins: []
  }

  join: view_08053 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08050.account_id} = ${view_08053.account_id} ;;
    required_joins: [view_08052]
  }

  join: view_08054 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08050.category} = ${view_08054.category} ;;
  }

  access_filter: {
    field: view_08050.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08050.is_deleted} = false ;;
}
