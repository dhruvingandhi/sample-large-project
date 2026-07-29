# Explore: explore_3058
# Auto-generated LookML Explore File

include: "/views/domain_25/view_09175.view.lkml"
include: "/views/domain_27/view_09177.view.lkml"
include: "/views/domain_28/view_09178.view.lkml"
include: "/views/domain_29/view_09179.view.lkml"

explore: explore_3058 {
  label: "Explore Explore 3058"
  description: "Comprehensive analytics explore joining base view_09175 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09175
  
  always_filter: {
    filters: [view_09175.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09175.created_at_date: "7 days"]
    unless: [view_09175.id, view_09175.status]
  }

  join: view_09177 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09175.user_id} = ${view_09177.id} ;;
    required_joins: []
  }

  join: view_09178 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09175.account_id} = ${view_09178.account_id} ;;
    required_joins: [view_09177]
  }

  join: view_09179 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09175.category} = ${view_09179.category} ;;
  }

  access_filter: {
    field: view_09175.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09175.is_deleted} = false ;;
}
