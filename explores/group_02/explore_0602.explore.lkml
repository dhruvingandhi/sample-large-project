# Explore: explore_0602
# Auto-generated LookML Explore File

include: "/views/domain_07/view_01807.view.lkml"
include: "/views/domain_09/view_01809.view.lkml"
include: "/views/domain_10/view_01810.view.lkml"
include: "/views/domain_11/view_01811.view.lkml"

explore: explore_0602 {
  label: "Explore Explore 0602"
  description: "Comprehensive analytics explore joining base view_01807 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01807
  
  always_filter: {
    filters: [view_01807.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01807.created_at_date: "7 days"]
    unless: [view_01807.id, view_01807.status]
  }

  join: view_01809 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01807.user_id} = ${view_01809.id} ;;
    required_joins: []
  }

  join: view_01810 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01807.account_id} = ${view_01810.account_id} ;;
    required_joins: [view_01809]
  }

  join: view_01811 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01807.category} = ${view_01811.category} ;;
  }

  access_filter: {
    field: view_01807.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01807.is_deleted} = false ;;
}
