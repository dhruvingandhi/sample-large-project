# Explore: explore_2669
# Auto-generated LookML Explore File

include: "/views/domain_08/view_08008.view.lkml"
include: "/views/domain_10/view_08010.view.lkml"
include: "/views/domain_11/view_08011.view.lkml"
include: "/views/domain_12/view_08012.view.lkml"

explore: explore_2669 {
  label: "Explore Explore 2669"
  description: "Comprehensive analytics explore joining base view_08008 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08008
  
  always_filter: {
    filters: [view_08008.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08008.created_at_date: "7 days"]
    unless: [view_08008.id, view_08008.status]
  }

  join: view_08010 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08008.user_id} = ${view_08010.id} ;;
    required_joins: []
  }

  join: view_08011 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08008.account_id} = ${view_08011.account_id} ;;
    required_joins: [view_08010]
  }

  join: view_08012 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08008.category} = ${view_08012.category} ;;
  }

  access_filter: {
    field: view_08008.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08008.is_deleted} = false ;;
}
