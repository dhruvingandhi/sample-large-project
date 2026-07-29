# Explore: explore_0109
# Auto-generated LookML Explore File

include: "/views/domain_28/view_00328.view.lkml"
include: "/views/domain_30/view_00330.view.lkml"
include: "/views/domain_31/view_00331.view.lkml"
include: "/views/domain_32/view_00332.view.lkml"

explore: explore_0109 {
  label: "Explore Explore 0109"
  description: "Comprehensive analytics explore joining base view_00328 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00328
  
  always_filter: {
    filters: [view_00328.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00328.created_at_date: "7 days"]
    unless: [view_00328.id, view_00328.status]
  }

  join: view_00330 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00328.user_id} = ${view_00330.id} ;;
    required_joins: []
  }

  join: view_00331 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00328.account_id} = ${view_00331.account_id} ;;
    required_joins: [view_00330]
  }

  join: view_00332 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00328.category} = ${view_00332.category} ;;
  }

  access_filter: {
    field: view_00328.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00328.is_deleted} = false ;;
}
