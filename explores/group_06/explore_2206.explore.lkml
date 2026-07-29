# Explore: explore_2206
# Auto-generated LookML Explore File

include: "/views/domain_19/view_06619.view.lkml"
include: "/views/domain_21/view_06621.view.lkml"
include: "/views/domain_22/view_06622.view.lkml"
include: "/views/domain_23/view_06623.view.lkml"

explore: explore_2206 {
  label: "Explore Explore 2206"
  description: "Comprehensive analytics explore joining base view_06619 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06619
  
  always_filter: {
    filters: [view_06619.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06619.created_at_date: "7 days"]
    unless: [view_06619.id, view_06619.status]
  }

  join: view_06621 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06619.user_id} = ${view_06621.id} ;;
    required_joins: []
  }

  join: view_06622 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06619.account_id} = ${view_06622.account_id} ;;
    required_joins: [view_06621]
  }

  join: view_06623 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06619.category} = ${view_06623.category} ;;
  }

  access_filter: {
    field: view_06619.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06619.is_deleted} = false ;;
}
