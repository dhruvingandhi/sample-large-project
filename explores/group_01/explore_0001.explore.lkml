# Explore: explore_0001
# Auto-generated LookML Explore File

include: "/views/domain_04/view_00004.view.lkml"
include: "/views/domain_06/view_00006.view.lkml"
include: "/views/domain_07/view_00007.view.lkml"
include: "/views/domain_08/view_00008.view.lkml"

explore: explore_0001 {
  label: "Explore Explore 0001"
  description: "Comprehensive analytics explore joining base view_00004 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_00004
  
  always_filter: {
    filters: [view_00004.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00004.created_at_date: "7 days"]
    unless: [view_00004.id, view_00004.status]
  }

  join: view_00006 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00004.user_id} = ${view_00006.id} ;;
    required_joins: []
  }

  join: view_00007 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00004.account_id} = ${view_00007.account_id} ;;
    required_joins: [view_00006]
  }

  join: view_00008 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00004.category} = ${view_00008.category} ;;
  }

  access_filter: {
    field: view_00004.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00004.is_deleted} = false ;;
}
