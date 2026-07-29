# Explore: explore_0297
# Auto-generated LookML Explore File

include: "/views/domain_42/view_00892.view.lkml"
include: "/views/domain_44/view_00894.view.lkml"
include: "/views/domain_45/view_00895.view.lkml"
include: "/views/domain_46/view_00896.view.lkml"

explore: explore_0297 {
  label: "Explore Explore 0297"
  description: "Comprehensive analytics explore joining base view_00892 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00892
  
  always_filter: {
    filters: [view_00892.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00892.created_at_date: "7 days"]
    unless: [view_00892.id, view_00892.status]
  }

  join: view_00894 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00892.user_id} = ${view_00894.id} ;;
    required_joins: []
  }

  join: view_00895 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00892.account_id} = ${view_00895.account_id} ;;
    required_joins: [view_00894]
  }

  join: view_00896 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00892.category} = ${view_00896.category} ;;
  }

  access_filter: {
    field: view_00892.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00892.is_deleted} = false ;;
}
