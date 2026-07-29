# Explore: explore_0097
# Auto-generated LookML Explore File

include: "/views/domain_42/view_00292.view.lkml"
include: "/views/domain_44/view_00294.view.lkml"
include: "/views/domain_45/view_00295.view.lkml"
include: "/views/domain_46/view_00296.view.lkml"

explore: explore_0097 {
  label: "Explore Explore 0097"
  description: "Comprehensive analytics explore joining base view_00292 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00292
  
  always_filter: {
    filters: [view_00292.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00292.created_at_date: "7 days"]
    unless: [view_00292.id, view_00292.status]
  }

  join: view_00294 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00292.user_id} = ${view_00294.id} ;;
    required_joins: []
  }

  join: view_00295 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00292.account_id} = ${view_00295.account_id} ;;
    required_joins: [view_00294]
  }

  join: view_00296 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00292.category} = ${view_00296.category} ;;
  }

  access_filter: {
    field: view_00292.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00292.is_deleted} = false ;;
}
