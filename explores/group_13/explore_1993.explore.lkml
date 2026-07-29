# Explore: explore_1993
# Auto-generated LookML Explore File

include: "/views/domain_30/view_05980.view.lkml"
include: "/views/domain_32/view_05982.view.lkml"
include: "/views/domain_33/view_05983.view.lkml"
include: "/views/domain_34/view_05984.view.lkml"

explore: explore_1993 {
  label: "Explore Explore 1993"
  description: "Comprehensive analytics explore joining base view_05980 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05980
  
  always_filter: {
    filters: [view_05980.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05980.created_at_date: "7 days"]
    unless: [view_05980.id, view_05980.status]
  }

  join: view_05982 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05980.user_id} = ${view_05982.id} ;;
    required_joins: []
  }

  join: view_05983 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05980.account_id} = ${view_05983.account_id} ;;
    required_joins: [view_05982]
  }

  join: view_05984 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05980.category} = ${view_05984.category} ;;
  }

  access_filter: {
    field: view_05980.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05980.is_deleted} = false ;;
}
