# Explore: explore_3766
# Auto-generated LookML Explore File

include: "/views/domain_49/view_11299.view.lkml"
include: "/views/domain_01/view_11301.view.lkml"
include: "/views/domain_02/view_11302.view.lkml"
include: "/views/domain_03/view_11303.view.lkml"

explore: explore_3766 {
  label: "Explore Explore 3766"
  description: "Comprehensive analytics explore joining base view_11299 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11299
  
  always_filter: {
    filters: [view_11299.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11299.created_at_date: "7 days"]
    unless: [view_11299.id, view_11299.status]
  }

  join: view_11301 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11299.user_id} = ${view_11301.id} ;;
    required_joins: []
  }

  join: view_11302 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11299.account_id} = ${view_11302.account_id} ;;
    required_joins: [view_11301]
  }

  join: view_11303 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11299.category} = ${view_11303.category} ;;
  }

  access_filter: {
    field: view_11299.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11299.is_deleted} = false ;;
}
