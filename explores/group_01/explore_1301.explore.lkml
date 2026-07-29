# Explore: explore_1301
# Auto-generated LookML Explore File

include: "/views/domain_04/view_03904.view.lkml"
include: "/views/domain_06/view_03906.view.lkml"
include: "/views/domain_07/view_03907.view.lkml"
include: "/views/domain_08/view_03908.view.lkml"

explore: explore_1301 {
  label: "Explore Explore 1301"
  description: "Comprehensive analytics explore joining base view_03904 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03904
  
  always_filter: {
    filters: [view_03904.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03904.created_at_date: "7 days"]
    unless: [view_03904.id, view_03904.status]
  }

  join: view_03906 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03904.user_id} = ${view_03906.id} ;;
    required_joins: []
  }

  join: view_03907 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03904.account_id} = ${view_03907.account_id} ;;
    required_joins: [view_03906]
  }

  join: view_03908 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03904.category} = ${view_03908.category} ;;
  }

  access_filter: {
    field: view_03904.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03904.is_deleted} = false ;;
}
