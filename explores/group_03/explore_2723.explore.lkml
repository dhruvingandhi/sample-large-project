# Explore: explore_2723
# Auto-generated LookML Explore File

include: "/views/domain_20/view_08170.view.lkml"
include: "/views/domain_22/view_08172.view.lkml"
include: "/views/domain_23/view_08173.view.lkml"
include: "/views/domain_24/view_08174.view.lkml"

explore: explore_2723 {
  label: "Explore Explore 2723"
  description: "Comprehensive analytics explore joining base view_08170 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08170
  
  always_filter: {
    filters: [view_08170.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08170.created_at_date: "7 days"]
    unless: [view_08170.id, view_08170.status]
  }

  join: view_08172 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08170.user_id} = ${view_08172.id} ;;
    required_joins: []
  }

  join: view_08173 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08170.account_id} = ${view_08173.account_id} ;;
    required_joins: [view_08172]
  }

  join: view_08174 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08170.category} = ${view_08174.category} ;;
  }

  access_filter: {
    field: view_08170.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08170.is_deleted} = false ;;
}
