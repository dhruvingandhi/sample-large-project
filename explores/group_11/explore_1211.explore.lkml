# Explore: explore_1211
# Auto-generated LookML Explore File

include: "/views/domain_34/view_03634.view.lkml"
include: "/views/domain_36/view_03636.view.lkml"
include: "/views/domain_37/view_03637.view.lkml"
include: "/views/domain_38/view_03638.view.lkml"

explore: explore_1211 {
  label: "Explore Explore 1211"
  description: "Comprehensive analytics explore joining base view_03634 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03634
  
  always_filter: {
    filters: [view_03634.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03634.created_at_date: "7 days"]
    unless: [view_03634.id, view_03634.status]
  }

  join: view_03636 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03634.user_id} = ${view_03636.id} ;;
    required_joins: []
  }

  join: view_03637 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03634.account_id} = ${view_03637.account_id} ;;
    required_joins: [view_03636]
  }

  join: view_03638 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03634.category} = ${view_03638.category} ;;
  }

  access_filter: {
    field: view_03634.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03634.is_deleted} = false ;;
}
