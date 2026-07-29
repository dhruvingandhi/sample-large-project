# Explore: explore_0154
# Auto-generated LookML Explore File

include: "/views/domain_13/view_00463.view.lkml"
include: "/views/domain_15/view_00465.view.lkml"
include: "/views/domain_16/view_00466.view.lkml"
include: "/views/domain_17/view_00467.view.lkml"

explore: explore_0154 {
  label: "Explore Explore 0154"
  description: "Comprehensive analytics explore joining base view_00463 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00463
  
  always_filter: {
    filters: [view_00463.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00463.created_at_date: "7 days"]
    unless: [view_00463.id, view_00463.status]
  }

  join: view_00465 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00463.user_id} = ${view_00465.id} ;;
    required_joins: []
  }

  join: view_00466 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00463.account_id} = ${view_00466.account_id} ;;
    required_joins: [view_00465]
  }

  join: view_00467 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00463.category} = ${view_00467.category} ;;
  }

  access_filter: {
    field: view_00463.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00463.is_deleted} = false ;;
}
