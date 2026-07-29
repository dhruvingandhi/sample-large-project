# Explore: explore_0903
# Auto-generated LookML Explore File

include: "/views/domain_10/view_02710.view.lkml"
include: "/views/domain_12/view_02712.view.lkml"
include: "/views/domain_13/view_02713.view.lkml"
include: "/views/domain_14/view_02714.view.lkml"

explore: explore_0903 {
  label: "Explore Explore 0903"
  description: "Comprehensive analytics explore joining base view_02710 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02710
  
  always_filter: {
    filters: [view_02710.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02710.created_at_date: "7 days"]
    unless: [view_02710.id, view_02710.status]
  }

  join: view_02712 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02710.user_id} = ${view_02712.id} ;;
    required_joins: []
  }

  join: view_02713 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02710.account_id} = ${view_02713.account_id} ;;
    required_joins: [view_02712]
  }

  join: view_02714 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02710.category} = ${view_02714.category} ;;
  }

  access_filter: {
    field: view_02710.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02710.is_deleted} = false ;;
}
