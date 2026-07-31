# Update for 2000 file diff target
# Explore: explore_0570
# Auto-generated LookML Explore File

include: "/views/domain_11/view_01711.view.lkml"
include: "/views/domain_13/view_01713.view.lkml"
include: "/views/domain_14/view_01714.view.lkml"
include: "/views/domain_15/view_01715.view.lkml"

explore: explore_0570 {
  label: "Explore Explore 0570"
  description: "Comprehensive analytics explore joining base view_01711 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01711
  
  always_filter: {
    filters: [view_01711.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01711.created_at_date: "7 days"]
    unless: [view_01711.id, view_01711.status]
  }

  join: view_01713 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01711.user_id} = ${view_01713.id} ;;
    required_joins: []
  }

  join: view_01714 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01711.account_id} = ${view_01714.account_id} ;;
    required_joins: [view_01713]
  }

  join: view_01715 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01711.category} = ${view_01715.category} ;;
  }

  access_filter: {
    field: view_01711.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01711.is_deleted} = false ;;
}
