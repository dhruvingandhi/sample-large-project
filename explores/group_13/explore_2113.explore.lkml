# Explore: explore_2113
# Auto-generated LookML Explore File

include: "/views/domain_40/view_06340.view.lkml"
include: "/views/domain_42/view_06342.view.lkml"
include: "/views/domain_43/view_06343.view.lkml"
include: "/views/domain_44/view_06344.view.lkml"

explore: explore_2113 {
  label: "Explore Explore 2113"
  description: "Comprehensive analytics explore joining base view_06340 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06340
  
  always_filter: {
    filters: [view_06340.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06340.created_at_date: "7 days"]
    unless: [view_06340.id, view_06340.status]
  }

  join: view_06342 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06340.user_id} = ${view_06342.id} ;;
    required_joins: []
  }

  join: view_06343 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06340.account_id} = ${view_06343.account_id} ;;
    required_joins: [view_06342]
  }

  join: view_06344 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06340.category} = ${view_06344.category} ;;
  }

  access_filter: {
    field: view_06340.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06340.is_deleted} = false ;;
}
