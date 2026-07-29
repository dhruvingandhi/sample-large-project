# Explore: explore_3001
# Auto-generated LookML Explore File

include: "/views/domain_04/view_09004.view.lkml"
include: "/views/domain_06/view_09006.view.lkml"
include: "/views/domain_07/view_09007.view.lkml"
include: "/views/domain_08/view_09008.view.lkml"

explore: explore_3001 {
  label: "Explore Explore 3001"
  description: "Comprehensive analytics explore joining base view_09004 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09004
  
  always_filter: {
    filters: [view_09004.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09004.created_at_date: "7 days"]
    unless: [view_09004.id, view_09004.status]
  }

  join: view_09006 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09004.user_id} = ${view_09006.id} ;;
    required_joins: []
  }

  join: view_09007 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09004.account_id} = ${view_09007.account_id} ;;
    required_joins: [view_09006]
  }

  join: view_09008 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09004.category} = ${view_09008.category} ;;
  }

  access_filter: {
    field: view_09004.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09004.is_deleted} = false ;;
}
