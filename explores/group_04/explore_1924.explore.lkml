# Explore: explore_1924
# Auto-generated LookML Explore File

include: "/views/domain_23/view_05773.view.lkml"
include: "/views/domain_25/view_05775.view.lkml"
include: "/views/domain_26/view_05776.view.lkml"
include: "/views/domain_27/view_05777.view.lkml"

explore: explore_1924 {
  label: "Explore Explore 1924"
  description: "Comprehensive analytics explore joining base view_05773 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_05773
  
  always_filter: {
    filters: [view_05773.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05773.created_at_date: "7 days"]
    unless: [view_05773.id, view_05773.status]
  }

  join: view_05775 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05773.user_id} = ${view_05775.id} ;;
    required_joins: []
  }

  join: view_05776 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05773.account_id} = ${view_05776.account_id} ;;
    required_joins: [view_05775]
  }

  join: view_05777 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05773.category} = ${view_05777.category} ;;
  }

  access_filter: {
    field: view_05773.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05773.is_deleted} = false ;;
}
