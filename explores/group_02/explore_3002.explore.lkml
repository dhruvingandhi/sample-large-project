# Update for 500 file diff target
# Explore: explore_3002
# Auto-generated LookML Explore File

include: "/views/domain_07/view_09007.view.lkml"
include: "/views/domain_09/view_09009.view.lkml"
include: "/views/domain_10/view_09010.view.lkml"
include: "/views/domain_11/view_09011.view.lkml"

explore: explore_3002 {
  label: "Explore Explore 3002"
  description: "Comprehensive analytics explore joining base view_09007 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09007
  
  always_filter: {
    filters: [view_09007.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09007.created_at_date: "7 days"]
    unless: [view_09007.id, view_09007.status]
  }

  join: view_09009 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09007.user_id} = ${view_09009.id} ;;
    required_joins: []
  }

  join: view_09010 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09007.account_id} = ${view_09010.account_id} ;;
    required_joins: [view_09009]
  }

  join: view_09011 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09007.category} = ${view_09011.category} ;;
  }

  access_filter: {
    field: view_09007.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09007.is_deleted} = false ;;
}
