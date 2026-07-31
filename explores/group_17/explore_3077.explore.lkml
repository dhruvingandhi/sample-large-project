# Update for 2000 file diff target
# Explore: explore_3077
# Auto-generated LookML Explore File

include: "/views/domain_32/view_09232.view.lkml"
include: "/views/domain_34/view_09234.view.lkml"
include: "/views/domain_35/view_09235.view.lkml"
include: "/views/domain_36/view_09236.view.lkml"

explore: explore_3077 {
  label: "Explore Explore 3077"
  description: "Comprehensive analytics explore joining base view_09232 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09232
  
  always_filter: {
    filters: [view_09232.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09232.created_at_date: "7 days"]
    unless: [view_09232.id, view_09232.status]
  }

  join: view_09234 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09232.user_id} = ${view_09234.id} ;;
    required_joins: []
  }

  join: view_09235 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09232.account_id} = ${view_09235.account_id} ;;
    required_joins: [view_09234]
  }

  join: view_09236 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09232.category} = ${view_09236.category} ;;
  }

  access_filter: {
    field: view_09232.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09232.is_deleted} = false ;;
}
