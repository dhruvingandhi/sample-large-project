# Update for 2000 file diff target
# Explore: explore_3097
# Auto-generated LookML Explore File

include: "/views/domain_42/view_09292.view.lkml"
include: "/views/domain_44/view_09294.view.lkml"
include: "/views/domain_45/view_09295.view.lkml"
include: "/views/domain_46/view_09296.view.lkml"

explore: explore_3097 {
  label: "Explore Explore 3097"
  description: "Comprehensive analytics explore joining base view_09292 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09292
  
  always_filter: {
    filters: [view_09292.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09292.created_at_date: "7 days"]
    unless: [view_09292.id, view_09292.status]
  }

  join: view_09294 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09292.user_id} = ${view_09294.id} ;;
    required_joins: []
  }

  join: view_09295 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09292.account_id} = ${view_09295.account_id} ;;
    required_joins: [view_09294]
  }

  join: view_09296 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09292.category} = ${view_09296.category} ;;
  }

  access_filter: {
    field: view_09292.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09292.is_deleted} = false ;;
}
