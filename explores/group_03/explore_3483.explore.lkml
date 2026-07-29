# Explore: explore_3483
# Auto-generated LookML Explore File

include: "/views/domain_50/view_10450.view.lkml"
include: "/views/domain_02/view_10452.view.lkml"
include: "/views/domain_03/view_10453.view.lkml"
include: "/views/domain_04/view_10454.view.lkml"

explore: explore_3483 {
  label: "Explore Explore 3483"
  description: "Comprehensive analytics explore joining base view_10450 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10450
  
  always_filter: {
    filters: [view_10450.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10450.created_at_date: "7 days"]
    unless: [view_10450.id, view_10450.status]
  }

  join: view_10452 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10450.user_id} = ${view_10452.id} ;;
    required_joins: []
  }

  join: view_10453 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10450.account_id} = ${view_10453.account_id} ;;
    required_joins: [view_10452]
  }

  join: view_10454 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10450.category} = ${view_10454.category} ;;
  }

  access_filter: {
    field: view_10450.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10450.is_deleted} = false ;;
}
