# Update for 2000 file diff target
# Explore: explore_4000
# Auto-generated LookML Explore File

include: "/views/domain_01/view_12001.view.lkml"
include: "/views/domain_03/view_12003.view.lkml"
include: "/views/domain_04/view_12004.view.lkml"
include: "/views/domain_05/view_12005.view.lkml"

explore: explore_4000 {
  label: "Explore Explore 4000"
  description: "Comprehensive analytics explore joining base view_12001 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_12001
  
  always_filter: {
    filters: [view_12001.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_12001.created_at_date: "7 days"]
    unless: [view_12001.id, view_12001.status]
  }

  join: view_12003 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_12001.user_id} = ${view_12003.id} ;;
    required_joins: []
  }

  join: view_12004 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_12001.account_id} = ${view_12004.account_id} ;;
    required_joins: [view_12003]
  }

  join: view_12005 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_12001.category} = ${view_12005.category} ;;
  }

  access_filter: {
    field: view_12001.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_12001.is_deleted} = false ;;
}
