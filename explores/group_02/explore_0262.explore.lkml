# Explore: explore_0262
# Auto-generated LookML Explore File

include: "/views/domain_37/view_00787.view.lkml"
include: "/views/domain_39/view_00789.view.lkml"
include: "/views/domain_40/view_00790.view.lkml"
include: "/views/domain_41/view_00791.view.lkml"

explore: explore_0262 {
  label: "Explore Explore 0262"
  description: "Comprehensive analytics explore joining base view_00787 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00787
  
  always_filter: {
    filters: [view_00787.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00787.created_at_date: "7 days"]
    unless: [view_00787.id, view_00787.status]
  }

  join: view_00789 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00787.user_id} = ${view_00789.id} ;;
    required_joins: []
  }

  join: view_00790 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00787.account_id} = ${view_00790.account_id} ;;
    required_joins: [view_00789]
  }

  join: view_00791 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00787.category} = ${view_00791.category} ;;
  }

  access_filter: {
    field: view_00787.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00787.is_deleted} = false ;;
}
