# Explore: explore_3748
# Auto-generated LookML Explore File

include: "/views/domain_45/view_11245.view.lkml"
include: "/views/domain_47/view_11247.view.lkml"
include: "/views/domain_48/view_11248.view.lkml"
include: "/views/domain_49/view_11249.view.lkml"

explore: explore_3748 {
  label: "Explore Explore 3748"
  description: "Comprehensive analytics explore joining base view_11245 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11245
  
  always_filter: {
    filters: [view_11245.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11245.created_at_date: "7 days"]
    unless: [view_11245.id, view_11245.status]
  }

  join: view_11247 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11245.user_id} = ${view_11247.id} ;;
    required_joins: []
  }

  join: view_11248 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11245.account_id} = ${view_11248.account_id} ;;
    required_joins: [view_11247]
  }

  join: view_11249 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11245.category} = ${view_11249.category} ;;
  }

  access_filter: {
    field: view_11245.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11245.is_deleted} = false ;;
}
