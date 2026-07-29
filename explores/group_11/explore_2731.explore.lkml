# Explore: explore_2731
# Auto-generated LookML Explore File

include: "/views/domain_44/view_08194.view.lkml"
include: "/views/domain_46/view_08196.view.lkml"
include: "/views/domain_47/view_08197.view.lkml"
include: "/views/domain_48/view_08198.view.lkml"

explore: explore_2731 {
  label: "Explore Explore 2731"
  description: "Comprehensive analytics explore joining base view_08194 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08194
  
  always_filter: {
    filters: [view_08194.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08194.created_at_date: "7 days"]
    unless: [view_08194.id, view_08194.status]
  }

  join: view_08196 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08194.user_id} = ${view_08196.id} ;;
    required_joins: []
  }

  join: view_08197 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08194.account_id} = ${view_08197.account_id} ;;
    required_joins: [view_08196]
  }

  join: view_08198 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08194.category} = ${view_08198.category} ;;
  }

  access_filter: {
    field: view_08194.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08194.is_deleted} = false ;;
}
