# Explore: explore_3795
# Auto-generated LookML Explore File

include: "/views/domain_36/view_11386.view.lkml"
include: "/views/domain_38/view_11388.view.lkml"
include: "/views/domain_39/view_11389.view.lkml"
include: "/views/domain_40/view_11390.view.lkml"

explore: explore_3795 {
  label: "Explore Explore 3795"
  description: "Comprehensive analytics explore joining base view_11386 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11386
  
  always_filter: {
    filters: [view_11386.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11386.created_at_date: "7 days"]
    unless: [view_11386.id, view_11386.status]
  }

  join: view_11388 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11386.user_id} = ${view_11388.id} ;;
    required_joins: []
  }

  join: view_11389 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11386.account_id} = ${view_11389.account_id} ;;
    required_joins: [view_11388]
  }

  join: view_11390 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11386.category} = ${view_11390.category} ;;
  }

  access_filter: {
    field: view_11386.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11386.is_deleted} = false ;;
}
