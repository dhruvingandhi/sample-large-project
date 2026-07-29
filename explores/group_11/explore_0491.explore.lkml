# Explore: explore_0491
# Auto-generated LookML Explore File

include: "/views/domain_24/view_01474.view.lkml"
include: "/views/domain_26/view_01476.view.lkml"
include: "/views/domain_27/view_01477.view.lkml"
include: "/views/domain_28/view_01478.view.lkml"

explore: explore_0491 {
  label: "Explore Explore 0491"
  description: "Comprehensive analytics explore joining base view_01474 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01474
  
  always_filter: {
    filters: [view_01474.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01474.created_at_date: "7 days"]
    unless: [view_01474.id, view_01474.status]
  }

  join: view_01476 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01474.user_id} = ${view_01476.id} ;;
    required_joins: []
  }

  join: view_01477 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01474.account_id} = ${view_01477.account_id} ;;
    required_joins: [view_01476]
  }

  join: view_01478 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01474.category} = ${view_01478.category} ;;
  }

  access_filter: {
    field: view_01474.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01474.is_deleted} = false ;;
}
