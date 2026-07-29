# Explore: explore_0162
# Auto-generated LookML Explore File

include: "/views/domain_37/view_00487.view.lkml"
include: "/views/domain_39/view_00489.view.lkml"
include: "/views/domain_40/view_00490.view.lkml"
include: "/views/domain_41/view_00491.view.lkml"

explore: explore_0162 {
  label: "Explore Explore 0162"
  description: "Comprehensive analytics explore joining base view_00487 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00487
  
  always_filter: {
    filters: [view_00487.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00487.created_at_date: "7 days"]
    unless: [view_00487.id, view_00487.status]
  }

  join: view_00489 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00487.user_id} = ${view_00489.id} ;;
    required_joins: []
  }

  join: view_00490 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00487.account_id} = ${view_00490.account_id} ;;
    required_joins: [view_00489]
  }

  join: view_00491 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00487.category} = ${view_00491.category} ;;
  }

  access_filter: {
    field: view_00487.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00487.is_deleted} = false ;;
}
