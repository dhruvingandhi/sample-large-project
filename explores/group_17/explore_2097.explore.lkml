# Update for 2000 file diff target
# Explore: explore_2097
# Auto-generated LookML Explore File

include: "/views/domain_42/view_06292.view.lkml"
include: "/views/domain_44/view_06294.view.lkml"
include: "/views/domain_45/view_06295.view.lkml"
include: "/views/domain_46/view_06296.view.lkml"

explore: explore_2097 {
  label: "Explore Explore 2097"
  description: "Comprehensive analytics explore joining base view_06292 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06292
  
  always_filter: {
    filters: [view_06292.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06292.created_at_date: "7 days"]
    unless: [view_06292.id, view_06292.status]
  }

  join: view_06294 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06292.user_id} = ${view_06294.id} ;;
    required_joins: []
  }

  join: view_06295 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06292.account_id} = ${view_06295.account_id} ;;
    required_joins: [view_06294]
  }

  join: view_06296 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06292.category} = ${view_06296.category} ;;
  }

  access_filter: {
    field: view_06292.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06292.is_deleted} = false ;;
}
