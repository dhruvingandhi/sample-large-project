# Explore: explore_3133
# Auto-generated LookML Explore File

include: "/views/domain_50/view_09400.view.lkml"
include: "/views/domain_02/view_09402.view.lkml"
include: "/views/domain_03/view_09403.view.lkml"
include: "/views/domain_04/view_09404.view.lkml"

explore: explore_3133 {
  label: "Explore Explore 3133"
  description: "Comprehensive analytics explore joining base view_09400 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09400
  
  always_filter: {
    filters: [view_09400.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09400.created_at_date: "7 days"]
    unless: [view_09400.id, view_09400.status]
  }

  join: view_09402 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09400.user_id} = ${view_09402.id} ;;
    required_joins: []
  }

  join: view_09403 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09400.account_id} = ${view_09403.account_id} ;;
    required_joins: [view_09402]
  }

  join: view_09404 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09400.category} = ${view_09404.category} ;;
  }

  access_filter: {
    field: view_09400.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09400.is_deleted} = false ;;
}
