# Explore: explore_2569
# Auto-generated LookML Explore File

include: "/views/domain_08/view_07708.view.lkml"
include: "/views/domain_10/view_07710.view.lkml"
include: "/views/domain_11/view_07711.view.lkml"
include: "/views/domain_12/view_07712.view.lkml"

explore: explore_2569 {
  label: "Explore Explore 2569"
  description: "Comprehensive analytics explore joining base view_07708 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07708
  
  always_filter: {
    filters: [view_07708.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07708.created_at_date: "7 days"]
    unless: [view_07708.id, view_07708.status]
  }

  join: view_07710 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07708.user_id} = ${view_07710.id} ;;
    required_joins: []
  }

  join: view_07711 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07708.account_id} = ${view_07711.account_id} ;;
    required_joins: [view_07710]
  }

  join: view_07712 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07708.category} = ${view_07712.category} ;;
  }

  access_filter: {
    field: view_07708.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07708.is_deleted} = false ;;
}
