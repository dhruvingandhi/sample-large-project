# Explore: explore_2300
# Auto-generated LookML Explore File

include: "/views/domain_01/view_06901.view.lkml"
include: "/views/domain_03/view_06903.view.lkml"
include: "/views/domain_04/view_06904.view.lkml"
include: "/views/domain_05/view_06905.view.lkml"

explore: explore_2300 {
  label: "Explore Explore 2300"
  description: "Comprehensive analytics explore joining base view_06901 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06901
  
  always_filter: {
    filters: [view_06901.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06901.created_at_date: "7 days"]
    unless: [view_06901.id, view_06901.status]
  }

  join: view_06903 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06901.user_id} = ${view_06903.id} ;;
    required_joins: []
  }

  join: view_06904 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06901.account_id} = ${view_06904.account_id} ;;
    required_joins: [view_06903]
  }

  join: view_06905 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06901.category} = ${view_06905.category} ;;
  }

  access_filter: {
    field: view_06901.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06901.is_deleted} = false ;;
}
