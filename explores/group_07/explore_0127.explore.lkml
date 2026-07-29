# Explore: explore_0127
# Auto-generated LookML Explore File

include: "/views/domain_32/view_00382.view.lkml"
include: "/views/domain_34/view_00384.view.lkml"
include: "/views/domain_35/view_00385.view.lkml"
include: "/views/domain_36/view_00386.view.lkml"

explore: explore_0127 {
  label: "Explore Explore 0127"
  description: "Comprehensive analytics explore joining base view_00382 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00382
  
  always_filter: {
    filters: [view_00382.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00382.created_at_date: "7 days"]
    unless: [view_00382.id, view_00382.status]
  }

  join: view_00384 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00382.user_id} = ${view_00384.id} ;;
    required_joins: []
  }

  join: view_00385 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00382.account_id} = ${view_00385.account_id} ;;
    required_joins: [view_00384]
  }

  join: view_00386 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00382.category} = ${view_00386.category} ;;
  }

  access_filter: {
    field: view_00382.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00382.is_deleted} = false ;;
}
