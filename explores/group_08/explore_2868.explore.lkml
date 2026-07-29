# Explore: explore_2868
# Auto-generated LookML Explore File

include: "/views/domain_05/view_08605.view.lkml"
include: "/views/domain_07/view_08607.view.lkml"
include: "/views/domain_08/view_08608.view.lkml"
include: "/views/domain_09/view_08609.view.lkml"

explore: explore_2868 {
  label: "Explore Explore 2868"
  description: "Comprehensive analytics explore joining base view_08605 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08605
  
  always_filter: {
    filters: [view_08605.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08605.created_at_date: "7 days"]
    unless: [view_08605.id, view_08605.status]
  }

  join: view_08607 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08605.user_id} = ${view_08607.id} ;;
    required_joins: []
  }

  join: view_08608 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08605.account_id} = ${view_08608.account_id} ;;
    required_joins: [view_08607]
  }

  join: view_08609 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08605.category} = ${view_08609.category} ;;
  }

  access_filter: {
    field: view_08605.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08605.is_deleted} = false ;;
}
