# Explore: explore_3104
# Auto-generated LookML Explore File

include: "/views/domain_13/view_09313.view.lkml"
include: "/views/domain_15/view_09315.view.lkml"
include: "/views/domain_16/view_09316.view.lkml"
include: "/views/domain_17/view_09317.view.lkml"

explore: explore_3104 {
  label: "Explore Explore 3104"
  description: "Comprehensive analytics explore joining base view_09313 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09313
  
  always_filter: {
    filters: [view_09313.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09313.created_at_date: "7 days"]
    unless: [view_09313.id, view_09313.status]
  }

  join: view_09315 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09313.user_id} = ${view_09315.id} ;;
    required_joins: []
  }

  join: view_09316 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09313.account_id} = ${view_09316.account_id} ;;
    required_joins: [view_09315]
  }

  join: view_09317 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09313.category} = ${view_09317.category} ;;
  }

  access_filter: {
    field: view_09313.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09313.is_deleted} = false ;;
}
