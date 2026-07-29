# Explore: explore_2803
# Auto-generated LookML Explore File

include: "/views/domain_10/view_08410.view.lkml"
include: "/views/domain_12/view_08412.view.lkml"
include: "/views/domain_13/view_08413.view.lkml"
include: "/views/domain_14/view_08414.view.lkml"

explore: explore_2803 {
  label: "Explore Explore 2803"
  description: "Comprehensive analytics explore joining base view_08410 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08410
  
  always_filter: {
    filters: [view_08410.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08410.created_at_date: "7 days"]
    unless: [view_08410.id, view_08410.status]
  }

  join: view_08412 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08410.user_id} = ${view_08412.id} ;;
    required_joins: []
  }

  join: view_08413 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08410.account_id} = ${view_08413.account_id} ;;
    required_joins: [view_08412]
  }

  join: view_08414 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08410.category} = ${view_08414.category} ;;
  }

  access_filter: {
    field: view_08410.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08410.is_deleted} = false ;;
}
