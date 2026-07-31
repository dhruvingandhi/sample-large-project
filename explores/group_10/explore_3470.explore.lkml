# Update for 2000 file diff target
# Explore: explore_3470
# Auto-generated LookML Explore File

include: "/views/domain_11/view_10411.view.lkml"
include: "/views/domain_13/view_10413.view.lkml"
include: "/views/domain_14/view_10414.view.lkml"
include: "/views/domain_15/view_10415.view.lkml"

explore: explore_3470 {
  label: "Explore Explore 3470"
  description: "Comprehensive analytics explore joining base view_10411 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10411
  
  always_filter: {
    filters: [view_10411.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10411.created_at_date: "7 days"]
    unless: [view_10411.id, view_10411.status]
  }

  join: view_10413 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10411.user_id} = ${view_10413.id} ;;
    required_joins: []
  }

  join: view_10414 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10411.account_id} = ${view_10414.account_id} ;;
    required_joins: [view_10413]
  }

  join: view_10415 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10411.category} = ${view_10415.category} ;;
  }

  access_filter: {
    field: view_10411.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10411.is_deleted} = false ;;
}
