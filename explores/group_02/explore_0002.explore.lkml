# Explore: explore_0002
# Auto-generated LookML Explore File

include: "/views/domain_07/view_00007.view.lkml"
include: "/views/domain_09/view_00009.view.lkml"
include: "/views/domain_10/view_00010.view.lkml"
include: "/views/domain_11/view_00011.view.lkml"

explore: explore_0002 {
  label: "Explore Explore 0002"
  description: "Comprehensive analytics explore joining base view_00007 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00007
  
  always_filter: {
    filters: [view_00007.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00007.created_at_date: "7 days"]
    unless: [view_00007.id, view_00007.status]
  }

  join: view_00009 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00007.user_id} = ${view_00009.id} ;;
    required_joins: []
  }

  join: view_00010 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00007.account_id} = ${view_00010.account_id} ;;
    required_joins: [view_00009]
  }

  join: view_00011 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00007.category} = ${view_00011.category} ;;
  }

  access_filter: {
    field: view_00007.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00007.is_deleted} = false ;;
}
