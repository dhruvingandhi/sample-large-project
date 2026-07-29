# Explore: explore_3171
# Auto-generated LookML Explore File

include: "/views/domain_14/view_09514.view.lkml"
include: "/views/domain_16/view_09516.view.lkml"
include: "/views/domain_17/view_09517.view.lkml"
include: "/views/domain_18/view_09518.view.lkml"

explore: explore_3171 {
  label: "Explore Explore 3171"
  description: "Comprehensive analytics explore joining base view_09514 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09514
  
  always_filter: {
    filters: [view_09514.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09514.created_at_date: "7 days"]
    unless: [view_09514.id, view_09514.status]
  }

  join: view_09516 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09514.user_id} = ${view_09516.id} ;;
    required_joins: []
  }

  join: view_09517 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09514.account_id} = ${view_09517.account_id} ;;
    required_joins: [view_09516]
  }

  join: view_09518 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09514.category} = ${view_09518.category} ;;
  }

  access_filter: {
    field: view_09514.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09514.is_deleted} = false ;;
}
