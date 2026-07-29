# Explore: explore_1165
# Auto-generated LookML Explore File

include: "/views/domain_46/view_03496.view.lkml"
include: "/views/domain_48/view_03498.view.lkml"
include: "/views/domain_49/view_03499.view.lkml"
include: "/views/domain_50/view_03500.view.lkml"

explore: explore_1165 {
  label: "Explore Explore 1165"
  description: "Comprehensive analytics explore joining base view_03496 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03496
  
  always_filter: {
    filters: [view_03496.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03496.created_at_date: "7 days"]
    unless: [view_03496.id, view_03496.status]
  }

  join: view_03498 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03496.user_id} = ${view_03498.id} ;;
    required_joins: []
  }

  join: view_03499 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03496.account_id} = ${view_03499.account_id} ;;
    required_joins: [view_03498]
  }

  join: view_03500 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03496.category} = ${view_03500.category} ;;
  }

  access_filter: {
    field: view_03496.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03496.is_deleted} = false ;;
}
