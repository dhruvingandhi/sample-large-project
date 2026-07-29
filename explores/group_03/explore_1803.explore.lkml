# Explore: explore_1803
# Auto-generated LookML Explore File

include: "/views/domain_10/view_05410.view.lkml"
include: "/views/domain_12/view_05412.view.lkml"
include: "/views/domain_13/view_05413.view.lkml"
include: "/views/domain_14/view_05414.view.lkml"

explore: explore_1803 {
  label: "Explore Explore 1803"
  description: "Comprehensive analytics explore joining base view_05410 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05410
  
  always_filter: {
    filters: [view_05410.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05410.created_at_date: "7 days"]
    unless: [view_05410.id, view_05410.status]
  }

  join: view_05412 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05410.user_id} = ${view_05412.id} ;;
    required_joins: []
  }

  join: view_05413 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05410.account_id} = ${view_05413.account_id} ;;
    required_joins: [view_05412]
  }

  join: view_05414 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05410.category} = ${view_05414.category} ;;
  }

  access_filter: {
    field: view_05410.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05410.is_deleted} = false ;;
}
