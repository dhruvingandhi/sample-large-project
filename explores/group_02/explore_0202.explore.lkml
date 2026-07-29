# Explore: explore_0202
# Auto-generated LookML Explore File

include: "/views/domain_07/view_00607.view.lkml"
include: "/views/domain_09/view_00609.view.lkml"
include: "/views/domain_10/view_00610.view.lkml"
include: "/views/domain_11/view_00611.view.lkml"

explore: explore_0202 {
  label: "Explore Explore 0202"
  description: "Comprehensive analytics explore joining base view_00607 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00607
  
  always_filter: {
    filters: [view_00607.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00607.created_at_date: "7 days"]
    unless: [view_00607.id, view_00607.status]
  }

  join: view_00609 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00607.user_id} = ${view_00609.id} ;;
    required_joins: []
  }

  join: view_00610 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00607.account_id} = ${view_00610.account_id} ;;
    required_joins: [view_00609]
  }

  join: view_00611 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00607.category} = ${view_00611.category} ;;
  }

  access_filter: {
    field: view_00607.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00607.is_deleted} = false ;;
}
