# Update for 2000 file diff target
# Explore: explore_0100
# Auto-generated LookML Explore File

include: "/views/domain_01/view_00301.view.lkml"
include: "/views/domain_03/view_00303.view.lkml"
include: "/views/domain_04/view_00304.view.lkml"
include: "/views/domain_05/view_00305.view.lkml"

explore: explore_0100 {
  label: "Explore Explore 0100"
  description: "Comprehensive analytics explore joining base view_00301 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00301
  
  always_filter: {
    filters: [view_00301.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00301.created_at_date: "7 days"]
    unless: [view_00301.id, view_00301.status]
  }

  join: view_00303 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00301.user_id} = ${view_00303.id} ;;
    required_joins: []
  }

  join: view_00304 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00301.account_id} = ${view_00304.account_id} ;;
    required_joins: [view_00303]
  }

  join: view_00305 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00301.category} = ${view_00305.category} ;;
  }

  access_filter: {
    field: view_00301.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00301.is_deleted} = false ;;
}
