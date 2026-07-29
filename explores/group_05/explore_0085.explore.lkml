# Explore: explore_0085
# Auto-generated LookML Explore File

include: "/views/domain_06/view_00256.view.lkml"
include: "/views/domain_08/view_00258.view.lkml"
include: "/views/domain_09/view_00259.view.lkml"
include: "/views/domain_10/view_00260.view.lkml"

explore: explore_0085 {
  label: "Explore Explore 0085"
  description: "Comprehensive analytics explore joining base view_00256 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00256
  
  always_filter: {
    filters: [view_00256.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00256.created_at_date: "7 days"]
    unless: [view_00256.id, view_00256.status]
  }

  join: view_00258 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00256.user_id} = ${view_00258.id} ;;
    required_joins: []
  }

  join: view_00259 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00256.account_id} = ${view_00259.account_id} ;;
    required_joins: [view_00258]
  }

  join: view_00260 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00256.category} = ${view_00260.category} ;;
  }

  access_filter: {
    field: view_00256.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00256.is_deleted} = false ;;
}
