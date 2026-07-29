# Explore: explore_0684
# Auto-generated LookML Explore File

include: "/views/domain_03/view_02053.view.lkml"
include: "/views/domain_05/view_02055.view.lkml"
include: "/views/domain_06/view_02056.view.lkml"
include: "/views/domain_07/view_02057.view.lkml"

explore: explore_0684 {
  label: "Explore Explore 0684"
  description: "Comprehensive analytics explore joining base view_02053 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02053
  
  always_filter: {
    filters: [view_02053.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02053.created_at_date: "7 days"]
    unless: [view_02053.id, view_02053.status]
  }

  join: view_02055 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02053.user_id} = ${view_02055.id} ;;
    required_joins: []
  }

  join: view_02056 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02053.account_id} = ${view_02056.account_id} ;;
    required_joins: [view_02055]
  }

  join: view_02057 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02053.category} = ${view_02057.category} ;;
  }

  access_filter: {
    field: view_02053.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02053.is_deleted} = false ;;
}
