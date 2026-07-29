# Explore: explore_0157
# Auto-generated LookML Explore File

include: "/views/domain_22/view_00472.view.lkml"
include: "/views/domain_24/view_00474.view.lkml"
include: "/views/domain_25/view_00475.view.lkml"
include: "/views/domain_26/view_00476.view.lkml"

explore: explore_0157 {
  label: "Explore Explore 0157"
  description: "Comprehensive analytics explore joining base view_00472 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00472
  
  always_filter: {
    filters: [view_00472.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00472.created_at_date: "7 days"]
    unless: [view_00472.id, view_00472.status]
  }

  join: view_00474 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00472.user_id} = ${view_00474.id} ;;
    required_joins: []
  }

  join: view_00475 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00472.account_id} = ${view_00475.account_id} ;;
    required_joins: [view_00474]
  }

  join: view_00476 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00472.category} = ${view_00476.category} ;;
  }

  access_filter: {
    field: view_00472.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00472.is_deleted} = false ;;
}
