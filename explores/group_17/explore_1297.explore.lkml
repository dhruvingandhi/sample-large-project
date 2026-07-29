# Explore: explore_1297
# Auto-generated LookML Explore File

include: "/views/domain_42/view_03892.view.lkml"
include: "/views/domain_44/view_03894.view.lkml"
include: "/views/domain_45/view_03895.view.lkml"
include: "/views/domain_46/view_03896.view.lkml"

explore: explore_1297 {
  label: "Explore Explore 1297"
  description: "Comprehensive analytics explore joining base view_03892 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03892
  
  always_filter: {
    filters: [view_03892.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03892.created_at_date: "7 days"]
    unless: [view_03892.id, view_03892.status]
  }

  join: view_03894 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03892.user_id} = ${view_03894.id} ;;
    required_joins: []
  }

  join: view_03895 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03892.account_id} = ${view_03895.account_id} ;;
    required_joins: [view_03894]
  }

  join: view_03896 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03892.category} = ${view_03896.category} ;;
  }

  access_filter: {
    field: view_03892.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03892.is_deleted} = false ;;
}
