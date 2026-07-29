# Explore: explore_3153
# Auto-generated LookML Explore File

include: "/views/domain_10/view_09460.view.lkml"
include: "/views/domain_12/view_09462.view.lkml"
include: "/views/domain_13/view_09463.view.lkml"
include: "/views/domain_14/view_09464.view.lkml"

explore: explore_3153 {
  label: "Explore Explore 3153"
  description: "Comprehensive analytics explore joining base view_09460 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09460
  
  always_filter: {
    filters: [view_09460.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09460.created_at_date: "7 days"]
    unless: [view_09460.id, view_09460.status]
  }

  join: view_09462 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09460.user_id} = ${view_09462.id} ;;
    required_joins: []
  }

  join: view_09463 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09460.account_id} = ${view_09463.account_id} ;;
    required_joins: [view_09462]
  }

  join: view_09464 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09460.category} = ${view_09464.category} ;;
  }

  access_filter: {
    field: view_09460.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09460.is_deleted} = false ;;
}
