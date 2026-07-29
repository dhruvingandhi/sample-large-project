# Explore: explore_2519
# Auto-generated LookML Explore File

include: "/views/domain_08/view_07558.view.lkml"
include: "/views/domain_10/view_07560.view.lkml"
include: "/views/domain_11/view_07561.view.lkml"
include: "/views/domain_12/view_07562.view.lkml"

explore: explore_2519 {
  label: "Explore Explore 2519"
  description: "Comprehensive analytics explore joining base view_07558 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07558
  
  always_filter: {
    filters: [view_07558.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07558.created_at_date: "7 days"]
    unless: [view_07558.id, view_07558.status]
  }

  join: view_07560 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07558.user_id} = ${view_07560.id} ;;
    required_joins: []
  }

  join: view_07561 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07558.account_id} = ${view_07561.account_id} ;;
    required_joins: [view_07560]
  }

  join: view_07562 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07558.category} = ${view_07562.category} ;;
  }

  access_filter: {
    field: view_07558.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07558.is_deleted} = false ;;
}
