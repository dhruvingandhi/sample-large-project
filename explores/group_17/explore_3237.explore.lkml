# Explore: explore_3237
# Auto-generated LookML Explore File

include: "/views/domain_12/view_09712.view.lkml"
include: "/views/domain_14/view_09714.view.lkml"
include: "/views/domain_15/view_09715.view.lkml"
include: "/views/domain_16/view_09716.view.lkml"

explore: explore_3237 {
  label: "Explore Explore 3237"
  description: "Comprehensive analytics explore joining base view_09712 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09712
  
  always_filter: {
    filters: [view_09712.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09712.created_at_date: "7 days"]
    unless: [view_09712.id, view_09712.status]
  }

  join: view_09714 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09712.user_id} = ${view_09714.id} ;;
    required_joins: []
  }

  join: view_09715 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09712.account_id} = ${view_09715.account_id} ;;
    required_joins: [view_09714]
  }

  join: view_09716 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09712.category} = ${view_09716.category} ;;
  }

  access_filter: {
    field: view_09712.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09712.is_deleted} = false ;;
}
