# Update for 2000 file diff target
# Explore: explore_2570
# Auto-generated LookML Explore File

include: "/views/domain_11/view_07711.view.lkml"
include: "/views/domain_13/view_07713.view.lkml"
include: "/views/domain_14/view_07714.view.lkml"
include: "/views/domain_15/view_07715.view.lkml"

explore: explore_2570 {
  label: "Explore Explore 2570"
  description: "Comprehensive analytics explore joining base view_07711 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07711
  
  always_filter: {
    filters: [view_07711.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07711.created_at_date: "7 days"]
    unless: [view_07711.id, view_07711.status]
  }

  join: view_07713 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07711.user_id} = ${view_07713.id} ;;
    required_joins: []
  }

  join: view_07714 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07711.account_id} = ${view_07714.account_id} ;;
    required_joins: [view_07713]
  }

  join: view_07715 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07711.category} = ${view_07715.category} ;;
  }

  access_filter: {
    field: view_07711.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07711.is_deleted} = false ;;
}
