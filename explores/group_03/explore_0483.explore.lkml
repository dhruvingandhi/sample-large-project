# Explore: explore_0483
# Auto-generated LookML Explore File

include: "/views/domain_50/view_01450.view.lkml"
include: "/views/domain_02/view_01452.view.lkml"
include: "/views/domain_03/view_01453.view.lkml"
include: "/views/domain_04/view_01454.view.lkml"

explore: explore_0483 {
  label: "Explore Explore 0483"
  description: "Comprehensive analytics explore joining base view_01450 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01450
  
  always_filter: {
    filters: [view_01450.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01450.created_at_date: "7 days"]
    unless: [view_01450.id, view_01450.status]
  }

  join: view_01452 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01450.user_id} = ${view_01452.id} ;;
    required_joins: []
  }

  join: view_01453 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01450.account_id} = ${view_01453.account_id} ;;
    required_joins: [view_01452]
  }

  join: view_01454 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01450.category} = ${view_01454.category} ;;
  }

  access_filter: {
    field: view_01450.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01450.is_deleted} = false ;;
}
