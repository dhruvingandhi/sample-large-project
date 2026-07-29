# Explore: explore_2438
# Auto-generated LookML Explore File

include: "/views/domain_15/view_07315.view.lkml"
include: "/views/domain_17/view_07317.view.lkml"
include: "/views/domain_18/view_07318.view.lkml"
include: "/views/domain_19/view_07319.view.lkml"

explore: explore_2438 {
  label: "Explore Explore 2438"
  description: "Comprehensive analytics explore joining base view_07315 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07315
  
  always_filter: {
    filters: [view_07315.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07315.created_at_date: "7 days"]
    unless: [view_07315.id, view_07315.status]
  }

  join: view_07317 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07315.user_id} = ${view_07317.id} ;;
    required_joins: []
  }

  join: view_07318 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07315.account_id} = ${view_07318.account_id} ;;
    required_joins: [view_07317]
  }

  join: view_07319 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07315.category} = ${view_07319.category} ;;
  }

  access_filter: {
    field: view_07315.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07315.is_deleted} = false ;;
}
