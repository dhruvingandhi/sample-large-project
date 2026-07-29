# Explore: explore_2958
# Auto-generated LookML Explore File

include: "/views/domain_25/view_08875.view.lkml"
include: "/views/domain_27/view_08877.view.lkml"
include: "/views/domain_28/view_08878.view.lkml"
include: "/views/domain_29/view_08879.view.lkml"

explore: explore_2958 {
  label: "Explore Explore 2958"
  description: "Comprehensive analytics explore joining base view_08875 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08875
  
  always_filter: {
    filters: [view_08875.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08875.created_at_date: "7 days"]
    unless: [view_08875.id, view_08875.status]
  }

  join: view_08877 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08875.user_id} = ${view_08877.id} ;;
    required_joins: []
  }

  join: view_08878 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08875.account_id} = ${view_08878.account_id} ;;
    required_joins: [view_08877]
  }

  join: view_08879 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08875.category} = ${view_08879.category} ;;
  }

  access_filter: {
    field: view_08875.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08875.is_deleted} = false ;;
}
