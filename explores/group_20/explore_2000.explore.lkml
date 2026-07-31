# Update for 2000 file diff target
# Explore: explore_2000
# Auto-generated LookML Explore File

include: "/views/domain_01/view_06001.view.lkml"
include: "/views/domain_03/view_06003.view.lkml"
include: "/views/domain_04/view_06004.view.lkml"
include: "/views/domain_05/view_06005.view.lkml"

explore: explore_2000 {
  label: "Explore Explore 2000"
  description: "Comprehensive analytics explore joining base view_06001 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06001
  
  always_filter: {
    filters: [view_06001.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06001.created_at_date: "7 days"]
    unless: [view_06001.id, view_06001.status]
  }

  join: view_06003 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06001.user_id} = ${view_06003.id} ;;
    required_joins: []
  }

  join: view_06004 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06001.account_id} = ${view_06004.account_id} ;;
    required_joins: [view_06003]
  }

  join: view_06005 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06001.category} = ${view_06005.category} ;;
  }

  access_filter: {
    field: view_06001.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06001.is_deleted} = false ;;
}
