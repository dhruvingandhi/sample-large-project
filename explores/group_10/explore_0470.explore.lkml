# Explore: explore_0470
# Auto-generated LookML Explore File

include: "/views/domain_11/view_01411.view.lkml"
include: "/views/domain_13/view_01413.view.lkml"
include: "/views/domain_14/view_01414.view.lkml"
include: "/views/domain_15/view_01415.view.lkml"

explore: explore_0470 {
  label: "Explore Explore 0470"
  description: "Comprehensive analytics explore joining base view_01411 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01411
  
  always_filter: {
    filters: [view_01411.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01411.created_at_date: "7 days"]
    unless: [view_01411.id, view_01411.status]
  }

  join: view_01413 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01411.user_id} = ${view_01413.id} ;;
    required_joins: []
  }

  join: view_01414 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01411.account_id} = ${view_01414.account_id} ;;
    required_joins: [view_01413]
  }

  join: view_01415 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01411.category} = ${view_01415.category} ;;
  }

  access_filter: {
    field: view_01411.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01411.is_deleted} = false ;;
}
