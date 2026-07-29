# Explore: explore_0163
# Auto-generated LookML Explore File

include: "/views/domain_40/view_00490.view.lkml"
include: "/views/domain_42/view_00492.view.lkml"
include: "/views/domain_43/view_00493.view.lkml"
include: "/views/domain_44/view_00494.view.lkml"

explore: explore_0163 {
  label: "Explore Explore 0163"
  description: "Comprehensive analytics explore joining base view_00490 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00490
  
  always_filter: {
    filters: [view_00490.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00490.created_at_date: "7 days"]
    unless: [view_00490.id, view_00490.status]
  }

  join: view_00492 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00490.user_id} = ${view_00492.id} ;;
    required_joins: []
  }

  join: view_00493 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00490.account_id} = ${view_00493.account_id} ;;
    required_joins: [view_00492]
  }

  join: view_00494 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00490.category} = ${view_00494.category} ;;
  }

  access_filter: {
    field: view_00490.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00490.is_deleted} = false ;;
}
