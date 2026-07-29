# Explore: explore_3864
# Auto-generated LookML Explore File

include: "/views/domain_43/view_11593.view.lkml"
include: "/views/domain_45/view_11595.view.lkml"
include: "/views/domain_46/view_11596.view.lkml"
include: "/views/domain_47/view_11597.view.lkml"

explore: explore_3864 {
  label: "Explore Explore 3864"
  description: "Comprehensive analytics explore joining base view_11593 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11593
  
  always_filter: {
    filters: [view_11593.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11593.created_at_date: "7 days"]
    unless: [view_11593.id, view_11593.status]
  }

  join: view_11595 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11593.user_id} = ${view_11595.id} ;;
    required_joins: []
  }

  join: view_11596 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11593.account_id} = ${view_11596.account_id} ;;
    required_joins: [view_11595]
  }

  join: view_11597 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11593.category} = ${view_11597.category} ;;
  }

  access_filter: {
    field: view_11593.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11593.is_deleted} = false ;;
}
