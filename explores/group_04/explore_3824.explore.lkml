# Explore: explore_3824
# Auto-generated LookML Explore File

include: "/views/domain_23/view_11473.view.lkml"
include: "/views/domain_25/view_11475.view.lkml"
include: "/views/domain_26/view_11476.view.lkml"
include: "/views/domain_27/view_11477.view.lkml"

explore: explore_3824 {
  label: "Explore Explore 3824"
  description: "Comprehensive analytics explore joining base view_11473 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11473
  
  always_filter: {
    filters: [view_11473.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11473.created_at_date: "7 days"]
    unless: [view_11473.id, view_11473.status]
  }

  join: view_11475 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11473.user_id} = ${view_11475.id} ;;
    required_joins: []
  }

  join: view_11476 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11473.account_id} = ${view_11476.account_id} ;;
    required_joins: [view_11475]
  }

  join: view_11477 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11473.category} = ${view_11477.category} ;;
  }

  access_filter: {
    field: view_11473.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11473.is_deleted} = false ;;
}
