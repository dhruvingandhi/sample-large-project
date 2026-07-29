# Explore: explore_1654
# Auto-generated LookML Explore File

include: "/views/domain_13/view_04963.view.lkml"
include: "/views/domain_15/view_04965.view.lkml"
include: "/views/domain_16/view_04966.view.lkml"
include: "/views/domain_17/view_04967.view.lkml"

explore: explore_1654 {
  label: "Explore Explore 1654"
  description: "Comprehensive analytics explore joining base view_04963 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04963
  
  always_filter: {
    filters: [view_04963.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04963.created_at_date: "7 days"]
    unless: [view_04963.id, view_04963.status]
  }

  join: view_04965 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04963.user_id} = ${view_04965.id} ;;
    required_joins: []
  }

  join: view_04966 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04963.account_id} = ${view_04966.account_id} ;;
    required_joins: [view_04965]
  }

  join: view_04967 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04963.category} = ${view_04967.category} ;;
  }

  access_filter: {
    field: view_04963.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04963.is_deleted} = false ;;
}
