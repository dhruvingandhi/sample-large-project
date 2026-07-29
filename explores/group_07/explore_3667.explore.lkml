# Explore: explore_3667
# Auto-generated LookML Explore File

include: "/views/domain_02/view_11002.view.lkml"
include: "/views/domain_04/view_11004.view.lkml"
include: "/views/domain_05/view_11005.view.lkml"
include: "/views/domain_06/view_11006.view.lkml"

explore: explore_3667 {
  label: "Explore Explore 3667"
  description: "Comprehensive analytics explore joining base view_11002 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11002
  
  always_filter: {
    filters: [view_11002.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11002.created_at_date: "7 days"]
    unless: [view_11002.id, view_11002.status]
  }

  join: view_11004 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11002.user_id} = ${view_11004.id} ;;
    required_joins: []
  }

  join: view_11005 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11002.account_id} = ${view_11005.account_id} ;;
    required_joins: [view_11004]
  }

  join: view_11006 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11002.category} = ${view_11006.category} ;;
  }

  access_filter: {
    field: view_11002.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11002.is_deleted} = false ;;
}
