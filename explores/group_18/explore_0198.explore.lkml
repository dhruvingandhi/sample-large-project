# Explore: explore_0198
# Auto-generated LookML Explore File

include: "/views/domain_45/view_00595.view.lkml"
include: "/views/domain_47/view_00597.view.lkml"
include: "/views/domain_48/view_00598.view.lkml"
include: "/views/domain_49/view_00599.view.lkml"

explore: explore_0198 {
  label: "Explore Explore 0198"
  description: "Comprehensive analytics explore joining base view_00595 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00595
  
  always_filter: {
    filters: [view_00595.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00595.created_at_date: "7 days"]
    unless: [view_00595.id, view_00595.status]
  }

  join: view_00597 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00595.user_id} = ${view_00597.id} ;;
    required_joins: []
  }

  join: view_00598 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00595.account_id} = ${view_00598.account_id} ;;
    required_joins: [view_00597]
  }

  join: view_00599 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00595.category} = ${view_00599.category} ;;
  }

  access_filter: {
    field: view_00595.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00595.is_deleted} = false ;;
}
