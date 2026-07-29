# Explore: explore_3333
# Auto-generated LookML Explore File

include: "/views/domain_50/view_10000.view.lkml"
include: "/views/domain_02/view_10002.view.lkml"
include: "/views/domain_03/view_10003.view.lkml"
include: "/views/domain_04/view_10004.view.lkml"

explore: explore_3333 {
  label: "Explore Explore 3333"
  description: "Comprehensive analytics explore joining base view_10000 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10000
  
  always_filter: {
    filters: [view_10000.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10000.created_at_date: "7 days"]
    unless: [view_10000.id, view_10000.status]
  }

  join: view_10002 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10000.user_id} = ${view_10002.id} ;;
    required_joins: []
  }

  join: view_10003 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10000.account_id} = ${view_10003.account_id} ;;
    required_joins: [view_10002]
  }

  join: view_10004 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10000.category} = ${view_10004.category} ;;
  }

  access_filter: {
    field: view_10000.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10000.is_deleted} = false ;;
}
