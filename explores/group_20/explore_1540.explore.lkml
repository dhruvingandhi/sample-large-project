# Update for 2000 file diff target
# Explore: explore_1540
# Auto-generated LookML Explore File

include: "/views/domain_21/view_04621.view.lkml"
include: "/views/domain_23/view_04623.view.lkml"
include: "/views/domain_24/view_04624.view.lkml"
include: "/views/domain_25/view_04625.view.lkml"

explore: explore_1540 {
  label: "Explore Explore 1540"
  description: "Comprehensive analytics explore joining base view_04621 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04621
  
  always_filter: {
    filters: [view_04621.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04621.created_at_date: "7 days"]
    unless: [view_04621.id, view_04621.status]
  }

  join: view_04623 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04621.user_id} = ${view_04623.id} ;;
    required_joins: []
  }

  join: view_04624 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04621.account_id} = ${view_04624.account_id} ;;
    required_joins: [view_04623]
  }

  join: view_04625 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04621.category} = ${view_04625.category} ;;
  }

  access_filter: {
    field: view_04621.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04621.is_deleted} = false ;;
}
