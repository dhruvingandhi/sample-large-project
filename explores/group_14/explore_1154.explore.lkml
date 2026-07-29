# Explore: explore_1154
# Auto-generated LookML Explore File

include: "/views/domain_13/view_03463.view.lkml"
include: "/views/domain_15/view_03465.view.lkml"
include: "/views/domain_16/view_03466.view.lkml"
include: "/views/domain_17/view_03467.view.lkml"

explore: explore_1154 {
  label: "Explore Explore 1154"
  description: "Comprehensive analytics explore joining base view_03463 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_03463
  
  always_filter: {
    filters: [view_03463.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03463.created_at_date: "7 days"]
    unless: [view_03463.id, view_03463.status]
  }

  join: view_03465 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03463.user_id} = ${view_03465.id} ;;
    required_joins: []
  }

  join: view_03466 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03463.account_id} = ${view_03466.account_id} ;;
    required_joins: [view_03465]
  }

  join: view_03467 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03463.category} = ${view_03467.category} ;;
  }

  access_filter: {
    field: view_03463.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03463.is_deleted} = false ;;
}
