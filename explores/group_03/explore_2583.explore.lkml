# Explore: explore_2583
# Auto-generated LookML Explore File

include: "/views/domain_50/view_07750.view.lkml"
include: "/views/domain_02/view_07752.view.lkml"
include: "/views/domain_03/view_07753.view.lkml"
include: "/views/domain_04/view_07754.view.lkml"

explore: explore_2583 {
  label: "Explore Explore 2583"
  description: "Comprehensive analytics explore joining base view_07750 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_07750
  
  always_filter: {
    filters: [view_07750.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07750.created_at_date: "7 days"]
    unless: [view_07750.id, view_07750.status]
  }

  join: view_07752 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07750.user_id} = ${view_07752.id} ;;
    required_joins: []
  }

  join: view_07753 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07750.account_id} = ${view_07753.account_id} ;;
    required_joins: [view_07752]
  }

  join: view_07754 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07750.category} = ${view_07754.category} ;;
  }

  access_filter: {
    field: view_07750.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07750.is_deleted} = false ;;
}
