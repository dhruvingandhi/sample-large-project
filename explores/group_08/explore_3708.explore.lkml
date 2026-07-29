# Explore: explore_3708
# Auto-generated LookML Explore File

include: "/views/domain_25/view_11125.view.lkml"
include: "/views/domain_27/view_11127.view.lkml"
include: "/views/domain_28/view_11128.view.lkml"
include: "/views/domain_29/view_11129.view.lkml"

explore: explore_3708 {
  label: "Explore Explore 3708"
  description: "Comprehensive analytics explore joining base view_11125 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11125
  
  always_filter: {
    filters: [view_11125.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11125.created_at_date: "7 days"]
    unless: [view_11125.id, view_11125.status]
  }

  join: view_11127 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11125.user_id} = ${view_11127.id} ;;
    required_joins: []
  }

  join: view_11128 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11125.account_id} = ${view_11128.account_id} ;;
    required_joins: [view_11127]
  }

  join: view_11129 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11125.category} = ${view_11129.category} ;;
  }

  access_filter: {
    field: view_11125.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11125.is_deleted} = false ;;
}
