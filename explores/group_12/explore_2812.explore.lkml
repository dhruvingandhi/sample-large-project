# Explore: explore_2812
# Auto-generated LookML Explore File

include: "/views/domain_37/view_08437.view.lkml"
include: "/views/domain_39/view_08439.view.lkml"
include: "/views/domain_40/view_08440.view.lkml"
include: "/views/domain_41/view_08441.view.lkml"

explore: explore_2812 {
  label: "Explore Explore 2812"
  description: "Comprehensive analytics explore joining base view_08437 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08437
  
  always_filter: {
    filters: [view_08437.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08437.created_at_date: "7 days"]
    unless: [view_08437.id, view_08437.status]
  }

  join: view_08439 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08437.user_id} = ${view_08439.id} ;;
    required_joins: []
  }

  join: view_08440 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08437.account_id} = ${view_08440.account_id} ;;
    required_joins: [view_08439]
  }

  join: view_08441 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08437.category} = ${view_08441.category} ;;
  }

  access_filter: {
    field: view_08437.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08437.is_deleted} = false ;;
}
