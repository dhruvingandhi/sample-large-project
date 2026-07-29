# Explore: explore_3852
# Auto-generated LookML Explore File

include: "/views/domain_07/view_11557.view.lkml"
include: "/views/domain_09/view_11559.view.lkml"
include: "/views/domain_10/view_11560.view.lkml"
include: "/views/domain_11/view_11561.view.lkml"

explore: explore_3852 {
  label: "Explore Explore 3852"
  description: "Comprehensive analytics explore joining base view_11557 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11557
  
  always_filter: {
    filters: [view_11557.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11557.created_at_date: "7 days"]
    unless: [view_11557.id, view_11557.status]
  }

  join: view_11559 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11557.user_id} = ${view_11559.id} ;;
    required_joins: []
  }

  join: view_11560 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11557.account_id} = ${view_11560.account_id} ;;
    required_joins: [view_11559]
  }

  join: view_11561 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11557.category} = ${view_11561.category} ;;
  }

  access_filter: {
    field: view_11557.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11557.is_deleted} = false ;;
}
