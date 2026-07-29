# Explore: explore_1444
# Auto-generated LookML Explore File

include: "/views/domain_33/view_04333.view.lkml"
include: "/views/domain_35/view_04335.view.lkml"
include: "/views/domain_36/view_04336.view.lkml"
include: "/views/domain_37/view_04337.view.lkml"

explore: explore_1444 {
  label: "Explore Explore 1444"
  description: "Comprehensive analytics explore joining base view_04333 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04333
  
  always_filter: {
    filters: [view_04333.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04333.created_at_date: "7 days"]
    unless: [view_04333.id, view_04333.status]
  }

  join: view_04335 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04333.user_id} = ${view_04335.id} ;;
    required_joins: []
  }

  join: view_04336 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04333.account_id} = ${view_04336.account_id} ;;
    required_joins: [view_04335]
  }

  join: view_04337 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04333.category} = ${view_04337.category} ;;
  }

  access_filter: {
    field: view_04333.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04333.is_deleted} = false ;;
}
