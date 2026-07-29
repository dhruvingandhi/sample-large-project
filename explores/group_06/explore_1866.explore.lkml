# Explore: explore_1866
# Auto-generated LookML Explore File

include: "/views/domain_49/view_05599.view.lkml"
include: "/views/domain_01/view_05601.view.lkml"
include: "/views/domain_02/view_05602.view.lkml"
include: "/views/domain_03/view_05603.view.lkml"

explore: explore_1866 {
  label: "Explore Explore 1866"
  description: "Comprehensive analytics explore joining base view_05599 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05599
  
  always_filter: {
    filters: [view_05599.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05599.created_at_date: "7 days"]
    unless: [view_05599.id, view_05599.status]
  }

  join: view_05601 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05599.user_id} = ${view_05601.id} ;;
    required_joins: []
  }

  join: view_05602 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05599.account_id} = ${view_05602.account_id} ;;
    required_joins: [view_05601]
  }

  join: view_05603 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05599.category} = ${view_05603.category} ;;
  }

  access_filter: {
    field: view_05599.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05599.is_deleted} = false ;;
}
