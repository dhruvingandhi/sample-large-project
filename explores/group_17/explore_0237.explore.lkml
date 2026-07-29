# Explore: explore_0237
# Auto-generated LookML Explore File

include: "/views/domain_12/view_00712.view.lkml"
include: "/views/domain_14/view_00714.view.lkml"
include: "/views/domain_15/view_00715.view.lkml"
include: "/views/domain_16/view_00716.view.lkml"

explore: explore_0237 {
  label: "Explore Explore 0237"
  description: "Comprehensive analytics explore joining base view_00712 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00712
  
  always_filter: {
    filters: [view_00712.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00712.created_at_date: "7 days"]
    unless: [view_00712.id, view_00712.status]
  }

  join: view_00714 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00712.user_id} = ${view_00714.id} ;;
    required_joins: []
  }

  join: view_00715 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00712.account_id} = ${view_00715.account_id} ;;
    required_joins: [view_00714]
  }

  join: view_00716 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00712.category} = ${view_00716.category} ;;
  }

  access_filter: {
    field: view_00712.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00712.is_deleted} = false ;;
}
