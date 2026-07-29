# Explore: explore_2575
# Auto-generated LookML Explore File

include: "/views/domain_26/view_07726.view.lkml"
include: "/views/domain_28/view_07728.view.lkml"
include: "/views/domain_29/view_07729.view.lkml"
include: "/views/domain_30/view_07730.view.lkml"

explore: explore_2575 {
  label: "Explore Explore 2575"
  description: "Comprehensive analytics explore joining base view_07726 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07726
  
  always_filter: {
    filters: [view_07726.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07726.created_at_date: "7 days"]
    unless: [view_07726.id, view_07726.status]
  }

  join: view_07728 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07726.user_id} = ${view_07728.id} ;;
    required_joins: []
  }

  join: view_07729 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07726.account_id} = ${view_07729.account_id} ;;
    required_joins: [view_07728]
  }

  join: view_07730 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07726.category} = ${view_07730.category} ;;
  }

  access_filter: {
    field: view_07726.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07726.is_deleted} = false ;;
}
