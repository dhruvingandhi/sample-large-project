# Explore: explore_0091
# Auto-generated LookML Explore File

include: "/views/domain_24/view_00274.view.lkml"
include: "/views/domain_26/view_00276.view.lkml"
include: "/views/domain_27/view_00277.view.lkml"
include: "/views/domain_28/view_00278.view.lkml"

explore: explore_0091 {
  label: "Explore Explore 0091"
  description: "Comprehensive analytics explore joining base view_00274 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00274
  
  always_filter: {
    filters: [view_00274.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00274.created_at_date: "7 days"]
    unless: [view_00274.id, view_00274.status]
  }

  join: view_00276 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00274.user_id} = ${view_00276.id} ;;
    required_joins: []
  }

  join: view_00277 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00274.account_id} = ${view_00277.account_id} ;;
    required_joins: [view_00276]
  }

  join: view_00278 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00274.category} = ${view_00278.category} ;;
  }

  access_filter: {
    field: view_00274.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00274.is_deleted} = false ;;
}
