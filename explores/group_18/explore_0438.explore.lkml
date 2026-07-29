# Explore: explore_0438
# Auto-generated LookML Explore File

include: "/views/domain_15/view_01315.view.lkml"
include: "/views/domain_17/view_01317.view.lkml"
include: "/views/domain_18/view_01318.view.lkml"
include: "/views/domain_19/view_01319.view.lkml"

explore: explore_0438 {
  label: "Explore Explore 0438"
  description: "Comprehensive analytics explore joining base view_01315 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01315
  
  always_filter: {
    filters: [view_01315.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01315.created_at_date: "7 days"]
    unless: [view_01315.id, view_01315.status]
  }

  join: view_01317 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01315.user_id} = ${view_01317.id} ;;
    required_joins: []
  }

  join: view_01318 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01315.account_id} = ${view_01318.account_id} ;;
    required_joins: [view_01317]
  }

  join: view_01319 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01315.category} = ${view_01319.category} ;;
  }

  access_filter: {
    field: view_01315.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01315.is_deleted} = false ;;
}
