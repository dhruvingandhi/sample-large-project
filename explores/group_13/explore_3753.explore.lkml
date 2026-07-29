# Explore: explore_3753
# Auto-generated LookML Explore File

include: "/views/domain_10/view_11260.view.lkml"
include: "/views/domain_12/view_11262.view.lkml"
include: "/views/domain_13/view_11263.view.lkml"
include: "/views/domain_14/view_11264.view.lkml"

explore: explore_3753 {
  label: "Explore Explore 3753"
  description: "Comprehensive analytics explore joining base view_11260 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11260
  
  always_filter: {
    filters: [view_11260.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11260.created_at_date: "7 days"]
    unless: [view_11260.id, view_11260.status]
  }

  join: view_11262 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11260.user_id} = ${view_11262.id} ;;
    required_joins: []
  }

  join: view_11263 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11260.account_id} = ${view_11263.account_id} ;;
    required_joins: [view_11262]
  }

  join: view_11264 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11260.category} = ${view_11264.category} ;;
  }

  access_filter: {
    field: view_11260.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11260.is_deleted} = false ;;
}
