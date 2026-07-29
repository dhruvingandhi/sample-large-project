# Explore: explore_0731
# Auto-generated LookML Explore File

include: "/views/domain_44/view_02194.view.lkml"
include: "/views/domain_46/view_02196.view.lkml"
include: "/views/domain_47/view_02197.view.lkml"
include: "/views/domain_48/view_02198.view.lkml"

explore: explore_0731 {
  label: "Explore Explore 0731"
  description: "Comprehensive analytics explore joining base view_02194 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02194
  
  always_filter: {
    filters: [view_02194.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02194.created_at_date: "7 days"]
    unless: [view_02194.id, view_02194.status]
  }

  join: view_02196 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02194.user_id} = ${view_02196.id} ;;
    required_joins: []
  }

  join: view_02197 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02194.account_id} = ${view_02197.account_id} ;;
    required_joins: [view_02196]
  }

  join: view_02198 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02194.category} = ${view_02198.category} ;;
  }

  access_filter: {
    field: view_02194.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02194.is_deleted} = false ;;
}
