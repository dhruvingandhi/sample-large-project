# Explore: explore_3215
# Auto-generated LookML Explore File

include: "/views/domain_46/view_09646.view.lkml"
include: "/views/domain_48/view_09648.view.lkml"
include: "/views/domain_49/view_09649.view.lkml"
include: "/views/domain_50/view_09650.view.lkml"

explore: explore_3215 {
  label: "Explore Explore 3215"
  description: "Comprehensive analytics explore joining base view_09646 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09646
  
  always_filter: {
    filters: [view_09646.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09646.created_at_date: "7 days"]
    unless: [view_09646.id, view_09646.status]
  }

  join: view_09648 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09646.user_id} = ${view_09648.id} ;;
    required_joins: []
  }

  join: view_09649 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09646.account_id} = ${view_09649.account_id} ;;
    required_joins: [view_09648]
  }

  join: view_09650 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09646.category} = ${view_09650.category} ;;
  }

  access_filter: {
    field: view_09646.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09646.is_deleted} = false ;;
}
