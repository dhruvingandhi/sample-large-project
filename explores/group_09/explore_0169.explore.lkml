# Explore: explore_0169
# Auto-generated LookML Explore File

include: "/views/domain_08/view_00508.view.lkml"
include: "/views/domain_10/view_00510.view.lkml"
include: "/views/domain_11/view_00511.view.lkml"
include: "/views/domain_12/view_00512.view.lkml"

explore: explore_0169 {
  label: "Explore Explore 0169"
  description: "Comprehensive analytics explore joining base view_00508 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00508
  
  always_filter: {
    filters: [view_00508.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00508.created_at_date: "7 days"]
    unless: [view_00508.id, view_00508.status]
  }

  join: view_00510 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00508.user_id} = ${view_00510.id} ;;
    required_joins: []
  }

  join: view_00511 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00508.account_id} = ${view_00511.account_id} ;;
    required_joins: [view_00510]
  }

  join: view_00512 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00508.category} = ${view_00512.category} ;;
  }

  access_filter: {
    field: view_00508.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00508.is_deleted} = false ;;
}
