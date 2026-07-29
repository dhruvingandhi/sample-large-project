# Explore: explore_3757
# Auto-generated LookML Explore File

include: "/views/domain_22/view_11272.view.lkml"
include: "/views/domain_24/view_11274.view.lkml"
include: "/views/domain_25/view_11275.view.lkml"
include: "/views/domain_26/view_11276.view.lkml"

explore: explore_3757 {
  label: "Explore Explore 3757"
  description: "Comprehensive analytics explore joining base view_11272 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11272
  
  always_filter: {
    filters: [view_11272.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11272.created_at_date: "7 days"]
    unless: [view_11272.id, view_11272.status]
  }

  join: view_11274 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11272.user_id} = ${view_11274.id} ;;
    required_joins: []
  }

  join: view_11275 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11272.account_id} = ${view_11275.account_id} ;;
    required_joins: [view_11274]
  }

  join: view_11276 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11272.category} = ${view_11276.category} ;;
  }

  access_filter: {
    field: view_11272.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11272.is_deleted} = false ;;
}
