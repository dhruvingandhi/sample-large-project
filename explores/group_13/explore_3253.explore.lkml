# Explore: explore_3253
# Auto-generated LookML Explore File

include: "/views/domain_10/view_09760.view.lkml"
include: "/views/domain_12/view_09762.view.lkml"
include: "/views/domain_13/view_09763.view.lkml"
include: "/views/domain_14/view_09764.view.lkml"

explore: explore_3253 {
  label: "Explore Explore 3253"
  description: "Comprehensive analytics explore joining base view_09760 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09760
  
  always_filter: {
    filters: [view_09760.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09760.created_at_date: "7 days"]
    unless: [view_09760.id, view_09760.status]
  }

  join: view_09762 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09760.user_id} = ${view_09762.id} ;;
    required_joins: []
  }

  join: view_09763 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09760.account_id} = ${view_09763.account_id} ;;
    required_joins: [view_09762]
  }

  join: view_09764 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09760.category} = ${view_09764.category} ;;
  }

  access_filter: {
    field: view_09760.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09760.is_deleted} = false ;;
}
