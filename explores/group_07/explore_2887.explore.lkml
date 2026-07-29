# Explore: explore_2887
# Auto-generated LookML Explore File

include: "/views/domain_12/view_08662.view.lkml"
include: "/views/domain_14/view_08664.view.lkml"
include: "/views/domain_15/view_08665.view.lkml"
include: "/views/domain_16/view_08666.view.lkml"

explore: explore_2887 {
  label: "Explore Explore 2887"
  description: "Comprehensive analytics explore joining base view_08662 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08662
  
  always_filter: {
    filters: [view_08662.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08662.created_at_date: "7 days"]
    unless: [view_08662.id, view_08662.status]
  }

  join: view_08664 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08662.user_id} = ${view_08664.id} ;;
    required_joins: []
  }

  join: view_08665 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08662.account_id} = ${view_08665.account_id} ;;
    required_joins: [view_08664]
  }

  join: view_08666 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08662.category} = ${view_08666.category} ;;
  }

  access_filter: {
    field: view_08662.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08662.is_deleted} = false ;;
}
