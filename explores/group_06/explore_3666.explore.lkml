# Explore: explore_3666
# Auto-generated LookML Explore File

include: "/views/domain_49/view_10999.view.lkml"
include: "/views/domain_01/view_11001.view.lkml"
include: "/views/domain_02/view_11002.view.lkml"
include: "/views/domain_03/view_11003.view.lkml"

explore: explore_3666 {
  label: "Explore Explore 3666"
  description: "Comprehensive analytics explore joining base view_10999 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10999
  
  always_filter: {
    filters: [view_10999.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10999.created_at_date: "7 days"]
    unless: [view_10999.id, view_10999.status]
  }

  join: view_11001 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10999.user_id} = ${view_11001.id} ;;
    required_joins: []
  }

  join: view_11002 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10999.account_id} = ${view_11002.account_id} ;;
    required_joins: [view_11001]
  }

  join: view_11003 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10999.category} = ${view_11003.category} ;;
  }

  access_filter: {
    field: view_10999.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10999.is_deleted} = false ;;
}
