# Explore: explore_0923
# Auto-generated LookML Explore File

include: "/views/domain_20/view_02770.view.lkml"
include: "/views/domain_22/view_02772.view.lkml"
include: "/views/domain_23/view_02773.view.lkml"
include: "/views/domain_24/view_02774.view.lkml"

explore: explore_0923 {
  label: "Explore Explore 0923"
  description: "Comprehensive analytics explore joining base view_02770 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02770
  
  always_filter: {
    filters: [view_02770.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02770.created_at_date: "7 days"]
    unless: [view_02770.id, view_02770.status]
  }

  join: view_02772 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02770.user_id} = ${view_02772.id} ;;
    required_joins: []
  }

  join: view_02773 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02770.account_id} = ${view_02773.account_id} ;;
    required_joins: [view_02772]
  }

  join: view_02774 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02770.category} = ${view_02774.category} ;;
  }

  access_filter: {
    field: view_02770.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02770.is_deleted} = false ;;
}
