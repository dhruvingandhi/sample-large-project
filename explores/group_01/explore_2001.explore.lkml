# Explore: explore_2001
# Auto-generated LookML Explore File

include: "/views/domain_04/view_06004.view.lkml"
include: "/views/domain_06/view_06006.view.lkml"
include: "/views/domain_07/view_06007.view.lkml"
include: "/views/domain_08/view_06008.view.lkml"

explore: explore_2001 {
  label: "Explore Explore 2001"
  description: "Comprehensive analytics explore joining base view_06004 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06004
  
  always_filter: {
    filters: [view_06004.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06004.created_at_date: "7 days"]
    unless: [view_06004.id, view_06004.status]
  }

  join: view_06006 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06004.user_id} = ${view_06006.id} ;;
    required_joins: []
  }

  join: view_06007 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06004.account_id} = ${view_06007.account_id} ;;
    required_joins: [view_06006]
  }

  join: view_06008 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06004.category} = ${view_06008.category} ;;
  }

  access_filter: {
    field: view_06004.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06004.is_deleted} = false ;;
}
