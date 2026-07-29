# Explore: explore_3334
# Auto-generated LookML Explore File

include: "/views/domain_03/view_10003.view.lkml"
include: "/views/domain_05/view_10005.view.lkml"
include: "/views/domain_06/view_10006.view.lkml"
include: "/views/domain_07/view_10007.view.lkml"

explore: explore_3334 {
  label: "Explore Explore 3334"
  description: "Comprehensive analytics explore joining base view_10003 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10003
  
  always_filter: {
    filters: [view_10003.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10003.created_at_date: "7 days"]
    unless: [view_10003.id, view_10003.status]
  }

  join: view_10005 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10003.user_id} = ${view_10005.id} ;;
    required_joins: []
  }

  join: view_10006 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10003.account_id} = ${view_10006.account_id} ;;
    required_joins: [view_10005]
  }

  join: view_10007 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10003.category} = ${view_10007.category} ;;
  }

  access_filter: {
    field: view_10003.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10003.is_deleted} = false ;;
}
