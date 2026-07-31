# Update for 500 file diff target
# Explore: explore_1685
# Auto-generated LookML Explore File

include: "/views/domain_06/view_05056.view.lkml"
include: "/views/domain_08/view_05058.view.lkml"
include: "/views/domain_09/view_05059.view.lkml"
include: "/views/domain_10/view_05060.view.lkml"

explore: explore_1685 {
  label: "Explore Explore 1685"
  description: "Comprehensive analytics explore joining base view_05056 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05056
  
  always_filter: {
    filters: [view_05056.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05056.created_at_date: "7 days"]
    unless: [view_05056.id, view_05056.status]
  }

  join: view_05058 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05056.user_id} = ${view_05058.id} ;;
    required_joins: []
  }

  join: view_05059 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05056.account_id} = ${view_05059.account_id} ;;
    required_joins: [view_05058]
  }

  join: view_05060 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05056.category} = ${view_05060.category} ;;
  }

  access_filter: {
    field: view_05056.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05056.is_deleted} = false ;;
}
