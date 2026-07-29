# Explore: explore_3203
# Auto-generated LookML Explore File

include: "/views/domain_10/view_09610.view.lkml"
include: "/views/domain_12/view_09612.view.lkml"
include: "/views/domain_13/view_09613.view.lkml"
include: "/views/domain_14/view_09614.view.lkml"

explore: explore_3203 {
  label: "Explore Explore 3203"
  description: "Comprehensive analytics explore joining base view_09610 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09610
  
  always_filter: {
    filters: [view_09610.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09610.created_at_date: "7 days"]
    unless: [view_09610.id, view_09610.status]
  }

  join: view_09612 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09610.user_id} = ${view_09612.id} ;;
    required_joins: []
  }

  join: view_09613 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09610.account_id} = ${view_09613.account_id} ;;
    required_joins: [view_09612]
  }

  join: view_09614 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09610.category} = ${view_09614.category} ;;
  }

  access_filter: {
    field: view_09610.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09610.is_deleted} = false ;;
}
