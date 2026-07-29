# Explore: explore_1491
# Auto-generated LookML Explore File

include: "/views/domain_24/view_04474.view.lkml"
include: "/views/domain_26/view_04476.view.lkml"
include: "/views/domain_27/view_04477.view.lkml"
include: "/views/domain_28/view_04478.view.lkml"

explore: explore_1491 {
  label: "Explore Explore 1491"
  description: "Comprehensive analytics explore joining base view_04474 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04474
  
  always_filter: {
    filters: [view_04474.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04474.created_at_date: "7 days"]
    unless: [view_04474.id, view_04474.status]
  }

  join: view_04476 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04474.user_id} = ${view_04476.id} ;;
    required_joins: []
  }

  join: view_04477 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04474.account_id} = ${view_04477.account_id} ;;
    required_joins: [view_04476]
  }

  join: view_04478 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04474.category} = ${view_04478.category} ;;
  }

  access_filter: {
    field: view_04474.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04474.is_deleted} = false ;;
}
