# Update for 2000 file diff target
# Explore: explore_2518
# Auto-generated LookML Explore File

include: "/views/domain_05/view_07555.view.lkml"
include: "/views/domain_07/view_07557.view.lkml"
include: "/views/domain_08/view_07558.view.lkml"
include: "/views/domain_09/view_07559.view.lkml"

explore: explore_2518 {
  label: "Explore Explore 2518"
  description: "Comprehensive analytics explore joining base view_07555 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07555
  
  always_filter: {
    filters: [view_07555.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07555.created_at_date: "7 days"]
    unless: [view_07555.id, view_07555.status]
  }

  join: view_07557 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07555.user_id} = ${view_07557.id} ;;
    required_joins: []
  }

  join: view_07558 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07555.account_id} = ${view_07558.account_id} ;;
    required_joins: [view_07557]
  }

  join: view_07559 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07555.category} = ${view_07559.category} ;;
  }

  access_filter: {
    field: view_07555.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07555.is_deleted} = false ;;
}
