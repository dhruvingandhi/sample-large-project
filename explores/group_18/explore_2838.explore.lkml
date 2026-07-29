# Explore: explore_2838
# Auto-generated LookML Explore File

include: "/views/domain_15/view_08515.view.lkml"
include: "/views/domain_17/view_08517.view.lkml"
include: "/views/domain_18/view_08518.view.lkml"
include: "/views/domain_19/view_08519.view.lkml"

explore: explore_2838 {
  label: "Explore Explore 2838"
  description: "Comprehensive analytics explore joining base view_08515 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08515
  
  always_filter: {
    filters: [view_08515.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08515.created_at_date: "7 days"]
    unless: [view_08515.id, view_08515.status]
  }

  join: view_08517 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08515.user_id} = ${view_08517.id} ;;
    required_joins: []
  }

  join: view_08518 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08515.account_id} = ${view_08518.account_id} ;;
    required_joins: [view_08517]
  }

  join: view_08519 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08515.category} = ${view_08519.category} ;;
  }

  access_filter: {
    field: view_08515.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08515.is_deleted} = false ;;
}
