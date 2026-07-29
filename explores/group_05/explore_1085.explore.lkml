# Explore: explore_1085
# Auto-generated LookML Explore File

include: "/views/domain_06/view_03256.view.lkml"
include: "/views/domain_08/view_03258.view.lkml"
include: "/views/domain_09/view_03259.view.lkml"
include: "/views/domain_10/view_03260.view.lkml"

explore: explore_1085 {
  label: "Explore Explore 1085"
  description: "Comprehensive analytics explore joining base view_03256 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03256
  
  always_filter: {
    filters: [view_03256.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03256.created_at_date: "7 days"]
    unless: [view_03256.id, view_03256.status]
  }

  join: view_03258 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03256.user_id} = ${view_03258.id} ;;
    required_joins: []
  }

  join: view_03259 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03256.account_id} = ${view_03259.account_id} ;;
    required_joins: [view_03258]
  }

  join: view_03260 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03256.category} = ${view_03260.category} ;;
  }

  access_filter: {
    field: view_03256.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03256.is_deleted} = false ;;
}
