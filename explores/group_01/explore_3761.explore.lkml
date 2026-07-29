# Explore: explore_3761
# Auto-generated LookML Explore File

include: "/views/domain_34/view_11284.view.lkml"
include: "/views/domain_36/view_11286.view.lkml"
include: "/views/domain_37/view_11287.view.lkml"
include: "/views/domain_38/view_11288.view.lkml"

explore: explore_3761 {
  label: "Explore Explore 3761"
  description: "Comprehensive analytics explore joining base view_11284 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11284
  
  always_filter: {
    filters: [view_11284.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11284.created_at_date: "7 days"]
    unless: [view_11284.id, view_11284.status]
  }

  join: view_11286 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11284.user_id} = ${view_11286.id} ;;
    required_joins: []
  }

  join: view_11287 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11284.account_id} = ${view_11287.account_id} ;;
    required_joins: [view_11286]
  }

  join: view_11288 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11284.category} = ${view_11288.category} ;;
  }

  access_filter: {
    field: view_11284.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11284.is_deleted} = false ;;
}
