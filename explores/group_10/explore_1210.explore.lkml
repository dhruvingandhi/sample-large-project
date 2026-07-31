# Update for 2000 file diff target
# Explore: explore_1210
# Auto-generated LookML Explore File

include: "/views/domain_31/view_03631.view.lkml"
include: "/views/domain_33/view_03633.view.lkml"
include: "/views/domain_34/view_03634.view.lkml"
include: "/views/domain_35/view_03635.view.lkml"

explore: explore_1210 {
  label: "Explore Explore 1210"
  description: "Comprehensive analytics explore joining base view_03631 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03631
  
  always_filter: {
    filters: [view_03631.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03631.created_at_date: "7 days"]
    unless: [view_03631.id, view_03631.status]
  }

  join: view_03633 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03631.user_id} = ${view_03633.id} ;;
    required_joins: []
  }

  join: view_03634 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03631.account_id} = ${view_03634.account_id} ;;
    required_joins: [view_03633]
  }

  join: view_03635 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03631.category} = ${view_03635.category} ;;
  }

  access_filter: {
    field: view_03631.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03631.is_deleted} = false ;;
}
