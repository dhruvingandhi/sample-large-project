# Explore: explore_1967
# Auto-generated LookML Explore File

include: "/views/domain_02/view_05902.view.lkml"
include: "/views/domain_04/view_05904.view.lkml"
include: "/views/domain_05/view_05905.view.lkml"
include: "/views/domain_06/view_05906.view.lkml"

explore: explore_1967 {
  label: "Explore Explore 1967"
  description: "Comprehensive analytics explore joining base view_05902 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05902
  
  always_filter: {
    filters: [view_05902.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05902.created_at_date: "7 days"]
    unless: [view_05902.id, view_05902.status]
  }

  join: view_05904 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05902.user_id} = ${view_05904.id} ;;
    required_joins: []
  }

  join: view_05905 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05902.account_id} = ${view_05905.account_id} ;;
    required_joins: [view_05904]
  }

  join: view_05906 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05902.category} = ${view_05906.category} ;;
  }

  access_filter: {
    field: view_05902.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05902.is_deleted} = false ;;
}
