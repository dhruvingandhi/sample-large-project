# Explore: explore_3765
# Auto-generated LookML Explore File

include: "/views/domain_46/view_11296.view.lkml"
include: "/views/domain_48/view_11298.view.lkml"
include: "/views/domain_49/view_11299.view.lkml"
include: "/views/domain_50/view_11300.view.lkml"

explore: explore_3765 {
  label: "Explore Explore 3765"
  description: "Comprehensive analytics explore joining base view_11296 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11296
  
  always_filter: {
    filters: [view_11296.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11296.created_at_date: "7 days"]
    unless: [view_11296.id, view_11296.status]
  }

  join: view_11298 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11296.user_id} = ${view_11298.id} ;;
    required_joins: []
  }

  join: view_11299 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11296.account_id} = ${view_11299.account_id} ;;
    required_joins: [view_11298]
  }

  join: view_11300 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11296.category} = ${view_11300.category} ;;
  }

  access_filter: {
    field: view_11296.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11296.is_deleted} = false ;;
}
