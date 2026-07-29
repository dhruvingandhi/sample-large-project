# Explore: explore_0594
# Auto-generated LookML Explore File

include: "/views/domain_33/view_01783.view.lkml"
include: "/views/domain_35/view_01785.view.lkml"
include: "/views/domain_36/view_01786.view.lkml"
include: "/views/domain_37/view_01787.view.lkml"

explore: explore_0594 {
  label: "Explore Explore 0594"
  description: "Comprehensive analytics explore joining base view_01783 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01783
  
  always_filter: {
    filters: [view_01783.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01783.created_at_date: "7 days"]
    unless: [view_01783.id, view_01783.status]
  }

  join: view_01785 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01783.user_id} = ${view_01785.id} ;;
    required_joins: []
  }

  join: view_01786 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01783.account_id} = ${view_01786.account_id} ;;
    required_joins: [view_01785]
  }

  join: view_01787 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01783.category} = ${view_01787.category} ;;
  }

  access_filter: {
    field: view_01783.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01783.is_deleted} = false ;;
}
