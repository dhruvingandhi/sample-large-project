# Explore: explore_0104
# Auto-generated LookML Explore File

include: "/views/domain_13/view_00313.view.lkml"
include: "/views/domain_15/view_00315.view.lkml"
include: "/views/domain_16/view_00316.view.lkml"
include: "/views/domain_17/view_00317.view.lkml"

explore: explore_0104 {
  label: "Explore Explore 0104"
  description: "Comprehensive analytics explore joining base view_00313 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00313
  
  always_filter: {
    filters: [view_00313.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00313.created_at_date: "7 days"]
    unless: [view_00313.id, view_00313.status]
  }

  join: view_00315 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00313.user_id} = ${view_00315.id} ;;
    required_joins: []
  }

  join: view_00316 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00313.account_id} = ${view_00316.account_id} ;;
    required_joins: [view_00315]
  }

  join: view_00317 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00313.category} = ${view_00317.category} ;;
  }

  access_filter: {
    field: view_00313.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00313.is_deleted} = false ;;
}
