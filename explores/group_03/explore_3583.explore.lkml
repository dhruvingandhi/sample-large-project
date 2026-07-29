# Explore: explore_3583
# Auto-generated LookML Explore File

include: "/views/domain_50/view_10750.view.lkml"
include: "/views/domain_02/view_10752.view.lkml"
include: "/views/domain_03/view_10753.view.lkml"
include: "/views/domain_04/view_10754.view.lkml"

explore: explore_3583 {
  label: "Explore Explore 3583"
  description: "Comprehensive analytics explore joining base view_10750 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10750
  
  always_filter: {
    filters: [view_10750.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10750.created_at_date: "7 days"]
    unless: [view_10750.id, view_10750.status]
  }

  join: view_10752 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10750.user_id} = ${view_10752.id} ;;
    required_joins: []
  }

  join: view_10753 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10750.account_id} = ${view_10753.account_id} ;;
    required_joins: [view_10752]
  }

  join: view_10754 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10750.category} = ${view_10754.category} ;;
  }

  access_filter: {
    field: view_10750.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10750.is_deleted} = false ;;
}
