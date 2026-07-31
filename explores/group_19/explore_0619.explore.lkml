# Update for 2000 file diff target
# Explore: explore_0619
# Auto-generated LookML Explore File

include: "/views/domain_08/view_01858.view.lkml"
include: "/views/domain_10/view_01860.view.lkml"
include: "/views/domain_11/view_01861.view.lkml"
include: "/views/domain_12/view_01862.view.lkml"

explore: explore_0619 {
  label: "Explore Explore 0619"
  description: "Comprehensive analytics explore joining base view_01858 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01858
  
  always_filter: {
    filters: [view_01858.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01858.created_at_date: "7 days"]
    unless: [view_01858.id, view_01858.status]
  }

  join: view_01860 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01858.user_id} = ${view_01860.id} ;;
    required_joins: []
  }

  join: view_01861 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01858.account_id} = ${view_01861.account_id} ;;
    required_joins: [view_01860]
  }

  join: view_01862 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01858.category} = ${view_01862.category} ;;
  }

  access_filter: {
    field: view_01858.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01858.is_deleted} = false ;;
}
