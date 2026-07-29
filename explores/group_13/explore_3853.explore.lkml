# Explore: explore_3853
# Auto-generated LookML Explore File

include: "/views/domain_10/view_11560.view.lkml"
include: "/views/domain_12/view_11562.view.lkml"
include: "/views/domain_13/view_11563.view.lkml"
include: "/views/domain_14/view_11564.view.lkml"

explore: explore_3853 {
  label: "Explore Explore 3853"
  description: "Comprehensive analytics explore joining base view_11560 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11560
  
  always_filter: {
    filters: [view_11560.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11560.created_at_date: "7 days"]
    unless: [view_11560.id, view_11560.status]
  }

  join: view_11562 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11560.user_id} = ${view_11562.id} ;;
    required_joins: []
  }

  join: view_11563 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11560.account_id} = ${view_11563.account_id} ;;
    required_joins: [view_11562]
  }

  join: view_11564 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11560.category} = ${view_11564.category} ;;
  }

  access_filter: {
    field: view_11560.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11560.is_deleted} = false ;;
}
