# Explore: explore_0831
# Auto-generated LookML Explore File

include: "/views/domain_44/view_02494.view.lkml"
include: "/views/domain_46/view_02496.view.lkml"
include: "/views/domain_47/view_02497.view.lkml"
include: "/views/domain_48/view_02498.view.lkml"

explore: explore_0831 {
  label: "Explore Explore 0831"
  description: "Comprehensive analytics explore joining base view_02494 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02494
  
  always_filter: {
    filters: [view_02494.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02494.created_at_date: "7 days"]
    unless: [view_02494.id, view_02494.status]
  }

  join: view_02496 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02494.user_id} = ${view_02496.id} ;;
    required_joins: []
  }

  join: view_02497 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02494.account_id} = ${view_02497.account_id} ;;
    required_joins: [view_02496]
  }

  join: view_02498 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02494.category} = ${view_02498.category} ;;
  }

  access_filter: {
    field: view_02494.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02494.is_deleted} = false ;;
}
