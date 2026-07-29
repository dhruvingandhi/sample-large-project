# Explore: explore_2297
# Auto-generated LookML Explore File

include: "/views/domain_42/view_06892.view.lkml"
include: "/views/domain_44/view_06894.view.lkml"
include: "/views/domain_45/view_06895.view.lkml"
include: "/views/domain_46/view_06896.view.lkml"

explore: explore_2297 {
  label: "Explore Explore 2297"
  description: "Comprehensive analytics explore joining base view_06892 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06892
  
  always_filter: {
    filters: [view_06892.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06892.created_at_date: "7 days"]
    unless: [view_06892.id, view_06892.status]
  }

  join: view_06894 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06892.user_id} = ${view_06894.id} ;;
    required_joins: []
  }

  join: view_06895 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06892.account_id} = ${view_06895.account_id} ;;
    required_joins: [view_06894]
  }

  join: view_06896 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06892.category} = ${view_06896.category} ;;
  }

  access_filter: {
    field: view_06892.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06892.is_deleted} = false ;;
}
