# Explore: explore_0211
# Auto-generated LookML Explore File

include: "/views/domain_34/view_00634.view.lkml"
include: "/views/domain_36/view_00636.view.lkml"
include: "/views/domain_37/view_00637.view.lkml"
include: "/views/domain_38/view_00638.view.lkml"

explore: explore_0211 {
  label: "Explore Explore 0211"
  description: "Comprehensive analytics explore joining base view_00634 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00634
  
  always_filter: {
    filters: [view_00634.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00634.created_at_date: "7 days"]
    unless: [view_00634.id, view_00634.status]
  }

  join: view_00636 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00634.user_id} = ${view_00636.id} ;;
    required_joins: []
  }

  join: view_00637 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00634.account_id} = ${view_00637.account_id} ;;
    required_joins: [view_00636]
  }

  join: view_00638 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00634.category} = ${view_00638.category} ;;
  }

  access_filter: {
    field: view_00634.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00634.is_deleted} = false ;;
}
