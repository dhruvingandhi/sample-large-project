# Explore: explore_1619
# Auto-generated LookML Explore File

include: "/views/domain_08/view_04858.view.lkml"
include: "/views/domain_10/view_04860.view.lkml"
include: "/views/domain_11/view_04861.view.lkml"
include: "/views/domain_12/view_04862.view.lkml"

explore: explore_1619 {
  label: "Explore Explore 1619"
  description: "Comprehensive analytics explore joining base view_04858 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04858
  
  always_filter: {
    filters: [view_04858.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04858.created_at_date: "7 days"]
    unless: [view_04858.id, view_04858.status]
  }

  join: view_04860 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04858.user_id} = ${view_04860.id} ;;
    required_joins: []
  }

  join: view_04861 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04858.account_id} = ${view_04861.account_id} ;;
    required_joins: [view_04860]
  }

  join: view_04862 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04858.category} = ${view_04862.category} ;;
  }

  access_filter: {
    field: view_04858.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04858.is_deleted} = false ;;
}
