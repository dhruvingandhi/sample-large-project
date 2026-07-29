# Explore: explore_1934
# Auto-generated LookML Explore File

include: "/views/domain_03/view_05803.view.lkml"
include: "/views/domain_05/view_05805.view.lkml"
include: "/views/domain_06/view_05806.view.lkml"
include: "/views/domain_07/view_05807.view.lkml"

explore: explore_1934 {
  label: "Explore Explore 1934"
  description: "Comprehensive analytics explore joining base view_05803 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05803
  
  always_filter: {
    filters: [view_05803.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05803.created_at_date: "7 days"]
    unless: [view_05803.id, view_05803.status]
  }

  join: view_05805 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05803.user_id} = ${view_05805.id} ;;
    required_joins: []
  }

  join: view_05806 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05803.account_id} = ${view_05806.account_id} ;;
    required_joins: [view_05805]
  }

  join: view_05807 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05803.category} = ${view_05807.category} ;;
  }

  access_filter: {
    field: view_05803.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05803.is_deleted} = false ;;
}
