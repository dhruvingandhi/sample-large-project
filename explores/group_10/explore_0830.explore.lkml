# Update for 2000 file diff target
# Explore: explore_0830
# Auto-generated LookML Explore File

include: "/views/domain_41/view_02491.view.lkml"
include: "/views/domain_43/view_02493.view.lkml"
include: "/views/domain_44/view_02494.view.lkml"
include: "/views/domain_45/view_02495.view.lkml"

explore: explore_0830 {
  label: "Explore Explore 0830"
  description: "Comprehensive analytics explore joining base view_02491 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02491
  
  always_filter: {
    filters: [view_02491.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02491.created_at_date: "7 days"]
    unless: [view_02491.id, view_02491.status]
  }

  join: view_02493 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02491.user_id} = ${view_02493.id} ;;
    required_joins: []
  }

  join: view_02494 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02491.account_id} = ${view_02494.account_id} ;;
    required_joins: [view_02493]
  }

  join: view_02495 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02491.category} = ${view_02495.category} ;;
  }

  access_filter: {
    field: view_02491.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02491.is_deleted} = false ;;
}
